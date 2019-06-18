/* menu_buslatches.cpp: user sub menu "buslatches"

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
#include <assert.h>

#include "utils.hpp"
#include "inputline.h"
#include "mcout.h"
#include "application.hpp" // own
#include "pru.hpp"

#include "gpios.hpp"

/**********************************************
 * test a single or multiple 8bit (or less) register latches
 * connected to UNIBUS
 * */

/* Test UNIBUS wires in order of UniProbe LEDS
 * slow moving zero
 */

// output value of each register
static uint8_t buslatches_outreg_val[8];

// write single signal wire
static void buslatches_set_pin_val(buslatches_wire_info_t *si, unsigned val) {
	// set single bit
	assert(!si->is_input); // only output signals
	if (val)
		buslatches_outreg_val[si->reg_sel] |= (1 << si->bit_nr);
	else
		buslatches_outreg_val[si->reg_sel] &= ~(1 << si->bit_nr);
	buslatches_setval(si->reg_sel, 0xff, buslatches_outreg_val[si->reg_sel]);
}

static bool buslatches_get_pin_val(buslatches_wire_info_t *si) {
	// read register
	assert(si->is_input); // only input signals
	unsigned val = buslatches_getval(si->reg_sel);
	// mask out register bit
	if (val & (1 << si->bit_nr))
		return 1;
	else
		return 0;
}

// highspeed toggle a register bit for a certain time. 
// result: false = stop with ^C
static bool buslatches_oscillate_pin(buslatches_wire_info_t *si, unsigned timeout_ms) {
	timeout_c timeout;
	unsigned count;

	timeout.start(1000000L * timeout_ms);
	SIGINTcatchnext();

	// high speed loop
	count = 0;
	while (!timeout.reached() && !SIGINTreceived) {
		unsigned val = ((count % 4) == 0); // toggle 0/0/0/1
		buslatches_set_pin_val(si, si->is_inverted ? !val : val);
		count++;
	}
	return !SIGINTreceived;

}

static void buslatches_test_uniprobe(void) {
	// signal names see gpio.cpp, "buslatches_wire_info"
	// order of signals like on UniProbe LEDs
	const char *signalnames[] = { "ACLO", "DCLO", "INIT",
	// IOPAGE
			"A17", "A16", "A15", "A14", "A13", "A12", "A11", "A10", "A09", "A08",  //
			"A07", "A06", "A05", "A04", "A03", "A02", "A01", "A00", //
			"D15", "D14", "D13", "D12", "D11", "D10", "D09", "D08",  //
			"D07", "D06", "D05", "D04", "D03", "D02", "D01", "D00", //
			"C0", "C1", "MSYN", "SSYN", "PA", "PB", "INTR", //
			"BR4", "BR5", "BR6", "BR7", "NPR", //
			"BG4_OUT", "BG5_OUT", "BG6_OUT", "BG7_OUT", "NPG_OUT", //
			"SACK", "BBSY", NULL };

	unsigned i;
	bool abort;
	unsigned timeout_ms = 500;

	printf(
			"Put slow \"moving half\" onto UNIBUS signals, in order of UniProbe diagnostics LEDs\n");
	printf(
			"Only a single LED is toggled high speed at a time resulting in \"half\" intensity.\n");
	printf("Stop with ^C\n");

	// clear all signals
	for (i = 0; i < 8; i++) {
		buslatches_outreg_val[i] = 0; //
		buslatches_setval(i, 0xff, 0);
	}

	// ALL ON, bitwise
	printf("Set all UNIBUS signals active => all LEDs ON.\n");
	for (i = 0; signalnames[i]; i++) {
		buslatches_wire_info_t *si = buslatches_get_wire_info(signalnames[i], /*is_input*/
		false);
		assert(si);
		buslatches_set_pin_val(si, si->is_inverted ? 0 : 1);
	}

	printf("Oscillate UNIBUS signals one by one => single LEDs with half intensity.\n");
	abort = false;
	for (i = 0; !abort && signalnames[i]; i++) {
		buslatches_wire_info_t *si = buslatches_get_wire_info(signalnames[i], /*is_input*/
		false);
		assert(si);
		abort = !buslatches_oscillate_pin(si, timeout_ms);
		buslatches_set_pin_val(si, si->is_inverted ? 0 : 1); // ON again
	}
	if (abort)
		printf("Test aborted.\n");
	else
		printf("Test complete.\n");

	// clear all signals
	for (i = 0; i < 8; i++) {
		buslatches_outreg_val[i] = 0; //
		buslatches_setval(i, 0xff, 0);
	}

}

static void buslatches_m9302_sack_test() {
#define GRANT_LINE_COUNT	5
	unsigned count;
	unsigned i;
	bool error;
	buslatches_wire_info_t *grant_line[GRANT_LINE_COUNT];
	buslatches_wire_info_t *sack_line;
	printf("Test SACK turnaround of M9302 terminator.\n");

	printf("GRANT lines BG4,BG5,BG6,BG7,NPG are stimulated randomly,\n");
	printf("if at least one is active, SACK must be asserted by M9302 terminator.\n");
	printf("Starting now, stop with ^C ...\n");
	assert(grant_line[0] = buslatches_get_wire_info("BG4_OUT",/*is_input*/false));
	assert(grant_line[1] = buslatches_get_wire_info("BG5_OUT",/*is_input*/false));
	assert(grant_line[2] = buslatches_get_wire_info("BG6_OUT",/*is_input*/false));
	assert(grant_line[3] = buslatches_get_wire_info("BG7_OUT",/*is_input*/false));
	assert(grant_line[4] = buslatches_get_wire_info("NPG_OUT",/*is_input*/false));
	assert(sack_line = buslatches_get_wire_info("SACK",/*is_input*/true));
	// BG* have rebersed polarity
	assert(grant_line[0]->is_inverted);
	assert(grant_line[1]->is_inverted);
	assert(grant_line[2]->is_inverted);
	assert(grant_line[3]->is_inverted);
	assert(grant_line[4]->is_inverted);

	SIGINTcatchnext();

	// INIT: all inactive
	for (i = 0; i < GRANT_LINE_COUNT; i++)
		buslatches_set_pin_val(grant_line[i], !0);
	// high speed loop
	count = 0;
	i = 0;
	error = false;
	while (!error && !SIGINTreceived) {

		// moving one, with lots of extra "all IDLE" phase
		// SACK LED must be on at 50%.
		i = count % (2 * GRANT_LINE_COUNT);
		// set one line
		if (i < GRANT_LINE_COUNT) {
			buslatches_set_pin_val(grant_line[i], !1);
			// SACK must be asserted
			if (!buslatches_get_pin_val(sack_line)) {
				printf("ERROR: GRANT line %s active, but SACK deasserted!\n",
						grant_line[i]->unibus_name);
				printf("Check:\n");
				printf("- \"SACK turn around\" enabled on terminator?\n");
				error = true;
			}
			// clear signal
			buslatches_set_pin_val(grant_line[i], !0);
		} else {
			// all inactive: SACK must be deasserted
			if (buslatches_get_pin_val(sack_line)) {
				printf("ERROR: All 5 GRANT lines inactive, but SACK asserted!\n");
				printf("Check:\n");
				printf("- GRANT chain between UniProbe and M9302 terminator closed?\n");
				error = true;
			}
		}
		count++;
	}
	if (error)
		printf("Test aborted after %d operations.\n", count);
	else
		printf("Test stopped by user after %d operations.\n", count);
	printf("\n");
}

void application_c::menu_buslatches(void) {
	bool show_help = true; // show cmds on first screen, then only on error or request
	bool show_inputs = true; // query and show state of all latches
	bool ready;
	char *s_choice;
	char s_opcode[256], s_param[256];
	int n_fields;

	// These test need active bus drivers
	hardware_startup(pru_c::PRUCODE_TEST);
	buslatches_output_enable(true);

#define PRINTBUSLATCH(i)	\
				printf("buslatch[%d] = 0x%02x (%d bits)\n", i,\
						buslatches_getval(i) & buslatches.bidi_bitmask[i], \
						buslatches.bidi_bitwidth[i])
	ready = false;
	while (!ready) {
		if (show_inputs) {
			unsigned i;
			for (i = 0; i < 8; i++) {
				printf("%d) ", i);
				PRINTBUSLATCH(i);
			}
		}
		if (show_help) {
			show_help = false; // only once
			printf("\n");
			printf("*** Test 8-bit register bus-latches and corresponding UNIBUS lines.\n");
			printf("*** Run only on empty UNIBUS !\n");
			printf("<id>        Read inputs connected to latch\n");
			printf("<id> <val>  Set latch outputs to hex value.\n");
			printf(
					"              Value appears on PRU inputs after signal round trip delay.\n");
			printf("<id> u      Count latch value upward\n");
			printf("<id> o      Rotate a \"moving one\"\n");
			printf("<id> z      Rotate a \"moving zero\"\n");
			printf("<id> t      Toggle 0x00,0xff\n");
			printf("<id> r      Random values\n");
			printf("* o|z|t|r   As above, test on all registers\n");
			printf("* 0|1       All OFF, all ON\n");
			printf("up          Slow \"moving zero\" to test UniProbe LEDs\n");
			printf("gst         M9302 GRANT/SACK turnaround test\n");
			printf("o <0|1>     Enable/disable DS8641 UNIBUS output drivers.\n");
			printf("              Drivers are currently %s.\n",
					buslatches.cur_output_enable ? "ENABLED" : "NOT ENABLED");
			printf("a           Show all\n");
			printf("r           Reset outputs to \"neutral\" values\n");
			printf(
					"t           High speed timing test by PRU. PRU1.12 is error signal. Stop with ^C\n");
			printf("q           Quit\n");
		}
		s_choice = getchoice();
		printf("\n");
		n_fields = sscanf(s_choice, "%s %s", s_opcode, s_param);
		if (strlen(s_choice) == 0) {
			// should not happen, but occurs under Eclipse?
		} else if (!strcasecmp(s_choice, "q")) {
			ready = true;
		} else if (!strcasecmp(s_choice, "r")) {
			buslatches_pru_reset();
		} else if (!strcasecmp(s_choice, "a")) {
			show_inputs = true;
		} else if (n_fields == 2 && !strcasecmp(s_opcode, "o")) {
			// parse o 0|1
			unsigned param = strtol(s_param, NULL, 10);
			buslatches_output_enable(param);
			printf("UNIBUS drivers now %s.\n",
					buslatches.cur_output_enable ? "enabled" : "disabled");
		} else if (n_fields == 1 && strchr("01234567", s_opcode[0])) {
			unsigned reg_sel = strtol(s_opcode, NULL, 16);
			PRINTBUSLATCH(reg_sel);
		} else if (n_fields == 2 && strchr("01234567", s_opcode[0])) {
			// parse <id> <opcode> |<val>
			unsigned reg_sel = strtol(s_opcode, NULL, 16);
			if (reg_sel > 7) {
				printf("Error: reg_sel %d not in [0..7]\n", reg_sel);
				show_help = true;
				continue;
			}
			if (strchr("0123456789abcdefABCDEF", s_param[0])) {
				unsigned val = strtol(s_param, NULL, 16);
				buslatches_setval(reg_sel, 0xff, val);
				PRINTBUSLATCH(reg_sel);
			} else if (!strcasecmp(s_param, "u")) {
				buslatches_test_simple_pattern(1, reg_sel);
			} else if (!strcasecmp(s_param, "o")) {
				buslatches_test_simple_pattern(2, reg_sel);
			} else if (!strcasecmp(s_param, "z")) {
				buslatches_test_simple_pattern(3, reg_sel);
			} else if (!strcasecmp(s_param, "t")) {
				buslatches_test_simple_pattern(4, reg_sel);
			} else if (!strcasecmp(s_param, "r")) {
				buslatches_test_simple_pattern(5, reg_sel);
			} else {
				printf("Syntax error: <id> <pattern> |<val>.\n");
				show_help = true;
			}
		} else if (n_fields == 2 && strchr("*", s_opcode[0])) {
			if (!strcasecmp(s_param, "o")) {
				buslatches_test_simple_pattern_multi(2);
			} else if (!strcasecmp(s_param, "z")) {
				buslatches_test_simple_pattern_multi(3);
			} else if (!strcasecmp(s_param, "t")) {
				buslatches_test_simple_pattern_multi(4);
			} else if (!strcasecmp(s_param, "r")) {
				buslatches_test_simple_pattern_multi(5);
			} else if (!strcasecmp(s_param, "0")) {
				for (unsigned reg_sel = 0; reg_sel < 8; reg_sel++)
					buslatches_setval(reg_sel, 0xff, 0);
				show_inputs = true;
			} else if (!strcasecmp(s_param, "1")) {
				for (unsigned reg_sel = 0; reg_sel < 8; reg_sel++)
					buslatches_setval(reg_sel, 0xff, 0xff);
				show_inputs = true;
			} else {
				printf("Syntax error: *  <pattern>.\n");
				show_help = true;
			}
		} else if (!strcasecmp(s_opcode, "up")) {
			buslatches_test_uniprobe();
		} else if (!strcasecmp(s_opcode, "gst")) {
			buslatches_m9302_sack_test();
		} else if (n_fields == 1 && !strcasecmp(s_opcode, "t")) {
			buslatches_test_timing(0x55, 0xaa, 0x00, 0xff);
		} else {
			printf("Unknown command \"%s\"!\n", s_choice);
			show_help = true;
		} // if (s_choice...)
	} // while (!ready)

	buslatches_output_enable(false);
	hardware_shutdown();
}

