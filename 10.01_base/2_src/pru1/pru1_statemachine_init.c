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


   12-nov-2018  JH      entered beta phase

   Statemachine for a pulse on UNIBUS INIT
   ! Uses single global timeout, don't run in parallel with other statemachines using timeout  !
 */

#define _PRU1_STATEMACHINE_INIT_C_

#include <stdint.h>

#include "mailbox.h"
#include "pru1_utils.h"

#include "pru1_buslatches.h"
#include "pru1_statemachine_init.h"


/***  detection of changes in INIT,DCLO,ACLO ***/

// detect signal change of INIT,DCLO,ACLO and sent event
// history initialized (among others) by powercycle
// Assume this events come so slow, no one gets raised until
// prev event processed.
void	do_event_initializationsignals() {
		uint8_t	tmp = buslatches_get(7) & 0x38 ;
		if (tmp != mailbox.events.initialization_signals_cur) {
			// save old state, so ARM can detect what changed
			mailbox.events.initialization_signals_prev = mailbox.events.initialization_signals_cur ;
			mailbox.events.initialization_signals_cur = tmp ;
			mailbox.events.eventmask |= EVENT_INITIALIZATIONSIGNALS ;
			PRU2ARM_INTERRUPT ;
		}
	}
// No event queue: INIT event may overide register access ... thats OK:
// INIT reset all register states




statemachine_init_t sm_init;

// forwards
uint8_t sm_init_state_idle(void);
static uint8_t sm_init_state_1(void);

// setup
void sm_init_start() {
	TIMEOUT_SET(MILLISECS(INITPULSE_DELAY_MS))
	;
	// INIT: latch[7], bit 3
	buslatches_setbits(7, BIT(3), BIT(3)); // assert INIT
	mailbox.events.initialization_signals_prev &= ~INITIALIZATIONSIGNAL_INIT ; // force INIT event
	do_event_initializationsignals() ;
	sm_init.state = &sm_init_state_1;
}

uint8_t sm_init_state_idle() {
	return 1; // ready
}

static uint8_t sm_init_state_1() {
	if (!TIMEOUT_REACHED)
		return 0;
	buslatches_setbits(7, BIT(3), 0); // deassert INIT
	do_event_initializationsignals() ;
	sm_init.state = &sm_init_state_idle;
	return 1;
}
