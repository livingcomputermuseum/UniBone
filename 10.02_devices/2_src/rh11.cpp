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
#include "rh11.hpp"   
#include "massbus_rp.hpp"

rh11_c::rh11_c() :
    storagecontroller_c(),
    _massbus(nullptr),
    _interruptEnable(false),
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
    set_default_bus_params(0776700, 11, 0254, 5);

    // TODO: allow configuration for different device types
    _massbus.reset(new massbus_rp_c(this));

    // The RH11 controller exposes up to 32 registers, not all are used
    // and use depends on the devices attached to the MASSBUS.
    // TODO: What does an RH11 do when an unimplemented register is accessed?
    register_count = 32;

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
            RH_reg[i]->reset_value = 0x0008; 
            RH_reg[i]->writable_bits = 0x037f;
            break;

        case RHWC:
            // Word count
            strcpy(RH_reg[i]->name, "RHWC");
            RH_reg[i]->active_on_dati = false;
            RH_reg[i]->active_on_dato = false;
            RH_reg[i]->reset_value = 0;
            RH_reg[i]->writable_bits = 0xffff;
            break;

        case RHBA:
            // Bus address
            strcpy(RH_reg[i]->name, "RHBA");
            RH_reg[i]->active_on_dati = false;
            RH_reg[i]->active_on_dato = false;
            RH_reg[i]->reset_value = 0;
            RH_reg[i]->writable_bits = 0xffff;
            break;

        case RHCS2:
            // Control & Status Reg 2
            strcpy(RH_reg[i]->name, "RHCS2");
            RH_reg[i]->active_on_dati = false;
            RH_reg[i]->active_on_dato = true;
            RH_reg[i]->reset_value = 0;
            RH_reg[i]->writable_bits = 0x003f;
            break;

        case RHDB:
            // Data Buffer (maintenance only)
            strcpy(RH_reg[i]->name, "RHDB");
            RH_reg[i]->active_on_dati = true;
            RH_reg[i]->active_on_dato = true;
            RH_reg[i]->reset_value = 0;
            RH_reg[i]->writable_bits = 0xffff;
            break;

        default:
            //
            // This is a "REMOTE" register implemented by the device(s)
            // attached to the massbus.
            //
            if (_massbus->ImplementsRegister(i))
            {
                strcpy(RH_reg[i]->name, _massbus->RegisterName(i).c_str());
                RH_reg[i]->active_on_dati = _massbus->RegisterActiveOnDATI(i);
                RH_reg[i]->active_on_dato = _massbus->RegisterActiveOnDATO(i);
                RH_reg[i]->reset_value = _massbus->RegisterResetValue(i);
                RH_reg[i]->writable_bits = _massbus->RegisterWritableBits(i);
            }
            else
            {
                // Not implemented by this device type
                RH_reg[i] = nullptr;
            }
            break;
        }
    }

}
  
rh11_c::~rh11_c()
{
}

void
rh11_c::write_register(
    uint32_t reg,
    uint16_t value)
{
    set_register_dati_value(
        RH_reg[_massbusToUnibusRegisterMap[reg]],
        value,
        "write_register");
}

uint16_t
rh11_c::read_register(
    uint32_t reg)
{
    return get_register_dato_value(
        RH_reg[_massbusToUnibusRegisterMap[reg]]);   
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
    UNUSED(unibus_control);

    uint16_t value = device_reg->active_dato_flipflops;

    switch(device_reg->index)
    {
        case RHCS1:    // Control & Status 1
        {
            if (UNIBUS_CONTROL_DATO == unibus_control)
            {
                // IE bit
                _interruptEnable = !!(value & 0x40);

                // Extended bus address bits
                _busAddress = (_busAddress & 0xffff) | ((value & 0x300) << 8);

                // Let the massbus device take a crack at the shared bits
                _massbus->WriteRegister(_unit, RHCS1, value & 0x3f);

                INFO("RHCS1: IE %x BA 0%o", _interruptEnable, _busAddress);
            }
        }
        break;

        case RHCS2:    // Control & Status 2
        {
            if (UNIBUS_CONTROL_DATO == unibus_control)
            {
                _unit = (value & 0x7);
                _busAddressIncrementProhibit = !!(value & 0x8);
                _parityTest = !!(value & 0x10);
                
                // TODO: handle System Register Clear (bit 5)        
                INFO("RHCS2: unit %d", _unit); 
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
                }
                else
                {
                    set_register_dati_value(
                        device_reg,
                        _massbus->ReadRegister(_unit, _unibusToMassbusRegisterMap[device_reg->index]),
                        "on_after_register_access");
                }
            }
            break;
    }   
    
}

void rh11_c::invoke_interrupt(void)
{
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
