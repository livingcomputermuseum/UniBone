/* unibus.cpp: utilities to handle UNIBUS functions

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

#define _UNIBUS_CPP_

#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <time.h>
#include <assert.h>

#include "pru.hpp"
#include "logger.hpp"
#include "gpios.hpp"
#include "bitcalc.h"
#include "memoryimage.hpp"
#include "mailbox.h" // for test of PRU code
#include "utils.hpp" // for test of PRU code
#include "unibus.h"

/* Singleton */
unibus_c *unibus;

unibus_c::unibus_c() {
	log_label = "UNIBUS";
	dma_bandwidth_percent = 50;
	dma_wordcount = MAX_DMA_WORDCOUNT;
}

/* return a 16 bit result, or TIMEOUT
 * result: 0 = timeout, else OK
 */
char *unibus_c::data2text(unsigned val) {
	static char buffer[256];
	if (val <= 0177777)
		sprintf(buffer, "%06o", val);
	else
		strcpy(buffer, "??????");
	return buffer;
}

/* return UNOBUS control as text: "DATI", DATO", ....
 */
char *unibus_c::control2text(uint8_t control) {
	static char buffer[256];
	switch (control) {
	case UNIBUS_CONTROL_DATI:
		strcpy(buffer, "DATI");
		break;
	case UNIBUS_CONTROL_DATIP:
		strcpy(buffer, "DATIP");
		break;
	case UNIBUS_CONTROL_DATO:
		strcpy(buffer, "DATO");
		break;
	case UNIBUS_CONTROL_DATOB:
		strcpy(buffer, "DATOB");
		break;
	default:
		strcpy(buffer, "???");
	}
	return buffer;
}

/* pulse INIT cycle for a number of milliseconds
 * Duration see INITPULSE_DELAY_MS
 */
void unibus_c::init(void) {
	/*
	 // INIT: latch[7], bit 3
	 buslatches_setval(7, BIT(3), BIT(3));
	 timeout.wait_ms(duration_ms);
	 buslatches_setval(7, BIT(3), 0);
	 */
	mailbox_execute(ARM2PRU_INITPULSE, ARM2PRU_NONE);
}

/* Simulate a power cycle
 */
void unibus_c::powercycle(void) {
	mailbox_execute(ARM2PRU_POWERCYCLE, ARM2PRU_NONE);
}

// do an UNIBUS INTR transaction with Arbitration by PDP-11 CPU
// todo: ARBITRATOR_MASTER?
void unibus_c::interrupt(uint8_t priority, uint16_t vector) {
	assert(pru->prucode_id == pru_c::PRUCODE_UNIBUS);
	switch (priority) {
	case 4:
		mailbox->intr.priority_bit = ARBITRATION_PRIORITY_BIT_B4;
		break;
	case 5:
		mailbox->intr.priority_bit = ARBITRATION_PRIORITY_BIT_B5;
		break;
	case 6:
		mailbox->intr.priority_bit = ARBITRATION_PRIORITY_BIT_B6;
		break;
	case 7:
		mailbox->intr.priority_bit = ARBITRATION_PRIORITY_BIT_B7;
		break;
	default:
		ERROR("unibus_interrupt(): Illegal priority %u, aborting", priority);
		return;
	}
	mailbox->intr.vector = vector;
	// mail last infinite, if processor priority above "priority"
	// timeout ??
	mailbox_execute(ARM2PRU_INTR, ARM2PRU_NONE);
}

// do a DMA transaction with or without abritration (arbitration_client)
// mailbox.dma.words already filled
// if result = timeout: =
// 0 = bus time, error address =  mailbox->dma.cur_addr
// 1 = all transfered
bool unibus_c::dma(enum unibus_c::arbitration_mode_enum arbitration_mode, uint8_t control,
		uint32_t startaddr, unsigned blocksize) {
	uint64_t dmatime_ns, totaltime_ns;
	uint8_t dma_opcode = ARBITRATION_MODE_NONE; // inihibit compiler warnings

	// can access bus with DMA when there's a Bus Arbitrator
	assert(pru->prucode_id == pru_c::PRUCODE_UNIBUS);
// TODO: assert pru->prucode_features & (PRUCODE_FEATURE_DMA) ???
	// TODO: Arbitration Master waits for SACK, 11/34 blocks?

	mailbox->dma.startaddr = startaddr;
	mailbox->dma.control = control;
	mailbox->dma.wordcount = blocksize;
	timeout.start(0); // no timeout, just running timer

	switch (arbitration_mode) {
	case unibus_c::ARBITRATION_MODE_NONE:
		dma_opcode = ARM2PRU_DMA_ARB_NONE;
		break;
	case unibus_c::ARBITRATION_MODE_CLIENT:
		dma_opcode = ARM2PRU_DMA_ARB_CLIENT;
		break;
	case unibus_c::ARBITRATION_MODE_MASTER:
		dma_opcode = ARM2PRU_DMA_ARB_MASTER;
		break;
	default:
		FATAL("Illegal arbitration_mode");
	}
	// wait until PRU ready
	mailbox_execute(dma_opcode, ARM2PRU_NONE);

	dmatime_ns = timeout.elapsed_ns();
	// wait before next transaction, to reduce Unibus bandwidth
	// calc required total time for DMA time + wait
	// 100% -> total = dma
	// 50% -> total = 2*dma
	// 25% -> total = 4* dma
	totaltime_ns = (dmatime_ns * 100) / dma_bandwidth_percent;
	// whole transaction requires totaltime, dma already done
//INFO("DMA time= %lluus, waiting %lluus", dmatime_ns/1000, (totaltime_ns - dmatime_ns)/1000) ;
	timeout.wait_ns(totaltime_ns - dmatime_ns);

	return (mailbox->dma.cur_status == DMA_STATE_READY);
	// all other end states are errors, only error is bus timeout
}

/* scan unibus addresses ascending from 0.
 * Stop on error, return first invalid address
 * return 0: no memory found at all
 * arbitration_active: if 1, perform NPR/NPG/SACK arbitration before mem accesses
 */
uint32_t unibus_c::test_sizer(enum unibus_c::arbitration_mode_enum arbitration_mode) {
	// tests chunks of 128 word
	bool timeout;
	unsigned addr = 0;
	//SET_DEBUG_PIN0(0) ;
	do {
		// printf("unibus_test_sizer(): %06o..%06o\n", addr, addr+2*unibus_dma_wordcount-2) ;
		timeout = !dma(arbitration_mode, UNIBUS_CONTROL_DATI, addr, dma_wordcount);
		addr += 2 * dma_wordcount; // prep for next round
	} while (!timeout);
	//SET_DEBUG_PIN0(1) ; // signal end
	//SET_DEBUG_PIN0(0) ;
	return mailbox->dma.cur_addr; // first non implemented address
}

/*
 * Test memory from 0 .. end_addr
 * mode = 1: fill every word with its address, then check endlessly,
 */

// write a subset of words[] with UNIBUS DMA:
// all words from start_addr to including end_addr
//
// DMA blocksize can be choosen arbitrarily
void unibus_c::mem_write(enum unibus_c::arbitration_mode_enum arbitration_mode, uint16_t *words,
		unsigned start_addr, unsigned end_addr, unsigned block_wordcount,
		bool *timeout) {
	unsigned block_start_addr = 0;
	unsigned n;
	assert(pru->prucode_id == pru_c::PRUCODE_UNIBUS);
	assert(block_wordcount <= MAX_DMA_WORDCOUNT);
	*timeout = 0;
	for (block_start_addr = start_addr; !*timeout && block_start_addr <= end_addr;
			block_start_addr += 2 * block_wordcount) {
		// trunc last block
		n = (end_addr - block_start_addr) / 2 + 1; // words left until memend
		if (n < block_wordcount)
			block_wordcount = n; //trunc last buffer
		// fill data into dma buffer
		memcpy((void*) (mailbox->dma.words), (void*) (words + block_start_addr / 2),
				2 * block_wordcount);
		/*		for (n = 0; n < block_wordcount; n++) {
		 cur_addr = block_start_addr + 2 * n;
		 mailbox->dma.words[n] = words[cur_addr / 2];
		 }
		 */*timeout = !dma(arbitration_mode, UNIBUS_CONTROL_DATO, block_start_addr,
				block_wordcount);
		if (*timeout) {
			printf("\nWrite timeout @ 0%6o\n", mailbox->dma.cur_addr);
			return;
		}
	}
}

// Read a subset of words[] with UNIBUS DMA
// all words from start_addr to including end_addr
// DMA blocksize can be choosen arbitrarily
// arbitration_active: if 1, perform NPR/NPG/SACK arbitration before mem accesses
void unibus_c::mem_read(enum unibus_c::arbitration_mode_enum arbitration_mode, uint16_t *words,
		uint32_t start_addr, uint32_t end_addr, unsigned block_wordcount,
		bool *timeout) {
	unsigned block_start_addr = 0;
	unsigned n;
	assert(pru->prucode_id == pru_c::PRUCODE_UNIBUS);
	assert(block_wordcount <= MAX_DMA_WORDCOUNT);

	*timeout = 0;
	for (block_start_addr = start_addr; !*timeout && block_start_addr <= end_addr;
			block_start_addr += 2 * block_wordcount) {
		// trunc last block
		n = (end_addr - block_start_addr) / 2 + 1; // words left until memend
		if (n < block_wordcount)
			block_wordcount = n; //trunc last buffer
		*timeout = !dma(arbitration_mode, UNIBUS_CONTROL_DATI, block_start_addr,
				block_wordcount);
		if (*timeout) {
			printf("\nRead timeout @ 0%6o\n", mailbox->dma.cur_addr);
			return;
		}
		// move from DMA buffer into words[]
		memcpy((void*) (words + block_start_addr / 2), (void*) (mailbox->dma.words),
				2 * block_wordcount);
		/*		for (n = 0; n < block_wordcount; n++) {
		 cur_addr = block_start_addr + 2 * n;
		 words[cur_addr / 2] = mailbox->dma.words[n];
		 }
		 */}
}

// arbitration_active: if 1, perform NPR/NPG/SACK arbitration before mem accesses
void unibus_c::test_mem(enum unibus_c::arbitration_mode_enum arbitration_mode,
		uint32_t start_addr, uint32_t end_addr, unsigned mode) {
#define MAX_ERROR_COUNT	8
	progress_c progress = progress_c(80);
	bool timeout = 0, mismatch = 0;
	unsigned mismatch_count = 0;
	uint32_t cur_test_addr;
	unsigned block_wordcount;

	assert(pru->prucode_id == pru_c::PRUCODE_UNIBUS);

	// Setup ^C catcher
	SIGINTcatchnext();
	switch (mode) {
	case 1: // single write, multiple read, "address" pattern
		/**** 1. Generate test values: only for even addresses */
		for (cur_test_addr = start_addr; cur_test_addr <= end_addr; cur_test_addr += 2)
			testwords[cur_test_addr / 2] = (cur_test_addr >> 1) & 0xffff;
		/**** 2. Write memory ****/
		progress.put("W");  //info : full memory write
		block_wordcount = 113; // something queer
		mem_write(arbitration_mode, testwords, start_addr, end_addr, block_wordcount, &timeout);

		/**** 3. read until ^C ****/
		while (!SIGINTreceived && !timeout && !mismatch_count) {
			progress.put("R");
			block_wordcount = 67; // something queer
			// read back into unibus_membuffer[]
			mem_read(arbitration_mode, membuffer->data.words, start_addr, end_addr,
					block_wordcount, &timeout);
			// compare
			SET_DEBUG_PIN0(0) ;
			for (mismatch_count = 0, cur_test_addr = start_addr; cur_test_addr <= end_addr;
					cur_test_addr += 2) {
				uint16_t cur_mem_val = membuffer->data.words[cur_test_addr / 2];
				mismatch = (testwords[cur_test_addr / 2] != cur_mem_val);
				if (mismatch) {
					SET_DEBUG_PIN0(1) ; // trigger
					SET_DEBUG_PIN0(0) ;
				}
				if (mismatch && ++mismatch_count <= MAX_ERROR_COUNT) // print only first errors
					printf(
							"\nMemory mismatch #%d at %06o: expected %06o, found %06o, diff mask = %06o.  ",
							mismatch_count, cur_test_addr, testwords[cur_test_addr / 2],
							cur_mem_val, testwords[cur_test_addr / 2] ^ cur_mem_val);
			}
		} // while
		break;

	case 2: // full write, full read
		/**** 1. Full write generate test values */
		while (!SIGINTreceived && !timeout && !mismatch_count) {
			for (cur_test_addr = start_addr; cur_test_addr <= end_addr; cur_test_addr += 2)
				testwords[cur_test_addr / 2] = random24() & 0xffff;
			progress.put("W");  //info : full memory write
			block_wordcount = 97; // something queer
			mem_write(arbitration_mode, testwords, start_addr, end_addr, block_wordcount,
					&timeout);

			if (SIGINTreceived || timeout)
				break; // leave loop

			// first full read
			progress.put("R");  //info : full memory write
			block_wordcount = 111; // something queer
			// read back into unibus_membuffer[]
			mem_read(arbitration_mode, membuffer->data.words, start_addr, end_addr,
					block_wordcount, &timeout);
			// compare
			SET_DEBUG_PIN0(0) ;
			for (mismatch_count = 0, cur_test_addr = start_addr; cur_test_addr <= end_addr;
					cur_test_addr += 2) {
				uint16_t cur_mem_val = membuffer->data.words[cur_test_addr / 2];
				mismatch = (testwords[cur_test_addr / 2] != cur_mem_val);
				if (mismatch) {
					SET_DEBUG_PIN0(1) ; // trigger
					SET_DEBUG_PIN0(0) ;
				}
				if (mismatch && ++mismatch_count <= MAX_ERROR_COUNT) // print only first errors
					printf(
							"\nMemory mismatch at %06o: expected %06o, found %06o, diff mask = %06o.  ",
							cur_test_addr, testwords[cur_test_addr / 2], cur_mem_val,
							testwords[cur_test_addr / 2] ^ cur_mem_val);
			}
		} // while
		break;
	} // switch(mode)
	printf("\n");
	if (timeout || mismatch_count)
		printf("Stopped by error: %stimeout, %d mismatches\n", (timeout ? "" : "no "),
				mismatch_count);
	else
		printf("All OK!\n");
}

#ifdef USED
/* load a word buffer from file
 * words assumed to be little endian (LSB first)
 */
void unibus_c::loadfromfile(char *fname, uint16_t *words, unsigned *bytecount) {
	FILE *f;
	unsigned n;
	f = fopen(fname, "rb");
	if (!f) {
		ERROR("unibus_loadfromfile(): could not open file \"%s\" for read.", fname);
		return;
	}
	// try to read max address range, shorter files are OK
	n = fread((void *) words, 1, 2 * UNIBUS_WORDCOUNT, f);
	fclose(f);
	*bytecount = n;
	INFO("Read %d bytes from \"%s\".", *bytecount, fname);
}

/* save a word buffer to file */
void unibus_c::savetofile(char *fname, uint16_t *words, unsigned bytecount) {
	FILE *f;
	unsigned n;
	f = fopen(fname, "w");
	if (!f) {
		ERROR("unibus_savetofile(): could not open file \"%s\" for write.", fname);
		return;
	}
	n = fwrite((void *) words, 1, bytecount, f);
	if (n != bytecount) {
		ERROR("unibus_savetofile(): tried to write %u bytes, only %d successful.", bytecount,
				n);
	}
	fclose(f);
	INFO("Wrote %d bytes to \"%s\".", n, fname);
}
#endif

