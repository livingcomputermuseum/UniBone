/* ddrmem.cpp - Control the shared DDR RAM - used for UNIBUS memory

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

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <assert.h>

#include "logger.hpp"
#include "inputline.h"
#include "mailbox.h"
#include "iopageregister.h"
#include "ddrmem.h"

/* another singleton */
ddrmem_c *ddrmem;

ddrmem_c::ddrmem_c() {
	log_label = "DDRMEM" ;
}


// check allocated memory and print info
void ddrmem_c::info() {
	INFO("Shared DDR memory: %u bytes available, %u bytes needed.", len, sizeof(ddrmem_t));
	if (len < sizeof(ddrmem_t)) {
		FATAL("Not enough shared DDR memory allocated by \"uio_pruss\"!\n"
				"To fix, use\n"
				"  modinfo uio_pruss\n"
				"  cat /sys/class/uio/uio0/maps/map1/size\n"
				"Change \"extram_pool_sz\" value for module uio_pruss:\n"
				"  vi /etc/modprobe.d/uio_pruss.conf");
	}

	INFO("  Virtual (ARM Linux-side) address: %p", base_virtual);
	INFO("  Physical (PRU-side) address:%x", base_physical);
	INFO("  %d bytes of UNIBUS memory allocated", sizeof(unibus_memory_t));
}

// read/write ddr memory locally
// result: true =OK, else illegal address ("timeout")
bool ddrmem_c::deposit(uint32_t addr, uint16_t w) {
	if (!enabled || addr < unibus_startaddr || addr > unibus_endaddr)
		return false;
	base_virtual->memory.words[addr / 2] = w;
	return true;
}

bool ddrmem_c::exam(uint32_t addr, uint16_t *w) {
	if (!enabled || addr < unibus_startaddr || addr > unibus_endaddr)
		return false;
	*w = base_virtual->memory.words[addr / 2];
	return true;
}

// write to disk file

void ddrmem_c::save(char *fname) {
	FILE *fout;
	unsigned wordcount = UNIBUS_WORDCOUNT;
	unsigned n;
	fout = fopen(fname, "wb");
	if (!fout) {
		ERROR(fileErrorText("Error opening file %s for write", fname));
		return;
	}
	n = fwrite((void *) base_virtual->memory.words, 2, wordcount, fout);
	fclose(fout);

	if (n != wordcount) {
		ERROR("ddrmem_save(): tried to write %u words, only %u successful.", wordcount, n);
	}

}

// load from disk file
void ddrmem_c::load(char *fname) {
	FILE *fin;
	fin = fopen(fname, "rb");
	if (!fin) {
		ERROR(fileErrorText("Error opening file %s for read", fname));
		return;
	}
	// try to read max address range, shorter files are OK
	fread((void *) base_virtual->memory.words, 2, UNIBUS_WORDCOUNT, fin);
	fclose(fin);
}

// fill whole memory with 0
void ddrmem_c::clear(void) {
	memset((void *) base_virtual, 0, sizeof(unibus_memory_t));
}

// fill whole memory with pattern, with local code
void ddrmem_c::fill_pattern(void) {
	unsigned n;
	volatile uint16_t *wordaddr = base_virtual->memory.words;
	for (n = 0; n < UNIBUS_WORDCOUNT; n++) {
		*wordaddr++ = ~n;
	}
}

// fill whole memory with pattern, by PRU
void ddrmem_c::fill_pattern_pru(void) {
	// ddrmem_base_physical and _len already set
	assert((uint32_t )mailbox->ddrmem_base_physical == base_physical);
	mailbox_execute(ARM2PRU_DDR_FILL_PATTERN, ARM2PRU_NONE);
}

// set corrected values for emulated memory range
// start = end = 0: disable
// operates on addressmap.pagetable[]
// precondition:  deviceregister_init()
// result: false = error
bool ddrmem_c::set_range(uint32_t startaddr, uint32_t endaddr) {
	// init empty pagetable, just iopage
	bool result;
	uint32_t addr;

	unibus_startaddr = startaddr;
	unibus_endaddr = endaddr;
	// set all memory pages to IGNORE
	for (addr = 0; addr < 0760000; addr += PAGE_SIZE)
		deviceregisters->pagetable[addr / PAGE_SIZE] = PAGE_IGNORE;

	enabled = (unibus_startaddr <= unibus_endaddr);
	if (!enabled)
		return true;
	result = false;
	if (unibus_endaddr >= 0760000)
		INFO("endaddr %06o in IO page", unibus_endaddr);
	// addresses must fit page borders
	else if (unibus_startaddr % PAGE_SIZE)
		WARNING("Start addr %06o not at start of a page of size %06o", unibus_startaddr,
				PAGE_SIZE);
	else if ((unibus_endaddr + 2) % PAGE_SIZE)
		WARNING("End addr %06o not at end of a page of size %06o", unibus_endaddr, PAGE_SIZE);
	else {
		// mark pages in address range as "memory emulation"
		for (addr = unibus_startaddr; addr < unibus_endaddr + 2; addr += PAGE_SIZE)
			deviceregisters->pagetable[addr / PAGE_SIZE] = PAGE_MEMORY;
		result = true;
	}
	return result;
}

// implement an UNIBUS memory card with DDR memory
// PRU act as slave to unibus master cycles
void ddrmem_c::unibus_slave(uint32_t startaddr, uint32_t endaddr) {

	char *s, buf[20]; // dummy
	// this command starts UNIBUS slave logic in PRU
	set_range(startaddr, endaddr);
	mailbox->arm2pru_req = ARM2PRU_DDR_SLAVE_MEMORY;
	printf("Hit 'q' ENTER to end.\n");
	do { // only this code wait for input under Eclipse
		s = inputline(buf, sizeof(buf), NULL);
	} while (strlen(s) == 0);
	// clearing  arm2pru_req stops the emulation
	mailbox_execute(ARM2PRU_NONE, ARM2PRU_NONE);
}

