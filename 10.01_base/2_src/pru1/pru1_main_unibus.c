/* pru1_main_unibus.c: main loop with mailbox cmd interface. UNIBUS devices with opt. phys. PDP-11 CPU.

 Copyright (c) 2018-2019, Joerg Hoppe
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


 28-mar-2019  JH      split off from "all-function" main
 12-nov-2018  JH      entered beta phase

 Master and slave functionality for UNIBUS devices.
 Assumes a physical PDP-11 CPU is working as Arbitrator for
 NPR/NG/SACK and BR/BG/SACK.
 Needed if UniBone runs in a system running PDP-11 CPU
 and simulated or physical devices do DMA or INTR.

 Separated from "all-function" main() because of PRU code size limits.
 Application has to load this into PRU1 depending on system state.

 from d:\RetroCmp\dec\pdp11\UniBone\91_3rd_party\pru-c-compile\pru-software-support-package\examples\am335x\PRU_gpioToggle
 Test GPIO, shared mem and interrupt
 a) waits until ARM writes a value to mailbox.arm2pru_req
 b) ACKs the value in mailbox.arm2pru_resp, clears arm2pru_req
 c) toggles 1 mio times GPIO, with delay as set by ARM
 d) signal EVENT0
 e) goto a
 */

#include <stdint.h>
#include <stdbool.h>
#include <pru_cfg.h>
#include "resource_table_empty.h"

#include "pru1_utils.h"
#include "pru1_timeouts.h"

#include "pru_pru_mailbox.h"
#include "mailbox.h"
#include "ddrmem.h"
#include "iopageregister.h"

#include "pru1_buslatches.h"
#include "pru1_statemachine_arbitration.h"
#include "pru1_statemachine_dma.h"
#include "pru1_statemachine_intr.h"
#include "pru1_statemachine_slave.h"
#include "pru1_statemachine_init.h"
#include "pru1_statemachine_powercycle.h"

// supress warnigns about using void * as fucntion pinters
//	sm_slave_state = (statemachine_state_func)&sm_slave_start;
	// while (sm_slave_state = sm_slave_state()) << usage
#pragma diag_push
#pragma diag_remark=515


void test(){ 
		while(1) {
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			}
}		


void main(void) {
	// state function pointer for different state machines
	statemachine_state_func sm_slave_state ;
	statemachine_state_func sm_arb_state ;
	statemachine_state_func sm_dma_state ;
	statemachine_state_func sm_intr_state ;
	statemachine_state_func sm_init_state ;
	statemachine_state_func sm_powercycle_state ;

	/* Clear SYSCFG[STANDBY_INIT] to enable OCP master port */
	CT_CFG.SYSCFG_bit.STANDBY_INIT = 0;

	timeout_init() ;

	// clear all tables, as backup if ARM fails todo
	iopageregisters_init();

	buslatches_reset(); // all deasserted, caches cleared

	/* ARM must init mailbox, especially:
	mailbox.arm2pru_req = ARM2PRU_NONE;
	mailbox.events.eventmask = 0;
	mailbox.events.initialization_signals_prev = 0;
	mailbox.events.initialization_signals_cur = 0;
	*/

	/* start parallel emulation of all devices,
	 * Process __DMA and _INTR bus master operations
	 *
	 * ! Several state machines (DMA, Powercycle, INIT,) use the same global timeout.
	 * ! Never execute these in parallel !
	 */
	// Reset PDP-11 with power-cycle simulation.
	// Necessary, as until now NPR/NPG/BG/BR/SACK lines were "unconnected"
//	buslatches_powercycle();
//	__delay_cycles(MILLISECS(100));
	// execute 2x, because M9312 boot ROMs need this
	//			__delay_cycles(MILLISECS(250));
	//			buslatches_powercycle();

	// buslatches_pulse_debug ;

	// base operation: accept and execute slave cycles
	while (true) {
		uint32_t arm2pru_req_cached;
		// do all states of an access, start when MSYN found.

		// slave cycles may trigger events to ARM, which changes "active" registers
		// and issues interrupts

		sm_slave_state = (statemachine_state_func)&sm_slave_start;
		while (sm_slave_state = sm_slave_state())
			; // execute complete slave cycle, then check NPR/INTR

		// update state of init lines
		// INIT never asserted in the midst of a transaction, bit 3,4,5
		do_event_initializationsignals();

		// standard operation may be interrupt by other requests
		arm2pru_req_cached = mailbox.arm2pru_req;
		switch (arm2pru_req_cached) {
		case ARM2PRU_NONE:
			// pass BG[4-7] to next device, state machine "idle"
			// pass all Arbitration GRANT IN to GRANT OUT for next device.
			// This is not necessary while INTR or DMA is actiove:
			// INTR is only 1 cycle, DMA has SACK set all the time, arbitration
			// prohibited then.
			sm_arb_state_idle();
			// do only forward GRANT lines if not INTR is pending,
			// else our GRANT would be passed too.
			break; // fast case: only slave operation
		case ARM2PRU_NOP: // needed to probe PRU run state
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
		case ARM2PRU_DMA_ARB_NONE: // ignore SACK condition
		case ARM2PRU_DMA_ARB_MASTER: // also without arbitration, TODO!
			sm_dma_state = (statemachine_state_func)&sm_dma_start;
			while (sm_dma_state = sm_dma_state())
				;
		
			// a dma cycle into a device register may trigger an interrupt
			// do not delete that condition
			if (mailbox.arm2pru_req == arm2pru_req_cached)
				mailbox.arm2pru_req = ARM2PRU_NONE; // clear request
			break;
		case ARM2PRU_DMA_ARB_CLIENT:
			// start DMA cycle
			// can not run parallel with INTR levels
			
			sm_arb_state = (statemachine_state_func)sm_arb_start(ARBITRATION_PRIORITY_BIT_NP);
			while (sm_arb_state && (sm_arb_state = sm_arb_state())) {
				// sm_slave is most time critical, as it must keep track with MSYN/SSYN bus traffic.
				// so give it more cpu cycles
				sm_slave_state = (statemachine_state_func)&sm_slave_start;
				while (sm_slave_state = sm_slave_state())
					;
			}
			// now SACK held and BBSY set, slave state machine ended, since BBSY found inactive

			// debug pin reset by bus access
			//DEBUG_PIN_SET(1) ;
			sm_dma_state = (statemachine_state_func)&sm_dma_start;
			while (sm_dma_state = sm_dma_state())
				//DEBUG_PIN_SET(1) ;
				;// execute dma master cycles
			
			// a dma cycle into a device register may trigger an interrupt
			// do not delete that condition
			if (mailbox.arm2pru_req == arm2pru_req_cached)
				mailbox.arm2pru_req = ARM2PRU_NONE; // clear request
			break;
		case ARM2PRU_INTR:
			// start one INTR cycle. May be raised in midst of slave cycle
			// by ARM, if access to "active" register triggers INTR.
			// no multiple levels simultaneously allowed, not parallel with DMA !
			sm_arb_state = (statemachine_state_func)sm_arb_start(mailbox.intr.priority_bit);
			// wait while INTR is accepted. This may take long time,
			// if system is at high processor priority (PSW register)
			while (sm_arb_state && (sm_arb_state = sm_arb_state())) {
				// sm_slave is most time critical, as it must keep track with MSYN/SSYN bus traffic.
				// so give it more cpu cycles
				sm_slave_state = (statemachine_state_func)&sm_slave_start;
				while (sm_slave_state = sm_slave_state())
					;
			}
			
			// now SACK held and BBSY set, slave state machine ended, since BBSY found inactive
			sm_intr_state = (statemachine_state_func)&sm_intr_start;
			while (sm_intr_state = sm_intr_state())
				; // execute intr cycle as bus master
			mailbox.arm2pru_req = ARM2PRU_NONE; // clear request
			break;
		case ARM2PRU_INITPULSE: // generate a pulse on UNIBUS INIT
			// only busmaster may assert INIT. violated here!

			// while INIT cycle is running, do slave cycles
			sm_init_state = (statemachine_state_func)&sm_init_start;
			while(sm_init_state=sm_init_state()) {
				if (sm_slave_state)
					sm_slave_state = sm_slave_state() ;
				else // restart
					sm_slave_state = (statemachine_state_func)&sm_slave_start;
			}
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
		case ARM2PRU_POWERCYCLE: // do ACLO/DCLO power cycle
			// Runs for 4* POWERCYCLE_DELAY_MS millsecs, approx 1 sec.
			// perform slave states in parallel, so emulated memory
			// is existent for power fail trap and reboot

			// while power cycle is running, do slave cycles
			sm_powercycle_state = (statemachine_state_func)&sm_powercycle_start;
			while(sm_powercycle_state=sm_powercycle_state()) {
				if (sm_slave_state)
					sm_slave_state = sm_slave_state() ;
				else // restart
					sm_slave_state = (statemachine_state_func)&sm_slave_start;
			}
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;

		default: // ignore all other requestes while executing emulation
			;
		} // switch
	} // while (true)

	// never reached
}
#pragma diag_pop

