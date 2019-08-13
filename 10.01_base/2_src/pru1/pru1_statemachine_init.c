/* pru1_statemachine_init.c: state machine for pulse on INIT

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


 29-jun-2019	JH		rework: state returns ptr to next state func
 12-nov-2018  JH      entered beta phase

 Statemachine for a pulse on UNIBUS INIT
 ! Uses single global timeout, don't run in parallel with other statemachines using timeout  !
 */

#define _PRU1_STATEMACHINE_INIT_C_

#include <stdlib.h>
#include <stdint.h>

#include "mailbox.h"
#include "pru1_utils.h"
#include "pru1_timeouts.h"

#include "pru1_buslatches.h"
#include "pru1_statemachine_init.h"
#include "pru1_statemachine_arbitration.h"

/***  detection of changes in INIT,DCLO,ACLO ***/

// detect signal change of INIT,DCLO,ACLO and sent event
// history initialized (among others) by powercycle
// Assume this events come so slow, no one gets raised until
// prev event processed.
void do_event_initializationsignals() {
	uint8_t mb_cur = mailbox.events.initialization_signals_cur; // as saved
	uint8_t bus_cur = buslatches_getbyte(7) & 0x38; // now sampled
	
	if (bus_cur & INITIALIZATIONSIGNAL_INIT)
		sm_arb.request_mask = 0 ; // INIT clears all PRIORITY request signals
		// SACK cleared later on end of INTR/DMA transaction
		
	if (bus_cur != mb_cur) {
		// save old state, so ARM can detect what changed
		mailbox.events.initialization_signals_prev = mb_cur;
		mailbox.events.initialization_signals_cur = bus_cur;
		// trigger the correct event: power and/or INIT
		if ((mb_cur ^ bus_cur) & (INITIALIZATIONSIGNAL_DCLO | INITIALIZATIONSIGNAL_ACLO))
			// AC_LO or DC_LO changed
			mailbox.events.event_power = 1;
		if ((mb_cur ^ bus_cur) & INITIALIZATIONSIGNAL_INIT)
			// INIT changed
			mailbox.events.event_init = 1;
		PRU2ARM_INTERRUPT
		;
	}
}

// forwards
static statemachine_state_func sm_init_state_1(void);

// setup
statemachine_state_func sm_init_start() {
	timeout_set(TIMEOUT_INIT, MILLISECS(INITPULSE_DELAY_MS));
	// INIT: latch[7], bit 3
	buslatches_setbits(7, BIT(3), BIT(3)); // assert INIT
	mailbox.events.initialization_signals_prev &= ~INITIALIZATIONSIGNAL_INIT; // force INIT event
	return (statemachine_state_func) &sm_init_state_1;
}

static statemachine_state_func sm_init_state_1() {
	if (!timeout_reached(TIMEOUT_INIT))
		return (statemachine_state_func) &sm_init_state_1; // wait
	buslatches_setbits(7, BIT(3), 0); // deassert INIT
	timeout_cleanup(TIMEOUT_INIT);
	return NULL; // ready
}

// terminate INIT
// To be called from Powercycle?
void sm_init_reset() {
	buslatches_setbits(7, BIT(3), 0); // deassert INIT
	do_event_initializationsignals();
	timeout_cleanup(TIMEOUT_INIT);
}
