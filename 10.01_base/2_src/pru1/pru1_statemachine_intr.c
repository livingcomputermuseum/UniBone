/* pru1_statemachine_intr.c: state machine to transfer an interrupt vector

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

   State machines to transfer an interrupt vector.
   All references "PDP11BUS handbook 1979"
   Precondition: BBSY already asserted (arbitration got)

 */
#define _PRU1_STATEMACHINE_INTR_C_

#include <stdlib.h>
#include <stdint.h>

//#include "devices.h"
#include "mailbox.h"
#include "pru1_buslatches.h"
#include "pru1_utils.h"

//#include "pru1_statemachine_arbitration.h"
#include "pru1_statemachine_intr.h"

// forwards
static statemachine_state_func sm_intr_state_1(void);
static statemachine_state_func sm_intr_state_2(void);

// BBSY already set, SACK held asserted
statemachine_state_func sm_intr_start() {
	//  BBSY already asserted. : latch[1], bit 6
	// buslatches_setbits(1, BIT(6), BIT(6));
	return (statemachine_state_func)&sm_intr_state_1;
	// next call to sm_intr.state() starts state machine
}

// place vector onto data, then set INTR
static statemachine_state_func sm_intr_state_1() {
	uint16_t vector = mailbox.intr.vector;

	buslatches_setbyte(5, vector & 0xff); // DATA[0..7] = latch[5]
	buslatches_setbyte(6, vector >> 8); // DATA[8..15] = latch[6]

	// set INTR
	buslatches_setbits(7, BIT(0), BIT(0)); // INTR = latch 7, bit 0

	// deassert SACK after vector set
	// deassert SACK before deassert BBSY
	// parallel to last word data transfer
	buslatches_setbits(1, BIT(5), 0); // SACK = latch[1], bit 5

	// wait for processor to accept vector (no timeout?)
	return (statemachine_state_func)&sm_intr_state_2;
}

// wait for SSYN
static statemachine_state_func sm_intr_state_2() {
	if (!(buslatches_getbyte(4) & BIT(5)))
		return (statemachine_state_func)&sm_intr_state_2; // wait
	// received SSYN

	// remove vector, then remove INTR
	buslatches_setbyte(5, 0); // DATA[0..7] = latch[5]
	buslatches_setbyte(6, 0); // DATA[8..15] = latch[6]
	buslatches_setbits(7, BIT(0), 0); // INTR = latch 7, bit 0
	// deassert BBSY
	buslatches_setbits(1, BIT(6), 0);
    // SACK already removed

	return NULL; // ready
	// master still drives SSYN
}

