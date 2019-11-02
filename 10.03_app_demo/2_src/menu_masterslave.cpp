/* menu_masterslave.cpp: user sub menu

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

 16-Nov-2018  JH      created
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include <unistd.h>
#include <limits.h>	// PATH_MAX

#include "mcout.h"
#include "application.hpp" // own

#include "gpios.hpp"
#include "pru.hpp"
#include "iopageregister.h"
#include "ddrmem.h"
#include "unibus.h"
#include "mailbox.h"

#include "memoryimage.hpp"
#include "unibusadapter.hpp"

#include "testcontroller.hpp"

#define WORDBUFFER_LEN	256

// "with_CPU": false if operating in an environment without
// arbitration and interrupt fielding?
void application_c::menu_masterslave(bool with_CPU) {
	// UniBone uses this test controller:
	// memory cells at start of IO page, can be tested with ZKMA
	testcontroller_c testcontroller;
	uint16_t wordbuffer[WORDBUFFER_LEN]; // for exam/deposit
	bool testcontroller_enabled = false;

	bool show_help = true; // show cmds on first screen, then only on error or request
	bool active = false; // 1 if PRU executes slave&master logic
	unsigned cur_addr = 0;
	bool ready;
	char *s_choice;
	char s_opcode[256], s_param[5][256];
	int n_fields;

//	iopageregisters_init(); // erase all devices from PRU

	// These test need active PRUs
	hardware_startup(pru_c::PRUCODE_UNIBUS);
	buslatches_output_enable(true);
	unibus->set_arbitrator_active(with_CPU) ;
		
	// PRUCODE_UNIBUS can raise events (INIT,ACLO,DCLO) 
	// handle & clear these
	unibusadapter->enabled.set(true);
	if (testcontroller_enabled) 
		testcontroller.enabled.set(true);

	ready = false;

	while (!ready) {
		// sync pagetable
		ddrmem->set_range(emulated_memory_start_addr, emulated_memory_end_addr);
		if (show_help) {
			show_help = false; // only once
			printf("\n");
			print_arbitration_info("    ");
			if (emulated_memory_start_addr > emulated_memory_end_addr)
				printf("    UniBone does not emulate memory.\n");
			else
				printf("    UniBone emulates memory from %06o to %06o.\n",
						emulated_memory_start_addr, emulated_memory_end_addr);
			if (with_CPU && !active) {
				// Old: physical PDP_11 CPU -> test of testcontroller?
				printf("***\n");
				printf("*** Starting full UNIBUS master/slave logic on PRU\n");
				printf("***\n");
				unibusadapter->print_shared_register_map();
				active = true;
			}

			printf(
					"m [<startaddr> <endaddr>]   memory range emulated by UniBone. No args = all upper. [octal]\n");
			printf(
					"e <addr> [n]                EXAMINE the next <n> words at <addr>. [octal]\n");
			printf("e                           EXAMINE single word from next <addr>\n");
			printf(
					"d <addr> <val> [<val> ..]   DEPOSIT multiple <val> starting at <addr> [octal]\n");
			printf("d <val>                     DEPOSIT <val> into next <addr>\n");
			printf(
					"sz                          Size memory: scan addresses from 0, show valid range\n");
			printf(
					"xe                          Like EXAM, but local access to DDR memory. Only in emulated memory range.\n");
			printf("xd                          Like DEPOSIT, local access to DDR memory.\n");
			printf(
					"lb <filename>               Load memory content from disk file, as binary image\n");
			printf("ll <filename>               Load memory content from MACRO-11 listing\n");
			printf(
					"lp <filename>               Load memory content from Absolute Papertape image\n");
			printf(
					"lt <filename>               Load memory content from \"adr-value pairs\" text file\n");
			printf("s <filename>                Save memory content to binary disk file\n");

			printf(
					"ta [<startaddr> <endaddr>]  Test memory, addr into each word. Max <endaddr> = 757776\n");
			printf("tr [<startaddr> <endaddr>]  Test memory random\n");
			printf("init                        Pulse UNIBUS INIT\n");
			printf("pwr                         Simulate UNIBUS power cycle (ACLO/DCLO)\n");
			printf(
					"dbg c|s|f                   Debug log: Clear, Show on console, dump to File.\n");
			printf("                               (file = %s)\n",
					logger->default_filepath.c_str());
			printf("i                           Info about address tables\n");
			printf("<  <filename>               Read command form <file>\n");

			printf("q                           Quit\n");
		}
		printf("Current EXAM/DEPOSIT address is %06o\n", cur_addr);
		s_choice = getchoice();

		printf("\n");
		n_fields = sscanf(s_choice, "%s %s %s %s %s %s", s_opcode, s_param[0], s_param[1],
				s_param[2], s_param[3], s_param[4]);

		// in each case, setup mailbox with memroy range to emulate

		if (!strcasecmp(s_opcode, "q")) {
			ready = true;
		} else if (!strcasecmp(s_opcode, "<")) {
			if (inputline.openfile(s_param[0]))
				printf("Now executing command from file \"%s\"\n", s_param[0]);
			else
				printf("%s\n", fileErrorText("Error opening command file \"%s\"!", s_param[0]));
		} else if (!strcasecmp(s_opcode, "init")) {
			unibus->init(50);
		} else if (!strcasecmp(s_opcode, "i")) {
			iopageregisters_print_tables();
		} else if (!strcasecmp(s_opcode, "pwr")) {
			unibus->probe_grant_continuity(true);
		} else if (!strcasecmp(s_opcode, "m") && n_fields == 3) {
			uint32_t start_addr, end_addr;
			parse_addr18(s_param[0], &start_addr);
			parse_addr18(s_param[1], &end_addr);
			if (ddrmem->set_range(start_addr, end_addr)) {
				emulated_memory_start_addr = start_addr;
				emulated_memory_end_addr = end_addr;
				printf("Responding to addresses in range %06o..%06o with DDR memory.\n",
						emulated_memory_start_addr, emulated_memory_end_addr);
			}
		} else if (!strcasecmp(s_opcode, "m") && n_fields == 1) {
			emulate_memory();
		} else if (!strcasecmp(s_opcode, "sz")) {
			uint32_t first_invalid_addr = unibus->test_sizer();
			if (first_invalid_addr == 0)
				printf("Address [0] invalid\n");
			else
				printf("Found valid addresses in range %06o..%06o.\n", 0,
						first_invalid_addr - 2);
		} else if (!strcasecmp(s_opcode, "ta") && n_fields == 1) {
			uint32_t end_addr = unibus->test_sizer() - 2; // well, may be invalid
			printf(
					"Testing %06o..%06o linear with \"address\" data pattern (stop with ^C) ...\n",
					0, end_addr);
			unibus->test_mem(0, end_addr, 1);
		} else if (!strcasecmp(s_opcode, "ta") && n_fields == 3) {
			uint32_t start_addr, end_addr;
			parse_addr18(s_param[0], &start_addr);
			parse_addr18(s_param[1], &end_addr);
			uint32_t last_addr = unibus->test_sizer() - 2;
			if (end_addr > last_addr)
				end_addr = last_addr; // trunc to memory size
			printf(
					"Testing %06o..%06o linear with \"address\" data pattern (stop with ^C) ...\n",
					start_addr, end_addr);
			unibus->test_mem(start_addr, end_addr, 1);
		} else if (!strcasecmp(s_opcode, "tr") && n_fields == 1) {
			uint32_t end_addr = unibus->test_sizer() - 2; // well, may be invalid
			printf("Testing %06o..%06o randomly (stop with ^C) ...\n", 0, end_addr);
			unibus->test_mem(0, end_addr, 2);
		} else if (!strcasecmp(s_opcode, "tr") && n_fields == 3) {
			uint32_t start_addr, end_addr;
			parse_addr18(s_param[0], &start_addr);
			parse_addr18(s_param[1], &end_addr);
			uint32_t last_addr = unibus->test_sizer() - 2;
			if (end_addr > last_addr)
				end_addr = last_addr; // trunc to memory size
			printf("Testing %06o..%06o randomly (stop with ^C) ...\n", start_addr, end_addr);
			unibus->test_mem(start_addr, end_addr, 2);
		} else if (!strcasecmp(s_opcode, "e")) {
			unsigned wordcount = 1;
			unsigned i;
			bool timeout;
			if (n_fields == 1) { // auto inc addr
				cur_addr = (cur_addr + 2) & 0777777;
				wordcount = 1;
			} else if (n_fields == 2) { // examine addr 1
				parse_addr18(s_param[0], &cur_addr);
				wordcount = 1;
			} else if (n_fields == 3) { // examine addr n
				parse_addr18(s_param[0], &cur_addr);
				wordcount = strtol(s_param[1], NULL, 8);
				if (wordcount > WORDBUFFER_LEN)
					wordcount = WORDBUFFER_LEN;
			}
			timeout = !unibus->dma(true, UNIBUS_CONTROL_DATI, cur_addr,
					wordbuffer, wordcount);
			for (i = 0; cur_addr <= unibus->dma_request->unibus_end_addr; i++, cur_addr += 2)
				printf("EXAM %06o -> %06o\n", cur_addr, wordbuffer[i]);
			cur_addr = unibus->dma_request->unibus_end_addr;
			if (timeout)
				printf("Bus timeout at %06o.\n", mailbox->dma.cur_addr);
			// cur_addr now on last address in block
		} else if (!strcasecmp(s_opcode, "xe")) {
			unsigned blocksize = 1;
			unsigned i;
			uint16_t w;
			bool access_error;
			if (n_fields == 1) { // auto inc addr
				cur_addr = (cur_addr + 2) & 0777777;
				blocksize = 1;
			} else if (n_fields == 2) { // examine addr 1
				parse_addr18(s_param[0], &cur_addr);
				blocksize = 1;
			} else if (n_fields == 3) { // examine addr n
				parse_addr18(s_param[0], &cur_addr);
				blocksize = strtol(s_param[1], NULL, 8);
			}
			for (access_error = false, i = 0; !access_error && i < blocksize;
					cur_addr += 2, i++) {
				access_error = !ddrmem->exam(cur_addr, &w);
				if (access_error)
					printf("DDRMEM illegal address %06o.\n", cur_addr);
				else
					printf("DDRMEM  EXAM %06o -> %06o\n", cur_addr, w);
			}
		} else if (!strcasecmp(s_opcode, "d")) {
			unsigned wordcount = 1;
			unsigned i;
			bool timeout;
			if (n_fields >= 3) { // deposit  <addr> <val> [<val> ...]
				wordcount = n_fields - 2;
				parse_addr18(s_param[0], &cur_addr);
				parse_word(s_param[1], &wordbuffer[0]);
				parse_word(s_param[2], &wordbuffer[1]);
				parse_word(s_param[3], &wordbuffer[2]);
				parse_word(s_param[4], &wordbuffer[3]);
			} else if (n_fields == 2) { // deposit  <val>
				cur_addr = (cur_addr + 2) & 0777777;
				parse_word(s_param[0], &wordbuffer[0]);
				wordcount = 1;
			}
			timeout = !unibus->dma(true, UNIBUS_CONTROL_DATO, cur_addr,
					wordbuffer, wordcount);
			for (i = 0; cur_addr <= unibus->dma_request->unibus_end_addr; i++, cur_addr += 2)
				printf("DEPOSIT %06o <- %06o\n", cur_addr, wordbuffer[i]);
			cur_addr = unibus->dma_request->unibus_end_addr;
			if (timeout)
				printf("Bus timeout at %06o.\n", cur_addr);
		} else if (!strcasecmp(s_opcode, "xd")) {
			uint16_t w[256];
			unsigned blocksize = 1;
			unsigned i;
			bool access_error;
			if (n_fields >= 3) { // deposit  <addr> <val> [<val> ...]
				blocksize = n_fields - 2;
				parse_addr18(s_param[0], &cur_addr);
				parse_word(s_param[1], &w[0]);
				parse_word(s_param[2], &w[1]);
				parse_word(s_param[3], &w[2]);
				parse_word(s_param[4], &w[3]);
			} else if (n_fields == 2) { // deposit  <val>
				cur_addr = (cur_addr + 2) & 0777777;
				parse_word(s_param[0], &w[0]);
				blocksize = 1;
			}
			for (access_error = false, i = 0; !access_error && i < blocksize;
					cur_addr += 2, i++) {
				access_error = ddrmem->deposit(cur_addr, w[i]);
				if (access_error)
					printf("DDRMEM illegal address %06o.\n", cur_addr);
				else
					printf("DDRMEM DEPOSIT %06o <- %06o\n", cur_addr, w[i]);
			}
		} else if (!strncasecmp(s_opcode, "l", 1) && (n_fields == 2)) {
			// is one of the "lx" opcodes
			bool load_ok = false;
			bool timeout;
			unsigned wordcount;
			unsigned startaddr, endaddr;
			membuffer->init();
			if (!strcasecmp(s_opcode, "lb")) {
				printf("Loading memory content from binary file %s\n", s_param[0]);
				membuffer->init();
				load_ok = membuffer->load_binary(s_param[0]);
			} else if (!strcasecmp(s_opcode, "ll")) {
				printf("Loading memory content from MACRO-11 listing %s\n", s_param[0]);
				membuffer->init();
				load_ok = membuffer->load_macro11_listing(s_param[0], "start");
			} else if (!strcasecmp(s_opcode, "lp")) {
				printf("Loading memory content from Absolute Papertape image file %s\n",
						s_param[0]);
				membuffer->init();
				load_ok = membuffer->load_papertape(s_param[0]);
				if (membuffer->entry_address == MEMORY_ADDRESS_INVALID)
					printf("No entry address defined.\n");
				else
					printf("Entry address is %06o.\n", membuffer->entry_address);
			} else if (!strcasecmp(s_opcode, "lt")) {
				printf("Loading memory content from \"adr-value pairs\" text file %s\n",
						s_param[0]);
				load_ok = membuffer->load_addr_value_text(s_param[0]);
			} else
				printf("Error: illegal load opcode!\n");
			if (!load_ok) {
				printf("File load failed, aborting!\n");
			} else {
				wordcount = membuffer->get_word_count();
				membuffer->get_addr_range(&startaddr, &endaddr);
				printf("Loaded %u words, writing UNIBUS memory[%06o:%06o].\n", wordcount,
						startaddr, endaddr);
				unibus->mem_write(membuffer->data.words, startaddr, endaddr,
						&timeout);
			}
		} else if (!strcasecmp(s_opcode, "s") && (n_fields == 2)) {
			bool timeout;
			uint32_t end_addr = unibus->test_sizer() - 2;
			printf("Reading UNIBUS memory[0:%06o] with DMA.\n", end_addr);
			unibus->mem_read(membuffer->data.words, 0, end_addr, &timeout);
			printf("Saving to file %s\n", s_param[0]);
			membuffer->save_binary(s_param[0], end_addr + 2);
		} else if (!strcasecmp(s_opcode, "dbg") && n_fields == 2) {
			if (!strcasecmp(s_param[0], "c")) {
				logger->clear();
				printf("Debug log cleared.\n");
			} else if (!strcasecmp(s_param[0], "s"))
				logger->dump();
			else if (!strcasecmp(s_param[0], "f"))
				logger->dump(logger->default_filepath);
		} else {
			printf("Unknown command \"%s\"!\n", s_choice);
			show_help = true;
		}
	}

	if (with_CPU && active) {
		printf("***\n");
		printf("*** Stopping UNIBUS logic on PRU\n");
		printf("***\n");

		if (testcontroller_enabled) {
			testcontroller.enabled.set(false);
		}
		active = false;
	}
	unibusadapter->enabled.set(false);

	// Switch off bus drivers
	buslatches_output_enable(false);
	hardware_shutdown();
}

