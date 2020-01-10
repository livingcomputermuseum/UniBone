/* 
    massbus_rp_c.hpp: Implements MASSBUS device logic for moving-head RP04/05/06 drives.

    Copyright Vulcan Inc. 2020 via Living Computers: Museum + Labs, Seattle, WA.
    Contributed under the BSD 2-clause license.

*/
#ifndef _MASSBUS_RP_HPP_
#define _MASSBUS_RP_HPP_

#include <stdint.h>
#include <string.h>
using namespace std;

#include "storagedrive.hpp"
#include "rh11.hpp"
#include "massbus_device.hpp"

// Registers
enum class Registers
{
    Control = 00,
    Status = 01,
    Error1 = 02,
    Maintenance = 03,
    AttentionSummary = 04,
    DesiredAddress = 05,
    LookAhead = 07,
    DriveType = 06,
    SerialNo = 014,
    Offset = 011,
    DesiredCylinderAddress = 012,
    CurrentCylinderAddress = 013,
    Error2 = 010,
    Error3 = 015,
    ECCPosition = 016,
    ECCPattern = 017,
};

// Control Function codes
#define RP_GO      01
#define RP_FUNC   076

enum class FunctionCode
{
    Nop = 00,
    Unload = 01,
    Recalibrate = 03,
    DriveClear = 04,
    Release = 05,
    Search = 014,
    WriteCheckData = 024,
    WriteCheckHeaderAndData = 025,
    WriteData = 030,
    WriteHeaderAndData = 031,
    ReadData = 034,
    ReadHeaderAndData = 035,
    Seek = 02,
    Offset = 06,
    ReturnToCenterline = 07,
    PackAcknowledge = 011,
    ReadInPreset = 010,
};

//
// Register metadata
//
struct rp_register_data
{
    bool ActiveOnDATI;
    bool ActiveOnDATO;
    uint16_t ResetValue;
    uint16_t WritableBits;
};

//
// Encapsulates MASSBUS control logic for RP04/05/06 moving-head disks.
// Talks to one or more rp_drive units.
//
class massbus_rp_c: public device_c, public massbus_device_c 
{
public:
    massbus_rp_c(rh11_c* controller);
    virtual ~massbus_rp_c();

public:
    bool ImplementsRegister(uint32_t register) override;
    std::string RegisterName(uint32_t register) override;

    bool RegisterActiveOnDATI(uint32_t register) override;
    bool RegisterActiveOnDATO(uint32_t register) override;
 
    uint16_t RegisterResetValue(uint32_t register) override;
    uint16_t RegisterWritableBits(uint32_t register) override;

    void WriteRegister(uint32_t unit, uint32_t register, uint16_t value) override;
    uint16_t ReadRegister(uint32_t unit, uint32_t register) override;

private:
    void DoCommand(uint32_t unit, uint16_t command);

    // background worker function
    void worker(unsigned instance) override;

    void on_power_changed(void) override;
    void on_init_changed(void) override;
private:
    rh11_c* _controller;

    rp_register_data _registerMetadata[16] =
    {
        { false, false, 0, 0 },			// 0, not used
        { false, false, 0, 0177700 },           // Status
        { false, true , 0, 0177777 },           // Error #1 - writable by diagnostics
        { false, true , 0, 0177777 },           // Maintenance 
        { false, false, 0, 0 },                 // Attention summary
        { false, false, 0, 0017437 },           // Desired Sector/Track
        { false, false, 0, 0 },                 // Look Ahead 
        { false, false, 0, 0 },                 // Drive Type
        { false, false, 0, 0 },                 // Serial Number
        { false, false, 0, 0177777 },           // Offset
        { false, false, 0, 0001777 },           // Desired Cylinder
        { false, false, 0, 0 },                 // Current Cylinder
        { false, false, 0, 0 },                 // Error #2
        { false, false, 0, 0 },                 // Error #3
        { false, false, 0, 0 },                 // ECC Position
        { false, false, 0, 0 },                 // ECC Pattern
    };

};

#endif
