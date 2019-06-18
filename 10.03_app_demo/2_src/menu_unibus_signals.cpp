/* menu_unibus_signals.cpp: user sub menu "unibussignals"

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

void application_c::menu_unibus_signals(void) {
	mcout_t mcout; // Multi Column OUTput
	unsigned i;
	unibus_signal_info_c usi;
	bool show_help = true; // show cmds on first screen, then only on error or request
	bool show_all = true; // query and show state of all signals
	bool ready;
	char *s_choice;
	char s_opcode[256], s_param[256];
	int n_fields;

	// These test need active bus drivers
	hardware_startup(pru_c::PRUCODE_TEST);
	buslatches_output_enable(true);

	ready = false;
	while (!ready) {
		if (show_all) {
			show_all = false ; // only once
			// display all known signals
			mcout_init(&mcout, unibus_signals->signals.size());
			// put all panel controls into array view
			for (i = 0; i < unibus_signals->signals.size(); i++) {
				usi = unibus_signals->signals[i];
				mcout_printf(&mcout, "%2d) %-*s = %*o", i, unibus_signals->max_name_len(),
						usi.name.c_str(), (usi.bitwidth + 2) / 3,
						unibus_signals->get_val(usi.id));
			}
			mcout_flush(&mcout, stdout, opt_linewidth, "  ||  ", /*first_col_then_row*/0);
		}

		if (show_help) {
			show_help = false; // only once
			printf("\n");
			printf("*** Stimulate UNIBUS signals manually.\n");
			printf("*** Run only on empty UNIBUS !\n");
			printf("<id>        Read signal\n");
			printf("<id> <val>  Write signal.\n");
			printf("o <0|1>     Enable/disable DS8641 UNIBUS output drivers.\n");
			printf("              Drivers are currently %s.\n",
					buslatches.cur_output_enable ? "ENABLED" : "NOT ENABLED");
			printf("a           Show all\n");
			printf("r           Reset outputs to \"neutral\" values\n");
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
			buslatches_pru_reset(); // low level clear
			show_all = true;
		} else if (!strcasecmp(s_choice, "a")) {
			show_all = true;
		} else if (n_fields == 2 && !strcasecmp(s_opcode, "o")) {
			// parse o 0|1
			unsigned param = strtol(s_param, NULL, 10);
			buslatches_output_enable(param);
			printf("UNIBUS drivers now %s.\n",
					buslatches.cur_output_enable ? "enabled" : "disabled");
		} else if (n_fields == 1 && strchr("0123456789", s_opcode[0])) {
			// parse <id>
			i = strtol(s_opcode, NULL, 10);
			if (i >= unibus_signals->size()) {
				printf("Illegal signal number %d.\n", i);
				show_help = true;
				continue;
			}
			usi = unibus_signals->signals[i];
			printf("%s = %*o\n", usi.name.c_str(), usi.bitwidth,
					unibus_signals->get_val(usi.id));
		} else if (n_fields == 2 && strchr("0123456789", s_opcode[0])) {
			// parse <id> <opcode> |<val>
			i = strtol(s_opcode, NULL, 10);
			if (i >= unibus_signals->size()) {
				printf("Illegal signal number %d.\n", i);
				show_help = true;
				continue;
			}
			usi = unibus_signals->signals[i];
			if (strchr("01234567", s_param[0])) {
				unsigned val = strtol(s_param, NULL, 8);
				unibus_signals->set_val(usi.id, val);
				printf("%s = %*o\n", usi.name.c_str(), usi.bitwidth,
						unibus_signals->get_val(usi.id));
			} else {
				printf("Syntax error: <id> <val>.\n");
				show_help = true;
			}
		} else {
			printf("Unknown command \"%s\"!\n", s_choice);
			show_help = true;
		} // if (s_choice...)
	} // while (!ready)

	buslatches_output_enable(false);
	hardware_shutdown();
}

