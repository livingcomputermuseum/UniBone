/*
   uda.hpp: MSCP controller port (UDA50)
*/

#pragma once

#include <memory>
#include "utils.hpp"
#include "unibusdevice.hpp"
#include "storagecontroller.hpp"
#include "mscp_server.hpp"

// TODO: this currently assumes a little-endian machine!
struct Message
{
    uint16_t MessageLength alignas(2);

    union
    {
        uint16_t Word1;
        struct
        {
            uint16_t Credits : 4;
            uint16_t MessageType : 4;
            uint16_t ConnectionID : 8;
        } Info;
    } Word1 alignas(2);

    // 384 bytes is the minimum needed to support
    // datagram messages.  The underlying buffer will
    // be allocated to cover whatever size needed.
    uint8_t Message[384] alignas(2);
};


/*
  This implements the Transport layer for a Unibus MSCP controller.

  Logic for initialization, reset, and communcation with the MSCP Server
  is implemented here.
*/
class uda_c : public storagecontroller_c
{
public:
    uda_c();
    virtual ~uda_c();

    void worker(void) override;

    void on_after_register_access(
        unibusdevice_register_t *device_reg,
        uint8_t unibus_control) override;

    void on_power_changed(void) override;
    void on_init_changed(void) override;

    void on_drive_status_changed(storagedrive_c *drive) override;
public:

    //
    // Returns the next command message from the command ring, if any.
    // Returns NULL if the ring is empty.
    //
    Message* GetNextCommand(void);

    //
    // Posts a response message to the response ring and memory
    // if there is space.
    // Returns FALSE if the ring is full.
    bool PostResponse(std::shared_ptr<Message> response);

    uint64_t GetControllerIdentifier(void);

private:
    // TODO: consolidate these private/public groups here 
    void Reset(void);
    void Interrupt(void);

    uint32_t GetCommandDescriptorAddress(size_t index);
    uint32_t GetResponseDescriptorAddress(size_t index);

public:
    bool DMAWriteWord(uint32_t address, uint16_t word);
    uint16_t DMAReadWord(uint32_t address, bool& success);

    bool DMAWrite(uint32_t address, size_t lengthInBytes, uint8_t* buffer);
    uint8_t* DMARead(uint32_t address, size_t lengthInBytes);

private:
    void update_SA(void);

    // UDA50 registers:
    unibusdevice_register_t *IP_reg;
    unibusdevice_register_t *SA_reg;

    uint16_t _sa;

    std::unique_ptr<mscp_server> _server;

    uint32_t _ringBase;

    // Lengths are in terms of slots (32 bits each) in the
    // corresponding rings.
    size_t   _commandRingLength;
    size_t   _responseRingLength;

    // The current slot in the ring being accessed.
    uint32_t _commandRingPointer;
    uint32_t _responseRingPointer;

    // Interrupt vector -- if zero, no interrupts
    // will be generated.
    uint32_t _interruptVector;
   
    // Interrupt enable flag
    bool _interruptEnable;

    // Purge interrupt enable flag
    bool _purgeInterruptEnable;

    // Value written during step1, saved
    // to make manipulation easier.
    uint16_t _step1Value;

    enum InitializationStep
    {
        Uninitialized = 0,
        Step1 = 1,
        Step2 = 2,
        Step3 = 4,
        Step4 = 8,
        Complete,
    };

    InitializationStep _initStep;
    bool _next_step;

    void StateTransition(InitializationStep nextStep);

    // TODO: this currently assumes a little-endian machine!
    struct Descriptor
    {
        union alignas(2)
        {
            uint16_t Word0;
            uint16_t EnvelopeLow;
        } Word0;

        union alignas(2)
        {
            uint16_t Word1;
            struct
            {
                uint16_t EnvelopeHigh : 2;
                uint16_t Reserved : 12;
                uint16_t Flag : 1;
                uint16_t Ownership : 1;
            } Fields;
        } Word1;
    };    
};

