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


 12-nov-2018  JH      entered beta phase

 Statemachine for execution of the Priority Arbitration protocol
 NPR arbitration and BR interrupt arbitration

 PRU handles all 5 requests in parallel:
 4x INTR BR4-BR7
 1x DMA NPR.
 Several ARM device may raise the same BR|NPR level, ARM must serialize this to PRU.

 Flow:
 1. ARM sets a REQUEST by
 filling the RQUEST struct and perhaps DMA data
 doing AMR2PRO_PRIORITY_ARBITRATION_REQUEST,
 2. PRU sets BR4567|NPR lines according to open requests
 3. PRU monitors IN GRANT lines BG4567,NPG.
 IN state of idle requests is forwarded to BG|NPG OUT liens,
 to be processed by other UNIBUS cards.
 BG*|NPG IN state line of active request cleares BR*|NPR line,
 sets SACK, and starts INTR or DMA state machine.
 4. INTR or DMA sent a signal on compelte to PRU.
 PRU may then start next request on same (completed) BR*|NPR level.

 All references "PDP11BUS handbook 1979"
 - At any time, CPU receives NPR it asserts NPG
 - between CPU instructions:
 if PRI < n and BRn is received, assert BGn
 else if PRI < 7 and BR7 is reived, assert BG7
 else if PRI < 6 and BR6 is reived, assert BG6
 else if PRI < 5 and BR5 is reived, assert BG5
 else if PRI < 4 and BR4 is reived, assert BG4


 If PRU detectes a BGINn which it not requested, it passes it to BGOUTn
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
 
 
 Several arbitration "workers" which set request, monitor or generate GRANT signals
 and allocate SACK.
 Which worker to use depends on wether a physical PDP-11 CPU is Arbitrator,
 the Arbitrator is implmented here (CPU emulation),
 or DMA should be possible always
 (even if some other CPU monitr is holding SACK (11/34).
 */

#define _PRU1_STATEMACHINE_ARBITRATION_C_

#include <stdint.h>

#include "pru1_utils.h"

#include "mailbox.h"

#include "pru1_buslatches.h"
#include "pru1_statemachine_arbitration.h"   

statemachine_arbitration_t sm_arb;

/********** NPR/NPG/SACK arbitrations **************/

// to be called on INIT signal: abort the abritration rpcoess
void sm_arb_reset() {
	// cleanup: clear all REQUESTS and SACK
	buslatches_setbits(1, PRIORITY_ARBITRATION_BIT_MASK | BIT(5), 0);
	sm_arb.request_mask = 0;
	sm_arb.bbsy_wait_grant_mask = 0;
}

/* sm_arb_workers_*()
 If return !=0: we have SACK on the GRANt lines return in a bit mask
 see PRIORITY_ARBITRATION_BIT_*
 */

/* worker_none():
 * No arbitration protocol. Make DMA possible in every bus configuration:
 * Ignores active SACK and/or BBSY from other bus masters.
 * For diagnostics on hung CPU, active device or console processor holding SACK.
 */
uint8_t sm_arb_worker_none() {
	// Unconditionally forward GRANT IN to GRANT OUT
	uint8_t grant_mask = buslatches_getbyte(0) & PRIORITY_ARBITRATION_BIT_MASK; // read GRANT IN
	buslatches_setbits(0, PRIORITY_ARBITRATION_BIT_MASK, ~grant_mask) ;

	// ignore BR* INTR requests, only ack DMA.
	if (sm_arb.request_mask & PRIORITY_ARBITRATION_BIT_NP) {
		sm_arb.request_mask &= ~PRIORITY_ARBITRATION_BIT_NP;
		return PRIORITY_ARBITRATION_BIT_NP;
	} else
		return 0;
}

/* worker_client: 
 Issue request to extern Arbitrator (PDP-11 CPU).
 Watch for GRANTs on the bus signal lines, then raise SACK.
 Wait for current bus master to release bus => Wait for BBSY clear. 
 Then return GRANTed request.
 "Wait for BBSY clear" may not be part of the arbitration protocol.
 But it guarantees caller may now issue an DMA or INTR.
 */
uint8_t sm_arb_worker_client() {
	uint8_t grant_mask;

	// Always update UNIBUS BR/NPR lines, are ORed with requests from other devices.
	buslatches_setbits(1, PRIORITY_ARBITRATION_BIT_MASK, sm_arb.request_mask)
	;
	// read GRANT IN lines from CPU (Arbitrator). Only one at a time may be active
	// Arbitrator asserts SACK is inactive
	// latch[0]: BG signals are inverted, "get" is non-inverting:  bit = active signal. 
	// "set" is inverting!
	grant_mask = buslatches_getbyte(0) & PRIORITY_ARBITRATION_BIT_MASK; // read GRANT IN
	// forward un-requested GRANT IN to GRANT OUT for other cards on neighbor slots
	buslatches_setbits(0, PRIORITY_ARBITRATION_BIT_MASK & ~sm_arb.request_mask, ~grant_mask)
	;

	if (sm_arb.bbsy_wait_grant_mask == 0) {
		// State 1: Wait For GRANT: 
		// process the requested grant for an open requests.
		grant_mask &= sm_arb.request_mask;
		if (grant_mask) {
			// one of our requests was granted: 
			// set SACK
			// AND simultaneously Clear granted requests BR*/NPR
			// BIT(5): SACK mask and level
			buslatches_setbits(1, (PRIORITY_ARBITRATION_BIT_MASK & sm_arb.request_mask) | BIT(5), 
			~grant_mask | BIT(5))
			;
			/*
			buslatches_setbits(1, BIT(5), BIT(5));
			// Arbitrator now clears GRANT IN

			// clear granted requests BR* / NPR on UNIBUS
			// "~": disable BR for set BG
			buslatches_setbits(1, PRIORITY_ARBITRATION_BIT_MASK & sm_arb.request_mask, ~grant_mask)
			;
		*/


			// clear granted requests internally
			sm_arb.request_mask &= ~grant_mask;
			// Arbitrator should remove GRANT now. Data section on Bus still BBSY
			sm_arb.bbsy_wait_grant_mask = grant_mask;	// next is State 2: wait for BBSY clear
		}
		return 0; // no GRANT for us, or wait for BBSY
	} else {
		// wait for BBSY to clear
		if (buslatches_getbyte(1) & BIT(6))
			return 0; // BBSY still set
		grant_mask = sm_arb.bbsy_wait_grant_mask;
		sm_arb.bbsy_wait_grant_mask = 0; // Next State is 1

		return grant_mask; // signal what request we got granted.
	}
	// UNIBUS DATA section is indepedent: MSYN, SSYN, BBSY may still be active.
	// -> DMA and INTR statemachine must wait for BBSY.
}

/*  "worker_master"
 Act as Arbitrator.
 Grant highest of requests, if SACK deasserted.
 Execute UNIBUS priority algorithm:
 - Grant DMA request, if present
 - GRANT BR* in descending priority, when CPU execution level allows .
 */
uint8_t sm_arb_worker_master() {
	return 0;
}

