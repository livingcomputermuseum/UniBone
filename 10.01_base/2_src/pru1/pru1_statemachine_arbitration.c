/* pru1_statemachine_arbitration.c: state machine for INTR/DMA arbitration

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

  Statemachine for execution of the Priority Arbitration protocol
  NPR arbitration and BR interrupt arbitration

  UniBone is neither interrupt fielding processor nor abitrator.
  It is a plain bus slave here.

  This state machine can handle ONLY ONE request at a time.
  ARM code threads must wait until a request is completed by PRU.
  Problem: Multiple devices may trigger DMA and Interrupts independently!
  Solution:  these events must be serialized by an "priority arbitration scheduler" ,
  May be implemented by a event queue for each priority level,
 	containing refereneces to all devices requesting arbitration.

  Or Todo: handle all 5 request/grants in parallel.

  1. Start a request: set bit in _start()
  2. PRU executes statemachine
  3. on complete BBSY is acquires, UniBone is bus master


  All references "PDP11BUS handbook 1979"
  - At any time, CPU receives NPR it asserts NPG
  - between CPU instructions:
 if PRI < n and BRn is received, assert BGn
 else if PRI < 7 and BR7 is reived, assert BG7
 else if PRI < 6 and BR6 is reived, assert BG6
 else if PRI < 5 and BR5 is reived, assert BG5
 else if PRI < 4 and BR4 is reived, assert BG4


 if PRU detectes a BGINn which it not requested, it passes it to BGOUTn
 "passing the grant"
 if PRU detects BGIN which was requests, it "blocks the GRANT" )sets SACK and
 transmit the INT (BG*) or becomes
 "no interrupt request while NPR transfer active!"
 Meaning: bus masterchip acquired by NPG may not be used to transmit an
 INTR vector.

 Device may take bus if BBSY==0 && SSYN==0 && NPG==0
 Device timing: assert NPR, wait for NPG, assert SACK, wait for NPG==0, set SACK=0 ,

 BBSY is set before SACK is released. SACK is relased imemdiatley after BBSY,
 enabling next arbitration in parallel to curretn data transfer
 "Only the device with helds SACk asserted can assert BBSY
 */

#define _PRU1_STATEMACHINE_ARBITRATION_C_

#include <stdlib.h>
#include <stdint.h>

#include "pru1_utils.h"

#include "mailbox.h"

#include "pru1_buslatches.h"
#include "pru1_statemachine_arbitration.h"

statemachine_arbitration_t sm_arb;

// forwards ;
static statemachine_state_func sm_arb_state_1(void);
static statemachine_state_func sm_arb_state_2(void);
static statemachine_state_func sm_arb_state_3(void);

/********** NPR/NPG/SACK arbitrations **************/
statemachine_state_func sm_arb_start(uint8_t priority_bit) {
	sm_arb.priority_bit = priority_bit; // single priority bit for this arbitration process
	return (statemachine_state_func)&sm_arb_state_1;
}

// idle. call _start()
// execute in parallel with slave!
// pass BGIN[4-7],NPGIN to next device , if DMA engine idle
statemachine_state_func sm_arb_state_idle() {
	uint8_t tmpval;
	tmpval = buslatches_getbyte(0);
	// forward all 5 GRANT IN inverted to GRANT OUT
	buslatches_setbits(0, ARBITRATION_PRIORITY_MASK, ~tmpval)
	;
	return (statemachine_state_func)&sm_arb_state_idle;
}

// wait for GRANT idle
// Assert REQUEST, wait for GRANT, assert SACK, wait for NPG==0, set SACK=0 ,
// execute in parallel with slave!
static statemachine_state_func sm_arb_state_1() {
	uint8_t tmpval;
	tmpval = buslatches_getbyte(0);
	// forward all lines, until idle
	buslatches_setbits(0, ARBITRATION_PRIORITY_MASK, ~tmpval) ;
		// wait for GRANT idle, other cycle in progress?
	if (tmpval & sm_arb.priority_bit)
		return (statemachine_state_func)&sm_arb_state_1; // wait
	// no need to wait for SACK: arbitrator responds only with a GRANT IN
	buslatches_setbits(1, sm_arb.priority_bit, sm_arb.priority_bit); // REQUEST = latch1
	return (statemachine_state_func)&sm_arb_state_2; // wait for GRANT IN active
}



// wait for BG*,NPG or INIT
// execute in parallel with slave!
static statemachine_state_func sm_arb_state_2() {
	uint8_t tmpval;

    tmpval = buslatches_getbyte(0);
	if (buslatches_getbyte(7) & BIT(3)) { // INIT stops transaction: latch[7], bit 3
		// cleanup: clear all 5 BR/NPR and SACK
		buslatches_setbits(1, ARBITRATION_PRIORITY_MASK| BIT(5), 0);

	    // forward all 5 GRANT IN inverted to GRANT OUT
    	buslatches_setbits(0, ARBITRATION_PRIORITY_MASK, ~tmpval) ;
	
		// Todo: signal INIT to ARM!
		return NULL ;
	}
	// forward all other BG lines
	// preceding arbitration must see BG removed by master on SACK

	if (tmpval & sm_arb.priority_bit) {
		// got GRANT IN. Clear GRANT OUT, don't pass to next device
		tmpval &= ~sm_arb.priority_bit ;
		buslatches_setbits(0, ARBITRATION_PRIORITY_MASK, ~tmpval); // forward all without our GRANT
		// set SACK
		buslatches_setbits(1, BIT(5), BIT(5));
		return (statemachine_state_func)&sm_arb_state_3;
	} else {
		buslatches_setbits(0, ARBITRATION_PRIORITY_MASK, ~tmpval); // forward all
		return (statemachine_state_func)&sm_arb_state_2 ; // wait 
	}
}

// GRANT received. wait for previous bus master to complete transaction,
// then become bus master
// Forwarding of other GRANTs not necessary ... arbitrator granted us.
static statemachine_state_func sm_arb_state_3() {
	if (buslatches_getbyte(7) & BIT(3)) { // INIT stops transaction: latch[7], bit 3
		// cleanup: clear all REQUESTS and SACk
		buslatches_setbits(1, ARBITRATION_PRIORITY_MASK| BIT(5), 0);
		// Todo: signal INIT to ARM!
		return NULL;
	}
	if (buslatches_getbyte(0) & sm_arb.priority_bit) // wait for GRANT IN to be deasserted
		return (statemachine_state_func)&sm_arb_state_3; // wait
	// wait until old bus master cleared BBSY
	if (buslatches_getbyte(1) & BIT(6))
		return (statemachine_state_func)&sm_arb_state_3; // wait
	// wait until SSYN deasserted by old slave
	if (buslatches_getbyte(4) & BIT(5))
		return (statemachine_state_func)&sm_arb_state_3; // wait
	// now become new bus master: Set BBSY, Clear REQUEST
	// BBSY= bit 6
	buslatches_setbits(1, sm_arb.priority_bit | BIT(6), BIT(6));
	// SACK is cleared later in "data transfer" statemachines (DMA or INTR)
	return NULL;  // bus mastership acquired
}

#ifdef USED

S1:
if SACK deasserted:

set all Reqest lines in latch 1, which have bits set in mailbox.arb_request
(requests all in parallel

		wait for any GRANT

		// always: pass un-requestedgrants
		read GRANT lines BG*IN, NPGIN
		mask with my requests
		write pattern to BG*OUT, NPGOUT

		S2:
		get all 5 GRANT signals
		get mask with highest asserted GRANT line ("active Grant") , which was requested in S1
		// always: pass un-requestedgrants to BG*OUT, NPGOUT
		if grants for us:
		set SACK
		wait for active GRANT line going LOW
		wait until BBSY==0 && SSYN==0 && active GRANT==0 free (long time!)
		set BBSY
		set SACK low
		NO: SHOULD BE "BEFORE LAST DATA TRAMSFER BY CURRENT MASTER"
		-> interaction with statemachine_master
		setting SACK low early start arbitration early.
		High priority interrupts while bus occpied by DMA (after ealry priority cycle)
		are ignoreed then.

		set bit in mailbox in .arb_grant

		INIT: clear all requests, set INIT flag in mailbox!

		freeing BBSY:
		on end of next DMA trasnfer,
		OR after INTR transmission

#endif
