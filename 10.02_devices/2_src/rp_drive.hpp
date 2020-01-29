/*
 rp_drive.hpp: Implementation of RP0X drives, used with RH11 controller.

 Copyright Vulcan Inc. 2020 via Living Computers: Museum + Labs, Seattle, WA.
 Contributed under the BSD 2-clause license.

 */

#pragma once

#include <stdint.h>
#include <string.h>
#include <memory>	// unique_ptr
#include "parameter.hpp"
#include "storagedrive.hpp"

//
// Implements the backing store for RP0X disk images
//
class rp_drive_c: public storagedrive_c 
{
public:
    rp_drive_c(storagecontroller_c *controller, uint32_t driveNumber);
    ~rp_drive_c(void);

    bool on_param_changed(parameter_c *param) override;

    uint32_t GetSectorSize(void);
    uint32_t GetType(void);

    bool IsAvailable(void);
    bool IsDriveReady(void) { return _ready; }
    bool IsWriteLocked(void) { return false; /* for now */ }
    bool IsPositioningInProgress(void) { return _pip; }
    void SetPositioningInProgress(void) { _pip = true; }  // TODO: THIS IS A HACK 
    bool GetReadLastSector(void) { return _lst; }
    bool GetAddressOverflow(void) { return _aoe; }
    bool GetInvalidAddress(void) { return _iae; }
    bool GetWriteLockError(void) { return _wle; }
    void SetDriveReady(void) { _ready = true; }
    void ClearDriveReady(void) { _ready = false; }
    void SetVolumeValid(void) { _vv = true; }
    void ClearVolumeValid(void) { _vv = false; }
    bool GetVolumeValid(void) { return _vv; }
  
    bool SeekTo(uint32_t cylinder);
    uint32_t GetCurrentCylinder();

    bool Write(uint32_t cylinder, uint32_t track, uint32_t sector, uint32_t countInWords, uint16_t* buffer);
    bool Read(uint32_t cylinder, uint32_t track, uint32_t sector, uint32_t countInWords, uint16_t** outBuffer);
    bool Search(uint32_t cylinder, uint32_t track, uint32_t sector);
   
public:
    void on_power_changed(void) override;
    void on_init_changed(void) override;

private:
    uint32_t _currentCylinder;
    uint32_t _driveNumber;
    bool _ready;
    bool _lst;
    bool _aoe;
    bool _iae;
    bool _wle;
    bool _pip;
    bool _vv;

    bool ValidateCHS(uint32_t cylinder, uint32_t track, uint32_t sector);
    uint32_t GetSectorForCHS(uint32_t cylinder, uint32_t track, uint32_t sector);

    uint32_t GetBlockSize();

    bool SetDriveType(const char* typeName);
    void UpdateCapacity();

    struct DriveInfo
    {
        char          TypeName[16];
        uint16_t      TypeNumber;
        uint16_t      Cylinders;
        uint16_t      Tracks;
        uint16_t      Sectors;
    } _driveInfo;   
     

    DriveInfo g_driveTable[5]  
    {
        // Name    Type    Cylinders    Tracks    Sectors
        { "RP04",  020,    411,         19,       22 },
        { "RP05",  021,    411,         19,       22 },
        { "RP06",  022,    815,         19,       22 },
        { "RP07",  023,    630,         32,       50 },   // TODO: verify
        { "", 0, 0, 0, 0 },
    };
};
