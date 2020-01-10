/* 
    massbus_rp_c.cpp: Implements MASSBUS device logic for moving-head RP04/05/06 drives.

    Copyright Vulcan Inc. 2020 via Living Computers: Museum + Labs, Seattle, WA.
    Contributed under the BSD 2-clause license.

*/
#include <stdint.h>
#include <string.h>
using namespace std;

#include "storagedrive.hpp"
#include "rh11.hpp"
#include "massbus_device.hpp"
#include "massbus_rp.hpp"

massbus_rp_c::massbus_rp_c(
   rh11_c* controller) :
       device_c(),
       _controller(controller)
{
    name.value="MASSBUS_RP";
    type_name.value = "massbus_rp_c";
    log_label = "MASSBUS_RP";

}

massbus_rp_c::~massbus_rp_c()
{

}

bool 
massbus_rp_c::ImplementsRegister(
	uint32_t register)
{
    return false;
}

std::string 
massbus_rp_c::RegisterName(
    uint32_t register)
{
    std::string name("foo");

    return name;
}

bool 
massbus_rp_c::RegisterActiveOnDATI(
    uint32_t reg)
{
    return _registerMetadata[reg].ActiveOnDATI;
}

bool 
massbus_rp_c::RegisterActiveOnDATO(
    uint32_t reg)
{
    return _registerMetadata[reg].ActiveOnDATO;
}
 
uint16_t 
massbus_rp_c::RegisterResetValue(
    uint32_t reg)
{
    return _registerMetadata[reg].ResetValue;
}

uint16_t
massbus_rp_c::RegisterWritableBits(
    uint32_t reg)
{
    return _registerMetadata[reg].WritableBits;
}

void
massbus_rp_c::WriteRegister(
    uint32_t unit, 
    uint32_t reg, 
    uint16_t value)
{
    INFO("RP reg write: unit %d register 0%o value 0%o", unit, reg, value);

    switch(reg)
    {
        case 0:
            DoCommand(unit, value);
            break;

        default:
            FATAL("Unimplemented RP register write.");
            break;
    }
}

void massbus_rp_c::DoCommand(
    uint32_t unit,
    uint16_t command)
{
    // check for GO bit; if unset we have nothing to do here.
    if ((command & RP_GO) == 0)
    {
        return;
    }

    uint32_t function = (command & RP_FUNC) >> 1;

    INFO("RP function 0%o", function);

    switch(function)
    {
        case FunctionCode::Nop:
            // Nothing.
            break;

        case FunctionCode::ReadInPreset:
            INFO("RP Read-In Preset");
            //
            // "This command sets the VV (volume valid) bit, clears the desired
            //  sector/track address register, and clears the FMT, HCI, and ECI
            //  bits in the offset register.  It is used to bootstrap the device."
            //
            set_bit
            break;

        case FunctionCode::ReadData:
            INFO("RP Read Data");    
            break;

        default:
            FATAL("Unimplemented RP function.");
            break;
    }    

}

uint16_t 
massbus_rp_c::ReadRegister(
    uint32_t unit, 
    uint32_t reg)
{
    INFO("RP reg read: unit %d register 0%o", unit, reg);
   
    FATAL("Unimplemented RP register read.");
 
    return 0;
}

// background worker function
void 
massbus_rp_c::worker(
    unsigned instance)
{

}

void 
massbus_rp_c::on_power_changed(void)
{

}

void 
massbus_rp_c::on_init_changed(void)
{

}
