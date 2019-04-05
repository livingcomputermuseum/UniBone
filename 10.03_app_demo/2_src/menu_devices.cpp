/* menu_devices.cpp: user sub menu

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

#include "inputline.h"
#include "mcout.h"


#include "menus.hpp" // own

#include "gpios.hpp"
#include "mailbox.h"
#include "iopageregister.h"
#include "parameter.hpp"
#include "unibus.h"
#include "memoryimage.hpp"

#include "unibusadapter.hpp"
#include "unibusdevice.hpp"

#include "panel.hpp"
#include "demo_io.hpp"
#include "demo_regs.hpp"
#include "rl11.hpp"
#include "rk11.hpp"
#include "cpu.hpp"


void menus_c::menu_devices(void) {
	bool ready = false;
	bool show_help = true;
	bool memory_installed = false;
	device_c *cur_device = NULL;
	unibusdevice_c *unibuscontroller = NULL;
	unsigned n_fields;
	char *s_choice;
	char s_opcode[256], s_param[2][256];

	iopageregisters_init();
	// UNIBUS activity
	buslatches_output_enable(true);

	unibusadapter->worker_start();
	if (unibus->arbitration_active)
		unibus->emulation_logic_start(); // PRU is active UNIBUS node

	// 2 demo controller
	demo_io_c demo_io;
	//demo_regs_c demo_regs; // mem at 160000: RT11 crashes?

	cpu_c cpu;

	// create RL11 + drives
	RL11_c RL11; // instantiates also 4 RL01/02 drives
	cur_device = NULL;

	paneldriver->reset(); // reset I2C, restart worker()
 
        // create RK11 + drives
        rk11_c RK05;
 
	demo_io.install();
	demo_io.worker_start();

	//demo_regs.install();
	//demo_regs.worker_start();

	RL11.install();
	RL11.connect_to_panel();
	RL11.worker_start();

        RK05.install();
        RK05.worker_start();

	cpu.install();
	cpu.worker_start();

	while (!ready) {

		if (show_help) {
			show_help = false; // only once
			printf("\n");
			printf("*** Test of device parameter interface and states.\n");
			print_arbitration_info("    ");
			if (cur_device) {
				printf("    Current device is \"%s\"\n", cur_device->name.value.c_str());
				if (unibuscontroller)
					printf("    UNIBUS unibuscontroller base address = %06o\n",
							unibuscontroller->base_addr.value);
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
			printf("ld                   List all defined devices\n");
			printf("sd <dev>             Select \"current device\"\n");
			if (cur_device) {
				printf("p <param> <val>      Set parameter value of current device\n");
				printf("p <param>            Get parameter value of current device\n");
				printf("p panel              Force parameter update from panel\n");
				printf("p                    Show all parameter of current device\n");
			}
			if (unibuscontroller) {
				printf("d <regname> <val>    Deposit octal value into named device register\n");
				printf("e <regname>          Examine single device register (regno decimal)\n");
				printf("e                    Examine all device registers\n");
				printf("d <addr> <val>       Deposit octal val into UNIBUS address.\n");
				printf("e <addr>             Deposit octal val into UNIBUS address.\n");
			}
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
			} else if (!strcasecmp(s_opcode, "ld") && n_fields == 1) {
				list<device_c *>::iterator it;
				cout << "Registered devices:\n";
				for (it = device_c::mydevices.begin(); it != device_c::mydevices.end(); ++it)
					cout << "- " << (*it)->name.value << " (type is " << (*it)->type_name.value
							<< ")\n";
			} else if (!strcasecmp(s_opcode, "sd") && n_fields == 2) {
				list<device_c *>::iterator it;
				bool found = false;
				for (it = device_c::mydevices.begin(); it != device_c::mydevices.end(); ++it)
					if (!strcasecmp((*it)->name.value.c_str(), s_param[0])) {
						found = true;
						cur_device = *it;
					}
				if (!found)
					cout << "Device \"" << s_param[0] << "\" not found.\n";
				else {
					printf("Current device is \"%s\"\n", cur_device->name.value.c_str());
					// find base address of assoiated UNIBUS unibuscontroller
					if (cur_device != NULL && dynamic_cast<unibusdevice_c *>(cur_device))
						unibuscontroller = dynamic_cast<unibusdevice_c *>(cur_device);
					else if (cur_device->parent != NULL
							&& dynamic_cast<unibusdevice_c *>(cur_device->parent)) {
						unibuscontroller = dynamic_cast<unibusdevice_c *>(cur_device->parent);
						printf("Controller base address = %06o\n",
								unibuscontroller->base_addr.value);
					} else
						unibuscontroller = NULL; // no unibuscontroller found
					show_help = true;
				}
			} else if (cur_device && !strcasecmp(s_opcode, "p") && n_fields == 1) {
				cout << "Parameters of device " << cur_device->name.value << ":\n";
				print_params(cur_device, NULL);
			} else if (cur_device && !strcasecmp(s_opcode, "p") && n_fields == 2
					&& !strcasecmp(s_param[0], "panel")) {
				paneldriver->refresh_params(cur_device);
				// RL11.refresh_params_from_panel(); // all 4 drives
			} else if (cur_device && !strcasecmp(s_opcode, "p") && n_fields == 2) {
				// show selected
				string pn(s_param[0]);
				parameter_c *p = cur_device->param_by_name(pn);
				if (p == NULL)
					cout << "Device \"" << cur_device->name.value << "\" has no parameter \""
							<< pn << "\".\n";
				else
					print_params(cur_device, p);
			} else if (cur_device && !strcasecmp(s_opcode, "p") && n_fields == 3) {
				string pn(s_param[0]);
				parameter_c *p = cur_device->param_by_name(pn);
				if (p == NULL)
					cout << "Device \"" << cur_device->name.value << "\" has no parameter \""
							<< pn << "\".\n";
				else {
					string sval(s_param[1]);
					p->parse(sval);
					print_params(cur_device, p);
				}
			} else if (unibuscontroller && !strcasecmp(s_opcode, "d") && n_fields == 3) {
				uint32_t addr;
				unibusdevice_register_t *reg = unibuscontroller->register_by_name(s_param[0]);
				if (reg) // register name given
					addr = reg->addr;
				else
					// interpret as 18 bit address
					addr = strtol(s_param[0], NULL, 8);

				mailbox->dma.words[0] = strtol(s_param[1], NULL, 8);
				bool timeout = !unibus->dma(UNIBUS_CONTROL_DATO, addr, 1);
				if (reg) {
					assert(
							reg
									== unibuscontroller->register_by_unibus_address(
											mailbox->dma.cur_addr));
					printf("DEPOSIT reg #%d \"%s\" %06o <- %06o\n", reg->index, reg->name,
							reg->addr, mailbox->dma.words[0]);
				} else
					printf("DEPOSIT %06o <- %06o\n", addr, mailbox->dma.words[0]);
				if (timeout)
					printf("Bus timeout at %06o.\n", mailbox->dma.cur_addr);
			} else if (unibuscontroller && !strcasecmp(s_opcode, "e") && n_fields <= 2) {
				unsigned blocksize = 0; // default: no EXAM
				bool timeout;
				uint32_t addr;
				unibusdevice_register_t *reg;
				if (n_fields == 2) { // single reg number given
					blocksize = 1; // exam 1 word
					reg = unibuscontroller->register_by_name(s_param[0]);
					if (reg)
						addr = reg->addr;
					else
						addr = strtol(s_param[0], NULL, 8); 	// interpret as 18 bit address
					timeout = !unibus->dma(UNIBUS_CONTROL_DATI, addr, blocksize);
					printf("EXAM %06o -> %06o\n", addr, mailbox->dma.words[0]);
				} else { // list all regs
					addr = unibuscontroller->base_addr.value; // all device registers
					blocksize = unibuscontroller->register_count;
					unsigned i;
					timeout = !unibus->dma(UNIBUS_CONTROL_DATI, addr, blocksize);
					for (i = 0; addr <= mailbox->dma.cur_addr; i++, addr += 2) {
						reg = unibuscontroller->register_by_unibus_address(addr);
						assert(reg);
						printf("EXAM reg #%d %s %06o -> %06o\n", reg->index, reg->name,
								reg->addr, mailbox->dma.words[i]);
					}
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
	cpu.worker_stop();
	cpu.uninstall();

	RL11.worker_stop();
	RL11.disconnect_from_panel();
	RL11.uninstall();

        RK05.worker_stop();
        RK05.uninstall();

	//demo_regs.worker_stop();
	//demo_regs.uninstall();

	demo_io.worker_stop();
	demo_io.uninstall();

	if (unibus->arbitration_active)
		unibus->emulation_logic_stop(); // undo

	unibusadapter->worker_stop();

	buslatches_output_enable(false);
}

