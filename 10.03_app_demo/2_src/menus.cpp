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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>
#include <assert.h>

#include "inputline.hpp"
#include "stringgrid.hpp"

#include "unibus.h"
#include "ddrmem.h"

#include "application.hpp" // own

using namespace std;

/**********************************************
 * User Interface
 *********************************************/

// octal, or '<char>'
bool application_c::parse_word(char *txt, uint16_t *word) {
	*word = 0;
	if (!txt || *txt == 0)
		return false;

	if (*txt == '\'') {
		txt++;
		if (*txt)
			*word = *txt; // ASCII code of first char after ''
	} else
		*word = strtol(txt, NULL, 8); // octal literal
	return true;
}

// octal, trunc to 18 bit
bool application_c::parse_addr18(char *txt, uint32_t *addr) {
	*addr = strtol(txt, NULL, 8);
	if (*addr > 0777777) {
		*addr = 0777777;
		return false;
	}
	return true;
}

bool application_c::parse_level(char *txt, uint8_t *level) {
	*level = strtol(txt, NULL, 8);
	if (*level < 4 || *level > 7) {
		printf("Illegal interrupt level %u, must be 4..7.\n", *level);
		return false;
	}
	return true;
}

bool application_c::parse_vector(char *txt, uint16_t max_vector, uint16_t *vector) {
	*vector = strtol(txt, NULL, 8);
	if (*vector > max_vector) {
		printf("Illegal interrupt vector %06o, must be <= %06o.\n", (unsigned) *vector,
				(unsigned) max_vector);
		return false;
	} else if ((*vector & 3) != 0) {
		printf("Illegal interrupt vector %06o, must be multiple of 4.\n", *vector);
		return false;
	}
	return true;
}

bool application_c::parse_slot(char *txt, uint8_t *priority_slot) {
	*priority_slot = strtol(txt, NULL, 10);
	if (*priority_slot <= 0 || *priority_slot > 31) {
		printf("Illegal priority slot %u, must be 1..31.\n", *priority_slot);
		return false;
	}
	return true;
}

void application_c::print_arbitration_info(const char *indent) {
	if (unibus->get_arbitrator_active()) {
		printf("%s\"UniBone devcies are clients to PDP-11 CPU doing NPR/INTR Arbitrator\n",
				indent);
		printf("%s(CPU active, console processor inactive).\n", indent);
		printf("%sCPU is physical or emulated.\n", indent);
		printf("%sMemory access as Bus Master with NPR/NPG/SACK handshake.\n", indent);
	} else {
		printf(
				"%s\"BR/BG and NPR/NPG Arbitration INACTIVE\": Expects no PDP-11 CPU doing NPR/INTR arbitration\n",
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
char *application_c::getchoice(void) {
	static char s_choice[255];

	do {
		printf("\n");
		inputline.readline(s_choice, (int) sizeof(s_choice), ">>>");
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
// result: false, if nothing emulated
bool application_c::emulate_memory() {
	bool result = false;
	unsigned first_invalid_addr;
	printf("Disable memory emulation, size physical memory ...\n");
	emulated_memory_start_addr = 0xffffffff;
	emulated_memory_end_addr = 0; // start > end: disable
	ddrmem->set_range(emulated_memory_start_addr, emulated_memory_end_addr);
	first_invalid_addr = unibus->test_sizer();
	if (first_invalid_addr >= 0760000)
		printf("Found physical memory in full range 0..0757776, no emulation necessary!\n");
	else {
		// Emulate all unimplemented memory behind physical
		if (ddrmem->set_range(first_invalid_addr, 0757776)) {
			emulated_memory_start_addr = first_invalid_addr;
			emulated_memory_end_addr = 0757776;
			printf("Now emulating UNIBUS memory in range %06o..%06o with DDR memory.\n",
					emulated_memory_start_addr, emulated_memory_end_addr);
			result = true;
		}
	}
	return result;
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
void application_c::menu_info(void) {
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
void application_c::print_params(parameterized_c *parameterized, parameter_c *p) {
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
void application_c::menu_main(void) {
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
		// printf("a <0/1>     Setup test for Aribitrator: 0 =none, 1 = client to active PDP-11 CPU.\n");
		printf("tg          Test of single non-PRU GPIO pins\n");
		printf("tp          Test I2C paneldriver\n");
		//printf("tx          Test of mailbox to PRU1\n");
		printf("tl          Test of IO bus latches\n");
		printf("us          Stimulate UNIBUS signals\n");
		printf(
				"tm          Test Bus Master: access UNIBUS address range without PDP-11 CPU arbitration\n");
		printf("ts          Test shared DDR memory = UNIBUS memory as BUS SLAVE\n");
		printf("ti          Test Interrupts (needs physical PDP-11 CPU)\n");
		printf("d           Emulate devices, with PDP-11 CPU arbitration\n");
		printf("dc          Emulate devices and CPU, PDP-11 must be disabled.\n");
		// printf("de          Device Exerciser: work with devices on the UNIBUS without PDP-11 CPU arbitration\n");
		printf(
				"m           Full memory slave emulation with DMA bus master functions by PDP-11 CPU.\n");
		printf("i           Info, help\n");
		printf("q           Quit\n");
		s_choice = getchoice();

		n_fields = sscanf(s_choice, "%s %d", opcode, &numarg);
		if (n_fields > 0) {
			if (!strcasecmp(opcode, "q")) {
				ready = true;
				// } else if (!strcasecmp(opcode, "a")) {
				//	unibus->arbitrator_client = !!numarg;
			} else if (!strcasecmp(opcode, "tg")) {
				menu_gpio();
			} else if (!strcasecmp(opcode, "tp")) {
				menu_panel();
				//} else if (!strcasecmp(opcode, "tx")) {
				//	menu_mailbox();
			} else if (!strcasecmp(opcode, "tl")) {
				menu_buslatches();
			} else if (!strcasecmp(opcode, "us")) {
				menu_unibus_signals();
			} else if (!strcasecmp(opcode, "tm")) {
				menu_masterslave(/*with_CPU*/false);
			} else if (!strcasecmp(opcode, "ts")) {
				menu_ddrmem_slave_only();
			} else if (!strcasecmp(opcode, "ti")) {
				menu_interrupts();
			} else if (!strcasecmp(opcode, "d")) {
				menu_devices(false);
			} else if (!strcasecmp(opcode, "dc")) {
				menu_devices(true);
			} else if (!strcasecmp(opcode, "de")) {
				menu_device_exercisers();
			} else if (!strcasecmp(opcode, "m")) {
				menu_masterslave(/*with_CPU*/true);
			} else if (!strcasecmp(opcode, "i")) {
				menu_info();
			}
		}
	} while (!ready);
}

