/* pru1_main.c: main loop with mailbox cmd interface

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

/* start parallel emulation of all devices,
 * Process __DMA and _INTR bus master operations
 *
 * ! Several state machines (DMA, Powercycle, INIT,) use the same global timeout.
 * ! Never execute these in parallel !
 */
static void state_emulation() {
	bool ready = false;

	buslatches_reset(); // all deasserted

	// Reset PDP-11 with power-cycle simulation.
	// Necessary, as until now NPR/NPG/BG/BR/SACK lines were "unconnected"

	buslatches_powercycle();
	__delay_cycles(MILLISECS(100));
	// execute 2x, because M9312 boot ROMs need this
	//			__delay_cycles(MILLISECS(250));
	//			buslatches_powercycle();

	ready = false;
	// buslatches_pulse_debug ;

	// base operation: accept and execute slave cycles
	sm_slave_start();

	while (!ready) {
		// do all states of an access, start when MSYN found.

		// slave cycles may trigger events to ARM, which changes "active" registers
		// and issues interrupts
		while (!sm_slave.state())
			; // execute complete slave cycle, then check NPR/INTR

		// update state of init lines
		// INIT never asserted in the midst of a transaction, bit 3,4,5
		do_event_initializationsignals();

		// standard operation may be interrupt by other requests
		switch (mailbox.arm2pru_req) {
		case ARM2PRU_EMULATION:
			// pass BG[4-7] to next device, state machine "idle"
			// pass all Arbitration GRANT IN to GRANT OUT for next device.
			// This is not necessary while INTR or DMA is actiove:
			// INTR is only 1 cycle, DMA has SACK set all the time, aribitration
			// prohibited then.
			sm_arb_state_idle();
			// do only forward GRANT lines if not INTR is pending,
			// else our GRANT would be passed too.
			break; // fast case: only slave operation
		case ARM2PRU_EMULATION_STOP:
			ready = true;
			break;
		case ARM2PRU_DMA:
			// start DMA cycle
			// can not run parallel with INTR levels
			sm_arb_start(ARBITRATION_PRIORITY_BIT_NP);
			while (!sm_arb.state()) {
				// sm_slave is most time critical, as it must keep track with MSYN/SSYN bus traffic.
				// so give it more cpu cycles
				while (!sm_slave.state())
					;
			}
			// now SACK held and BBSY set, slave state machine ended, since BBSY found inactive

			// debug pin reset by bus access
			//DEBUG_PIN_SET(1) ;
			sm_dma_start();
			//DEBUG_PIN_SET(1) ;
			while (!sm_dma.state())
				//DEBUG_PIN_SET(1) ;
				;// execute dma master cycles
			// a dma cycle into a device register may trigger an interrupt
			// do not delete that condition
			if (mailbox.arm2pru_req == ARM2PRU_DMA)
				mailbox.arm2pru_req = ARM2PRU_EMULATION; // clear request
			break;
		case ARM2PRU_INTR:
			// start one INTR cycle. May be raised in midst of slave cycle
			// by ARM, if access to "active" register triggers INTR.
			// no multiple levels simultaneously allowed, not parallel with DMA !
			sm_arb_start(mailbox.intr.priority_bit);
			// wait while INTR is accepted. This may take long time,
			// if system is at high processor priority (PSW register)
			while (!sm_arb.state()) {
				// sm_slave is most time critical, as it must keep track with MSYN/SSYN bus traffic.
				// so give it more cpu cycles
				while (!sm_slave.state())
					;
			}
			// now SACK held and BBSY set, slave state machine ended, since BBSY found inactive
			sm_intr_start();
			while (!sm_intr.state())
				; // execute intr cycle as bus master
			mailbox.arm2pru_req = ARM2PRU_EMULATION; // clear request
			break;
		case ARM2PRU_INITPULSE: // generate a pulse on UNIBUS INIT
			// only busmaster may assert INIT. violated here!
			sm_slave_start();
			sm_init_start();
			while (!sm_slave.state() || !sm_init.state())
				;
			mailbox.arm2pru_req = ARM2PRU_EMULATION; // ACK: done
			break;
		case ARM2PRU_POWERCYCLE: // do ACLO/DCLO power cycle
			// Runs for 4* POWERCYCLE_DELAY_MS millsecs, approx 1 sec.
			// perform slave states in parallel, so emulated memory
			// is existent for power fail trap and reboot
			sm_slave_start();
			sm_powercycle_start();
			while (!sm_slave.state() || !sm_powercycle.state())
				;
			mailbox.arm2pru_req = ARM2PRU_EMULATION; // ACK: done
			break;

		default: // ignore all other requestes while executing emulation
			;
		} // switch
	} // while (!ready)
}

void main(void) {

	/* Clear SYSCFG[STANDBY_INIT] to enable OCP master port */
	CT_CFG.SYSCFG_bit.STANDBY_INIT = 0;

	// clear all tables, as backup if ARM fails todo
	iopageregisters_init();

	buslatches_reset(); // all deasserted

	// init mailbox
	mailbox.arm2pru_req = ARM2PRU_NONE;
	mailbox.events.eventmask = 0;
	mailbox.events.initialization_signals_prev = 0;
	mailbox.events.initialization_signals_cur = 0;

	while (1) {
		// display opcode (active for one cycle
//		__R30 = (mailbox.arm2pru_req & 0xf) << 8;
		/*
		 mailbox.arm2pru_resp = mailbox.arm2pru_req ;
		 __R30 = (mailbox.arm2pru_resp & 0xf) << 8;
		 mailbox.arm2pru_resp = mailbox.arm2pru_req ;
		 }
		 */
		/*** Attention: arm2pru_req (and all mailbox vars) change at ANY TIME
		 * - ARM must set arm2pru_req as last operation on mailbox,
		 *    memory barrier needed.
		 * - ARM may not access mailbox until arm2pru_req is 0
		 * - PRU only clears arm2pru_req after actual processing if mailbox
		 * ***/
		switch (mailbox.arm2pru_req) {
		case ARM2PRU_NONE: // == 0
			// reloop
			break;
		case ARM2PRU_HALT:
			__halt(); // that's it
			break;
#ifdef USED
		case ARM2PRU_MAILBOXTEST1:
			// simulate a register read access.
#ifdef TEST_TIMEOUT
			while (1) {
				// toggle with REGSEL_0    = PRU1_8
				__R30 |= (1 << 8);
				// buslatches_setbits(1, BIT(6), BIT(6)) ;
				TIMEOUT_SET(NANOSECS(1000));// 1 usec / level
				while (!TIMEOUT_REACHED);
				__R30 &= ~(1 << 8);
				//buslatches_setbits(1, BIT(6), 0) ;
				TIMEOUT_SET(NANOSECS(1000));
				while (!TIMEOUT_REACHED);
			}
#endif

			// show on REG_DATAOUT
			buslatches_pru0_dataout(mailbox.mailbox_test.addr);
			// pru_pru_mailbox.pru0_r30 = mailbox.mailbox_test.addr & 0xff;
			// __R30 = (mailbox.mailbox_test.addr & 0xf) << 8;
			mailbox.mailbox_test.val = mailbox.mailbox_test.addr;
			__R30 = (mailbox.arm2pru_req & 0xf) << 8; // optical ACK
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
#endif
		case ARM2PRU_BUSLATCH_INIT: // set all mux registers to "neutral"
			buslatches_reset();
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;

		case ARM2PRU_BUSLATCH_SET: { // set a mux register

			// don't feed "volatile" vars into buslatch_macros !!!
			uint8_t reg_sel = mailbox.buslatch.addr & 7;
			uint8_t bitmask = mailbox.buslatch.bitmask;
			uint8_t val = mailbox.buslatch.val;
			//buslatches.cur_reg_sel = 0xff; // force new setting of reg_sel
			if (BUSLATCH_REG_IS_BYTE(reg_sel))
				buslatches_setbyte(reg_sel, val);
			else
				buslatches_setbits(reg_sel, bitmask, val);
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
		}
		case ARM2PRU_BUSLATCH_GET: {
			// don't feed "volatile" vars into buslatch_macros !!!
			uint8_t reg_sel = mailbox.buslatch.addr & 7;
			// buslatches.cur_reg_sel = 0xff; // force new setting of reg_sel
			mailbox.buslatch.val = buslatches_get(reg_sel);
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
		}
		case ARM2PRU_BUSLATCH_TEST: {
			buslatches_test(mailbox.buslatch_test.addr_0_7, mailbox.buslatch_test.addr_8_15,
					mailbox.buslatch_test.data_0_7, mailbox.buslatch_test.data_8_15);
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
		}
		case ARM2PRU_INITPULSE: // generate a pulse on UNIBUS INIT
		// INIT: latch[7], bit 3
			buslatches_setbits(7, BIT(3), BIT(3)); // assert INIT
			__delay_cycles(MILLISECS(250)); // INIT is 250ms
			buslatches_setbits(7, BIT(3), 0); // deassert INIT
				mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;

		case ARM2PRU_POWERCYCLE: // do ACLO/DCLO power cycle
			buslatches_powercycle();
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
		case ARM2PRU_DMA:
			sm_dma_start(); // without NPR/NPG arbitration
			// simply call current state function, until stopped
			// parallel the BUS-slave statemachine is triggered
			// by master logic.
			while (!sm_dma.state())
				;
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
		case ARM2PRU_DDR_FILL_PATTERN:
			ddrmem_fill_pattern();
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
		case ARM2PRU_DDR_SLAVE_MEMORY:
			// respond to UNIBUS cycles as slave and
			// access DDR as UNIBUS memory.

			// only debugging: all signals deasserted
			buslatches_reset();

			// do UNIBUS slave cycles, until ARM abort this by
			// writing into mailbox.arm2pru_req
			while (mailbox.arm2pru_req == ARM2PRU_DDR_SLAVE_MEMORY) {
				sm_slave_start();
				// do all states of an access, start when MSYN found.
				while (!sm_slave.state())
					;
			}
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
		case ARM2PRU_EMULATION:
			/* start parallel emulation of all devices, */
			state_emulation();
			mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
			break;
		} // switch
	} // while
}

