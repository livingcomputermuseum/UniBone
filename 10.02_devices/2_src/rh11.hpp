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
#include "rp_drive.hpp"

#define RH_DRIVE_COUNT 8

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

    void Interrupt(void);
    void reset_controller(void);

    void IncrementBusAddress(uint32_t delta);
    void DecrementWordCount(uint16_t delta);
   
    bool DMAWrite(uint32_t address, size_t lengthInWords, uint16_t* buffer);
    uint16_t* DMARead(uint32_t address, size_t lengthInWords);

    void UpdateCS1();
    void UpdateCS2();

private:

    std::unique_ptr<massbus_device_c> _massbus;

    // Control & Status reg 1 bits
    volatile bool _attention;
    volatile bool _error;
    volatile bool _mcbParityError;
    volatile bool _avail;
    volatile bool _ready;
    volatile bool _interruptEnable;
    volatile uint16_t _function;
    volatile bool _go;

    volatile uint32_t _busAddress;

    // Control & Status reg 2 bits
    volatile bool _parityError;
    volatile bool _ned;
    volatile bool _nxm;
    volatile bool _progError;
    volatile bool _outputReady;
    volatile bool _inputReady;
    volatile uint16_t _unit;
    volatile bool _busAddressIncrementProhibit; 
    volatile bool _parityTest;
    volatile bool _controllerClear;
	
public:

    rh11_c();
    virtual ~rh11_c();   

    void BusStatus(bool completion, bool ready, bool attention, bool error, bool avail, bool ned);

    // Unibus register access (for devices on massbus)
    void WriteRegister(uint32_t reg, uint16_t value);
    uint16_t ReadRegister(uint32_t reg);

    rp_drive_c* GetDrive(uint32_t driveNumber);
    uint32_t GetBusAddress();
    uint16_t GetWordCount();
   
    bool DiskReadTransfer(uint32_t address, size_t lengthInWords, uint16_t* buffer);
    uint16_t* DiskWriteTransfer(uint32_t address, size_t lengthInWords);
 
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
