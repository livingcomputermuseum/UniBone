/*
   mscp_drive.hpp: Implementation of MSCP drive, used with MSCP controller.
*/

#pragma once

#include <stdint.h>
#include <string.h>
#include "parameter.hpp"
#include "storagedrive.hpp"

//
// Implements the backing store for MSCP disk images
//
class mscp_drive_c : public storagedrive_c
{
public:
    mscp_drive_c(storagecontroller_c *controller, uint32_t driveNumber);
    ~mscp_drive_c(void);

    uint32_t GetBlockSize(void);
    uint32_t GetBlockCount(void);
    uint32_t GetRCTBlockCount(void);
    uint32_t GetMediaID(void);
    uint64_t GetUnitID(void);
    uint16_t GetRCTSize(void);
    uint8_t GetRBNs(void);
    uint8_t GetRCTCopies(void);

    void SetOnline(void);
    void SetOffline(void);
    bool IsOnline(void);
    bool IsAvailable(void);

    void Write(
        uint32_t blockNumber,
        size_t lengthInBytes,
        uint8_t* buffer);

    uint8_t* Read(
        uint32_t blockNumber,
        size_t lengthInBytes);

    void WriteRCTBlock(
        uint32_t rctBlockNumber,
        uint8_t* buffer);

    uint8_t* ReadRCTBlock(
        uint32_t rctBlockNumber); 

public:
    bool on_param_changed(parameter_c *param) override;
    void on_power_changed(void) override;
    void on_init_changed(void) override;

    void worker(void) override;

public:
    parameter_bool_c use_image_size = parameter_bool_c(
        this, "useimagesize", "uis", false, "Determine unit size from image file instead of drive type");

private:
   
    struct DriveInfo
    {
        char      TypeName[16];
        size_t    BlockCount;
        uint32_t  MediaID;
        bool      Removable;
        bool      ReadOnly;
    };

    DriveInfo g_driveTable[22] 
    {
    { "RX50",  800,      0x25658032, true,  false },
    { "RX33",  2400,     0x25658021, true,  false },
    { "RD51",  21600,    0x25644033, false, false },
    { "RD31",  41560,    0x2564401f, false, false },
    { "RC25",  50902,    0x20643019, true, false },
    { "RC25F", 50902,    0x20643319, true, false },
    { "RD52",  60480,    0x25644034, false, false },
    { "RD32",  83236,    0x25641047, false, false },
    { "RD53",  138672,   0x25644035, false, false },
    { "RA80",  237212,   0x20643019, false, false },
    { "RD54",  311200,   0x25644036, false, false },
    { "RA60",  400176,   0x22a4103c, true, false },
    { "RA70",  547041,   0x20643019, false, false },
    { "RA81",  891072,   0x25641051, false, false },
    { "RA82",  1216665,  0x25641052, false, false },
    { "RA71",  1367310,  0x25641047, false, false },
    { "RRD40", 1331200,  0x25652228, true,  true },
    { "RA72",  1953300,  0x25641048, false, false },
    { "RA90",  2376153,  0x2564105a, false, false },
    { "RA92",  2940951,  0x2564105c, false, false },
    { "RA73",  3920490,  0x25641049, false, false },
    { "", 0, 0, false, false }
    };

    bool SetDriveType(const char* typeName);
    void UpdateCapacity(void); 
    DriveInfo _driveInfo;
    bool _online;
    uint64_t _unitID;
    bool _useImageSize;

    //
    // RCT ("Replacement and Caching Table") data:
    // At this time we provide the minimum required by the MSCP spec,
    // a single block used to provide the volume write-protect flags.
    // We do not require additional RCT space because the underlying media
    // (an image file) doesn't have bad sectors.       
    // This data is not persisted to disk as it is unnecessary.
    //
    unique_ptr<uint8_t> _rctData;
};
