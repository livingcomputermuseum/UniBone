/* menu_interrupts.cpp: user sub menu

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

#include "utils.hpp"
#include "inputline.hpp"
#include "mcout.h"
#include "application.hpp" // own

#include "pru.hpp"
#include "gpios.hpp"
#include "unibus.h"

#include "memoryimage.hpp"
#include "unibusadapter.hpp"
#include "testcontroller.hpp"

void application_c::menu_interrupts(const char *menu_code) {
	bool show_help = true; // show cmds on first screen, then only on error or request
	bool active = false; // 1 if PRU executes slave&master logic
	bool ready;
	bool test_loaded;
	char *s_choice;
	char s_opcode[256], s_param[5][256];
	int n_fields;

	testcontroller_c *test_controller = new testcontroller_c();
	test_controller->enabled.value = true;

	// These test need active PRUs
	// and an PDP-11 CPU as Arbitrator
	hardware_startup(pru_c::PRUCODE_UNIBUS);
	buslatches_output_enable(true);
	// CPU required
	unibus->set_arbitrator_active(true) ;

	ready = false;
	test_loaded = false;
	while (!ready) {
		if (show_help) {
			show_help = false; // only once
			printf("\n");
			printf("*** Test of UNIBUS interrupts.\n");
			printf(
					"    BR*/BG* Bus Arbitration needs a PDP-11 CPU acting as Bus Arbitrator.\n");
			if (emulated_memory_start_addr > emulated_memory_end_addr)
				printf("    UniBone does not emulate memory.\n");
			else
				printf("   UniBone emulates memory from %06o to %06o.\n",
						emulated_memory_start_addr, emulated_memory_end_addr);
			if (!active) {
				printf("***\n");
				printf("*** Starting full UNIBUS master/slave logic on PRU\n");
				printf("***\n");
				unibusadapter->enabled.set(true);
				active = true;
			}
			printf("m                    emulate all missing memory\n");
			printf("e <addr>             EXAMINE the word at <addr>. [octal]\n");
			printf("d <addr> <val>       DEPOSIT <val> into <addr> [octal]\n");
			printf("ll <filename>        Load test program from MACRO-11 listing\n");
			if (test_loaded) {
				printf(
 				   "i <level> <vector>   Issue interrupt at priority <level> to <<vector> [octal]\n");
				printf("                     <level> = 0..7, <vector> = 0,4,10,...,374\n");
				printf(
						"                     Then interrupts cause print-out, and	processor priority\n");
				printf("                     can be set with keys 0..7.\n");
				printf("                     Example:\n");
				printf("                       \"i 5 164\" calls vector 164 at level 5.\n");
				printf(
						"                       If processor level < 5, INTR is accepted, a message is printed.\n");
				printf("                       Else INTR is pending until level is lowered.\n");
				printf("				     <level> = 0..7, <vector> = 0,4,10,...,374\n");
				printf(
						"i <level> <slot> <vector>  Variant, additional a backplane slot for priority\n");
				printf("                     within same level group is given\n");
				printf("dma <channel> <from> <to> <data>  (addr & data word octal)\n");
				printf(
						"	                 DEPOSIT memory range. Non-blocking, subsequent script commands\n");
				printf(
						"                     are executed in parallel. <slot> is backplane slot for priority\n");
				printf("                      <channel> 0..%u possible.\n",
						(unsigned) test_controller->dma_channel_count);
			}
			printf("dbg c|s|f            Debug log: Clear, Show on console, dump to File.\n");
			printf("pwr                  Simulate UNIBUS power cycle (ACLO/DCLO)\n");
			printf("q                    Quit\n");
		}
		s_choice = getchoice(menu_code);

		printf("\n");
		n_fields = sscanf(s_choice, "%s %s %s %s %s %s", s_opcode, s_param[0], s_param[1],
				s_param[2], s_param[3], s_param[4]);
		if (!strcasecmp(s_opcode, "q")) {
			ready = true;
		} else if (!strcasecmp(s_opcode, "pwr")) {
			unibus->probe_grant_continuity(true);
		} else if (!strcasecmp(s_opcode, "m") && n_fields == 1) {
			emulate_memory();
		} else if (!strcasecmp(s_opcode, "e") && n_fields == 2) {
			uint32_t cur_addr;
			uint16_t wordbuffer;
			parse_addr18(s_param[0], &cur_addr);
			bool timeout = !unibus->dma(true, UNIBUS_CONTROL_DATI, cur_addr,
					&wordbuffer, 1);
			if (timeout)
				printf("Bus timeout at %06o.\n", cur_addr);
			else
				printf("EXAM %06o -> %06o\n", cur_addr, wordbuffer);
		} else if (!strcasecmp(s_opcode, "d") && n_fields == 3) {
			uint32_t cur_addr;
			uint16_t wordbuffer;
			parse_addr18(s_param[0], &cur_addr);
			parse_word(s_param[1], &wordbuffer);
			bool timeout = !unibus->dma(true, UNIBUS_CONTROL_DATO, cur_addr,
					&wordbuffer, 1);
			if (timeout)
				printf("Bus timeout at %06o.\n", cur_addr);
			else
				printf("DEPOSIT %06o <- %06o\n", cur_addr, wordbuffer);
		} else if (!strcasecmp(s_opcode, "ll") && n_fields == 2) {
			uint32_t start_addr, end_addr;
			bool timeout;
			test_loaded = false;
			printf("Loading memory content from MACRO-11 listing %s\n", s_param[0]);
			membuffer->init();
			bool load_ok = membuffer->load_macro11_listing(s_param[0], "start");
			if (!load_ok) {
				printf("File load failed, aborting.\n");
				continue;
			}
			membuffer->get_addr_range(&start_addr, &end_addr);
			printf("Loaded %u words, writing UNIBUS memory[%06o:%06o].\n",
					membuffer->get_word_count(), start_addr, end_addr);
			unibus->mem_write(membuffer->data.words, start_addr, end_addr,
					&timeout);
			if (timeout)
				printf("Memory write failed with UNIBUS timeout, aborting.\n");
			else {
				if (membuffer->entry_address == MEMORY_ADDRESS_INVALID)
					printf(
							"Start program manually on PDP-11 console (entry address not found).\n");
				else
					printf("Start program manually on PDP-11 console, entry address is %06o.\n",
							membuffer->entry_address);
				test_loaded = true;
			}
		} else if (test_loaded && !strcasecmp(s_opcode, "i") && n_fields >= 3
				&& n_fields <= 4) {

			uint8_t priority_slot = 16; // default
			uint8_t level;
			uint16_t vector;
			if (!parse_level(s_param[0], &level))
				continue;
			if (n_fields == 3) { // i <level> <vector>
				if (!parse_vector(s_param[1], 0374, &vector)) // artificial limit, still far to big
					continue;
			} else if (n_fields == 4) { // i <level> <slot> <vector>
				if (!parse_slot(s_param[1], &priority_slot))
					continue;
				if (!parse_vector(s_param[2], 0374, &vector)) // artificial limit, still far to big
					continue;
			}
			// use request from testcontroller
			unsigned level_idx = level - 4; // 4,5,6,7 -> 0,1,2,3
			intr_request_c *intr_request =
					test_controller->intr_request[priority_slot][level_idx];
			intr_request->set_vector(vector);
			unibusadapter->INTR(*intr_request, NULL, 0);
			printf("Interrupt with level=%d, priority slot=%d, vector=%03o generated.\n", level,
					priority_slot, vector);
		} else if (test_loaded && !strcasecmp(s_opcode, "dma") && n_fields == 5) {
			// dma <slot> <from> <to> <data>
			uint8_t dma_channel;
			uint32_t addr_from, addr_to;
			uint16_t fillword;
			dma_channel = strtol(s_param[0], NULL, 10);
			if (dma_channel >= test_controller->dma_channel_count) {
				printf("Only DMA channels 0..%u possible.\n",
						(unsigned) test_controller->dma_channel_count);
				continue;
			}
			parse_addr18(s_param[1], &addr_from);
			parse_addr18(s_param[2], &addr_to);
			parse_word(s_param[3], &fillword);
			if (addr_to < addr_from)
				addr_to = addr_from;
			unsigned wordcount = (addr_to - addr_from + 2) / 2;

			// do not use single global "membuffer": need independent buffer per concurrent DMA with different data
			memoryimage_c *dma_buffer = test_controller->dma_channel_buffer[dma_channel];
			dma_buffer->set_addr_range(addr_from, addr_to);
			dma_buffer->fill(fillword);

			// DMA running asynchronically parallel, no info on BUS timeout yet. User has to wait.
			dma_request_c *dma_request = test_controller->dma_channel_request[dma_channel];
			unibusadapter->DMA(*dma_request, false, UNIBUS_CONTROL_DATO, addr_from,
					&(dma_buffer->data.words[addr_from / 2]), wordcount);
			printf("DEPOSIT in slot %d started for %06o..%06o\n",
					dma_request->get_priority_slot(), addr_from, addr_to);
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
	} // while(!ready) ;
	if (active) {
		printf("***\n");
		printf("*** Stopping UNIBUS logic on PRU\n");
		printf("***\n");
		unibusadapter->enabled.set(false);
		active = false;
	}
	delete test_controller;

	// Switch off bus drivers
	buslatches_output_enable(false);
	hardware_shutdown();

}

