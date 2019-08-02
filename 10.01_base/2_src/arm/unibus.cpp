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

 jul-2019     JH      rewrite: multiple parallel arbitration levels
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
#include "unibusadapter.hpp" // DMA, INTR

#include "unibus.h"

/* Singleton */
unibus_c *unibus;

unibus_c::unibus_c() {
	log_label = "UNIBUS";
	dma_request = new dma_request_c(NULL);
	// priority backplane slot # for helper DMA not important, as typically used stand-alone
	// (no other devioces on the backplane active, except perhaps "testcontroller")
	dma_request->set_priority_slot(16);
}

unibus_c::~unibus_c() {
	delete dma_request;
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
	mailbox_execute(ARM2PRU_INITPULSE);
}

/* Simulate a power cycle
 */
void unibus_c::powercycle(void) {
	mailbox_execute(ARM2PRU_POWERCYCLE);
}

void unibus_c::set_arbitration_mode(arbitration_mode_enum arbitration_mode) {
	// switch pru to desired mode
	switch (arbitration_mode) {
	case unibus_c::ARBITRATION_MODE_NONE:
		mailbox_execute(ARM2PRU_ARB_MODE_NONE);
		break;
	case unibus_c::ARBITRATION_MODE_CLIENT:
		mailbox_execute(ARM2PRU_ARB_MODE_CLIENT);
		break;
	case unibus_c::ARBITRATION_MODE_MASTER:
		mailbox_execute(ARM2PRU_ARB_MODE_MASTER);
		break;
	default:
		printf("Illegal arbitration_mode  %d\n", (int) arbitration_mode);
		exit(1);
	}
}

// do a DMA transaction with or without abritration (arbitration_client)
// mailbox.dma.words already filled
// if result = timeout: =
// 0 = bus time, error address =  mailbox->dma.cur_addr
// 1 = all transfered
// A limit for time used by DMA can be compiled-in
bool unibus_c::dma(enum unibus_c::arbitration_mode_enum arbitration_mode, bool blocking,
		uint8_t control, uint32_t startaddr, uint16_t *buffer, unsigned wordcount) {
	int dma_bandwidth_percent = 50; // use 50% of time for DMA, rest for running PDP-11 CPU
	uint64_t dmatime_ns, totaltime_ns;

	// can access bus with DMA when there's a Bus Arbitrator
	assert(pru->prucode_id == pru_c::PRUCODE_UNIBUS);

	set_arbitration_mode(arbitration_mode); // changes PRU behaviour

	timeout.start(0); // no timeout, just running timer
	unibusadapter->DMA(*dma_request, blocking, control, startaddr, buffer, wordcount);

	dmatime_ns = timeout.elapsed_ns();
	// wait before next transaction, to reduce Unibus bandwidth
	// calc required total time for DMA time + wait
	// 100% -> total = dma
	// 50% -> total = 2*dma
	// 25% -> total = 4* dma
	totaltime_ns = (dmatime_ns * 100) / dma_bandwidth_percent;
	// whole transaction requires totaltime, dma already done
	timeout.wait_ns(totaltime_ns - dmatime_ns);

	return dma_request->success; // only useful if blocking
}

/* scan unibus addresses ascending from 0.
 * Stop on error, return first invalid address
 * return 0: no memory found at all
 * arbitration_active: if 1, perform NPR/NPG/SACK arbitration before mem accesses
 * words[]: buffer for whole UNIBUS address range, is filled with data
 */
uint32_t unibus_c::test_sizer(enum unibus_c::arbitration_mode_enum arbitration_mode) {
	// tests chunks of 128 word
	unsigned addr = 0;

	set_arbitration_mode(arbitration_mode); // changes PRU behaviour
	// one big transaction, automatically split in chunks
	unibusadapter->DMA(*dma_request, true, UNIBUS_CONTROL_DATI, addr, testwords,
	UNIBUS_WORDCOUNT);
	return dma_request->unibus_end_addr; // first non implemented address
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
		unsigned unibus_start_addr, unsigned unibus_end_addr, bool *timeout) {
	unsigned wordcount = (unibus_end_addr - unibus_start_addr) / 2 + 1;
	uint16_t *buffer_start_addr = words + unibus_start_addr / 2;
	assert(pru->prucode_id == pru_c::PRUCODE_UNIBUS);
	*timeout = !dma(arbitration_mode, true, UNIBUS_CONTROL_DATO, unibus_start_addr,
			buffer_start_addr, wordcount);
	if (*timeout) {
		printf("\nWrite timeout @ 0%6o\n", mailbox->dma.cur_addr);
		return;
	}
}

// Read a subset of words[] with UNIBUS DMA
// all words from start_addr to including end_addr
// DMA blocksize can be choosen arbitrarily
// arbitration_active: if 1, perform NPR/NPG/SACK arbitration before mem accesses
void unibus_c::mem_read(enum unibus_c::arbitration_mode_enum arbitration_mode, uint16_t *words,
		uint32_t unibus_start_addr, uint32_t unibus_end_addr, bool *timeout) {
	unsigned wordcount = (unibus_end_addr - unibus_start_addr) / 2 + 1;
	uint16_t *buffer_start_addr = words + unibus_start_addr / 2;
	assert(pru->prucode_id == pru_c::PRUCODE_UNIBUS);

	*timeout = !dma(arbitration_mode, true, UNIBUS_CONTROL_DATI, unibus_start_addr,
			buffer_start_addr, wordcount);
	if (*timeout) {
		printf("\nRead timeout @ 0%6o\n", mailbox->dma.cur_addr);
		return;
	}
}

// read or write
void unibus_c::mem_access_random(enum unibus_c::arbitration_mode_enum arbitration_mode,
		uint8_t unibus_control, uint16_t *words, uint32_t unibus_start_addr,
		uint32_t unibus_end_addr, bool *timeout, uint32_t *block_counter) {
	uint32_t block_unibus_start_addr, block_unibus_end_addr;
	// in average, make 16 sub transactions 
	assert(pru->prucode_id == pru_c::PRUCODE_UNIBUS);
	assert(unibus_control == UNIBUS_CONTROL_DATI || unibus_control == UNIBUS_CONTROL_DATO);
	block_unibus_start_addr = unibus_start_addr;
	// split transaction in random sized blocks
	uint32_t max_block_wordcount = (unibus_end_addr - unibus_start_addr + 2) / 2;

	do {
		uint16_t *block_buffer_start = words + block_unibus_start_addr / 2;
		uint32_t block_wordcount;
		do {
			block_wordcount = random32_log(max_block_wordcount);
		} while (block_wordcount < 1);
		assert(block_wordcount < max_block_wordcount);
		// wordcount limited by "words left to transfer"
		block_wordcount = std::min(block_wordcount,
				(unibus_end_addr - block_unibus_start_addr) / 2 + 1);
		block_unibus_end_addr = block_unibus_start_addr + 2 * block_wordcount - 2;
		assert(block_unibus_end_addr <= unibus_end_addr);
		(*block_counter) += 1;
		// printf("%06d: %5u words %06o-0%06o\n", *block_counter, block_wordcount, block_unibus_start_addr, block_unibus_end_addr) ;
		*timeout = !dma(arbitration_mode, true, unibus_control, block_unibus_start_addr,
				block_buffer_start, block_wordcount);
		if (*timeout) {
			printf("\n%s timeout @ 0%6o\n", control2text(unibus_control),
					mailbox->dma.cur_addr);
			return;
		}
		block_unibus_start_addr = block_unibus_end_addr + 2;
	} while (block_unibus_start_addr <= unibus_end_addr);
}

// arbitration_active: if 1, perform NPR/NPG/SACK arbitration before mem accesses
void unibus_c::test_mem(enum unibus_c::arbitration_mode_enum arbitration_mode,
		uint32_t start_addr, uint32_t end_addr, unsigned mode) {
#define MAX_ERROR_COUNT	8
	progress_c progress = progress_c(80);
	bool timeout = 0, mismatch = 0;
	unsigned mismatch_count = 0;
	uint32_t cur_test_addr;
	unsigned pass_count = 0, total_read_block_count = 0, total_write_block_count = 0;

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
		mem_write(arbitration_mode, testwords, start_addr, end_addr, &timeout);

		/**** 3. read until ^C ****/
		while (!SIGINTreceived && !timeout && !mismatch_count) {
			pass_count++;
			if (pass_count % 10 == 0)
				progress.putf(" %d ", pass_count);
			total_write_block_count++; // not randomized
			total_read_block_count++;
			progress.put("R");
			// read back into unibus_membuffer[]
			mem_read(arbitration_mode, membuffer->data.words, start_addr, end_addr, &timeout);
			// compare
			for (mismatch_count = 0, cur_test_addr = start_addr; cur_test_addr <= end_addr;
					cur_test_addr += 2) {
				uint16_t cur_mem_val = membuffer->data.words[cur_test_addr / 2];
				mismatch = (testwords[cur_test_addr / 2] != cur_mem_val);
				if (mismatch) {
					ARM_DEBUG_PIN0(1)
					; // trigger
					ARM_DEBUG_PIN0(0)
					;
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
//		start_addr = 0;
//		end_addr = 076;
		while (!SIGINTreceived && !timeout && !mismatch_count) {
			pass_count++;
			if (pass_count % 10 == 0)
				progress.putf(" %d ", pass_count);

			for (cur_test_addr = start_addr; cur_test_addr <= end_addr; cur_test_addr += 2)
				testwords[cur_test_addr / 2] = random24() & 0xffff; // random
//				testwords[cur_test_addr / 2] = (cur_test_addr >> 1) & 0xffff; // linear

			progress.put("W");  //info : full memory write
			mem_access_random(arbitration_mode, UNIBUS_CONTROL_DATO, testwords, start_addr,
					end_addr, &timeout, &total_write_block_count);

			if (SIGINTreceived || timeout)
				break; // leave loop

			// first full read
			progress.put("R");  //info : full memory write
			// read back into unibus_membuffer[]
			mem_access_random(arbitration_mode, UNIBUS_CONTROL_DATI, membuffer->data.words,
					start_addr, end_addr, &timeout, &total_read_block_count);
			// compare
			for (mismatch_count = 0, cur_test_addr = start_addr; cur_test_addr <= end_addr;
					cur_test_addr += 2) {
				uint16_t cur_mem_val = membuffer->data.words[cur_test_addr / 2];
				mismatch = (testwords[cur_test_addr / 2] != cur_mem_val);
				if (mismatch) {
					ARM_DEBUG_PIN0(1)
					; // trigger
					ARM_DEBUG_PIN0(0)
					;
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
		printf("All OK! Total %d passes, split into %d block writes and %d block reads\n",
				pass_count, total_write_block_count, total_read_block_count);
}

