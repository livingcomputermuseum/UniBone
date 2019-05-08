/*
    mscp_drive.cpp: Implementation of MSCP disks.
*/

#include <assert.h>
#include <memory>

using namespace std;

#include "logger.hpp"
#include "utils.hpp"
#include "mscp_drive.hpp"
#include "mscp_server.hpp"

mscp_drive_c::mscp_drive_c(
    storagecontroller_c *controller,
    uint32_t driveNumber) :
        storagedrive_c(controller),
        _useImageSize(false)
{
    log_label = "MSCPD";
    SetDriveType("RA81");
    SetOffline();

    // Calculate the unit's ID:
    // drive number in upper 32 bits, class/model in lower.
    _unitID = (static_cast<uint64_t>(driveNumber) << 32) | 0x02020000;

    // Initialize the RCT area
    _rctData.reset(new uint8_t[GetBlockSize()]);
    memset(reinterpret_cast<void *>(_rctData.get()), 0, GetBlockSize());
}

mscp_drive_c::~mscp_drive_c()
{
    if (file_is_open())
    {
        file_close();
    }
}

uint32_t mscp_drive_c::GetBlockSize()
{
    //
    // For the time being this is always 512 bytes.
    //   
    return 512;
}

uint32_t mscp_drive_c::GetBlockCount()
{
    if (_useImageSize)
    {
        // Return the image size / Block size (rounding down).
        return file_size() / GetBlockSize();
    }
    else
    {
        //
        // Use the size defined by the drive type.
        //
        return _driveInfo.BlockCount;
    }
}

uint32_t mscp_drive_c::GetRCTBlockCount()
{
    //
    // We provide only a single RCT block, required by the MSCP spec for the volume
    // write-protect flags.
    //
    return 1;
}

uint32_t mscp_drive_c::GetMediaID()
{
    return _driveInfo.MediaID;
}

uint64_t mscp_drive_c::GetUnitID()
{
    return _unitID;
}

bool mscp_drive_c::IsAvailable()
{
    return file_is_open();
}

bool mscp_drive_c::IsOnline()
{
    return _online;
}

void mscp_drive_c::SetOnline()
{
    _online = true;

    //
    // Once online, the drive's type and image cannot be changed until
    // the drive is offline.
    //
    type_name.readonly = true;
    image_filepath.readonly = true;
}

void mscp_drive_c::SetOffline()
{
    _online = false;
    type_name.readonly = false;
    image_filepath.readonly = false;
}

//
// Writes the specified number of bytes from the provided buffer,
// starting at the specified logical block.
//
void mscp_drive_c::Write(
    uint32_t blockNumber,
    size_t lengthInBytes,
    uint8_t* buffer)
{
    file_write(
        buffer,
        blockNumber * GetBlockSize(),
        lengthInBytes);
}

//
// Reads the specifed number of bytes starting at the specified logical
// block.  Returns a pointer to a buffer containing the data read.
// Caller is responsible for freeing this buffer.
//
uint8_t* mscp_drive_c::Read(
    uint32_t blockNumber,
    size_t lengthInBytes)
{
    uint8_t* buffer = new uint8_t[lengthInBytes];

    assert(nullptr != buffer);

    file_read(
        buffer,
        blockNumber * GetBlockSize(),
        lengthInBytes);

    return buffer;
}

//
// Writes a single block's worth of data from the provided buffer into the
// RCT area at the specified RCT block.  Buffer must be at least as large 
// as the disk's block size.
//
void mscp_drive_c::WriteRCTBlock(
    uint32_t rctBlockNumber,
    uint8_t* buffer)
{
    assert (rctBlockNumber < GetRCTBlockCount());

    memcpy(
       reinterpret_cast<void *>(_rctData.get() + rctBlockNumber * GetBlockSize()),
       reinterpret_cast<void *>(buffer), 
       GetBlockSize());
}

//
// Reads a single block's worth of data from the RCT area (at the specified
// block offset).  Returns a pointer to a buffer containing the data read.
// Caller is responsible for freeing this buffer.
//
uint8_t* mscp_drive_c::ReadRCTBlock(
    uint32_t rctBlockNumber)
{
    assert (rctBlockNumber < GetRCTBlockCount());

    uint8_t* buffer = new uint8_t[GetBlockSize()];
    assert (nullptr != buffer);

    memcpy(
        reinterpret_cast<void *>(buffer),
        reinterpret_cast<void *>(_rctData.get() + rctBlockNumber * GetBlockSize()),
        GetBlockSize()); 
        
    return buffer;
} 

void mscp_drive_c::UpdateCapacity()
{
    capacity.value = 
        GetBlockCount() * GetBlockSize();
}

bool mscp_drive_c::on_param_changed(
    parameter_c *param)
{
   if (&type_name == param)
   {
       return SetDriveType(type_name.new_value.c_str()); 
   }
   else if (&image_filepath == param)
   {
       //
       // Try to open the image file.
       //
       if (file_open(image_filepath.new_value, true))
       {
            image_filepath.value = image_filepath.new_value;
            UpdateCapacity();
            return true;
       }
      
       //
       // TODO: if file is a nonstandard size? 
   }
   else if (&use_image_size == param)
   {
       _useImageSize = use_image_size.new_value;
       use_image_size.value = use_image_size.new_value;
       UpdateCapacity(); 
       return true;
   }

   return false;
}

bool mscp_drive_c::SetDriveType(const char* typeName)
{
    //
    // Search through drive data table for name,
    // and if valid, set the type appropriately.
    //
    int index = 0;
    while (g_driveTable[index].BlockCount != 0)
    {
        if (!strcasecmp(typeName, g_driveTable[index].TypeName))
        {
            _driveInfo = g_driveTable[index];
            type_name.value = _driveInfo.TypeName;
            UpdateCapacity(); 
            return true;
        }

        index++;
    }

    // Not found
    return false;
}

void mscp_drive_c::worker(void)
{
    // Nothing to do here at the moment.
}

void mscp_drive_c::on_power_changed(void)
{
    // Take the drive offline due to power change
    SetOffline();
}

void mscp_drive_c::on_init_changed(void)
{
    // Take the drive offline due to reset
    SetOffline();
}


