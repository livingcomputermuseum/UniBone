#include <string.h>
#include <assert.h>

#include "unibus.h"
#include "unibusadapter.hpp"
#include "unibusdevice.hpp"
#include "storagecontroller.hpp"
#include "mscp_drive.hpp"
#include "uda.hpp"

uda_c::uda_c() :
        storagecontroller_c(),
        _sa(0),
        _server(nullptr),
        _ringBase(0),
        _commandRingLength(0),
        _responseRingLength(0),
        _commandRingPointer(0),
        _responseRingPointer(0),
        _interruptVector(0),
        _interruptEnable(false),
        _initStep(InitializationStep::Uninitialized),
        _next_step(false)
{
    name.value = "uda";  
    type_name.value = "UDA50";
    log_label = "uda";

    default_base_addr = 0772150;
    default_intr_vector = 0154;
    default_intr_level = 5;

    // The UDA50 controller has two registers.
    register_count = 2;

    IP_reg = &(this->registers[0]); // @ base addr
    strcpy(IP_reg->name, "IP");
    IP_reg->active_on_dati = true;
    IP_reg->active_on_dato = true;
    IP_reg->reset_value = 0;
    IP_reg->writable_bits = 0xffff;

    SA_reg = &(this->registers[1]); // @ base addr + 2
    strcpy(SA_reg->name, "SA");
    SA_reg->active_on_dati = false;
    SA_reg->active_on_dato = true;
    SA_reg->reset_value = 0;
    SA_reg->writable_bits = 0xffff;

    _server.reset(new mscp_server(this));

    //
    // Initialize drives.  We support up to eight attached drives.
    //
    drivecount = 8;
    for (uint32_t i=0; i<drivecount; i++)
    {
        mscp_drive_c *drive = new mscp_drive_c(this, i);
        drive->unitno.value = i;
        drive->name.value = name.value + std::to_string(i);
        drive->log_label = drive->name.value;
        drive->parent = this;
        storagedrives.push_back(drive);
    }
}

uda_c::~uda_c()
{
    for(uint32_t i=0; i<drivecount; i++)
    {
        delete storagedrives[i];
    }

    storagedrives.clear();
}

void uda_c::Reset(void)
{
    DEBUG("UDA reset");

    _sa = 0;
    update_SA();

    // Signal the worker to begin the initialization sequence.
    StateTransition(InitializationStep::Uninitialized); 
    
    _server->Reset(); 
}

uint32_t uda_c::GetDriveCount(void)
{
    return drivecount;
}
    
mscp_drive_c* uda_c::GetDrive(
    uint32_t driveNumber)
{
    assert(driveNumber < drivecount);

    return dynamic_cast<mscp_drive_c*>(storagedrives[driveNumber]);
}

void uda_c::StateTransition(
    InitializationStep nextStep)
{
    pthread_mutex_lock(&on_after_register_access_mutex);
        _initStep = nextStep;
        _next_step = true;
    pthread_cond_signal(&on_after_register_access_cond);
    pthread_mutex_unlock(&on_after_register_access_mutex);
}

void uda_c::worker(void)
{
    worker_init_realtime_priority(rt_device);

    timeout_c timeout;

    while (!worker_terminate)
    {
        //
        // Wait to be awoken.
        //
        pthread_mutex_lock(&on_after_register_access_mutex);
        while (!_next_step)
        {
            pthread_cond_wait(
                &on_after_register_access_cond,
                &on_after_register_access_mutex);
        }

        _next_step = false;
        pthread_mutex_unlock(&on_after_register_access_mutex);

        // INFO("Awoken.");

        switch (_initStep)
        {
            case InitializationStep::Uninitialized:
                 INFO("Transition to Init state Uninitialized.");

                 // SA should already be zero but we'll be extra sure here.
                 _sa = 0;
                 update_SA();

                 StateTransition(InitializationStep::Step1);
                 break;                

            case InitializationStep::Step1:
                 // Wait 100uS, set SA.
                 timeout.wait_us(100); 

                 INFO("Transition to Init state S1.");
                 //
                 // S1 is set, all other bits zero.  This indicates that we
                 // support a host-settable interrupt vector, that we do not
                 // implement enhanced diagnostics, and that no errors have
                 // occurred.
                 //
                 _sa = 0x0800;
                 update_SA();
                 break;

            case InitializationStep::Step2:
                 // Wait 100uS, set SA.
                 timeout.wait_ms(100);

                 INFO("Transition to Init state S2.");
                 // update the SA read value for step 2:
                 // S2 is set, unibus port type (0),  SA bits 15-8 written
                 // by the host in step 1.
                 _sa = 0x1000 | ((_step1Value >> 8) & 0xff);
                 update_SA();
                 Interrupt();
                 break;

            case InitializationStep::Step3:
                 // Wait 100uS, set SA.
                 timeout.wait_ms(100);

                 INFO("Transition to Init state S3.");
                 // Update the SA read value for step 3:
                 // S3 set, plus SA bits 7-0 written by the host in step 1.
                 _sa = 0x2000 | (_step1Value & 0xff);
                 update_SA();
                 Interrupt();
                 break;
 
            case InitializationStep::Step4:

                 // Clear communications area, set SA   
                 INFO("Clearing comm area at 0x%x.", _ringBase);
                 INFO("resp 0x%x comm 0x%x", _responseRingLength, _commandRingLength);

                 // TODO: -6 and -8 are described; do these always get cleared or only
                 // on VAXen?  ZUDJ diag only expects -2 and -4 to be cleared...
                 for(uint32_t i = 0; 
                     i < (_responseRingLength + _commandRingLength) * sizeof(Descriptor) + 4;
                     i += 2)
                 {
                     DMAWriteWord(_ringBase + i - 4, 0x0);
                 }

                 //
                 // Set the ownership bit on all descriptors in the response ring
                 // to indicate that the port owns them.
                 //

                 Descriptor blankDescriptor;
                 blankDescriptor.Word0.Word0 = 0;
                 blankDescriptor.Word1.Word1 = 0;
                 blankDescriptor.Word1.Fields.Ownership = 1;

                 for(uint32_t i = 0; i < _responseRingLength; i++)
                 {
                     DMAWrite(
                         GetResponseDescriptorAddress(i),
                         sizeof(Descriptor),
                         reinterpret_cast<uint8_t*>(&blankDescriptor));
                 }  
 
                 INFO("Transition to Init state S4.");
                 // Update the SA read value for step 4:
                 // Bits 7-0 indicating our control microcode version.
                 // _sa = 0x4063;  //UDA50
                 _sa = 0x4042;
                 update_SA();
                 Interrupt();
                 break;

            case InitializationStep::Complete:
                 INFO("Transition to Init state Complete.  Initializing response ring.");
                 //_sa = 0x0;
                 //update_SA();

                 //
                 // Set the ownership bit on all descriptors in the response ring
                 // to indicate that the port owns them.
                 //
                 /*
                 Descriptor blankDescriptor;
                 blankDescriptor.Word0.Word0 = 0;
                 blankDescriptor.Word1.Word1 = 0;
                 blankDescriptor.Word1.Fields.Ownership = 1;

                 for(uint32_t i = 0; i < _responseRingLength; i++)
                 {
                     DMAWrite(
                         GetResponseDescriptorAddress(i),
                         sizeof(Descriptor),
                         reinterpret_cast<uint8_t*>(&blankDescriptor));
                 } */
                 break;

        }
    }
}


void
uda_c::on_after_register_access(
    unibusdevice_register_t *device_reg,
    uint8_t unibus_control
)
{
    switch (device_reg->index)
    {
        case 0:  // IP
            if (UNIBUS_CONTROL_DATO == unibus_control)
            {
                // "When written with any value, it causes a hard initialization
                //  of the port and the device controller."
                // INFO("Reset due to IP read");  
                Reset();
            }
            else
            {
                // "When read while the port is operating, it causes the controller
                //  to initiate polling..."
                if (_initStep == InitializationStep::Complete)
                {
                    INFO("Request to start polling.");
                    _server->InitPolling();
                }
            }
            break;

        case 1:  // SA - write only
            uint16_t value = SA_reg->active_dato_flipflops;

            switch (_initStep)
            {
                case InitializationStep::Uninitialized:
                    // Should not occur, we treat it like step1 here.
                    INFO("Write to SA in Uninitialized state.");

                case InitializationStep::Step1:
                    // Host writes the following:
                    // 15   13 11 10  8 7 6           0
                    // +-+-+-----+-----+-+-------------+
                    // |1|W|c rng|r rng|I| int vector  |
                    // | |R| lng | lng |E|(address / 4)|
                    // +-+-+-----+-----+-+-------------+
                    // WR = 1 tells the port to enter diagnostic wrap
                    // mode (which we ignore).
                    //
                    // c rng lng is the number of slots (32 bits each)
                    //  in the command ring, expressed as a power of two.
                    //
                    // r rng lng is as above, but for the response ring.
                    // 
                    // IE=1 means the host is requesting an interrupt
                    // at the end of the completion of init steps 1-3.
                    //
                    // int vector determines if interrupts will be generated
                    // by the port.  If this field is non-zero, interupts will
                    // be generated during normal operation and, if IE=1,
                    // during initialization.
                    _step1Value = value;
                    intr_vector.value = _interruptVector = (value & 0x7f) << 2;
                    _interruptEnable = !!(value & 0x80);
                    _responseRingLength = (1 << ((value & 0x700) >> 8));
                    _commandRingLength = (1 << ((value & 0x3800) >> 11));

                    INFO("Step1: 0x%x", value); 
                    INFO("resp ring 0x%x", _responseRingLength);
                    INFO("cmd ring 0x%x", _commandRingLength);
 
                    // Move to step 2.
                    StateTransition(InitializationStep::Step2);
                    break;

                case InitializationStep::Step2:
                    // Host writes the following:
                    //  15                          1 0 
                    // +-----------------------------+-+ 
                    // |        ringbase low         |P| 
                    // |         (address)           |I|
                    // +-----------------------------+-+ 
                    // ringbase low is the low-order portion of word
                    // [ringbase+0] of the communications area.  This is a
                    // 16-bit byte address whose low-order bit is zero implicitly.
                    //
                    _ringBase = value & 0xfffe;
                    _purgeInterruptEnable = !!(value & 0x1);

                    INFO("Step2: 0x%x", value);
                    // Move to step 3 and interrupt as necessary.
                    StateTransition(InitializationStep::Step3);
                    break;

                case InitializationStep::Step3:
                    // Host writes the following:
                    // 15                              0
                    // +-+-----------------------------+ 
                    // |P|        ringbase hi          |
                    // |P|         (address)           | 
                    // +-+-----------------------------+
                    // PP = 1 means the host is requesting execution of
                    // purge and poll tests, which we ignore because we can.
                    //
                    // ringbase hi is the high-order portion of the address
                    // [ringbase+0].
                    _ringBase |= ((value & 0x7fff) << 16);

                    INFO("Step3: 0x%x", value);
                    // Move to step 4 and interrupt as necessary.
                    StateTransition(InitializationStep::Step4);
                    break;

                case InitializationStep::Step4:
                    // Host writes the following:
                    // 15             8 7           1 0 
                    // +---------------+-----------+-+-+ 
                    // |    reserved   |    burst  |L|G| 
                    // |               |           |F|O| 
                    // +---------------+-----------+-+-+ 
                    // burst is one less than the max. number of longwords
                    // the host is willing to allow per DMA transfer.
                    // If zero, the port uses its default burst count.
                    //
                    // LF=1 means that the host wants a "last fail" response
                    // packet when initialization is complete.
                    //
                    // GO=1 means that the controller should enter its functional
                    // microcode as soon as initialization completes.
                    // 
                    // Note that if GO=0 when initialization completes, the port
                    // will continue to read SA until the host forces SA bit 0 to
                    // make the transition 0->1.
                    //
                    // There is no explicit interrupt at the end of Step 4.
                    //
                    // TODO: For now we ignore burst settings.
                    // We also ignore Last Fail report requests since we aren't
                    // supporting onboard diagnostics and there's nothing to
                    // report.
                    //
                    INFO("Step4: 0x%x", value);
                    if (value & 0x1)
                    {
                        //
                        // GO is set, move to the Complete state.  The worker will
                        // start the controller running.
                        //
                        StateTransition(InitializationStep::Complete);
                        // The VMS bootstrap expects SA to be zero IMMEDIATELY
                        // after completion. 
                        _sa = 0;
                        update_SA();
                    }
                    else
                    {
                        // GO unset, wait until it is.
                    }
                    break;

                case InitializationStep::Complete:
                    // "When zeroed by the host during both initialization and normal
                    //  operation, it signals the port that the host has successfully
                    //  completed a bus adapter purge in response to a port-initiated
                    //  purge request.
                    //  Unsure what this means at the moment.
                    break;
            }
            break;

    }
}

void
uda_c::update_SA()
{
    set_register_dati_value(
        SA_reg,
        _sa,
        "update_SA"); 
} 

Message*
uda_c::GetNextCommand(void)
{
    timeout_c timer;
 
    // Grab the next descriptor being pointed to    
    uint32_t descriptorAddress = 
        GetCommandDescriptorAddress(_commandRingPointer);

    DEBUG("Next descriptor (ring ptr 0x%x) address is o%o", 
        _commandRingPointer, 
        descriptorAddress);


    std::unique_ptr<Descriptor> cmdDescriptor(
        reinterpret_cast<Descriptor*>(
            DMARead(
                descriptorAddress,
                sizeof(Descriptor),
                sizeof(Descriptor))));


    // TODO: if NULL is returned after retry assume a bus error and handle it appropriately.
    assert(cmdDescriptor != nullptr);

    // Check owner bit: if set, ownership has been passed to us, in which case
    // we can attempt to pull the actual message from memory.
    if (cmdDescriptor->Word1.Fields.Ownership)
    {
        bool doInterrupt = false;

        uint32_t messageAddress =
            cmdDescriptor->Word0.EnvelopeLow |
            (cmdDescriptor->Word1.Fields.EnvelopeHigh << 16);

        DEBUG("Next message address is o%o, flag %d", 
            messageAddress, cmdDescriptor->Word1.Fields.Flag);

        //
        // Grab the message length; this is at messageAddress - 4
        //
        bool success = false;
        uint16_t messageLength = 
            DMAReadWord(
                messageAddress - 4,
                success);
        
        // INFO("Message length 0x%x", messageLength);
 
        //
        // TODO: sanity check message length (what is the max length we
        // can expect to see?)
        //
        std::unique_ptr<Message> cmdMessage(
            reinterpret_cast<Message*>(
                DMARead(
                    messageAddress - 4,
                    messageLength + 4, 
                    sizeof(Message)))); 

        //
        // Handle Ring Transitions (from full to not-full) and associated
        // interrupts.
        // If the previous entry in the ring is owned by the Port then that indicates
        // that the ring was previously full (i.e. the descriptor we're now returning
        // is the first free entry.)
        //
        if (cmdDescriptor->Word1.Fields.Flag)
        {
            //
            // Flag is set, host is requesting a transition interrupt.
            // Check the previous entry in the ring.            
            //            
            if (_commandRingLength == 1)
            {
                // Degenerate case:  If the ring is of size 1 we always interrupt.
                doInterrupt = true;
            }
            else
            {
                uint32_t previousDescriptorAddress =
                    GetCommandDescriptorAddress(
                        (_commandRingPointer - 1) % _commandRingLength);

                std::unique_ptr<Descriptor> previousDescriptor(
                    reinterpret_cast<Descriptor*>(
                        DMARead(
                            previousDescriptorAddress,
                            sizeof(Descriptor),
                            sizeof(Descriptor))));

                if (previousDescriptor->Word1.Fields.Ownership)
                {
                    // We own the previous descriptor, so the ring was previously
                    // full.
                    doInterrupt = true;
                }
            }            
        }

        //
        // Message retrieved; reset the Owner bit of the command descriptor,
        // set the Flag bit (to indicate that we've processed it)
        // and return a pointer to the message.
        //
        cmdDescriptor->Word1.Fields.Ownership = 0;
        cmdDescriptor->Word1.Fields.Flag = 1;
        DMAWrite(
            descriptorAddress,
            sizeof(Descriptor),
            reinterpret_cast<uint8_t*>(cmdDescriptor.get()));        

        //
        // Move to the next descriptor in the ring for next time.
        _commandRingPointer = (_commandRingPointer + 1) % _commandRingLength;

        // Post an interrupt as necessary.
        if (doInterrupt)
        {
            //
            // Set ring base - 4 to non-zero to indicate a transition.
            //
            DMAWriteWord(
                _ringBase - 4,
                0xffff);

            //
            // Raise the interrupt
            //
            Interrupt();
        }

        return cmdMessage.release();
    }
   
    DEBUG("No descriptor found.  0x%x 0x%x", cmdDescriptor->Word0.Word0, cmdDescriptor->Word1.Word1);  
 
    // No descriptor available.
    return nullptr;
}

bool
uda_c::PostResponse(
    Message* response
)
{
    bool res = false;

    // Grab the next descriptor.
    uint32_t descriptorAddress = GetResponseDescriptorAddress(_responseRingPointer);
    std::unique_ptr<Descriptor> cmdDescriptor(
        reinterpret_cast<Descriptor*>(
            DMARead(
                descriptorAddress,
                sizeof(Descriptor),
                sizeof(Descriptor))));

    // TODO: if NULL is returned assume a bus error and handle it appropriately.

    //
    // Check owner bit: if set, ownership has been passed to us, in which case
    // we can use this descriptor and fill in the response buffer it points to.
    // If not, we return false to indicate to the caller the need to try again later.
    //
    if (cmdDescriptor->Word1.Fields.Ownership)
    {
        bool doInterrupt = false;

        uint32_t messageAddress =
            cmdDescriptor->Word0.EnvelopeLow |
            (cmdDescriptor->Word1.Fields.EnvelopeHigh << 16);

        //
        // Read the buffer length the host has allocated for this response;
        // if it is shorter than the buffer we're writing then we will need to
        // split the response into multiple responses.
        //        
        // Message length is at messageAddress - 4 -- this is the size of the command
        // not including the two header words.
        //
        bool success = false;
        uint16_t messageLength =
            DMAReadWord(
                messageAddress - 4,
                success);

        DEBUG("response address o%o length o%o", messageAddress, response->MessageLength);

        if (reinterpret_cast<uint16_t*>(response)[0] == 0)
        {
            INFO("Writing zero length response!");
        }

        if (messageLength < response->MessageLength)
        {
            // TODO: handle this; for now eat flaming death.
            INFO("Response buffer %x > message length %x", response->MessageLength, messageLength);
        }
        // else
        {
            //
            // This will fit; simply copy the response message over the top
            // of the buffer allocated on the host -- this updates the header fields
            // as necessary and provides the actual response data to the host.
            //
            DMAWrite(
                messageAddress - 4,
                response->MessageLength + 4,
                reinterpret_cast<uint8_t*>(response));
        }

        //
        // Check if a transition from empty to non-empty occurred, interrupt if requested.
        //
        // TODO: factor this code out as it's basically identical to the code in GetNextCommand.
        //
        // If the previous entry in the ring is owned by the Port then that indicates
        // that the ring was previously empty (i.e. the descriptor we're now returning
        // is the first entry returned to the ring by the Port.)
        //
        if (cmdDescriptor->Word1.Fields.Flag)
        {
            //
            // Flag is set, host is requesting a transition interrupt.
            // Check the previous entry in the ring.
            //            
            if (_responseRingLength == 1)
            {
                // Degenerate case:  If the ring is of size 1 we always interrupt.
                doInterrupt = true;
            }
            else
            {
                uint32_t previousDescriptorAddress =
                    GetResponseDescriptorAddress(
                    (_responseRingPointer - 1) % _responseRingLength);

                std::unique_ptr<Descriptor> previousDescriptor(
                    reinterpret_cast<Descriptor*>(
                        DMARead(
                            previousDescriptorAddress,
                            sizeof(Descriptor),
                            sizeof(Descriptor))));

                if (previousDescriptor->Word1.Fields.Ownership)
                {
                    // We own the previous descriptor, so the ring was previously
                    // full.
                    doInterrupt = true;
                }
            }
        }

        //
        // Message posted; reset the Owner bit of the response descriptor,
        // and set the Flag bit (to indicate that we've processed it).
        //
        cmdDescriptor->Word1.Fields.Ownership = 0;
        cmdDescriptor->Word1.Fields.Flag = 1;
        DMAWrite(
            descriptorAddress,
            sizeof(Descriptor),
            reinterpret_cast<uint8_t*>(cmdDescriptor.get()));

        // Post an interrupt as necessary.
        if (doInterrupt)
        {
            // INFO("Response ring no longer empty, interrupting.");
            //
            // Set ring base - 2 to non-zero to indicate a transition.
            //
            DMAWriteWord(
                _ringBase - 2,
                0xffff);

            //
            // Raise the interrupt
            //
            Interrupt();
        }

        res = true;
        
        // Move to the next descriptor in the ring for next time.
        _responseRingPointer = (_responseRingPointer + 1) % _responseRingLength;
    }

    return res;
}

uint64_t
uda_c::GetControllerIdentifier()
{
    // TODO: make this not hardcoded
    // ID 0x1234568, device class 1 (mass storage), model 2 (UDA50)
    return 0x1234567801020000;
}

void
uda_c::Interrupt(void)
{
    if (_interruptEnable && _interruptVector != 0)
    {
        interrupt();
    }
}

void
uda_c::on_power_changed(void)
{
    storagecontroller_c::on_power_changed();
  
    if (power_down)
    {
        DEBUG("Reset due to power change");
        Reset();
    }
}

void
uda_c::on_init_changed(void)
{
    if (init_asserted)
    {
        DEBUG("Reset due to INIT");
        Reset();
    }

    storagecontroller_c::on_init_changed();
}

void
uda_c::on_drive_status_changed(storagedrive_c *drive)
{
    
}

uint32_t 
uda_c::GetCommandDescriptorAddress(
    size_t index
)
{
    return  _ringBase + _responseRingLength * sizeof(Descriptor) +
            index * sizeof(Descriptor);
}

uint32_t
uda_c::GetResponseDescriptorAddress(
    size_t index
)
{
    return  _ringBase + index * sizeof(Descriptor);
}

/* 
   Write a single word to Unibus memory.  Returns true 
   on success; if false is returned this is due to an NXM condition.
*/
bool
uda_c::DMAWriteWord(
    uint32_t address,
    uint16_t word)
{
    return DMAWrite(
        address,
        sizeof(uint16_t),
        reinterpret_cast<uint8_t*>(&word));
}

/*
   Read a single word from Unibus memory.  Returns the word read on success.
   the success field indicates the success or failure of the read.
*/
uint16_t
uda_c::DMAReadWord(
    uint32_t address,
    bool& success)
{
    uint8_t* buffer = DMARead(
        address,
        sizeof(uint16_t),
        sizeof(uint16_t));

    if (buffer)
    {
        success = true;
        uint16_t retval = *reinterpret_cast<uint16_t *>(buffer);
        delete[] buffer;
        return retval;
    }
    else
    {
        success = false;
        return 0;
    }
}


/*
   Write data from buffer to Unibus memory.  Returns true
   on success; if false is returned this is due to an NXM condition.
*/
bool
uda_c::DMAWrite(
    uint32_t address,
    size_t lengthInBytes,
    uint8_t* buffer)
{
    assert ((lengthInBytes % 2) == 0);

    return unibusadapter->request_DMA(
            UNIBUS_CONTROL_DATO,
            address,
            reinterpret_cast<uint16_t*>(buffer),
            lengthInBytes >> 1);
}

/*
   Read data from Unibus memory into the returned buffer.
   Buffer returned is nullptr if memory could not be read.
   Caller is responsible for freeing the buffer when done.
*/
uint8_t*
uda_c::DMARead(
    uint32_t address,
    size_t lengthInBytes,
    size_t bufferSize)
{
    assert (bufferSize >= lengthInBytes);
    assert((lengthInBytes % 2) == 0);

    uint16_t* buffer = new uint16_t[bufferSize >> 1];

    assert(buffer);

    memset(reinterpret_cast<uint8_t*>(buffer), 0xc3, bufferSize);

    bool success = unibusadapter->request_DMA(
                UNIBUS_CONTROL_DATI,
                address,
                buffer,
                lengthInBytes >> 1);

    if (success)
    { 
	return reinterpret_cast<uint8_t*>(buffer);
    }
    else
    {
        return nullptr;
    }
} 
