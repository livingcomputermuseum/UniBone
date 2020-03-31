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

class rp_drive_c;

// Registers
enum class Registers
{
    Control = 00,
    Status = 01,
    Error1 = 02,
    Maintenance = 03,
    AttentionSummary = 04,
    DesiredSectorTrackAddress = 05,
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

//
// Register metadata
//
struct rp_register_data
{
    char Name[16];
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
    void Reset();

    uint32_t GetRegisterCount() override
    {
        // Total registers for RH11 + RP06:
        return 20;
    }

    bool ImplementsRegister(uint32_t register) override;
    std::string RegisterName(uint32_t register) override;

    bool RegisterActiveOnDATI(uint32_t register) override;
    bool RegisterActiveOnDATO(uint32_t register) override;
 
    uint16_t RegisterResetValue(uint32_t register) override;
    uint16_t RegisterWritableBits(uint32_t register) override;

    void WriteRegister(uint32_t register, uint16_t value) override;
    uint16_t ReadRegister(uint32_t register) override;

    void DriveStatus(uint32_t unit, uint16_t status, uint16_t error1, bool ata, bool complete);

    void SelectUnit(uint32_t unit);

    // Background worker functions
    void Spin();

private:
    void on_power_changed(void) override;
    void on_init_changed(void) override;

    void UpdateDriveRegisters();

    rp_drive_c* SelectedDrive();
    rp_drive_c* GetDrive(uint16_t unit);

private:
    rh11_c* _controller;

    rp_register_data _registerMetadata[16] =
    {
       // Name    DATI   DATO
        { "INV",  false, false, 0, 0 },			// 0, not used
        { "CS1",  false, true,  0, 0041777 },           // 1, Status
        { "ER1",  false, true,  0, 0177777 },           // 2, Error #1 - writable by diagnostics
        { "MR" ,  false, true,  0, 0177777 },           // 3, Maintenance 
        { "ATN",  false, true,  0, 0377 },              // 4, Attention summary
        { "DA" ,  false, true,  0, 0017437 },           // 5, Desired Sector/Track
        { "DT" ,  true,  true,  0, 0 },                 // 6, Drive Type
        { "LA" ,  false, false, 0, 0 },                 // 7, Look Ahead 
        { "ER2",  false, false, 0, 0 },                 // 10, Error #2 
        { "OFF",  false, false, 0, 0177777 },           // 11, Offset
        { "DCY",  false, true,  0, 0001777 },           // 12, Desired Cylinder
        { "CCY",  false, false, 0, 0 },                 // 13, Current Cylinder
        { "SN" ,  true,  true,  0, 0 },                 // 14, Serial Number
        { "ER3",  false, false, 0, 0 },                 // 15, Error #3
        { "EPO",  false, false, 0, 0 },                 // 16, ECC Position
        { "EPA",  false, false, 0, 0 },                 // 17, ECC Pattern
    };

    // Unit selected by last command register write
    volatile uint32_t _selectedUnit;

    // Register data
    volatile uint16_t _maint;
    volatile uint16_t _attnSummary;
    volatile uint16_t _error2;
    volatile uint16_t _error3;

    // RH11 ready signal (ugly: this should be in the rh11 code!)
    volatile bool _ned;  // ditto

    // Drive status update lock
    pthread_mutex_t _updateLock;
 
    // Spin thread
    pthread_t        _spinThread;
};

#endif
