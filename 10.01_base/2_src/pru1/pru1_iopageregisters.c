/* pru1_iopageregisters.c: handle UNIBUS behaviour of emulated devices

   Copyright (c) 2018, Joerg Hoppe
   j_hoppe@t-online.de, www.retrocmp.com

   Permission is hereby granted, free of charge, to any person obtaining a
   copy of this software and associated documentation files (the "Software"),
   to deal in the Software without restriction, including without limitation
   the rights to use, copy, modify, merge, publish, distribute, sublicense,
   and/or sell copies of the Software, and to permit persons to whom the
   Software is furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
   JOERG HOPPE BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
   IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


   12-nov-2018  JH      entered beta phase
*/

#define _IOPAGEREGISTERS_C_

#include <string.h>
#include <stdint.h>

#include "pru1_utils.h"
#include "pru1_buslatches.h" // DEBUG_PIN_SET
#include "mailbox.h"
#include "iopageregister.h"
#include "ddrmem.h"

// place section with register struct at begin of 8K PRU_DMEM_1_0.
// see linker command file
#pragma DATA_SECTION(deviceregisters,".deviceregisters_sec")

// not volatile: data seldom changed by ARM, speed matters!
iopageregisters_t deviceregisters;


/* request value from a device register
 * page_table_entry already calculated for addr
 * may have side effects onto other registers!
 * result 1 = sucessful, 0 = register not implemented
 * for "active" registers:
 * put prepared register value onto bus, then set mailbox event to ARM
 * for post processing. SSYN must remain asserted until ARM is complete
 */
uint8_t iopageregisters_read(uint32_t addr, uint16_t *val) {
	uint8_t page_table_entry = PAGE_TABLE_ENTRY(deviceregisters,addr);
	if (page_table_entry == PAGE_MEMORY) {
		// addr in allowed 18bit memory range, not in I/O page
		*val = DDRMEM_MEMGET_W(addr);
		return 1;
	} else if (page_table_entry == PAGE_IO) {
//		uint8_t reghandle = deviceregisters.iopage_register_handles[ADDR2IOPAGEWORD(addr)];
		uint8_t reghandle  ;
		reghandle = IOPAGE_REGISTER_ENTRY(deviceregisters,addr) ;
		if (!reghandle) {
			return 0; // register not implemented as "active"
			}
		// return register value. remove "volatile" attribute
//		DEBUG_PIN_SET(1) ;
	// indexing this records takes 4,6 us, if record size != 8
		iopageregister_t *reg = (iopageregister_t *) &(deviceregisters.registers[reghandle]); // alias
//		DEBUG_PIN_SET(0) ;
		*val = reg->value;
		if (reg->event_flags & IOPAGEREGISTER_EVENT_FLAG_DATI)
			DO_EVENT_DEVICEREGISTER(reg, UNIBUS_CONTROL_DATI, addr, *val);
		return 1;
	} else
		return 0;
}

/* write value into a device register
 * may have side effects onto other registers!
 * result 1 = sucessful, 0 = not implemented
 * may set mailbox event to ARM, then SSYN must remain asserted until ARM is complete
 */
uint8_t iopageregisters_write_w(uint32_t addr, uint16_t w) {
	uint8_t page_table_entry = PAGE_TABLE_ENTRY(deviceregisters,addr);
	if (page_table_entry == PAGE_MEMORY) {
		// addr in allowed 18bit memory range, not in I/O page
		// no check wether addr is even (A00=0)
		// write 16 bits
		DDRMEM_MEMSET_W(addr, w);
		return 1;
	} else if (page_table_entry == PAGE_IO) {
//		uint8_t reghandle = deviceregisters.iopage_register_handles[ADDR2IOPAGEWORD(addr)];
		uint8_t reghandle = IOPAGE_REGISTER_ENTRY(deviceregisters,addr) ;
		if (!reghandle)
			return 0; // register not implemented
		// change register value
		iopageregister_t *reg = (iopageregister_t *) &(deviceregisters.registers[reghandle]); // alias
		uint16_t reg_val = (reg->value & ~reg->writable_bits) | (w & reg->writable_bits);
		reg->value = reg_val ;
		if (reg->event_flags & IOPAGEREGISTER_EVENT_FLAG_DATO)
			DO_EVENT_DEVICEREGISTER(reg, UNIBUS_CONTROL_DATO, addr, reg_val);
		return 1;
	} else
		return 0;
}

uint8_t iopageregisters_write_b(uint32_t addr, uint8_t b) {
	uint8_t page_table_entry = PAGE_TABLE_ENTRY(deviceregisters,addr);
	if (page_table_entry == PAGE_MEMORY) {
		// addr in allowed 18bit memory range, not in I/O page
		DDRMEM_MEMSET_B(addr, b);
		return 1;
	} else if (page_table_entry == PAGE_IO) {
//		uint8_t reghandle = deviceregisters.iopage_register_handles[ADDR2IOPAGEWORD(addr)];
		uint8_t reghandle = IOPAGE_REGISTER_ENTRY(deviceregisters,addr) ;
		if (!reghandle)
			return 0; // register not implemented
		// change register value
		iopageregister_t *reg = (iopageregister_t *) &(deviceregisters.registers[reghandle]); // alias
		uint16_t	reg_val ;
		if (addr & 1)  // odd address = write upper byte
			reg_val = (reg->value & 0x00ff) // don't touch lower byte
			| (reg->value & ~reg->writable_bits & 0xff00) // protected upper byte bits
					| (((uint16_t)b << 8) & reg->writable_bits); // changed upper byte bits
		else
			// even address: write lower byte
			reg_val = (reg->value & 0xff00) // don' touch upper byte
			| (reg->value & ~reg->writable_bits & 0x00ff) // protected upper byte bits
					| (b & reg->writable_bits); // changed lower byte bits
		reg->value = reg_val ;
		if (reg->event_flags & IOPAGEREGISTER_EVENT_FLAG_DATO)
			DO_EVENT_DEVICEREGISTER(reg, UNIBUS_CONTROL_DATOB, addr, reg_val);
		return 1;
	} else
		return 0;

}

//
void iopageregisters_init() {
	// clear the pagetable: no address emulated
	memset((void *) deviceregisters.pagetable, 0, sizeof(deviceregisters.pagetable));
	// clear the iopage addr map: no register assigned
	memset((void *) deviceregisters.iopage_register_handles, 0,
			sizeof(deviceregisters.iopage_register_handles));
	// and clear all register descriptors
	memset((void *) deviceregisters.registers, 0, sizeof(deviceregisters.registers));
}
