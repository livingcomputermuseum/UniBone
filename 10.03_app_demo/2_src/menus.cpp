/* menus.cpp: user menus for tests

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
 15-May-2016  JH      created
 */
#define _MENUS_CPP_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>
#include <assert.h>

#include "inputline.h"
#include "stringgrid.hpp"

#include "unibus.h"
#include "ddrmem.h"

#include "menus.hpp" // own

using namespace std;

menus_c *menus; // Singleton

/**********************************************
 * User Interface
 *********************************************/

void menus_c::print_arbitration_info(const char *indent) {
	if (unibus->arbitration_active) {
		printf("%s\"Arbitration ACTIVE\": Needs a PDP-11 CPU doing NPR/INTR arbitration\n",
				indent);
		printf("%s(CPU active, console processor inactive).\n", indent);
		printf("%sMemory access as Bus Master with NPR/NPG/SACK handshake.\n", indent);
	} else {
		printf("%s\"Arbitration INACTIVE\": Expects no PDP-11 CPU doing NPR/INTR arbitration\n",
				indent);
		printf("%s(CPU not plugged in, or console processor active).\n", indent);
		printf("%sOnly UNIBUS data transfers can be tested.\n", indent);
		printf("%sUnconditional memory access as Bus Master without NPR/NPG/SACK handshake.\n",
				indent);
	}
}

/*
 * read character string from stdin
 */
char *menus_c::getchoice(void) {
	static char s_choice[255];

	do {
		printf("\n>>>");
		inputline(s_choice, (int) sizeof(s_choice));
		//char *s;
		// do {
		// s_choice[0] = '\0'; //  empty buffer.
		// fgets(s_choice, sizeof(s_choice), stdin);
		// clr \n
		//for (s = s_choice; *s; s++)
		//	if (*s == '\n')
		//		*s = '\0';
		// } while (strlen(s_choice) == 0); //loop until real input
	} while (strlen(s_choice) == 0); // should not happen, but occurs under Eclipse?
	return s_choice;
}

// scan UNIBUS address range and emulate missing memory
void menus_c::emulate_memory(void) {
	unsigned first_invalid_addr;
	printf("Disable memory emulation, size physical memory ... ");
	emulated_memory_start_addr = 0xffffffff;
	emulated_memory_end_addr = 0; // start > end: disable
	ddrmem->set_range(emulated_memory_start_addr, emulated_memory_end_addr);
	first_invalid_addr = unibus->test_sizer();
	if (first_invalid_addr >= 0760000)
		printf("\nFound physical memory in full range 0..0757776, no emulation necessary!\n");
	else {
		// Emulate all unimplemented memory behind physical
		if (ddrmem->set_range(first_invalid_addr, 0757776)) {
			emulated_memory_start_addr = first_invalid_addr;
			emulated_memory_end_addr = 0757776;
			printf("\nNow emulating UNIBUS memory in range %06o..%06o with DDR memory.\n",
					emulated_memory_start_addr, emulated_memory_end_addr);
		}
	}
}

/*

 // get register by name or by index number
 unibusdevice_register_t * menus_c::device_register_by_id(unibusdevice_c *device,
 char *specifier) {
 unsigned regno;
 char *endptr;
 unibusdevice_register_t *reg = device->register_by_name(specifier);
 if (reg)
 return reg; // found by name

 regno = strtol(specifier, &endptr, 10);
 if (*endptr) { // parsing stopped
 printf("Illegal register specifier \"%s\".\n", specifier);
 return NULL;
 }
 if (regno >= device->register_count) {
 printf("Only registers 0..%d allowed.\n", device->register_count);
 return NULL;
 }
 return &(device->registers[regno]);
 }
 */

/**********************************************
 * Print info()
 * */
void menus_c::menu_info(void) {
	printf("Build timestamp: " __DATE__ " " __TIME__ "\n\n");
	printf("Test setup:\n");
	printf("UniBone must be plugged into SPC slots C-F on a DD11-CK backplane.\n");
	printf("See some configurations:\n");
	printf("\n");
	printf("  a) Regular operation, not used in tests.\n");
	printf("     No size conflict for UniBone, 3 unpopulated SPC slots here)\n");
	printf("   __F___   __E___   __D___   __C___   __B___   __A___\n");
	printf("  [ ============UniBone============ ] [ ==UNIBUS-OUT= ]\n");
	printf("  [      ] [      ] [ G727 ] [ A1-B1] [      ] [      ]  POWER\n");
	printf("  [      ] [      ] [ G727 ] [ A1-B1] [      ] [      ]\n");
	printf("  [      ] [      ] [ G727 ] [ A1-B1] [ ==UNIBUS-IN== ]\n");
	printf("\n");
	printf("\n");
	printf("  b) Signal test: On UniBone BG4,5,6,7 NPG In/Out shortcut with jumpers\n");
	printf("   __F___   __E___   __D___   __C___   __B___   __A___\n");
	printf("  [      ] [      ] [      ] [      ] [ ==DIAG+M930== ]\n");
	printf("  [      ] [      ] [      ] [      ] [      ] [      ]  POWER side\n");
	printf("  [      ] [      ] [      ] [      ] [      ] [      ]\n");
	printf("  [ ============UniBone============ ] [ ====M930===== ]\n");
	printf("\n");
	printf("\n");
	printf("  c) UNIBUS protocol test: access memory card. \n");
	printf("  	Memory MS11-L M7891 256KB = A0..A17 used.\n");
	printf("   __F___   __E___   __D___   __C___   __B___   __A___\n");
	printf("  [      ] [      ] [      ] [      ] [ ==DIAG+M930== ]\n");
	printf("  [ ====================Memory card================== ]  POWER side\n");
	printf("  [      ] [      ] [      ] [      ] [      ] [+/-12V]  Mem needs +/-12V\n");
	printf("  [ ============UniBone============ ] [ ====M930===== ]\n");
	printf("\n");
	printf("\n");
	printf("- Install the \"Non-PRU\" device tree overlay:\n");
	printf("  - cp UniBoneNonPru-00A0.dtbo /lib/firmware UniBone-00A0.dtbo\n");
	printf("  - reboot\n");

}

// print all parameters of a device or device exerciser
// p == NULL: alle
void menus_c::print_params(parameterized_c *parameterized, parameter_c *p) {
	stringgrid_c grid;
	unsigned r;
	grid.set(0, 0, "Name");
	grid.set(1, 0, "Short");
	grid.set(2, 0, "Value");
	grid.set(3, 0, "Unit");
	grid.set(4, 0, "Access");
	grid.set(5, 0, "Info");

	vector<parameter_c *>::iterator it;
	r = 1;
	for (it = parameterized->parameter.begin(); it != parameterized->parameter.end(); ++it)
		if (p == NULL || *it == p) {
			grid.set(0, r, (*it)->name);
			grid.set(1, r, (*it)->shortname);
			grid.set(2, r, *(*it)->render());
			grid.set(3, r, (*it)->unit);
			grid.set(4, r, (*it)->readonly ? "read only" : "writable");
			grid.set(5, r, (*it)->info);
			r++;
		}
	grid.print("  ", '-');
}


/**********************************************
 *	Main menu
 */
void menus_c::menu_main(void) {
	bool ready;
	char *s_choice;
	char opcode[80];
	int numarg;
	int n_fields;

// set emulated memory to "disabled"
	emulated_memory_start_addr = 0x7fffffff;
	emulated_memory_end_addr = 0;

	ready = false;
	do {
		extern const char *compile_timestamp;
		printf("\n\n");
		printf("*** UniBone technology demonstrator build %s\n", compile_timestamp);
		printf("\n");
		print_arbitration_info("    ");
		printf("\n");
		printf("a <0/1>     Setup test for active/disabled PDP-11CPU.\n");
		printf("tg          Test of single non-PRU GPIO pins\n");
		printf("tp          Test I2C paneldriver\n");
		printf("tx          Test of mailbox to PRU1\n");
		printf("tl          Test of IO bus latches\n");
		printf(
				"tm          Test Bus Master: access UNIBUS address range without PDP-11 CPU arbitration\n");
		printf("ts          Test shared DDR memory = UNIBUS memory as BUS SLAVE\n");
		if (unibus->arbitration_active)
			printf("ti          Test Interrupts\n");
		printf("td          Test device interface and state logic of RL01/02\n");
		printf("de          Device Exerciser: work with devices on the UNIBUS without PDP-11 CPU arbitration\n") ;
		printf(
				"m           Full memory slave emulation with DMA bus master functions by PDP-11 CPU.\n");
		printf("i           Info, help\n");
		printf("q           Quit\n");
		s_choice = getchoice();

		n_fields = sscanf(s_choice, "%s %d", opcode, &numarg);
		if (n_fields > 0) {
			if (!strcasecmp(opcode, "q")) {
				ready = true;
			} else if (!strcasecmp(opcode, "a")) {
				unibus->arbitration_active = !!numarg;
			} else if (!strcasecmp(opcode, "tg")) {
				menu_gpio();
			} else if (!strcasecmp(opcode, "tp")) {
				menu_panel();
			} else if (!strcasecmp(opcode, "tx")) {
				menu_mailbox();
			} else if (!strcasecmp(opcode, "tl")) {
				menu_buslatches();
			} else if (!strcasecmp(opcode, "tm")) {
				unibus->arbitration_active = false;
				menu_masterslave();
			} else if (!strcasecmp(opcode, "ts")) {
				menu_ddrmem_slave_only();
			} else if (!strcasecmp(opcode, "ti")) {
				menu_interrupts();
			} else if (!strcasecmp(opcode, "td")) {
				menu_devices();
			} else if (!strcasecmp(opcode, "de")) {
				menu_device_exercisers();
			} else if (!strcasecmp(opcode, "m")) {
				unibus->arbitration_active = true;
				menu_masterslave();
			} else if (!strcasecmp(opcode, "i")) {
				menu_info();
			}
		}
	} while (!ready);
}

