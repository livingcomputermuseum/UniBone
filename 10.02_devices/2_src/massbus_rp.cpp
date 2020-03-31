/* 
    massbus_rp_c.cpp: Implements MASSBUS device logic for moving-head RP04/05/06 drives.

    Copyright Vulcan Inc. 2020 via Living Computers: Museum + Labs, Seattle, WA.
    Contributed under the BSD 2-clause license.

*/
#include <stdint.h>
#include <string.h>
using namespace std;

#include "storagedrive.hpp"
#include "rp_drive.hpp"
#include "rh11.hpp"
#include "massbus_device.hpp"
#include "massbus_rp.hpp"

void* SpinInit(
    void* context)
{
    massbus_rp_c* rp = reinterpret_cast<massbus_rp_c*>(context);
    rp->Spin();
    return nullptr;
}

massbus_rp_c::massbus_rp_c(
   rh11_c* controller) :
       device_c(),
       _controller(controller),
       _selectedUnit(0),
       _ned(false),
       _attnSummary(0),
       _updateLock(PTHREAD_MUTEX_INITIALIZER)
    
{
    name.value="MASSBUS_RP";
    type_name.value = "massbus_rp_c";
    log_label = "MASSBUS_RP";

    pthread_attr_t attribs2;
    pthread_attr_init(&attribs2);
    uint32_t status = pthread_create(
        &_spinThread,
        &attribs2,   
        &SpinInit,
        reinterpret_cast<void*>(this));
}

massbus_rp_c::~massbus_rp_c()
{

}

bool 
massbus_rp_c::ImplementsRegister(
	uint32_t reg)
{
    return (reg > 0) && (reg < 16);
}

std::string 
massbus_rp_c::RegisterName(
    uint32_t reg)
{
    std::string name(_registerMetadata[reg].Name);

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
massbus_rp_c::SelectUnit(
    uint32_t unit)
{
    if (_selectedUnit != unit)
    {
        _selectedUnit = unit;

        // Let the drive know it's been selected, this
        // may cause status register updates.
        SelectedDrive()->Select();
        UpdateDriveRegisters();
    } 
}

void
massbus_rp_c::WriteRegister(
    uint32_t reg, 
    uint16_t value)
{
    INFO ("RP reg write: unit %d register 0%o value 0%o", _selectedUnit, reg, value);

    rp_drive_c* drive = SelectedDrive();

    switch(static_cast<Registers>(reg))
    {
        case Registers::Control:
            //
            // Select unit as necessary.
            //
            drive->DoCommand(value);
            break;

        case Registers::DesiredSectorTrackAddress:
            drive->SetDesiredTrack((value & 0x1f00) >> 8);
            drive->SetDesiredSector(value & 0x1f);
            UpdateDriveRegisters();
            break;

        case Registers::DesiredCylinderAddress:
            drive->SetDesiredCylinder(value & 0x3ff);
            UpdateDriveRegisters();
            break;

        case Registers::AttentionSummary:
            // Clear bits in the Attention Summary register specified in the
            // written value:
            _attnSummary &= ~(value & 0xff);
            _controller->WriteRegister(reg, _attnSummary);
            DEBUG("Attention Summary write o%o, value is now o%o", value, _attnSummary); 
            break;

        case Registers::Error1:
            // Pg. 2-20 of EK-RP056-MM-01:
            // "The register can also be written by the controller for diagnostic purposes.
            // Setting any bit in this register sets the composite error bit in the status register."
            //
            // Based on diagnostic (ZRJGE0) behavior, writing ANY value here forces an error.
            //
            drive->ForceDiagnosticError();
            break;            

        default:
            FATAL("Unimplemented RP register write.");
            break;
    }
}

uint16_t 
massbus_rp_c::ReadRegister(
    uint32_t reg)
{
    DEBUG("RP reg read: unit %d register 0%o", _selectedUnit, reg);
  
    switch(static_cast<Registers>(reg))
    {

        case Registers::DriveType:
            return SelectedDrive()->GetDriveType() | 020000;    // Moving head (MOVE TO CONSTANT)
            break;

        case Registers::SerialNo:
            return SelectedDrive()->GetSerialNumber();
            break;

        default: 
            FATAL("Unimplemented register read %o", reg);
            break;

    } 
    return 0;
}

//
// Register update functions
//
void
massbus_rp_c::DriveStatus(
   uint32_t unit,
   uint16_t status,
   uint16_t error1,
   bool ata,
   bool complete)
{
   pthread_mutex_lock(&_updateLock);

   // Update status registers only for the selected drive.
   if (unit == _selectedUnit)
   {
       _controller->WriteRegister(static_cast<uint32_t>(Registers::Status), status);
       _controller->WriteRegister(static_cast<uint32_t>(Registers::Error1), error1);
   }
 
   // Update the Attention Summary register for the reporting drive:
   if (ata)
   {
       _attnSummary |= (0x1 << unit);
       INFO ("Attention Summary is now o%o", _attnSummary); 
   }

   _controller->WriteRegister(static_cast<uint32_t>(Registers::AttentionSummary), _attnSummary);

   // Inform controller of status update.
   // TODO: ready status is a hack that serializes drive commands;
   //  a real RH11/RP06 setup allows overlapped seeks, we do not (yet).
  
   bool ready = true;
  
   for(int i=0;i<8;i++)
   {
       if (GetDrive(i)->IsConnected() && !GetDrive(i)->IsDriveReady())
       {     
           ready = false;// We're ready if there isn't a command in progress right now.
           break;
       }
   }

   _controller->BusStatus(complete, ready, ata, (error1 != 0), SelectedDrive()->IsConnected(), _ned);

   pthread_mutex_unlock(&_updateLock);
}

void
massbus_rp_c::UpdateDriveRegisters()
{
    rp_drive_c* drive = SelectedDrive();

    _controller->WriteRegister(static_cast<uint32_t>(Registers::CurrentCylinderAddress),
        drive->GetCurrentCylinder());

    _controller->WriteRegister(static_cast<uint32_t>(Registers::DesiredCylinderAddress),
        drive->GetDesiredCylinder());

    uint16_t desiredSectorTrack = drive->GetDesiredSector() | (drive->GetDesiredTrack() << 8);
    _controller->WriteRegister(static_cast<uint32_t>(Registers::DesiredSectorTrackAddress),
        desiredSectorTrack);

    _controller->WriteRegister(static_cast<uint32_t>(Registers::Offset), drive->GetOffset());
}

void
massbus_rp_c::Reset()
{
    // Reset registers to their defaults
    _attnSummary = 0;
    SelectUnit(0);
}

rp_drive_c*
massbus_rp_c::SelectedDrive()
{
    return _controller->GetDrive(_selectedUnit);
}

rp_drive_c*
massbus_rp_c::GetDrive(uint16_t unit)
{
    assert(unit < 8);
    return _controller->GetDrive(unit);
}

void
massbus_rp_c::Spin(void)
{
    // 
    // All this worker does is simulate the spinning of the disk by
    // updating the LookAhead register periodically.  In reality there'd be a
    // different value for every drive but also in reality there'd be a gigantic
    // washing-machine-sized drive spinning aluminum disks plated with rust, so...
    //
   
    uint16_t lookAhead = 0;
    timeout_c timer;


    timer.wait_ms(2500);
    while(true)
    {
        timer.wait_ms(10);

        // We update only the sector count portion of the register.
        lookAhead = (lookAhead + 1) % 22;
    //    _controller->WriteRegister(static_cast<uint32_t>(Registers::LookAhead), lookAhead << 6);
    }
}

void 
massbus_rp_c::on_power_changed(void)
{

}

void 
massbus_rp_c::on_init_changed(void)
{
    Reset();
}
