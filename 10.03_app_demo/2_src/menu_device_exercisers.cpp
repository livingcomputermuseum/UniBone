/* menu_device_exercisers.cpp: user sub menu

 Copyright (c) 2019, Joerg Hoppe
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

 19-mar-2019  JH      created
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "inputline.h"
#include "mcout.h"
#include "stringgrid.hpp"

#include "menus.hpp" // own

#include "gpios.hpp"
#include "mailbox.h"
#include "iopageregister.h"
#include "parameter.hpp"
#include "unibus.h"
#include "memoryimage.hpp"

#include "unibusadapter.hpp"
#include "unibusdevice.hpp"

#include "devexer_rl.hpp"

void menus_c::menu_device_exercisers(void) {
	bool ready = false;
	bool show_help = true;
	bool memory_installed = false;
	devexer::devexer_c *cur_exerciser = NULL;
	unsigned n_fields;
	char *s_choice;
	char s_opcode[256], s_param[2][256];

	iopageregisters_init();
	// UNIBUS activity
	buslatches_output_enable(true);
	// no device emualtion, no CPU arbitration

	unibusadapter->worker_stop();
	unibus->arbitration_active = false;

	// instantiate differebt device exercisers

	devexer::rl_c rl;
	USE(rl); // not accessed diretcly, but is registered to exerciser list
	// and used by name.

	cur_exerciser = NULL;

	while (!ready) {

		if (show_help) {
			show_help = false; // only once
			printf("\n");
			printf("*** Exercise (= work with) installed UNIBUS decives.\n");
			print_arbitration_info("    ");
			if (cur_exerciser) {
				printf("    Current device is \"%s\" @ %06o\n", cur_exerciser->name.value.c_str(),
						cur_exerciser->base_addr.value);
			} else
				printf("    No current device selected\n");
			if (memory_installed) {
				printf(
						"    UNIBUS memory (physical or emulated) installed from %06o to %06o.\n",
						emulated_memory_start_addr, emulated_memory_end_addr);
			} else
				printf("    NO UNIBUS memory installed ... device test limited!\n");
			printf("\n");
			printf("m i              Install (emulate) max UNIBUS memory\n");
			if (memory_installed) {
				printf("m f [word]       Fill UNIBUS memory (with 0 or other octal value)\n");
				printf("m d              Dump UNIBUS memory to disk\n");
			}
			printf("le                   List all defined device exercisers\n");
			printf("se <exer>            Select \"current device exerciser\"\n");
			if (cur_exerciser) {
				printf("p <param> <val>      Set parameter value of current device\n");
				printf("p <param>            Get parameter value of current device\n");
				printf("p panel              Force parameter update from panel\n");
				printf("p                    Show all parameter of current device\n");
			}

			printf("d <regname> <val>    Deposit octal value into named device register\n");
			printf("e <regname>          Examine single device register (regno decimal)\n");
			printf("e                    Examine all device registers\n");
			printf("d <addr> <val>       Deposit octal val into UNIBUS address.\n");
			printf("e <addr>             Deposit octal val into UNIBUS address.\n");
			printf("dl c|s|f             Debug log: Clear, Show on console, dump to File.\n");
			printf("                       (file = %s)\n", logger->default_filepath.c_str());
			printf("init                 Pulse UNIBUS INIT\n");
			printf("pwr                  Simulate UNIBUS power cycle (ACLO/DCLO)\n");
			printf("q                    Quit\n");
		}
		s_choice = getchoice();

		printf("\n");
		try {
			n_fields = sscanf(s_choice, "%s %s %s", s_opcode, s_param[0], s_param[1]);
			if (!strcasecmp(s_opcode, "q")) {
				ready = true;
			} else if (!strcasecmp(s_opcode, "init")) {
				unibus->init();
			} else if (!strcasecmp(s_opcode, "pwr")) {
				unibus->powercycle();
			} else if (!strcasecmp(s_opcode, "dl") && n_fields == 2) {
				if (!strcasecmp(s_param[0], "c")) {
					logger->clear();
					printf("Debug log cleared.\n");
				} else if (!strcasecmp(s_param[0], "s"))
					logger->dump();
				else if (!strcasecmp(s_param[0], "f"))
					logger->dump(logger->default_filepath);
			} else if (!strcasecmp(s_opcode, "m") && n_fields == 2
					&& !strcasecmp(s_param[0], "i")) {
				// install (emulate) max UNIBUS memory
				emulate_memory();
				memory_installed = true;
				show_help = true; // menu struct changed
			} else if (memory_installed && !strcasecmp(s_opcode, "m") && n_fields >= 2
					&& !strcasecmp(s_param[0], "f")) {
				//  clear UNIBUS memory
				bool timeout;
				uint16_t fillword = 0;
				if (n_fields == 3)
					fillword = strtol(s_param[1], NULL, 8);
				membuffer->set_addr_range(emulated_memory_start_addr, emulated_memory_end_addr);
				membuffer->fill(fillword);
				// write buffer-> UNIBUS
				printf(
						"Fill memory with %06o, writing UNIBUS memory[%06o:%06o] with blocksize %u words\n",
						fillword, emulated_memory_start_addr, emulated_memory_end_addr,
						unibus->dma_wordcount);
				unibus->mem_write(membuffer->data.words, emulated_memory_start_addr,
						emulated_memory_end_addr, unibus->dma_wordcount, &timeout);
				if (timeout)
					printf("Error writing UNIBUS memory!\n");
			} else if (memory_installed && !strcasecmp(s_opcode, "m") && n_fields == 2
					&& !strcasecmp(s_param[0], "d")) {
				// dump UNIBUS memory to disk
				const char * filename = "memory.dump";
				bool timeout;
				// 1. read UNIBUS memory
				uint32_t end_addr = unibus->test_sizer() - 2;
				printf("Reading UNIBUS memory[0:%06o] with DMA blocks of %u words\n", end_addr,
						unibus->dma_wordcount);
				//  clear memory buffer, to be sure content changed
				membuffer->set_addr_range(0, end_addr);
				membuffer->fill(0);

				unibus->mem_read(membuffer->data.words, 0, end_addr, unibus->dma_wordcount,
						&timeout);
				if (timeout)
					printf("Error reading UNIBUS memory!\n");
				else {
					// 1. read UNIBUS memory
					printf("Saving to file \"%s\"\n", filename);
					membuffer->save_binary(filename, end_addr + 2);
				}
			} else if (!strcasecmp(s_opcode, "le") && n_fields == 1) {
				list<devexer::devexer_c *>::iterator it;
				cout << "Registered exercisers:\n";
				for (it = devexer::devexer_c::myexercisers.begin();
						it != devexer::devexer_c::myexercisers.end(); ++it)
					cout << "- " << (*it)->name.value << "\n";
			} else if (!strcasecmp(s_opcode, "se") && n_fields == 2) {
				list<devexer::devexer_c *>::iterator it;
				bool found = false;
				for (it = devexer::devexer_c::myexercisers.begin();
						it != devexer::devexer_c::myexercisers.end(); ++it)
					if (!strcasecmp((*it)->name.value.c_str(), s_param[0])) {
						found = true;
						cur_exerciser = *it;
					}
				if (!found)
					cout << "Exerciser \"" << s_param[0] << "\" not found.\n";
				else {
					printf("Current exerciser is \"%s\" @ %06o\n", cur_exerciser->name.value.c_str(),
							cur_exerciser->base_addr.value );
					// TODO: find base address of assoiated UNIBUS unibuscontroller
					show_help = true;
				}
			} else if (cur_exerciser && !strcasecmp(s_opcode, "p") && n_fields == 1) {
				cout << "Parameters of device " << cur_exerciser->name.value << ":\n";
				print_params(cur_exerciser, NULL);
			} else if (cur_exerciser && !strcasecmp(s_opcode, "p") && n_fields == 2) {
				// show selected
				string pn(s_param[0]);
				parameter_c *p = cur_exerciser->param_by_name(pn);
				if (p == NULL)
					cout << "Exerciser \"" << cur_exerciser->name.value
							<< "\" has no parameter \"" << pn << "\".\n";
				else
					print_params(cur_exerciser, p);
			} else if (cur_exerciser && !strcasecmp(s_opcode, "p") && n_fields == 3) {
				string pn(s_param[0]);
				parameter_c *p = cur_exerciser->param_by_name(pn);
				if (p == NULL)
					cout << "Exerciser \"" << cur_exerciser->name.value
							<< "\" has no parameter \"" << pn << "\".\n";
				else {
					string sval(s_param[1]);
					p->parse(sval);
					print_params(cur_exerciser, p);
				}
			} else if (!strcasecmp(s_opcode, "d") && n_fields == 3) {
				uint32_t addr;
				// interpret as 18 bit address
				addr = strtol(s_param[0], NULL, 8);

				mailbox->dma.words[0] = strtol(s_param[1], NULL, 8);
				bool timeout = !unibus->dma(UNIBUS_CONTROL_DATO, addr, 1);
				printf("DEPOSIT %06o <- %06o\n", addr, mailbox->dma.words[0]);
				if (timeout)
					printf("Bus timeout at %06o.\n", mailbox->dma.cur_addr);
			} else if (!strcasecmp(s_opcode, "e") && n_fields <= 2) {
				unsigned blocksize = 0; // default: no EXAM
				bool timeout;
				uint32_t addr;
				if (n_fields == 2) { // single reg number given
					blocksize = 1; // exam 1 word
					addr = strtol(s_param[0], NULL, 8); 	// interpret as 18 bit address
					timeout = !unibus->dma(UNIBUS_CONTROL_DATI, addr, blocksize);
					printf("EXAM %06o -> %06o\n", addr, mailbox->dma.words[0]);
				}
				if (timeout)
					printf("Bus timeout at %06o.\n", mailbox->dma.cur_addr);
				// cur_addr now on last address in block

			} else {
				printf("Unknown command \"%s\"!\n", s_choice);
				show_help = true;
			}
		} catch (bad_parameter& e) {
			cout << "Error : " << e.what() << "\n";
		}
	} // ready

	buslatches_output_enable(false);
}

