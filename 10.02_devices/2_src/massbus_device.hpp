/*
 massbus_device.hpp: Generic interface for MASSBUS devices.
 
 Copyright Vulcan Inc. 2020 via Living Computers: Museum + Labs, Seattle, WA.
 Contributed under the BSD 2-clause license.
*/

#pragma once

//
// Provides a virtual interface connecting a MASSBUS device implementation
// to the RH11 Unibus device implementation.  Provides metadata about
// MASSBUS registers, defines methods for reading and writing them, and
// provides methods for transferring blocks of data.
//
class massbus_device_c 
{
public:

    // Resets the bus  
    virtual void Reset() = 0;

    //
    // MASSBUS Register Metadata:
    //
    // Indicates whether this device implements the specified register.
    virtual bool ImplementsRegister(uint32_t register) = 0;

    // Provides the mnemonic name for this register
    virtual std::string RegisterName(uint32_t register) = 0;
    
    // Unibus DATI/DATO activity bits
    virtual bool RegisterActiveOnDATI(uint32_t register) = 0;
    virtual bool RegisterActiveOnDATO(uint32_t register) = 0;

    // Reset value
    virtual uint16_t RegisterResetValue(uint32_t register) = 0;
  
    // Writable bits
    virtual uint16_t RegisterWritableBits(uint32_t register) = 0;


    //
    // MASSBUS Register reads and writes
    //
    virtual void WriteRegister(uint32_t unit, uint32_t register, uint16_t value) = 0;
    virtual uint16_t ReadRegister(uint32_t unit, uint32_t register) = 0;

    //
    // Block transfers
    // TODO: define these
    // 

};
