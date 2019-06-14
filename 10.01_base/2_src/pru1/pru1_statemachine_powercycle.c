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

#include <stdint.h>


#include "mailbox.h"
#include "pru1_utils.h"

#include "pru1_buslatches.h"
#include "pru1_statemachine_init.h"

#include "pru1_statemachine_powercycle.h"

statemachine_powercycle_t sm_powercycle;

// forwards ;                     /
uint8_t sm_powercycle_state_idle(void);
static uint8_t sm_powercycle_state_1(void);
static uint8_t sm_powercycle_state_2(void);
static uint8_t sm_powercycle_state_3(void);
static uint8_t sm_powercycle_state_4(void);

// setup with
void sm_powercycle_start() {
	sm_powercycle.state = &sm_powercycle_state_1;
	// next call to sm_slave.state() starts state machine
}

uint8_t sm_powercycle_state_idle() {
	return 1; // ready
}

// "Line power shutdown": assert ACLO, then wait
static uint8_t sm_powercycle_state_1() {
	buslatches_setbits(7, BIT(4), BIT(4)); // ACLO asserted
	TIMEOUT_SET(MILLISECS(POWERCYCLE_DELAY_MS))
	; // wait for DC power shutdown
	sm_powercycle.state = &sm_powercycle_state_2;
	// DEBUG_OUT(0x01) ;
	do_event_initializationsignals() ;
	// DEBUG_OUT(0x02) ;
	return 0;
}

// "Power supply switched off": assert DCLO, then wait
static uint8_t sm_powercycle_state_2() {
	if (!TIMEOUT_REACHED)
		return 0;
	buslatches_setbits(7, BIT(5), BIT(5)); // DCLO asserted
	TIMEOUT_SET(MILLISECS(POWERCYCLE_DELAY_MS))
	; // system powered off
	sm_powercycle.state = &sm_powercycle_state_3;
	// DEBUG_OUT(0x03) ;
	do_event_initializationsignals() ;
	// DEBUG_OUT(0x04) ;
	return 0;
}

// "Line power back again": deassert ACLO, then wait
static uint8_t sm_powercycle_state_3() {
	if (!TIMEOUT_REACHED)
		return 0;
	buslatches_setbits(7, BIT(4), 0); // ACLO deasserted
	TIMEOUT_SET(MILLISECS(POWERCYCLE_DELAY_MS))
	; // "power supply stabilizing"
	sm_powercycle.state = &sm_powercycle_state_4;
	do_event_initializationsignals() ;
	return 0;
}

// "Logic power stabilized": deassert DCLO, ready
static uint8_t sm_powercycle_state_4() {
	if (!TIMEOUT_REACHED)
		return 0;
   	buslatches_setbits(7, BIT(5), 0); // DCLO deasserted
	sm_powercycle.state = &sm_powercycle_state_idle;
	do_event_initializationsignals() ;
	return 1;
}

