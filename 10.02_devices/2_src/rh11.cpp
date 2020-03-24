/* 
    rh11_cpp: RH11 UNIBUS-MASSBUS controller 

    Copyright Vulcan Inc. 2020 via Living Computers: Museum + Labs, Seattle, WA.
    Contributed under the BSD 2-clause license.

 */

#include <string.h>
#include <assert.h>
#include <pthread.h>

#include "unibus.h"
#include "unibusadapter.hpp"
#include "unibusdevice.hpp"
#include "storagecontroller.hpp"
#include "rp_drive.hpp"
#include "rh11.hpp"   
#include "massbus_rp.hpp"

// Maps the unibus register index to the MASSBUS register number.
// -1 entries are local to the rh11.
int32_t _unibusToMassbusRegisterMap[] =
{
    00,    // 776700
    -1,    // 776702
    -1,    // 776704
    05,    // 776706
    -1,    // 776710
    01,    // 776712
    02,    // 776714
    04,    // 776716
    07,    // 776720
    -1,    // 776722
    03,    // 776724
    06,    // 776726
    014,   // 776730
    011,   // 776732
    012,   // 776734
    013,   // 776736
    010,   // 776740
    015,   // 776742
    016,   // etc.
    017,
    020,
    021,
    022,
    023,
    024,
    025,
    026,
    027,
    030,
    031,
    032,
    033
};

int32_t _massbusToUnibusRegisterMap[] =
{
    00,     // 0
    05,
    06,
    012,
    07,
    03,
    013,
    010,
    014,   // 10
    015,
    016,
    017,
    020,
    021,
    022,
    023,
    024,    // 20
    025,
    026,
    027,
    030,
    031,
    032,
    033,
    034,    // 30
    035,
    036,
    037,
    -1,
    -1,
    -1,
    -1,
};

rh11_c::rh11_c() :
    storagecontroller_c(),
    _massbus(nullptr),
    _attention(false),
    _error(false),
    _mcbParityError(false),
    _avail(false),
    _ready(false),
    _interruptEnable(false),
    _function(0),
    _go(false),
    _parityError(false), 
    _ned(false),
    _nxm(false),
    _progError(false),
    _outputReady(false),
    _inputReady(false),
    _controllerClear(false),
    _busAddressIncrementProhibit(false),
    _parityTest(false),
    _busAddress(0),
    _unit(0)
{
    // static config
    name.value = "rh";
    type_name.value = "RH11";
    log_label = "rh";

    // base addr, intr-vector, intr level
    // TODO: make configurable based on type (fixed, tape, moving-head disk)
    //  right now it is hardcoded for moving-head disks.
    set_default_bus_params(0776700, 5, 0254, 6);

    _massbus.reset(new massbus_rp_c(this));

    // The RH11 controller exposes up to 32 registers, not all are used
    // and use depends on the devices attached to the MASSBUS.
    // TODO: What does an RH11 do when an unimplemented register is accessed?
    register_count = _massbus->GetRegisterCount();

    for (int i=0; i<register_count; i++)
    {
        RH_reg[i] = &(this->registers[i]);

        switch (i)
        {
        case RHCS1:
	    // Control & Status Reg 1
            strcpy(RH_reg[i]->name, "RHCS1");
            RH_reg[i]->active_on_dati = false;
            RH_reg[i]->active_on_dato = true;
            RH_reg[i]->reset_value = 0000200; 
            RH_reg[i]->writable_bits = 041577;
            break;

        case RHWC:
            // Word count
            strcpy(RH_reg[i]->name, "RHWC");
            RH_reg[i]->active_on_dati = false;
            RH_reg[i]->active_on_dato = true;
            RH_reg[i]->reset_value = 0;
            RH_reg[i]->writable_bits = 0177777;
            break;

        case RHBA:
            // Bus address
            strcpy(RH_reg[i]->name, "RHBA");
            RH_reg[i]->active_on_dati = false;
            RH_reg[i]->active_on_dato = true; 
            RH_reg[i]->reset_value = 0;
            RH_reg[i]->writable_bits = 0177776;
            break;

        case RHCS2:
            // Control & Status Reg 2
            strcpy(RH_reg[i]->name, "RHCS2");
            RH_reg[i]->active_on_dati = false;
            RH_reg[i]->active_on_dato = true;
            RH_reg[i]->reset_value = 0;
            RH_reg[i]->writable_bits = 0021077;
            break;

        case RHDB:
            // Data Buffer (maintenance only)
            strcpy(RH_reg[i]->name, "RHDB");
            RH_reg[i]->active_on_dati = false;
            RH_reg[i]->active_on_dato = false;
            RH_reg[i]->reset_value = 0;
            RH_reg[i]->writable_bits = 0177777;
            break;

        default:
            //
            // This is a "REMOTE" register implemented by the device(s)
            // attached to the massbus.
            //
            int32_t ma = _unibusToMassbusRegisterMap[i];
            if (ma >= 0 && _massbus->ImplementsRegister(ma))
            {
                strcpy(RH_reg[i]->name, _massbus->RegisterName(ma).c_str());
                RH_reg[i]->active_on_dati = _massbus->RegisterActiveOnDATI(ma);
                RH_reg[i]->active_on_dato = _massbus->RegisterActiveOnDATO(ma);
                RH_reg[i]->reset_value = _massbus->RegisterResetValue(ma);
                RH_reg[i]->writable_bits = _massbus->RegisterWritableBits(ma);
            }
            else
            {
                // Not implemented by this device type
                RH_reg[i] = nullptr;
            }
            break;
        }
    }

    //
    // We can have up to eight attached drives.
    // Really drives should "belong" to massbus_c...
    // but that complicates configuration, etc.
    //
    drivecount = RH_DRIVE_COUNT;
    for (uint32_t i=0; i<drivecount; i++)
    {
        rp_drive_c *drive = new rp_drive_c(this, i);
        drive->unitno.value = i;
        drive->name.value = name.value + std::to_string(i);
        drive->log_label = drive->name.value;
        drive->parent = this;
        storagedrives.push_back(drive);
    }
  
}
  
rh11_c::~rh11_c()
{
}

// TODO: RENAME!  This is invoked when the drive is finished with the given command.
void
rh11_c::BusStatus(
    bool completion,
    bool ready,
    bool attention,
    bool error,
    bool avail,
    bool ned)
{
    INFO("Massbus status update attn %d, error %d, ned %d", attention, error, ned);

    _attention = attention;
    _error = error;
    _avail = avail;
    _ready = ready;

    if (completion)
    {
        // clear the GO bit from the CS word if the drive is finished.
        _go = false; 
    }

    UpdateCS1();

    if (!_controllerClear)
    { 
        _ned = ned;
        UpdateCS2();
    }
 
    if ((attention || ready) && completion)
    {
        Interrupt();
    }
}

void
rh11_c::UpdateCS1()
{
    uint16_t newStatus =
        (_attention ?         0100000 : 0) |   
        (_error ?             0040000 : 0) |
        (_mcbParityError ?    0020000 : 0) |
        (_avail ?             0004000 : 0) |  // drive available
        ((_busAddress & 0600000) >> 8) |
        (_ready ?             0000200 : 0) |  // controller ready bit
        (_interruptEnable ?   0000100 : 0) | 
        (_function << 1) |
        (_go ?                0000001 : 0);

    INFO("RHCS1 is now o%o", newStatus);
 
    set_register_dati_value(
        RH_reg[RHCS1],
        newStatus,
        "UpdateCS1");
}

void rh11_c::UpdateCS2()
{
    uint16_t newStatus =
        (_parityError ?                   0020000 : 0) |
        (_ned ?                           0010000 : 0) |
        (_nxm ?                           0004000 : 0) |
        (_progError ?                     0002000 : 0) |
        (_outputReady ?                   0000200 : 0) |
        (_inputReady ?                    0000100 : 0) |
        (_parityTest ?                    0000020 : 0) |
        (_busAddressIncrementProhibit ?   0000010 : 0) |
        (_unit);

    INFO("RHCS2 is now o%o", newStatus);

    set_register_dati_value(
        RH_reg[RHCS2],
        newStatus,
        "UpdateCS2");
}

void
rh11_c::WriteRegister(
    uint32_t reg,
    uint16_t value)
{
    set_register_dati_value(
        RH_reg[_massbusToUnibusRegisterMap[reg]],
        value,
        "write_register");
}

uint16_t
rh11_c::ReadRegister( 
    uint32_t reg)
{
    return get_register_dato_value(
        RH_reg[_massbusToUnibusRegisterMap[reg]]);   
}

rp_drive_c*
rh11_c::GetDrive(
    uint32_t driveNumber)
{
    assert (driveNumber < RH_DRIVE_COUNT);

    return dynamic_cast<rp_drive_c*>(storagedrives[driveNumber]);
}

uint32_t
rh11_c::GetBusAddress()
{
    return _busAddress;
}

//
// Transfers data read from disk to the Unibus.
// Updates RHBA and RHWC registers appropriately.
//
bool
rh11_c::DiskReadTransfer(
    uint32_t address,
    size_t lengthInWords,
    uint16_t* diskBuffer)
{
    // Write the disk data to memory
    if (DMAWrite(
            address,
            lengthInWords,
            diskBuffer))
    {
        IncrementBusAddress(lengthInWords);
        DecrementWordCount(lengthInWords);
        return true;
    }
    else
    {
        // TODO: raise errors, etc.
        FATAL("DMA Write failed!");
        return false;
    }
}

//
// Transfers data from the Unibus to be written to disk.
// Updates RHBA and RHWC registers appropriately.
//
uint16_t*
rh11_c::DiskWriteTransfer(
    uint32_t address,
    size_t lengthInWords)
{
    uint16_t* buffer = DMARead(
        address,
        lengthInWords);

    if (buffer)
    {
        IncrementBusAddress(lengthInWords);
        DecrementWordCount(lengthInWords);
    }
    else
    {
        // TODO: raise errors, etc.
        FATAL("DMA Read failed!"); 
    }

    return buffer; 
}

void
rh11_c::IncrementBusAddress(uint32_t delta)
{
    _busAddress += delta;

    uint16_t currentStatus = get_register_dato_value(RH_reg[RHCS1]);

    // Clear extended address bits
    currentStatus &= ~(0x300);

    currentStatus |= ((_busAddress & 0x30000) >> 8);
    set_register_dati_value(
        RH_reg[RHCS1],
        currentStatus,
        "SetBusAddress");

    set_register_dati_value(
        RH_reg[RHBA],
        (_busAddress & 0xffff),
        "IncrementBusAddress");

    INFO("BA Reg incr:  o%o", _busAddress);
}

uint16_t
rh11_c::GetWordCount()
{
    return -get_register_dato_value(RH_reg[RHWC]);
}

void
rh11_c::DecrementWordCount(uint16_t delta)
{
    uint16_t currentWordCount = get_register_dato_value(RH_reg[RHWC]);

    currentWordCount += delta;

    set_register_dati_value(
        RH_reg[RHWC],
        currentWordCount,
        "DecrementWordCount");


    INFO("WC Reg decr:  o%o", currentWordCount);
}

bool
rh11_c::DMAWrite(
    uint32_t address,
    size_t lengthInWords,
    uint16_t* buffer)
{
    assert (address < 0x40000);

    for(size_t i=0;i<lengthInWords;i++)
    {
        printf("o%o ", buffer[i]);
    }

    INFO("DMA Write o%o, length %d", address, lengthInWords);
    unibusadapter->DMA(
        dma_request,
        true,
        UNIBUS_CONTROL_DATO,
        address,
        buffer,
        lengthInWords);

    INFO("Success: %d", dma_request.success);
    assert(dma_request.success);

    return dma_request.success;
}

uint16_t*
rh11_c::DMARead(
    uint32_t address,
    size_t lengthInWords)
{
    assert (address < 0x40000);

    INFO("DMA Read o%o, length %d", address, lengthInWords);

    uint16_t* buffer = new uint16_t[lengthInWords];
    assert (buffer);
  
    unibusadapter->DMA(
        dma_request,
        true,
        UNIBUS_CONTROL_DATI,
        address,
        buffer,
        lengthInWords);

    if (dma_request.success)
    {
        return buffer;
    }
    else
    {
        delete buffer;
        return nullptr;
    }
}


// return false, if illegal parameter value.
// verify "new_value", must output error messages
bool rh11_c::on_param_changed(parameter_c *param) 
{
    // no own parameter or "enable" logic
    if (param == &priority_slot) 
    {
        dma_request.set_priority_slot(priority_slot.new_value);
        intr_request.set_priority_slot(priority_slot.new_value);
    }
    else if (param == &intr_level) 
    {
        intr_request.set_level(intr_level.new_value);
    } 
    else if
    (param == &intr_vector)  
    {
        intr_request.set_vector(intr_vector.new_value);
    }	
    return storagecontroller_c::on_param_changed(param); // more actions (for enable)
}

// Background worker.
// Handle device operations.
void rh11_c::worker(unsigned instance) 
{
    UNUSED(instance); // only one

    worker_init_realtime_priority(rt_device);

    bool do_interrupt = true;
    timeout_c timeout;

    /* 
    while (!workers_terminate) 
    {
    }
    */
}

//
// process DATI/DATO access to the RK11's "active" registers.
// !! called asynchronuously by PRU, with SSYN asserted and blocking UNIBUS.
// The time between PRU event and program flow into this callback
// is determined by ARM Linux context switch
//
// UNIBUS DATO cycles let dati_flipflops "flicker" outside of this proc:
//      do not read back dati_flipflops.
void rh11_c::on_after_register_access(
    unibusdevice_register_t *device_reg,
    uint8_t unibus_control)
{
    uint16_t value = device_reg->active_dato_flipflops;

    switch(device_reg->index)
    {
        case RHCS1:    // Control & Status 1
        {
            if (UNIBUS_CONTROL_DATO == unibus_control)
            {
                INFO("RHCS1: DATO o%o", value);
                _error = !!(value & 0040000);
                _busAddress = (_busAddress & 0177777) | ((value & 01400) << 8);
                _interruptEnable = !!(value & 0100);
                _function = (value & 076) >> 1;
                _go = (value & 01);

                // Bit 14 (Transfer Error) is writeable; the function of this is not documented
                // In the handbook or engineering manuals.  The schematics are eluding me as well.
                // 2.11bsd writes this bit, as do diagnostics (and they expect it to be read back..)
                // SIMH suggests this is used to clear error bits, so we'll do that here.
                if (_error)
                {
                    _error = false;
                    _parityError = false;
                    _mcbParityError = false;
                    _ned = false;
                    _nxm = false;
                }
               
                INFO("RHCS1: IE %d BA o%o func o%o go %d", _interruptEnable, _busAddress, _function, _go); 
                // Let the massbus device take a crack at the shared bits
                _massbus->WriteRegister(_unit, RHCS1, value & 077);

                // TODO:  Per RH11-AB_OptionDescr.pdf (p 4-17):
                // "The program can force an interrupt by loading bits D06 H (IE) and D07 H (RDY) in the CS1
                //  register which direct sets the INTR flip-flop."
                //
                UpdateCS1(); 
            }
        }
        break;

        case RHCS2:    // Control & Status 2
        {
            if (UNIBUS_CONTROL_DATO == unibus_control)
            {
                _unit = (value & 07);
                _busAddressIncrementProhibit = !!(value & 010);
                _parityTest = !!(value & 020); 
                _controllerClear = !!(value & 040);
                _parityError = !!(value & 0020000);
 
                INFO("RHCS2 write: o%o", value); 
                INFO("RHCS2: perror %d, unit %d inc %d ptest %d clear %d", 
                    _parityError, _unit, _busAddressIncrementProhibit, _parityTest, _controllerClear);
 
                // TODO: handle System Register Clear (bit 5)     
                if (_controllerClear)
                {
                    INFO("Controller Clear");
                    _interruptEnable = false;

                    _massbus->Reset();

                    // clear error and the clear bits
                    _ned = false;
                    _nxm = false;

                    INFO("RHCS2: is now o%o", value);
                    _controllerClear = false;
                }

                UpdateCS2();
            }
        }
        break;

        case RHWC:     // Word count
        {
            if (UNIBUS_CONTROL_DATO == unibus_control)
            {
                INFO("RHWC: o%o", value);

                set_register_dati_value(
                    RH_reg[RHWC],
                    value,
                    "HACK");
            }
        }
        break;

        case RHBA:    // Bus address
        {
            if (UNIBUS_CONTROL_DATO == unibus_control)
            {
               _busAddress = (_busAddress & 0x30000) | value;
               INFO("RHBA: o%o", _busAddress);
 
               set_register_dati_value(
                   RH_reg[RHWC],
                   value,
                   "HACK");
            }
        }
        break;

        default:
            // See if a massbus device wishes to answer
            if (RH_reg[device_reg->index] != nullptr)
            {
                if (UNIBUS_CONTROL_DATO == unibus_control)
                {
                    _massbus->WriteRegister(_unit, _unibusToMassbusRegisterMap[device_reg->index], value);
                    // Massbus is responsible for writing back the appropriate dati value.
                }
                else
                {
                    INFO("massbus reg read %o", device_reg->index);
                    set_register_dati_value(
                        device_reg,
                        _massbus->ReadRegister(_unit, _unibusToMassbusRegisterMap[device_reg->index]),
                        "on_after_register_access");
                }
            }
            else
            {
                INFO("Unhandled register write o%o", device_reg->index);
            }
            break;
    }   
    
}

void rh11_c::Interrupt(void)
{
    if(_interruptEnable)
    {
        INFO("Interrupt!");
        unibusadapter->INTR(intr_request, nullptr, 0);

        // IE is cleared after the interrupt is raised
        // Actual bit is cleared in BusStatus, this should be fixed.
        _interruptEnable = false;
        UpdateCS1();
    }
}

void rh11_c::reset_controller(void)
{
    reset_unibus_registers();
 
}

void rh11_c::on_power_changed(void) 
{
    storagecontroller_c::on_power_changed();

    if (power_down) 
    { 
        // power-on defaults
        reset_controller();
    }
}

// UNIBUS INIT: clear all registers
void rh11_c::on_init_changed(void) 
{
    // write all registers to "reset-values"
    if (init_asserted) 
    {
        reset_controller();
    }

    storagecontroller_c::on_init_changed();
}

void 
rh11_c::on_drive_status_changed(storagedrive_c *drive)
{

}
