/* pru1_statemachine_powercycle.c: state machine to generate an ACLO/DCLO pseudo power cycle

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


 Statemachine for execution of an ACLO/DCLO pseudo power cycle.
 // ACLO: latch[7], bit 4
 // DCLO: latch[7], bit 5
 buslatches_setbits(7, BIT(4), BIT(4)); // ACLO asserted
 __delay_cycles(MILLISECS(250)) ; // "power supply shuts down"
 buslatches_setbits(7, BIT(5), BIT(5)); // DCLO asserted
 __delay_cycles(MILLISECS(250)) ; // "power is OFF now"
 buslatches_setbits(7, BIT(4), 0); // ACLO deasserted
 __delay_cycles(MILLISECS(250)) ; // "power supply stabilizing"
 buslatches_setbits(7, BIT(5), 0); // DCLO deasserted
 // CPU has to generate INIT and BBSY

 ! Uses single global timeout, don't run in parallel with other statemachines using timeout  !
 */

#define _PRU1_STATEMACHINE_POWERCYCLE_C_

#include <stdlib.h>
#include <stdint.h>

#include "mailbox.h"
#include "pru1_utils.h"
#include "pru1_timeouts.h"

#include "pru1_buslatches.h"
#include "pru1_statemachine_init.h"

#include "pru1_statemachine_powercycle.h"

// forwards ;                     /
static statemachine_state_func sm_powercycle_state_1(void);
static statemachine_state_func sm_powercycle_state_2(void);
static statemachine_state_func sm_powercycle_state_3(void);
static statemachine_state_func sm_powercycle_state_4(void);

// setup with
statemachine_state_func sm_powercycle_start() {
	return (statemachine_state_func)&sm_powercycle_state_1;
	// next call to sm_slave.state() starts state machine
}


// "Line power shutdown": assert ACLO, then wait
static statemachine_state_func sm_powercycle_state_1() {
	buslatches_setbits(7, BIT(4), BIT(4)); // ACLO asserted
	timeout_set(TIMEOUT_POWERCYCLE, MILLISECS(POWERCYCLE_DELAY_MS))	; // wait for DC power shutdown
	// DEBUG_OUT(0x01) ;
	do_event_initializationsignals() ;
	// DEBUG_OUT(0x02) ;
	return (statemachine_state_func)&sm_powercycle_state_2;
}

// "Power supply switched off": assert DCLO, then wait
static statemachine_state_func sm_powercycle_state_2() {
	if (!timeout_reached(TIMEOUT_POWERCYCLE))
		return (statemachine_state_func)&sm_powercycle_state_2; // wait
	buslatches_setbits(7, BIT(5), BIT(5)); // DCLO asserted
	timeout_set(TIMEOUT_POWERCYCLE, MILLISECS(POWERCYCLE_DELAY_MS))
	; // system powered off
	// DEBUG_OUT(0x03) ;
	do_event_initializationsignals() ;
	// DEBUG_OUT(0x04) ;
	return (statemachine_state_func)&sm_powercycle_state_3;
}

// "Line power back again": deassert ACLO, then wait
static statemachine_state_func sm_powercycle_state_3() {
	if (!timeout_reached(TIMEOUT_POWERCYCLE))
		return (statemachine_state_func)&sm_powercycle_state_3; // wait
	buslatches_setbits(7, BIT(4), 0); // ACLO deasserted
	timeout_set(TIMEOUT_POWERCYCLE, MILLISECS(POWERCYCLE_DELAY_MS))
	; // "power supply stabilizing"
	do_event_initializationsignals() ;
	return (statemachine_state_func)&sm_powercycle_state_4;
}

// "Logic power stabilized": deassert DCLO, ready
static statemachine_state_func sm_powercycle_state_4() {
	if (!timeout_reached(TIMEOUT_POWERCYCLE))
		return (statemachine_state_func)&sm_powercycle_state_4;
   	buslatches_setbits(7, BIT(5), 0); // DCLO deasserted
	do_event_initializationsignals() ;
	timeout_cleanup(TIMEOUT_POWERCYCLE) ;
	return NULL;
}

