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
#include "massbus_rp.hpp"
#include "rh11.hpp"

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
// Implements the backing store for RP0X disk images
//
class rp_drive_c: public storagedrive_c 
{
public:
    rp_drive_c(rh11_c *controller, massbus_rp_c* bus, uint32_t driveNumber);
    ~rp_drive_c(void);

    void Reset();

    void Select();
    void DoCommand(uint16_t command);
    void ForceDiagnosticError();

    // Register data reported via RH11
    void SetDesiredCylinder(uint32_t cylinder) { _desiredCylinder = cylinder; }
    void SetDesiredTrack(uint32_t track) { _desiredTrack = track; }
    void SetDesiredSector(uint32_t sector) { _desiredSector = sector; }
    void SetOffset(uint16_t offset) { _offset = offset; }
    void ClearAttention() { _ata = false; }
    uint32_t GetDesiredCylinder(void) { return _desiredCylinder; }
    uint32_t GetDesiredTrack(void) { return _desiredTrack; }
    uint32_t GetDesiredSector(void) { return _desiredSector; }
    uint16_t GetOffset(void) { return _offset; }
    uint32_t GetCurrentCylinder(void) { return _currentCylinder; }
    bool GetAttention() { return _ata; }
 
    uint16_t GetDriveType(void) { return  _driveInfo.TypeNumber; }
    uint16_t GetSerialNumber(void) { return 012345; }  // TODO: Make configurable parameter
    uint32_t GetSectorSize(void);
  
    // Useful public status bits
    bool IsConnected(void) { return true; /* todo: make config. parameter */ }
    bool IsDriveReady(void) { return _ready; }
    bool IsWriteLocked(void) { return false; /* also make config. parameter */ }
    bool IsPackLoaded(void);
 
public:

    // storagedrive_c methods
    bool on_param_changed(parameter_c *param) override; 
    void on_power_changed(void) override;
    void on_init_changed(void) override;

    // background worker function
    void worker(unsigned instance) override;
private:
  
    struct WorkerCommand
    {
        uint32_t bus_address;
        int32_t word_count;
        FunctionCode function;
        volatile bool     ready;
    } _newCommand; 

    enum WorkerState
    {
        Idle = 0,
        Execute = 1,
        Finish = 2,
    } _workerState;


    uint32_t _desiredCylinder;
    uint32_t _desiredTrack;
    uint32_t _desiredSector;
    uint16_t _offset;
    uint32_t _currentCylinder;
    uint32_t _driveNumber;
    bool _ata;
    bool _ned;
    bool _rmr;
    bool _ready;
    bool _lst;
    bool _aoe;
    bool _iae;
    bool _wle;
    bool _pip;
    bool _vv;


    rh11_c* _controller;
    massbus_rp_c* _bus; 

    // Worker mutex
    pthread_cond_t   _workerWakeupCond;
    pthread_mutex_t  _workerMutex;  

    bool SeekTo();
    bool Write(uint32_t countInWords, uint16_t* buffer);
    bool Read(uint32_t countInWords, uint16_t** outBuffer);
    bool Search();

    bool ValidateCHS(uint32_t cylinder, uint32_t track, uint32_t sector);
    uint32_t GetSectorForCHS(uint32_t cylinder, uint32_t track, uint32_t sector);

    bool SetDriveType(const char* typeName);
    void UpdateCapacity();

    void UpdateStatus(bool complete, bool diagForceError);
    
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
