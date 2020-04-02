/*
 rp_drive.cpp: Implementation of RP0X disks.

 Copyright Vulcan Inc. 2020 via Living Computers: Museum + Labs, Seattle, WA.
 Contributed under the BSD 2-clause license.

 */

#include <assert.h>
#include <memory>

using namespace std;

#include "logger.hpp"
#include "utils.hpp"
#include "rh11.hpp"
#include "massbus_rp.hpp"
#include "rp_drive.hpp"

rp_drive_c::rp_drive_c(rh11_c *controller, massbus_rp_c* bus, uint32_t driveNumber) :
     storagedrive_c(controller),
     _driveNumber(driveNumber),
     _desiredCylinder(0),
     _currentCylinder(0),
     _desiredTrack(0),
     _offset(0),
     _ata(false),
     _ned(false), 
     _rmr(false),
     _ready(true),
     _lst(false),
     _aoe(false),
     _iae(false),
     _wle(false),
     _pip(false),
     _vv(false),
     _workerState(WorkerState::Idle),
     _workerWakeupCond(PTHREAD_COND_INITIALIZER),
     _workerMutex(PTHREAD_MUTEX_INITIALIZER)
{
    set_workers_count(1);
    log_label = "RP";
    SetDriveType("RP06");

    _newCommand = { 0 };

    _controller = controller;
    _bus = bus;
}

rp_drive_c::~rp_drive_c() 
{
    if (file_is_open()) 
    {
        file_close();
    }
}

void
rp_drive_c::Reset()
{
    INFO ("Drive %d reset", _driveNumber);

    // TODO: how to deal with the worker thread. 
    // In the case of a Controller Clear, for example,
    // it needs to terminate its work immediately, which may
    // not be possible if a DMA transfer is in progress.
    // If we can make the above happen, it's reasonable to block
    // here until the worker has returned to idle.
    // (Maybe?)
   
}

// on_param_changed():
//  Handles configuration parameter changes.
bool 
rp_drive_c::on_param_changed(parameter_c *param) 
{
    // no own "enable" logic
    if (&type_name == param) 
    {
	return SetDriveType(type_name.new_value.c_str());
    } 
    else if (&image_filepath == param) 
    {
        // Try to open the image file.
        if (file_open(image_filepath.new_value, true)) 
        {
            image_filepath.value = image_filepath.new_value;

            // New image; this is analogous to a new pack being spun up.
            // Set the Volume Valid bit so software knows things have changed.
            _vv = true;
            UpdateStatus(false, false);
            return true;
        }
        
        return false;
    } 

    return device_c::on_param_changed(param); // more actions (for enable)false;
}

//
// GetSectorSize():
//  Returns the size, in bytes, of a single sector on this drive.
//  This is either 512 or 576 bytes.
//
uint32_t 
rp_drive_c::GetSectorSize()
{
    //
    // For the time being this is always 512 bytes.
    //
    return 512;
}

//
// IsPackLoaded():
//  Indicates whether this drive has a pack loaded (i.e. has an image
//  assigned to it)
//
bool 
rp_drive_c::IsPackLoaded()
{
    return file_is_open();
}

void
rp_drive_c::Select()
{
    // Just force an update of status registers for this disk.
    UpdateStatus(false, false);
}

void rp_drive_c::DoCommand(
    uint16_t command)
{
    FunctionCode function = static_cast<FunctionCode>((command & RP_FUNC) >> 1);

    // check for GO bit; if unset we have nothing to do here,
    if ((command & RP_GO) == 0)
    {
        return;
    }

    INFO ("RP function 0%o, unit %o", function, _driveNumber);

    if (!_ready && FunctionCode::DriveClear != function)
    {
        // For now, halt -- This should never happen with valid code.
        // After things are stable, this should set error bits.
        FATAL("Unit %d - Command sent while not ready!", _driveNumber);
    }

    // TODO: when Error Summary bit is set in ER1, the drive will accept no commands
    // apart from a DRIVE CLEAR command.
 
    _ned = false;
    _ata = false;

    switch(static_cast<FunctionCode>(function))
    {
        case FunctionCode::Nop:
            // Nothing.
            UpdateStatus(true, false);
            break;

        case FunctionCode::Unload:
            // Unsure how best to implement this:
            // This puts the drive in STANDBY state, meaning the heads are
            // retracted and the spindle powers down.  The command doesn't actually *finish*
            // until the pack is manually spun back up.  This could be implemented
            // by unloading the disk image and waiting until a new one is loaded.
            // Right now I'm just treating it as a no-op, at least until I can find a good
            // way to test it using real software.
            INFO ("RP Unload");
            _ata = true;
            UpdateStatus(true, false);  
            break;


        case FunctionCode::DriveClear:
            // p. 2-11 of EK-RP056-MM-01:
            // "The following registers and conditions within the DCL are cleared
            //  by this command:
            //   - Status Register (ATA and ERR status bits)
            //   - All three Error registers
            //   - Attention Summary Register
            //   - ECC Position and Pattern Registers
            //   - The Diagnostic Mode Bit
            INFO ("RP Drive Clear");
            _ata = false;
            _rmr = false;
            _ned = false;
            UpdateStatus(false, false);
            break;
   
        case FunctionCode::Release:
            INFO ("RP Release"); 
            // This is a no-op, this only applies to dual-ported configurations,
            // which we are not.
            _ata = false;
            UpdateStatus(false, false);
            break;
 
        case FunctionCode::ReadInPreset:
            INFO ("RP Read-In Preset");
            //
            // "This command sets the VV (volume valid) bit, clears the desired
            //  sector/track address register, and clears the FMT, HCI, and ECI
            //  bits in the offset register.  It is used to bootstrap the device."
            //
            _vv = true;      
            _ready = true;   
            _desiredSector = 0; 
            _desiredTrack = 0;  
            _offset = 0; 
            UpdateStatus(false, false);
            break;

        case FunctionCode::PackAcknowledge:
            INFO ("RP Pack Acknowledge");
            _vv = true;
            UpdateStatus(false, false);
            break;

        case FunctionCode::ReadData:
        case FunctionCode::WriteData:
        case FunctionCode::WriteHeaderAndData:
        case FunctionCode::ReadHeaderAndData:
        case FunctionCode::Search:
        case FunctionCode::Seek:
        case FunctionCode::Recalibrate:
        case FunctionCode::Offset:
        case FunctionCode::ReturnToCenterline:
            INFO ("RP Read/Write Data or head-motion command");
            {
                // If this drive is not connected, head-motion commands cannot be
                // executed.
                if (!IsConnected())
                {
                    _ata = true;
                    _ned = true;
                    UpdateStatus(true, false);
                    return;
                }
                
                // Clear DRY. 
                _ready = false;

                if (function == FunctionCode::Search ||
                    function == FunctionCode::Seek ||
                    function == FunctionCode::Recalibrate ||
                    function == FunctionCode::Offset ||
                    function == FunctionCode::ReturnToCenterline)
                {    
                     // Positioning in progress. 
                     _pip = true;
                }
                else
                {
                     // This is a data transfer command,
                     // let the controller know so it can clear its READY bit
                     // for the duration.
                     _controller->StartDataTransfer();
                }                  

                UpdateStatus(false, false);
 
                pthread_mutex_lock(&_workerMutex);
                
                // Sanity check: no other command should be executing on this drive
                // right now.
                if (_newCommand.ready)
                {
                    FATAL("Command o%o sent while worker for drive %d is busy!",
                        function, _driveNumber);
                } 

                // Save a copy of command data for the worker to consume
                _newCommand.function = function;
                _newCommand.bus_address = _controller->GetBusAddress();
                _newCommand.word_count = _controller->GetWordCount();
                _newCommand.ready = true;

                // Wake the worker
                pthread_cond_signal(&_workerWakeupCond);
                pthread_mutex_unlock(&_workerMutex);
                INFO ("Command queued for worker.");
            }
            break;

        default:
            FATAL("Unimplemented RP function.");
            break;
    }    
}

// Background worker function
void 
rp_drive_c::worker(unsigned instance)
{
    UNUSED(instance);

    // worker_init_realtime_priority(rt_device);

    _workerState = WorkerState::Idle;
    WorkerCommand command = { 0 };

    timeout_c timeout;

    INFO ("rp_drive %d worker started.", _driveNumber);
    while (!workers_terminate)
    {
        switch(_workerState) 
        {
            case WorkerState::Idle:
                // Wait for work.
                pthread_mutex_lock(&_workerMutex);
                while (!_newCommand.ready) 
                {
                    pthread_cond_wait(
                        &_workerWakeupCond,
                        &_workerMutex);
                }

                // Make a local copy of the new command
                command = _newCommand; 
                pthread_mutex_unlock(&_workerMutex);

                _workerState = WorkerState::Execute;
                break;
           
            case WorkerState::Execute:
                {
                INFO ("Worker executing function o%o", command.function);
                switch(command.function)
                {
                    case FunctionCode::ReadHeaderAndData:
                    case FunctionCode::ReadData:
                    {
                        INFO ("Read wc %d", command.word_count);
                        if (FunctionCode::ReadHeaderAndData == command.function)
                        {
                            // Per EK-RP056-MM-01 a READ HEADER AND DATA command
                            // is functionally identical to a READ DATA command
                            // except four extra words are sent prior to the sector data.
                            // These are: 
                            //   1. Cylinder address and format bit:
                            //      TODO: where is this format bit?
                            //   2. Sector/Track address:
                            //      bits 0-4 specify sector, bits 8-12 indicate track.
                            //      (i.e identical to the DA register format)
                            //   3, 4. Key Field - programmer defined, at format time.
                            // We return a header that matches the expected disk address. 
                            uint16_t* header = new uint16_t[4];
                            assert(header);

                            header[0] = _desiredCylinder;
                            header[1] = _desiredSector | (_desiredTrack << 8);
                            header[2] = 0;
                            header[3] = 0;

                            _controller->DiskReadTransfer(
                                command.bus_address,
                                std::min(4, command.word_count),
                                header);

                            command.bus_address += 8;
                            command.word_count -= 4;
                            delete[] header;
                        }
 
                        // Any words left?
                        if (command.word_count > 0)
                        {
                            uint16_t* buffer = nullptr;
                            if (Read(
                                    command.word_count,
                                    &buffer))
                            {
                                //
                                // Data read: do DMA transfer to memory.
                                //
                                _controller->DiskReadTransfer(
                                    command.bus_address,
                                    command.word_count,
                                    buffer);
                            
                                // Free buffer
                                delete[] buffer;
                            }
                            else
                            {
                                // Read failed: 
                                INFO ("Read failed.");
                                _ata = true;
                            }
                        }

                        _workerState = WorkerState::Finish;
                    }
                    break;

                    case FunctionCode::WriteData:
                    {
                        //
                        // Data write: do DMA transfer from memory.
                        //
                        uint16_t* buffer = _controller->DiskWriteTransfer(
                            command.bus_address,
                            command.word_count);

                        if (!buffer || !Write(
                                command.word_count,
                                buffer))
                        {
                            // Write failed:
                            INFO ("Write failed.");
                            _ata = true;
                        }

                        delete[] buffer;

                        _workerState = WorkerState::Finish;
                    }
                    break;
                  
                    case FunctionCode::Search:
                    {
                        if (!Search())
                        {
                            // Search failed
                            INFO ("Search failed");
                        }

                        // Return to ready state, set attention bit.
                        _ata = true;
                        _workerState = WorkerState::Finish;
                    }
                    break;

                    case FunctionCode::Recalibrate:
                        INFO ("RECALIBRATE"); 
                        // Treat a Recal as a seek to zero.
                        _desiredCylinder = 0;
                        // Fall through to seek.
                    case FunctionCode::Seek:
                        if (!SeekTo())
                        {
                            // Seek failed
                            INFO ("Seek failed");
                        }
                        _ata = true;
                        _workerState = WorkerState::Finish;
                        break; 

                    case FunctionCode::Offset:
                    case FunctionCode::ReturnToCenterline:
                        // We don't support adjusting the head position between
                        // cylinders so these are both effectively no-ops, but
                        // they're no-ops that need to take a small amount of time
                        // to complete.
                        INFO ("OFFSET/RETURN TO CL");
                        timeout.wait_ms(10);
                        _ata = true;
                        _workerState = WorkerState::Finish;  
                        break;

                    default:
                        FATAL("Unimplemented drive function %d", command.function);
                        break;
                }
                }
                break;

            case WorkerState::Finish:
                _workerState = WorkerState::Idle;
                // Drive is ready again.
                _ready = true; 
                _pip = false;
                pthread_mutex_lock(&_workerMutex);
                    _newCommand.ready = false;
                pthread_mutex_unlock(&_workerMutex);
                UpdateStatus(true, false);
                break; 
                
        }
    }
}

void
rp_drive_c::ForceDiagnosticError()
{
    UpdateStatus(false, true);
}

//
// Register update functions
//
void
rp_drive_c::UpdateStatus(
   bool complete,
   bool diagForceError)
{
   uint16_t error1 =
       (_rmr ? 04 : 0) |
       (_aoe ? 01000 : 0) |
       (_iae ? 02000 : 0) |
       (_wle ? 04000 : 0);

   bool err = false;

   if (error1 != 0)
   {
       err = true;
       _ata = true;
   }
   else if (diagForceError)
   {
       _ata = true;
   }

   uint16_t status =
        (_vv    ? 0100 : 0) |
        (_ready ? 0200 : 0) |
        (0400) |    // Drive preset -- always set for a single-controller disk
        (_lst   ? 02000 : 0) |   // Last sector read
        (IsWriteLocked() ? 04000 : 0) |   // Write lock
        (IsPackLoaded()  ? 010000 : 0) | // Medium online
        (_pip   ? 020000 : 0) |  // PIP
        (err    ? 040000 : 0) |  // Composite error
        (_ata   ? 0100000 : 0);

   INFO ("Unit %d error1: o%o", _driveNumber, error1);
   INFO ("Unit %d Status: o%o", _driveNumber, status);

   // Inform controller of status update.
   _bus->DriveStatus(_driveNumber, status, error1, _ata, complete);
}

bool
rp_drive_c::SeekTo()
{
    // TODO: delay by appropriate amount

    timeout_c timeout;
  
    _iae = !(_desiredCylinder < _driveInfo.Cylinders);

    if (IsConnected() && IsPackLoaded() && !_iae)
    {
        timeout.wait_ms(20);

        _currentCylinder = _desiredCylinder;
        return true;
    }   
    else
    {
        return false;  // no good
    }
}


//
// TODO: on all reads/writes, an implied seek takes place if the
// specified cylinder is not the current cylinder.
//

//
// Writes the specified number of words from the provided buffer,
// starting at the specified C/H/S address. 
//
bool 
rp_drive_c::Write(
    size_t countInWords, 
    uint16_t* buffer)
{
    _iae = !ValidateCHS(_desiredCylinder, _desiredTrack, _desiredSector);
    _wle = IsWriteLocked();
    
    // TODO: handle address overflow

    if (!IsConnected() || !IsPackLoaded() || _iae || _wle)
    {
        return false;
    }
    else
    {
        _currentCylinder = _desiredCylinder;    
        uint32_t offset = GetSectorForCHS(_currentCylinder, _desiredTrack, _desiredSector);
        file_write(reinterpret_cast<uint8_t*>(buffer), offset * GetSectorSize(), countInWords * 2);
        timeout_c timeout;
        timeout.wait_us(2500);
 
        return true;
    }
}

//
// Reads the specifed number of words starting at the specified logical
// block.  Returns a pointer to a buffer containing the data read.
// Caller is responsible for freeing this buffer.
//
bool
rp_drive_c::Read(
    size_t countInWords,
    uint16_t** buffer)
{

    _iae = !ValidateCHS(_desiredCylinder, _desiredTrack, _desiredSector);
    _wle = false;

    if (!IsConnected() || !IsPackLoaded() || _iae)
    {
        *buffer = nullptr;
        INFO ("Failure: connected %d loaded %d valid %d", IsConnected(), IsPackLoaded(), _iae); 
        return false;
    }
    else
    {
        _currentCylinder = _desiredCylinder;

        *buffer = new uint16_t[countInWords];

        assert(nullptr != *buffer);

        uint32_t offset = GetSectorForCHS(_currentCylinder, _desiredTrack, _desiredSector);
        INFO ("Read from sector offset o%o", offset);
        file_read(reinterpret_cast<uint8_t*>(*buffer), offset * GetSectorSize(), countInWords * 2);
        timeout_c timeout;
        timeout.wait_us(2500);

        return true;
    }
}

bool
rp_drive_c::Search(void)
{
    _iae = !ValidateCHS(_desiredCylinder, _desiredTrack, _desiredSector);

    if (!IsConnected() || !IsPackLoaded() || _iae)
    {
        INFO ("Failure: connected &d loaded %d valid %d", IsConnected(), IsPackLoaded(), _iae);
        return false; 
    }
    else
    {
        // This is just a no-op, as we don't emulate read errors.  We just delay a tiny bit.
        timeout_c timeout;
         
        INFO ("Search commencing.");
        timeout.wait_ms(20);
        INFO ("Search completed.");
        _currentCylinder = _desiredCylinder;

        return true;
    }
    
}

uint32_t
rp_drive_c::GetSectorForCHS(
    uint32_t cylinder,
    uint32_t track,
    uint32_t sector)
{
    return (cylinder * _driveInfo.Tracks * _driveInfo.Sectors) + 
           (track * _driveInfo.Sectors) +
           sector;
}

//
//  Updates the capacity parameter of the drive based on the block count and block size.
//
void 
rp_drive_c::UpdateCapacity() 
{
    // TODO: implement
}

bool
rp_drive_c::ValidateCHS(
    uint32_t cylinder,
    uint32_t track,
    uint32_t sector)
{
    if (cylinder >= _driveInfo.Cylinders ||
        track >= _driveInfo.Tracks ||
        sector >= _driveInfo.Sectors)
    {
        return false; // Out of range
    }
    else
    {
        return true;
    } 
}

//
//
// SetDriveType():
//  Updates this drive's type to the specified type (i.e.
//  RP05 or RM80).
//  If the specified type is not found in our list of known
//  drive types, the drive's type is not changed and false
//  is returned.
//
bool 
rp_drive_c::SetDriveType(
    const char* typeName) 
{
    //
    // Search through drive data table for name,
    // and if valid, set the type appropriately.
    //
    int index = 0;
    while (g_driveTable[index].Cylinders != 0) 
    {
        if (!strcasecmp(typeName, g_driveTable[index].TypeName)) 
        {
            _driveInfo = g_driveTable[index];
            type_name.value = _driveInfo.TypeName;
            UpdateCapacity();
            return true;
        }

        index++;
     }

     // Not found
     return false;
}

//
// on_power_changed():
//  Handle power change notifications.
//
void 
rp_drive_c::on_power_changed(void) 
{
}

//
// on_init_changed():
//  Handle INIT signal.
void 
rp_drive_c::on_init_changed(void) 
{
}

