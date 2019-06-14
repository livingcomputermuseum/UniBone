/* iopageregister.cpp: handle ARM-PRU shared struct with device register descriptors

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

#define _IOPAGEREGISTER_CPP_

#include <stdio.h>
#include <string.h>
#include "pru.hpp"

//#include "pru1_config.h"
#include "iopageregister.h"

// Device register struct shared between PRU and ARM.
// Place section with register struct at begin of 8K PRU_DMEM_1_0.
volatile iopageregisters_t *deviceregisters;

int iopageregisters_connect(void) {
	void *pru_shared_dataram;
	// get pointer to RAM
	if (prussdrv_map_prumem(PRU_DEVICEREGISTER_RAM_ID, &pru_shared_dataram)) {
		fprintf(stderr, "prussdrv_map_prumem() failed\n");
		return -1;

	}
	// prussdrv_map_prumem( PRU_MAILBOX_RAM_ID, &pru_shared_dataram) ;
	// point to struct inside RAM
	deviceregisters = (iopageregisters_t *) ((uint8_t *) pru_shared_dataram
			+ PRU_DEVICEREGISTER_RAM_OFFSET);

	// now ARM and PRU can access the device register descriptors

	return 0;
}

//  initialize register tables to "empty"
void iopageregisters_init() {
	unsigned i;
	uint32_t addr;
	// clear the pagetable: no address emulated, only IO page marked
	for (i = 0; i < PAGE_COUNT; i++)
		deviceregisters->pagetable[i] = PAGE_IGNORE;
	// mark IO pages
	for (addr = 0760000; addr < 01000000; addr += PAGE_SIZE)
		deviceregisters->pagetable[addr / PAGE_SIZE] = PAGE_IO;

	// clear the iopage addr map: no register assigned
	memset((void *) deviceregisters->iopage_register_handles, 0,
			sizeof(deviceregisters->iopage_register_handles));
}

void iopageregisters_print_tables(void) {
	unsigned i, n;
	uint32_t addr;
	printf("Primary page table:");
	for (i = 0; i < PAGE_COUNT; i++) {
		if ((i % 4) == 0) // 4 in a row
			printf("\n");
		printf("[%2d]@%06o = %d   ", i, i * PAGE_SIZE, (int) deviceregisters->pagetable[i]);
	}
	printf("\n");
	printf("Secondary IO page register table:");
	n = 0; // counts valid registers
	for (addr = 0760000; addr < 0100000; addr += 2) {
		uint8_t reghandle;
		i = (addr - 0760000) / 2; // register handle
		reghandle = deviceregisters->iopage_register_handles[i];
		if (reghandle != 0) {
			if ((n % 4) == 0) // 4 in a row
				printf("\n");
			printf("[%3d]@%06o = 0x%02x    ", i, addr, (unsigned) reghandle);
			n++;
		}
	}
	if (n == 0)
		printf(" no registers defined.");
	printf("\n");
}

