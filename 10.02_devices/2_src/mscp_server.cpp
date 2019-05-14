/*
    mscp_server.cpp: Implementation a simple MSCP server.


    This provides an implementation of the Minimal MSCP subset outlined
    in AA-L619A-TK (Chapter 6).  It takes a few liberties and errs on 
    the side of implementation simplicity.

    In particular:
         All commands are executed sequentially, as they appear in the
         command ring.  This includes any commands in the "Immediate"
         category.  Technically this is incorrect:  Immediate commands
         should execute as soon as possible, before any other commands.
         In practice I have yet to find code that cares.

         This simplifies the implementation significantly, and apart
         from maintaining fealty to the MSCP spec for Immediate commands,
         there's no good reason to make it more complex:  real MSCP
         controllers (like the original UDA50) would resequence commands
         to allow optimal throughput across multiple units, etc.  On the
         unibone, the underlying storage and the execution speed of the
         processor is orders of magnitude faster, so even a brute-force
         braindead implementation like this can saturate the Unibus.

    TODO:
    Some commands aren't checked as thoroughly for errors as they could be,
    and at this time NXM (attempts to address non-existent memory) are
    almost completely unhandled.

    
*/
#include <assert.h>
#include <pthread.h>
#include <stdio.h>
#include <memory>
#include <queue>
 
using namespace std;

#include "logger.hpp"
#include "utils.hpp"

#include "mscp_drive.hpp"
#include "mscp_server.hpp"
#include "uda.hpp"

void* polling_worker(
    void *context)
{
    mscp_server* server = reinterpret_cast<mscp_server*>(context);

    server->Poll();

    return nullptr;
}


mscp_server::mscp_server(
    uda_c *port) :
        device_c(),
        _hostTimeout(0),
        _controllerFlags(0),
        _abort_polling(false),
        _pollState(PollingState::Wait),
        polling_cond(PTHREAD_COND_INITIALIZER),
        polling_mutex(PTHREAD_MUTEX_INITIALIZER),
        _credits(INIT_CREDITS) 
{
    // Alias the port pointer.  We do not own the port, merely reference it.
    _port = port;

    StartPollingThread();
}


mscp_server::~mscp_server()
{
    AbortPollingThread();
}

void
mscp_server::StartPollingThread(void)
{
    _abort_polling = false;
    _pollState = PollingState::Wait;

    //
    // Initialize the polling thread and start it.
    // It will wait to be woken to do actual work.
    //
    pthread_attr_t attribs;
    pthread_attr_init(&attribs);

    int status = pthread_create(
        &polling_pthread,
        &attribs,
        &polling_worker,
        reinterpret_cast<void*>(this));

    if (status != 0)
    {
        FATAL("Failed to start mscp server thread.  Status 0x%x", status);
    }

    DEBUG("Polling thread created.");
}

void
mscp_server::AbortPollingThread(void)
{
    pthread_mutex_lock(&polling_mutex);
    _abort_polling = true;
    _pollState = PollingState::Wait;
    pthread_cond_signal(&polling_cond);
    pthread_mutex_unlock(&polling_mutex);

    pthread_cancel(polling_pthread);

    uint32_t status = pthread_join(polling_pthread, NULL);

    if (status != 0)
    {
        FATAL("Failed to join polling thread, status 0x%x", status);
    }

    DEBUG("Polling thread aborted.");  
}

void
mscp_server::Poll(void)
{
    worker_init_realtime_priority(rt_device);

    while(!_abort_polling)
    {
        //
        // Wait to be awoken, then pull commands from the command ring
        //
        pthread_mutex_lock(&polling_mutex);
        while (_pollState == PollingState::Wait)
        {
            pthread_cond_wait(
                &polling_cond,
                &polling_mutex);
        }

        // Shouldn't happen but if it does we just return to the top.
        if (_pollState == PollingState::InitRun)
        {
           _pollState = PollingState::Run;
        }

        pthread_mutex_unlock(&polling_mutex);
    
        if (_abort_polling)
        {
            break;
        }

        //
        // Read all commands from the ring into a queue; then execute them.
        //
        std::queue<shared_ptr<Message>> messages;

        while (!_abort_polling && _pollState != PollingState::InitRestart)
        {
            shared_ptr<Message> message(_port->GetNextCommand());

            if (nullptr == message)
            {
                DEBUG("End of command ring; %d messages to be executed.");
                break;
            }

            messages.push(message);
        } 

        //
        // Pull commands from the queue until it is empty, at which
        // point we sleep until awoken again.
        //
        while(!messages.empty() && !_abort_polling && _pollState != PollingState::InitRestart)
        {
            shared_ptr<Message> message(messages.front());  
            messages.pop();

            DEBUG("Processing message.");

            //
            // Handle the message.  We dispatch on opcodes to the
            // appropriate methods.  These methods modify the message
            // object in place; this message object is then posted back
            // to the response ring.
            //
            ControlMessageHeader* header = 
                reinterpret_cast<ControlMessageHeader*>(message->Message);

            INFO ("Message size 0x%x opcode 0x%x rsvd 0x%x mod 0x%x unit %d, ursvd 0x%x, ref 0x%x", 
                message->MessageLength,
                header->Word3.Command.Opcode,
                header->Word3.Command.Reserved,
                header->Word3.Command.Modifiers,
                header->UnitNumber,
                header->Reserved,
                header->ReferenceNumber);

            uint32_t cmdStatus = 0;
            uint16_t modifiers = header->Word3.Command.Modifiers;

            switch (header->Word3.Command.Opcode)
            {
                case Opcodes::ABORT:
                    cmdStatus = Abort(message);
                    break;

                case Opcodes::ACCESS:
                    cmdStatus = Access(message, header->UnitNumber);
                    break;

                case Opcodes::AVAILABLE:
                    cmdStatus = Available(message, header->UnitNumber, modifiers);
                    break;

                case Opcodes::COMPARE_HOST_DATA:
                    cmdStatus = CompareHostData(message, header->UnitNumber);
                    break;

                case Opcodes::DETERMINE_ACCESS_PATHS:
                    cmdStatus = DetermineAccessPaths(message, header->UnitNumber);
                    break;

                case Opcodes::ERASE:
                    cmdStatus = Erase(message, header->UnitNumber, modifiers);
                    break;

                case Opcodes::GET_COMMAND_STATUS:
                    cmdStatus = GetCommandStatus(message);
                    break;

                case Opcodes::GET_UNIT_STATUS:
                    cmdStatus = GetUnitStatus(message, header->UnitNumber, modifiers);
                    break;

                case Opcodes::ONLINE:
                    cmdStatus = Online(message, header->UnitNumber, modifiers);
                    break;

                case Opcodes::READ:
                    cmdStatus = Read(message, header->UnitNumber, modifiers);
                    break;

                case Opcodes::REPLACE:
                    cmdStatus = Replace(message, header->UnitNumber);
                    break;

                case Opcodes::SET_CONTROLLER_CHARACTERISTICS:
                    cmdStatus = SetControllerCharacteristics(message);     
                    break;

                case Opcodes::SET_UNIT_CHARACTERISTICS:
                    cmdStatus = SetUnitCharacteristics(message, header->UnitNumber, modifiers);
                    break;

                case Opcodes::WRITE:
                    cmdStatus = Write(message, header->UnitNumber, modifiers);
                    break;

                default:
                    FATAL("Unimplemented MSCP command 0x%x", header->Word3.Command.Opcode);
                    break;
            }

            INFO ("cmd 0x%x st 0x%x fl 0x%x", cmdStatus, GET_STATUS(cmdStatus), GET_FLAGS(cmdStatus));

            //
            // Set the endcode and status bits
            //
            header->Word3.End.Status = GET_STATUS(cmdStatus);
            header->Word3.End.Flags = GET_FLAGS(cmdStatus);

            // Set the End code properly -- for an Invalid Command response
            // this is just the End code, for all others it's the End code
            // or'd with the opcode.
            if ((GET_STATUS(cmdStatus) & 0x1f) == Status::INVALID_COMMAND)
            {
                 // Just the END code, no opcode
                 header->Word3.End.Endcode = Endcodes::END;
            }
            else
            {
                 header->Word3.End.Endcode |= Endcodes::END;
            }

            if (message->Word1.Info.MessageType == MessageTypes::Sequential &&
                header->Word3.End.Endcode & Endcodes::END)
            {
                //
                // We steal the hack from simh:
                // The controller gives all of its credits to the host,
                // thereafter it supplies one credit for every response
                // packet sent.
                //
                // Max 14 credits, also C++ is flaming garbage, thanks for replacing "min"
                // with something so incredibly annoying to use.
                // 
                uint8_t grantedCredits = min(_credits, static_cast<uint8_t>(MAX_CREDITS));
                _credits -= grantedCredits;
                message->Word1.Info.Credits = grantedCredits + 1;
                DEBUG("granted credits %d", grantedCredits + 1);
            }
            else
            {
                message->Word1.Info.Credits = 0;
            }

            //
            // Post the response to the port's response ring.
            //
            if(!_port->PostResponse(message.get()))
            {
                FATAL("Unexpected: no room in response ring.");
            }

            //
            // Go around and pick up the next one.
            //
        }

        pthread_mutex_lock(&polling_mutex); 
        if (_pollState == PollingState::InitRestart)
        {
            DEBUG("MSCP Polling thread reset.");
            // Signal the Reset call that we're done so it can return
            // and release the Host.
            _pollState = PollingState::Wait;
            pthread_cond_signal(&polling_cond);
        }
        else if (_pollState == PollingState::InitRun)
        {
            _pollState = PollingState::Run;
        }
        else
        { 
            _pollState = PollingState::Wait;
        }
        pthread_mutex_unlock(&polling_mutex);
        
    }
    DEBUG("MSCP Polling thread exiting."); 
}

uint32_t
mscp_server::Abort(
    shared_ptr<Message> message)
{
    INFO("MSCP ABORT");

    //
    // Since we do not reorder messages and in fact pick up and execute
    // them one at a time, sequentially as they appear in the ring buffer,
    // by the time we've gotten this command, the command it's referring
    // to is long gone.
    // This is semi-legal behavior and it's legal for us to ignore ABORT in this
    // case.
    //
    // We just return SUCCESS here.
    return STATUS(Status::SUCCESS, 0, 0);
}


uint32_t
mscp_server::Available(
    shared_ptr<Message> message,
    uint16_t unitNumber,
    uint16_t modifiers)
{
    // Message has no message-specific data.
    // We don't do much with this now...
    // Just set the specified drive as Available if appropriate.
    // We do nothing with the spin-down modifier.

    DEBUG("MSCP AVAILABLE");

    mscp_drive_c* drive = GetDrive(unitNumber);

    if (nullptr == drive ||
        !drive->IsAvailable())
    {
        return STATUS(Status::UNIT_OFFLINE, UnitOfflineSubcodes::UNIT_UNKNOWN, 0);
    }

    drive->SetOffline();

    return STATUS(Status::SUCCESS, 0x40, 0);  // still connected    
}

uint32_t
mscp_server::Access(
    shared_ptr<Message> message,
    uint16_t unitNumber)
{
    INFO("MSCP ACCESS");

    return DoDiskTransfer(
        Opcodes::ACCESS,
        message,
        unitNumber,
        0);
}

uint32_t
mscp_server::CompareHostData(
    shared_ptr<Message> message,
    uint16_t unitNumber)
{
    INFO("MSCP COMPARE HOST DATA");
    return DoDiskTransfer(
        Opcodes::COMPARE_HOST_DATA,
        message,
        unitNumber,
        0);
}

uint32_t
mscp_server::DetermineAccessPaths(
    shared_ptr<Message> message,
    uint16_t unitNumber)
{
    DEBUG("MSCP DETERMINE ACCESS PATHS drive %d", unitNumber);

    // "This command must be treated as a no-op that always succeeds
    //  if the unit is incapable of being connected to more than one
    //  controller." That's us!

    return STATUS(Status::SUCCESS, 0, 0);
}

uint32_t
mscp_server::Erase(
    shared_ptr<Message> message,
    uint16_t unitNumber,
    uint16_t modifiers)
{
    return DoDiskTransfer(
        Opcodes::ERASE,
        message,
        unitNumber,
        modifiers);
}

uint32_t
mscp_server::GetCommandStatus(
    shared_ptr<Message> message)
{
    INFO("MSCP GET COMMAND STATUS");

    #pragma pack(push,1)
    struct GetCommandStatusResponseParameters
    {
        uint32_t OutstandingReferenceNumber;
        uint32_t CommandStatus;
    };
    #pragma pack(pop)

    message->MessageLength = sizeof(GetCommandStatusResponseParameters)
        + HEADER_SIZE;

    
    GetCommandStatusResponseParameters* params = 
        reinterpret_cast<GetCommandStatusResponseParameters*>(
            GetParameterPointer(message));

    //
    // This will always return zero; as with the ABORT command, at this
    // point the command being referenced has already been executed.
    //
    params->CommandStatus = 0;

    return STATUS(Status::SUCCESS, 0, 0);
}

uint32_t
mscp_server::GetUnitStatus(
    shared_ptr<Message> message,
    uint16_t unitNumber,
    uint16_t modifiers)
{
    #pragma pack(push,1)
    struct GetUnitStatusResponseParameters
    {
        uint16_t MultiUnitCode;
        uint16_t UnitFlags;
        uint32_t Reserved0;
        uint64_t UnitIdentifier;
        uint32_t MediaTypeIdentifier;
        uint16_t ShadowUnit;
        uint16_t Reserved1;
        uint16_t TrackSize;
        uint16_t GroupSize;
        uint16_t CylinderSize;
        uint16_t Reserved2;   
        uint16_t RCTSize;
        uint8_t RBNs;
        uint8_t Copies;
    };
    #pragma pack(pop)

    INFO ("MSCP GET UNIT STATUS drive %d", unitNumber);

    // Adjust message length for response
    message->MessageLength = sizeof(GetUnitStatusResponseParameters) +
        HEADER_SIZE;


    ControlMessageHeader* header =
        reinterpret_cast<ControlMessageHeader*>(message->Message);

    if (modifiers & 0x1)
    {
        // Next Unit modifier: return the next known unit >= unitNumber.
        // Unless unitNumber is greater than the number of drives we support
        // we just return the unit specified by unitNumber.
        if (unitNumber >= _port->GetDriveCount())
        {
            // In this case we act as if drive 0 was queried.
            unitNumber = 0;
            header->UnitNumber = 0;
        }
    }

    mscp_drive_c* drive = GetDrive(unitNumber);

    GetUnitStatusResponseParameters* params = 
        reinterpret_cast<GetUnitStatusResponseParameters*>(
            GetParameterPointer(message));

    if (nullptr == drive)
    {
        // No such drive
        params->UnitIdentifier = 0;
        params->ShadowUnit = 0;
        return STATUS(Status::UNIT_OFFLINE, UnitOfflineSubcodes::UNIT_UNKNOWN, 0);
    }

    if(!drive->IsAvailable())
    {
        // Known drive, but not available at this time.
        params->UnitIdentifier = 0;
        params->ShadowUnit = 0;

        return STATUS(Status::UNIT_OFFLINE, UnitOfflineSubcodes::NO_VOLUME, 0);  // offline; no volume available
    }

    params->Reserved0 = 0;
    params->Reserved1 = 0;
    params->Reserved2 = 0;
    params->UnitFlags = 0;  // TODO: 0 for now, which is sane.
    params->MultiUnitCode = 0; // Controller dependent, we don't support multi-unit drives.
    params->UnitIdentifier = drive->GetUnitID();  
    params->MediaTypeIdentifier = drive->GetMediaID(); 
    params->ShadowUnit = unitNumber;   // Always equal to unit number
    
    // From the MSCP spec: "As stated above, the host area of  a  disk  is  structured  as  a
    //  vector of logical blocks.  From a performance viewpoint, however,
    //  it  is  more  appropriate  to  view  the  host  area  as  a  four
    //  dimensional hyper-cube."
    // This has nothing whatsoever to do with what's going on here but it makes me snicker
    // every time I read it so I'm including it.
    // Let's relay some information about our data-tesseract:
    // Since our underlying storage is an image file on flash memory, we don't need to be concerned
    // about seek times, so the below is appropriate:
    //
    params->TrackSize = 1;  // one block per track, per aa-l619a-tk.
    params->GroupSize = 1;  // one cylinder per group
    params->CylinderSize = 1; // one sector per cylinder

    //
    // Since we do no bad block replacement (no bad blocks possible in a disk image file)
    // the RCT size is one block as required for the volume write protect information.
    // There are no replacement blocks, and no duplicate copies of
    // the RCT are present.
    //
    params->RCTSize = drive->GetRCTSize();
    params->RBNs = drive->GetRBNs();
    params->Copies = drive->GetRCTCopies();

    if (drive->IsOnline())
    {
        return STATUS(Status::SUCCESS, 0, 0);
    }
    else
    {
        return STATUS(Status::UNIT_AVAILABLE, 0, 0);
    } 
}

uint32_t
mscp_server::Online(
    shared_ptr<Message> message,
    uint16_t unitNumber,
    uint16_t modifiers)
{
    #pragma pack(push,1)
    struct OnlineParameters
    {
        uint16_t UnitFlags alignas(2);
        uint16_t Reserved0 alignas(2);
        uint32_t Reserved1;
        uint32_t Reserved2;
        uint32_t Reserved3;
        uint32_t DeviceParameters;
        uint32_t Reserved4;
    };
    #pragma pack(pop)

    //
    // TODO: Right now, ignoring all incoming parameters.
    // With the exception of write-protection none of them really
    // apply.
    // We still need to flag errors if someone tries to set
    // host-settable flags we can't support.
    //

    // TODO: "The ONLINE command performs a SET UNIT CHARACTERISTICS
    // operation after bringing a unit 'Unit-Online'"
    // This code could be refactored w/th S_U_C handler.
    //
    #pragma pack(push,1)
    struct OnlineResponseParameters
    {
        uint16_t UnitFlags;
        uint16_t MultiUnitCode;
        uint32_t Reserved0;
        uint64_t UnitIdentifier;
        uint32_t MediaTypeIdentifier;
        uint32_t Reserved1;
        uint32_t UnitSize;
        uint32_t VolumeSerialNumber;
    };
    #pragma pack(pop)

    DEBUG("MSCP ONLINE drive %d", unitNumber);

    // Adjust message length for response
    message->MessageLength = sizeof(OnlineResponseParameters) +
        HEADER_SIZE;

    mscp_drive_c* drive = GetDrive(unitNumber);

    if (nullptr == drive ||
        !drive->IsAvailable())
    {
        return STATUS(Status::UNIT_OFFLINE, UnitOfflineSubcodes::UNIT_UNKNOWN, 0);
    }
  
    bool alreadyOnline = drive->IsOnline();
 
    drive->SetOnline();

    OnlineResponseParameters* params =
        reinterpret_cast<OnlineResponseParameters*>(
            GetParameterPointer(message));

    params->UnitFlags = 0;  // TODO: 0 for now, which is sane.
    params->MultiUnitCode = 0; // Controller dependent, we don't support multi-unit drives.
    params->UnitIdentifier = drive->GetUnitID(); 
    params->MediaTypeIdentifier = drive->GetMediaID();
    params->UnitSize = drive->GetBlockCount();
    params->VolumeSerialNumber = 1;  // We report no serial
    params->Reserved0 = 0;
    params->Reserved1 = 0;

    return STATUS(Status::SUCCESS | 
        (alreadyOnline ? SuccessSubcodes::ALREADY_ONLINE : SuccessSubcodes::NORMAL), 0, 0); 
}

uint32_t
mscp_server::Replace(
    shared_ptr<Message> message,
    uint16_t unitNumber)
{
    INFO("MSCP REPLACE");
    //
    // We treat this as a success for valid units as we do no block replacement at all.
    // Best just to smile and nod.  We could be more vigilant and check LBNs, etc...
    //
    message->MessageLength = HEADER_SIZE;

    mscp_drive_c* drive = GetDrive(unitNumber);

    if (nullptr == drive ||
        !drive->IsAvailable())
    {
        return STATUS(Status::UNIT_OFFLINE, UnitOfflineSubcodes::UNIT_UNKNOWN, 0);
    }
    else
    {
        return STATUS(Status::SUCCESS, 0, 0);
    }
}

uint32_t
mscp_server::SetControllerCharacteristics(
    shared_ptr<Message> message)
{
    #pragma pack(push,1)
    struct SetControllerCharacteristicsParameters
    {
        uint16_t MSCPVersion;    
        uint16_t ControllerFlags;
        uint16_t HostTimeout;
        uint16_t Reserved;
        uint64_t TimeAndDate;
    };
    #pragma pack(pop)
 
    SetControllerCharacteristicsParameters* params =
        reinterpret_cast<SetControllerCharacteristicsParameters*>(
            GetParameterPointer(message));

    DEBUG("MSCP SET CONTROLLER CHARACTERISTICS");

    // Adjust message length for response
    message->MessageLength = sizeof(SetControllerCharacteristicsParameters) +
        HEADER_SIZE;
    //
    // Check the version, if non-zero we must return an Invalid Command
    // end message.
    //
    if (params->MSCPVersion != 0)
    {
        return STATUS(Status::INVALID_COMMAND, 0, 0); // TODO: set sub-status
    }  
    else
    {
        _hostTimeout = params->HostTimeout;
        _controllerFlags = params->ControllerFlags; 

        // At this time we ignore the time and date entirely.
   
        // Prepare the response message 
        params->Reserved = 0;
        params->ControllerFlags = _controllerFlags & 0xfe;  // Mask off 576 byte sectors bit.
                                                            // it's read-only and we're a 512
                                                            // byte sector shop here. 
        params->HostTimeout = 0x10;   // Controller timeout: return the max value.
        params->TimeAndDate = _port->GetControllerIdentifier();  // Controller ID

        return STATUS(Status::SUCCESS, 0, 0);
    }
     
}

uint32_t
mscp_server::SetUnitCharacteristics(
    shared_ptr<Message> message,
    uint16_t unitNumber,
    uint16_t modifiers)
{
    #pragma pack(push,1)
    struct SetUnitCharacteristicsParameters
    {
        uint16_t UnitFlags;
        uint16_t Reserved0;
        uint32_t Reserved1;
        uint64_t Reserved2;
        uint32_t DeviceDependent;
        uint16_t Reserved3;
        uint16_t Reserved4;
    };
    #pragma pack(pop)

    // TODO: handle Set Write Protect modifier

    DEBUG("MSCP SET UNIT CHARACTERISTICS drive %d", unitNumber);

    // TODO: mostly same as Online command: should share logic.
    #pragma pack(push,1)
    struct SetUnitCharacteristicsResponseParameters
    {
        uint16_t UnitFlags;
        uint16_t MultiUnitCode;
        uint32_t Reserved0;
        uint64_t UnitIdentifier;
        uint32_t MediaTypeIdentifier;
        uint32_t Reserved1;
        uint16_t ShadowUnit;
        uint32_t UnitSize;
        uint32_t VolumeSerialNumber;
    };
    #pragma pack(pop)

    // Adjust message length for response
    message->MessageLength = sizeof(SetUnitCharacteristicsResponseParameters) +
        HEADER_SIZE;

    mscp_drive_c* drive = GetDrive(unitNumber);
    // Check unit
    if (nullptr == drive ||
        !drive->IsAvailable())
    {
        return STATUS(Status::UNIT_OFFLINE, UnitOfflineSubcodes::UNIT_UNKNOWN, 0);
    }

    SetUnitCharacteristicsResponseParameters* params =
        reinterpret_cast<SetUnitCharacteristicsResponseParameters*>(
            GetParameterPointer(message));

    params->UnitFlags = 0;  // TODO: 0 for now, which is sane.
    params->MultiUnitCode = 0; // Controller dependent, we don't support multi-unit drives.
    params->UnitIdentifier = drive->GetUnitID();
    params->MediaTypeIdentifier = drive->GetMediaID();
    params->UnitSize = drive->GetBlockCount();
    params->VolumeSerialNumber = 0;  // We report no serial

    return STATUS(Status::SUCCESS, 0, 0); 
}


uint32_t
mscp_server::Read(
    shared_ptr<Message> message,
    uint16_t unitNumber,
    uint16_t modifiers)
{
    return DoDiskTransfer(
        Opcodes::READ,
        message,
        unitNumber,
        modifiers);
}

uint32_t
mscp_server::Write(
    shared_ptr<Message> message,
    uint16_t unitNumber,
    uint16_t modifiers)
{
    return DoDiskTransfer(
        Opcodes::WRITE,
        message,
        unitNumber,
        modifiers);
}

uint32_t
mscp_server::DoDiskTransfer(
    uint16_t operation,
    shared_ptr<Message> message,
    uint16_t unitNumber,
    uint16_t modifiers)
{
    #pragma pack(push,1)
    struct ReadWriteEraseParameters
    {
        uint32_t ByteCount;
        uint32_t BufferPhysicalAddress;  // upper 8 bits are channel address for VAXen
        uint32_t Unused0;
        uint32_t Unused1;
        uint32_t LBN;
    };
    #pragma pack(pop)

    ReadWriteEraseParameters* params =
        reinterpret_cast<ReadWriteEraseParameters*>(GetParameterPointer(message));

    INFO ("MSCP RWE 0x%x unit %d mod 0x%x chan o%o pa o%o count %d lbn %d",
        operation,
        unitNumber,
        modifiers,
        params->BufferPhysicalAddress >> 24,
        params->BufferPhysicalAddress & 0x00ffffff,
        params->ByteCount,
        params->LBN);

    // Adjust message length for response
    message->MessageLength = sizeof(ReadWriteEraseParameters) +
        HEADER_SIZE;

    mscp_drive_c* drive = GetDrive(unitNumber);

    // Check unit
    if (nullptr == drive ||
        !drive->IsAvailable())
    {
        return STATUS(Status::UNIT_OFFLINE, UnitOfflineSubcodes::UNIT_UNKNOWN, 0);
    }

    // Are we accessing the RCT area?
    bool rctAccess = params->LBN >= drive->GetBlockCount(); 
    uint32_t rctBlockNumber = params->LBN - drive->GetBlockCount();

    // Check that the LBN is valid
    if (params->LBN >= drive->GetBlockCount() + drive->GetRCTBlockCount())
    {
        return STATUS(Status::INVALID_COMMAND + (0x1c << 8), 0, 0); // TODO: set sub-code
    }

    // Check byte count: 
    if (params->ByteCount > ((drive->GetBlockCount() + drive->GetRCTBlockCount()) - params->LBN) * drive->GetBlockSize())
    {
        return STATUS(Status::INVALID_COMMAND + (0x0c << 8), 0, 0); // TODO: as above
    }

    // If this is an RCT access, byte count must equal the block size.
    if (rctAccess && params->ByteCount != drive->GetBlockSize())
    {
        return STATUS(Status::INVALID_COMMAND + (0x0c << 8), 0, 0); // TODO: again
    }

    //
    // OK: do the transfer from the PDP-11 to a buffer
    //
    switch (operation)
    {
        case Opcodes::ACCESS:
            // We don't need to actually do any sort of transfer; ACCESS merely checks
            // That the data can be read -- we checked the LBN, etc. above and we 
            // will never encounter a read error, so there's nothing left to do.
        break;

        case Opcodes::COMPARE_HOST_DATA:
        {
            // Read the data in from disk, read the data in from memory, and compare.
            unique_ptr<uint8_t> diskBuffer;

            if (rctAccess)
            {
                diskBuffer.reset(drive->ReadRCTBlock(rctBlockNumber));
            }
            else
            {
                diskBuffer.reset(drive->Read(params->LBN, params->ByteCount));
            }

            unique_ptr<uint8_t> memBuffer(_port->DMARead(
                params->BufferPhysicalAddress & 0x00ffffff,
                params->ByteCount,
                params->ByteCount));
  
            if (!memcmp(diskBuffer.get(), memBuffer.get(), params->ByteCount))
            {
                // TODO: maybe not do an early return, make code not as ugly?  Hm.
                return STATUS(Status::COMPARE_ERROR, 0, 0);
            }
        }
 
        case Opcodes::ERASE:
        {
            unique_ptr<uint8_t> memBuffer(new uint8_t[params->ByteCount]);
            memset(reinterpret_cast<void*>(memBuffer.get()), 0, params->ByteCount);

            if (rctAccess)
            {
                drive->WriteRCTBlock(rctBlockNumber,
                    memBuffer.get());
            }
            else
            {
                drive->Write(params->LBN,
                    params->ByteCount,
                    memBuffer.get());
            }
        } 
        break;

        case Opcodes::READ:
        {
            unique_ptr<uint8_t> diskBuffer;
            
            if (rctAccess)
            {
                diskBuffer.reset(drive->ReadRCTBlock(rctBlockNumber));
            }
            else
            { 
                diskBuffer.reset(drive->Read(params->LBN, params->ByteCount));
            }

            _port->DMAWrite(
                params->BufferPhysicalAddress & 0x00ffffff,
                params->ByteCount,
                diskBuffer.get());
        }
        break;

        case Opcodes::WRITE:
        {
            unique_ptr<uint8_t> memBuffer(_port->DMARead(
                params->BufferPhysicalAddress & 0x00ffffff,
                params->ByteCount,
                params->ByteCount));
 
            if (rctAccess)
            {
                drive->WriteRCTBlock(rctBlockNumber,
                    memBuffer.get());
            }
            else
            {
                drive->Write(params->LBN,
                    params->ByteCount,
                    memBuffer.get());
            }
        }
        break;

        default:
            // Should never happen.
            assert(false);
            break;
    }

    // Set parameters for response.
    // We leave ByteCount as is (for now anyway)
    // And set First Bad Block to 0.  (This is unnecessary since we're
    // not reporting a bad block, but we're doing it for completeness.)
    params->LBN = 0;

    return STATUS(Status::SUCCESS, 0, 0);
}

uint8_t*
mscp_server::GetParameterPointer(
    shared_ptr<Message> message)
{
    return reinterpret_cast<ControlMessageHeader*>(message->Message)->Parameters;
}

mscp_drive_c*
mscp_server::GetDrive(
    uint32_t unitNumber)
{
    mscp_drive_c* drive = nullptr;
    if (unitNumber < _port->GetDriveCount())
    {
        drive = _port->GetDrive(unitNumber);
    }

    return drive;
}

void 
mscp_server::Reset(void)
{
    DEBUG("Aborting polling due to reset.");

    pthread_mutex_lock(&polling_mutex);
    if (_pollState != PollingState::Wait)
    {
        _pollState = PollingState::InitRestart;

        while (_pollState != PollingState::Wait)
        {
            pthread_cond_wait(
                &polling_cond,
                &polling_mutex);
        }
    }  
    pthread_mutex_unlock(&polling_mutex);

    _credits = INIT_CREDITS;

    // Release all drives
    for (int i=0;i<_port->GetDriveCount();i++)
    {
        GetDrive(i)->SetOffline();
    }
}


void 
mscp_server::InitPolling(void)
{
    //
    // Wake the polling thread if not already awoken.
    //
    pthread_mutex_lock(&polling_mutex);
    if (true) //!_continue_polling)
    {
        DEBUG("Waking polling thread.");
        _pollState = PollingState::InitRun;
       	pthread_cond_signal(&polling_cond);
    }
    else
    {
        DEBUG("Polling already active.");
    }
    pthread_mutex_unlock(&polling_mutex);
}

