/* 
    rh11.hpp: RH11 UNIBUS-MASSBUS controller

    Copyright Vulcan Inc. 2020 via Living Computers: Museum + Labs, Seattle, WA.
    Contributed under the BSD 2-clause license.

 */
#ifndef _RH11_HPP_
#define _RH11_HPP_

#include <fstream>
#include <cstdint>
#include <memory>

using namespace std;

#include "utils.hpp"
#include "unibusadapter.hpp"
#include "unibusdevice.hpp"
#include "storagecontroller.hpp"
#include "massbus_device.hpp"

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
    010,   // 776730
    011,   // 776732
    012,   // 776734
    013,   // 776736
    014,   // 776740
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

class rh11_c: public storagecontroller_c
{
private:

    // 32 RH11 Registers:     
    unibusdevice_register_t* RH_reg[32];	

    // "Local" registers (or mostly local anyway)
    #define RHCS1    0			 
    #define RHWC     1
    #define RHBA     2
    #define RHCS2    4
    #define RHDB     011

    // Unibusadapter: RH11 has one INTR and DMA
    // should be merged with RH11::DMARequest
    dma_request_c dma_request = dma_request_c(this); // operated by unibusadapter
    intr_request_c intr_request = intr_request_c(this);

    void invoke_interrupt(void);
    void reset_controller(void);

private:

    std::unique_ptr<massbus_device_c> _massbus;

    // Control & Status reg 1 bits
    bool _interruptEnable;
    uint32_t _busAddress;

    // Control & Status reg 2 bits
    uint16_t _unit;
    bool _busAddressIncrementProhibit; 
    bool _parityTest;
	
public:

    rh11_c();
    virtual ~rh11_c();   

    // Unibus register access (for devices on massbus)
    void write_register(uint32_t reg, uint16_t value);
    uint16_t read_register(uint32_t reg);

public:

    // background worker function
    void worker(unsigned instance) override;

    // called by unibusadapter on emulated register access
    void on_after_register_access(
        unibusdevice_register_t *device_reg,
        uint8_t unibus_control) override;

    bool on_param_changed(parameter_c *param) override;
    void on_power_changed(void) override;
    void on_init_changed(void) override;

    void on_drive_status_changed(storagedrive_c *drive) override;
};

#endif
