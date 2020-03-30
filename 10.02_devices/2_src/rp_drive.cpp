/*
 rp_drive.cpp: Implementation of RP0X disks.

 Copyright Vulcan Inc. 2020 via Living Computers: Museum + Labs, Seattle, WA.
 Contributed under the BSD 2-clause license.

 */

#include <assert.h>
#include <memory>

using namespace std;

#include "logger.hpp"
#include "utils.hpp"
#include "rp_drive.hpp"

rp_drive_c::rp_drive_c(storagecontroller_c *controller, uint32_t driveNumber) :
     storagedrive_c(controller),
     _driveNumber(driveNumber),
     _desiredCylinder(0),
     _currentCylinder(0),
     _desiredTrack(0),
     _offset(0),
     _ready(true),
     _lst(false),
     _aoe(false),
     _iae(false),
     _wle(false),
     _pip(false),
     _vv(false) 
{
    set_workers_count(0) ; // needs no worker()
    log_label = "RP";
    SetDriveType("RP06");
}

rp_drive_c::~rp_drive_c() 
{
    if (file_is_open()) 
    {
        file_close();
    }
}

void
rp_drive_c::Reset()
{

}

// on_param_changed():
//  Handles configuration parameter changes.
bool 
rp_drive_c::on_param_changed(parameter_c *param) 
{
    // no own "enable" logic
    if (&type_name == param) 
    {
	return SetDriveType(type_name.new_value.c_str());
    } 
    else if (&image_filepath == param) 
    {
        // Try to open the image file.
        if (file_open(image_filepath.new_value, true)) 
        {
            image_filepath.value = image_filepath.new_value;

            // New image; this is analogous to a new pack being spun up.
            // Set the Volume Valid bit so software knows things have changed.
            // TODO: should alert massbus_rp so that it can update status regs immediately. 
            SetVolumeValid();

            return true;
        }
        
        return false;
    } 

    return device_c::on_param_changed(param); // more actions (for enable)false;
}

//
// GetBlockSize():
//  Returns the size, in bytes, of a single sector on this drive.
//  This is either 512 or 576 bytes.
//
uint32_t 
rp_drive_c::GetSectorSize()
{
    //
    // For the time being this is always 512 bytes.
    //
    return 512;
}

//
// IsPackLoaded():
//  Indicates whether this drive has a pack loaded (i.e. has an image
//  assigned to it)
//
bool 
rp_drive_c::IsPackLoaded()
{
    return file_is_open();
}

bool
rp_drive_c::SeekTo()
{
    // TODO: delay by appropriate amount

    timeout_c timeout;
  
    _iae = !(_desiredCylinder < _driveInfo.Cylinders);

    if (IsConnected() && IsPackLoaded() && !_iae)
    {
        timeout.wait_ms(20);

        _currentCylinder = _desiredCylinder;
        return true;
    }   
    else
    {
        return false;  // no good
    }
}


//
// TODO: on all reads/writes, an implied seek takes place if the
// specified cylinder is not the current cylinder.
//

//
// Writes the specified number of words from the provided buffer,
// starting at the specified C/H/S address. 
//
bool 
rp_drive_c::Write(
    size_t countInWords, 
    uint16_t* buffer)
{
    _iae = !ValidateCHS(_desiredCylinder, _desiredTrack, _desiredSector);
    _wle = IsWriteLocked();
    
    // TODO: handle address overflow

    if (!IsConnected() || !IsPackLoaded() || _iae || _wle)
    {
        return false;
    }
    else
    {
        _currentCylinder = _desiredCylinder;    
        uint32_t offset = GetSectorForCHS(_currentCylinder, _desiredTrack, _desiredSector);
        file_write(reinterpret_cast<uint8_t*>(buffer), offset * GetSectorSize(), countInWords * 2);
        timeout_c timeout;
        timeout.wait_us(500);
 
        return true;
    }
}

//
// Reads the specifed number of words starting at the specified logical
// block.  Returns a pointer to a buffer containing the data read.
// Caller is responsible for freeing this buffer.
//
bool
rp_drive_c::Read(
    size_t countInWords,
    uint16_t** buffer)
{

    _iae = !ValidateCHS(_desiredCylinder, _desiredTrack, _desiredSector);
    _wle = false;

    if (!IsConnected() || !IsPackLoaded() || _iae)
    {
        *buffer = nullptr;
        DEBUG("Failure: connected %d loaded %d valid %d", IsConnected(), IsPackLoaded(), _iae); 
        return false;
    }
    else
    {
        _currentCylinder = _desiredCylinder;

        *buffer = new uint16_t[countInWords];

        assert(nullptr != *buffer);

        uint32_t offset = GetSectorForCHS(_currentCylinder, _desiredTrack, _desiredSector);
        DEBUG("Read from sector offset o%o", offset);
        file_read(reinterpret_cast<uint8_t*>(*buffer), offset * GetSectorSize(), countInWords * 2);
        timeout_c timeout;
        timeout.wait_us(500);

        return true;
    }
}

bool
rp_drive_c::Search(void)
{
    _iae = !ValidateCHS(_desiredCylinder, _desiredTrack, _desiredSector);

    if (!IsConnected() || !IsPackLoaded() || _iae)
    {
        DEBUG("Failure: connected &d loaded %d valid %d", IsConnected(), IsPackLoaded(), _iae);
        return false; 
    }
    else
    {
        // This is just a no-op, as we don't emulate read errors.  We just delay a tiny bit.
        timeout_c timeout;
         
        DEBUG("Search commencing.");
        timeout.wait_ms(20);
        _pip = false;
        DEBUG("Search completed.");
        _currentCylinder = _desiredCylinder;

        return true;
    }
    
}

uint32_t
rp_drive_c::GetSectorForCHS(
    uint32_t cylinder,
    uint32_t track,
    uint32_t sector)
{
    return (cylinder * _driveInfo.Tracks * _driveInfo.Sectors) + 
           (track * _driveInfo.Sectors) +
           sector;
}

//
//  Updates the capacity parameter of the drive based on the block count and block size.
//
void 
rp_drive_c::UpdateCapacity() 
{
    // TODO: implement
}

bool
rp_drive_c::ValidateCHS(
    uint32_t cylinder,
    uint32_t track,
    uint32_t sector)
{
    if (cylinder >= _driveInfo.Cylinders ||
        track >= _driveInfo.Tracks ||
        sector >= _driveInfo.Sectors)
    {
        return false; // Out of range
    }
    else
    {
        return true;
    } 
}

//
//
// SetDriveType():
//  Updates this drive's type to the specified type (i.e.
//  RP05 or RM80).
//  If the specified type is not found in our list of known
//  drive types, the drive's type is not changed and false
//  is returned.
//
bool 
rp_drive_c::SetDriveType(
    const char* typeName) 
{
    //
    // Search through drive data table for name,
    // and if valid, set the type appropriately.
    //
    int index = 0;
    while (g_driveTable[index].Cylinders != 0) 
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

//
// on_power_changed():
//  Handle power change notifications.
//
void 
rp_drive_c::on_power_changed(void) 
{
}

//
// on_init_changed():
//  Handle INIT signal.
void 
rp_drive_c::on_init_changed(void) 
{
}

