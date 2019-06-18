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
#include "inputline.h"
#include "mcout.h"
#include "application.hpp" // own

#include "pru.hpp"
#include "gpios.hpp"
#include "unibus.h"

#include "memoryimage.hpp"
#include "unibusadapter.hpp"

void application_c::menu_interrupts(void) {
	// needs physical CPU
	enum unibus_c::arbitration_mode_enum arbitration_mode = unibus_c::ARBITRATION_MODE_CLIENT;

	const char *testprogram_fname = "intrtst.lst";
	bool show_help = true; // show cmds on first screen, then only on error or request
	bool active = false; // 1 if PRU executes slave&master logic
	bool ready;
	char *s_choice;
	char s_opcode[256], s_param[5][256];
	int n_fields;

	// These test need active PRUs
	// and an PDP-11 CPU as Arbitrator
	hardware_startup(pru_c::PRUCODE_UNIBUS);
	buslatches_output_enable(true);

	ready = false;
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
				unibusadapter->worker_start();
				active = true;
			}

			printf(
					"a                   Automatic setup: emulate memory, download \"%s\" onto PDP-11.\n",
					testprogram_fname);
			printf(
					"i <level> <vector>  Issue interrupt at priority <level> to <<vector> [octal]\n");
			printf("                      <level> = 0..7, <vector> = 0,4,10,...,374\n");
			printf("                      The test program \"%s\" must be running!\n",
					testprogram_fname);
			printf(
					"                      Then interrupts cause print-out, and	processor priority\n");
			printf("                      can be set with keys 0..7.\n");
			printf("                      Examples:\n");
			printf("                      \"i 5 164\" calls vector 164 at level 5.\n");
			printf(
					"                      If processor level < 5, INTR is accepted, a message is printed.\n");
			printf("                      Else INTR is pending until level is lowered.\n");
			printf("pwr                   Simulate UNIBUS power cycle (ACLO/DCLO)\n");
			printf("q                     Quit\n");
		}
		s_choice = getchoice();

		printf("\n");
		n_fields = sscanf(s_choice, "%s %s %s %s %s %s", s_opcode, s_param[0], s_param[1],
				s_param[2], s_param[3], s_param[4]);
		if (!strcasecmp(s_opcode, "q")) {
			ready = true;
		} else if (!strcasecmp(s_opcode, "pwr")) {
			unibus->powercycle();
		} else if (!strcasecmp(s_opcode, "a")) {
			timeout_c timer;
			bool load_ok, timeout;
			uint32_t start_addr, end_addr;
			printf("Trying to start PDP-11 CPU...\n");
			unibus->powercycle();
			timer.wait_ms(1000); // shpw prompt
			unibus->powercycle();
			timer.wait_ms(1000); // shpw prompt

			printf("Loading memory content from MACRO-11 listing \"%s\".\n", testprogram_fname);
			membuffer->init();
			load_ok = membuffer->load_macro11_listing(testprogram_fname, "start");
			if (!load_ok) {
				printf("File load failed, aborting.\n");
			} else {
				// SET_DEBUG_PIN0(1) ;
				emulate_memory(arbitration_mode);
				// SET_DEBUG_PIN0(0) ;
				membuffer->get_addr_range(&start_addr, &end_addr);
				printf(
						"Loaded %u words, writing UNIBUS memory[%06o:%06o] with blocksize %u words.\n",
						membuffer->get_word_count(), start_addr, end_addr,
						unibus->dma_wordcount);
				// SET_DEBUG_PIN1(1) ;
				unibus->mem_write(arbitration_mode, membuffer->data.words, start_addr, end_addr,
						unibus->dma_wordcount, &timeout);
				// SET_DEBUG_PIN0(0) ;
				// SET_DEBUG_PIN1(0) ;
				if (timeout)
					printf("Memory write failed with UNIBUS timeout, aborting.\n");
				else {
					if (membuffer->entry_address == MEMORY_ADDRESS_INVALID)
						printf(
								"Start program manually on PDP-11 console (entry address not found).\n");
					else
						printf(
								"Start program manually on PDP-11 console, entry address is %06o.\n",
								membuffer->entry_address);
				}
			}
		} else if (!strcasecmp(s_opcode, "i") && n_fields == 3) {
			unsigned priority = strtol(s_param[0], NULL, 8);
			unsigned vector = strtol(s_param[1], NULL, 8);
			if (priority < 4 || priority > 7) {
				printf("Illegal interrupt priority %u, must be 4..7.\n", priority);
			} else if ((vector & 3) != 0) {
				printf("Illegal interrupt vector %06o, must be multiple of 4.\n", vector);
			} else if (vector >= 0374) { // artificial limit, still far to big
				printf("Illegal interrupt vector %06o, must be <= 0374.\n", vector);
			} else {
				unibus->interrupt((uint8_t) priority, (uint16_t) vector);
				printf("Interrupt with priority=%d, vector=%03o generated.\n", priority,
						vector);
			}
		} else {
			printf("Unknown command \"%s\"!\n", s_choice);
			show_help = true;
		}
	} // while(!ready) ;
	if (active) {
		printf("***\n");
		printf("*** Stopping UNIBUS logic on PRU\n");
		printf("***\n");
		unibusadapter->worker_stop();
		active = false;
	}

	// Switch off bus drivers
	buslatches_output_enable(false);
	hardware_shutdown();

}

