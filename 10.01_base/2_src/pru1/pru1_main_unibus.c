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
 b) ACKs with clear of arm2pru_req
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
#include "pru1_statemachine_data_slave.h"
#include "pru1_statemachine_intr_master.h"
#include "pru1_statemachine_intr_slave.h"

// supress warnigns about using void * as function pointers
//	sm_slave_state = (statemachine_state_func)&sm_data_slave_start;
// while (sm_slave_state = sm_slave_state()) << usage
#pragma diag_push
#pragma diag_remark=515

/***
 3 major states executed in circular 1- 2- 3 order.

 1. "SLAVE":
 UniBone monitoring BUS traffic as slave for DATI/DATO cycles
 Watch UNIBUS for CPU access to emulated memory/devices
 High speed not necessary: Bus master will wait with MSYN if UniBone not responding.
 wathcin BG/BPG signals, catching requested GRANts and forwardinf
 other GRANTS
 - monitoring INIT and AC_LO/DC_LO
 - watching fpr AMR2PRU commands
 2. "BBSYWAIT": UniBone got PRIORITY GRAMT, has set SACK and released BR/NPR
 waits for current BUS master to relaeasy BBSY (ony DATI/DATO cycle max)
 - SACK active: no GRANT forward necessary, no arbitration necessary
 - INIT is monitored by DMA statemachine: no DC_LO/INIT monitoring necessary
 3. "MASTER": UniBone is Bus master: transfering INTR vector or doing DMA
 - Own timing: transfer DMA data block or INTR vector with master cycles
 - SACK active: no GRANT forward necessary, no arbitration necessary
 - INIT is monitored by DMA statemachine: no DC_LO/INIT monitoring necessary
 */

void main(void) {
	// state function pointer for different state machines
	statemachine_arb_worker_func sm_arb_worker = &sm_arb_worker_client;
	statemachine_state_func sm_data_slave_state = NULL;
	statemachine_state_func sm_data_master_state = NULL;
	statemachine_state_func sm_intr_slave_state = NULL;
	// these are function pointers: could be 16bit on PRU?

	bool emulate_cpu = false;

	/* Clear SYSCFG[STANDBY_INIT] to enable OCP master port */
	CT_CFG.SYSCFG_bit.STANDBY_INIT = 0;

	timeout_init();

	// clear all tables, as backup if ARM fails todo
	iopageregisters_init();

	buslatches_reset(); // all deasserted, caches cleared

	/* ARM must init mailbox, especially:
	 mailbox.arm2pru_req = ARM2PRU_NONE;
	 mailbox.events.eventmask = 0;
	 mailbox.events.initialization_signals_prev = 0;
	 mailbox.events.initialization_signals_cur = 0;
	 */

	sm_arb_reset();

	while (true) {
		uint8_t arm2pru_req_cached;

		if (sm_data_master_state == NULL) {
			// State 1 "SLAVE"

			// DATA or INTR for CPU?

			// fast: a complete slave data cycle
			if (!sm_data_slave_state)
				sm_data_slave_state = (statemachine_state_func) &sm_data_slave_start;
			while ((sm_data_slave_state = sm_data_slave_state())
					&& EVENT_IS_ACKED(mailbox, deviceregister))
				// throws signals to ARM,
				// Acess to internal registers may may issue AMR2PRU opcode, so exit loop then
				;// execute complete slave cycle, then check NPR/INTR

			// signal INT or PWR FAIL to ARM
			// before arb_worker(), so BR/NPR requests are canceled on INIT
			do_event_initializationsignals();

			// Priority Arbitration
			// Delay INTR or DMA while BUS halted via SSYN.
			// ARM may start DMA within deviceregister event!
			if (EVENT_IS_ACKED(mailbox, deviceregister)) {
				// execute one of the arbitration workers
				uint8_t grant_mask = sm_arb_worker();
				// sm_arb_worker()s include State 2 "BBSYWAIT".
				// So now SACK maybe set, even if grant_mask is still 0

				if (grant_mask & PRIORITY_ARBITRATION_BIT_NP) {
					sm_data_master_state = (statemachine_state_func) &sm_dma_start;
					// can data_master_state  be overwritten in the midst of a running data_master_state ?
					// no: when running, SACK is set, no new GRANTs
				} else if (grant_mask & PRIORITY_ARBITRATION_INTR_MASK) {
					// convert bit in grant_mask to INTR index
					uint8_t idx = PRIORITY_ARBITRATION_INTR_BIT2IDX(grant_mask);
					// now transfer INTR vector for interupt of GRANted level.
					// vector and ARM context have been setup by ARM before ARM2PRU_INTR already
					sm_intr_master.vector = mailbox.intr.vector[idx];
					sm_intr_master.level_index = idx; // to be returned to ARM on complete

					sm_data_master_state = (statemachine_state_func) &sm_intr_master_start;
				}
			}
		} else {
			// State 3 "MASTER"
			// we have been GRANTed bus mastership and are doing DMA or INTR
			// SACK held here -> no further arbitration
			// INTR is only 1 cycle, DMA has SACK set all the time, arbitration
			// prohibited then.

			sm_data_master_state = sm_data_master_state(); // execute only ONE state ,
			// else DMA blocks will block processing of other state machines
			// throws signals to ARM, causes may issue mailbox.arm2pru_req
		}

		if (emulate_cpu) {
			// Receive INTR from physical or emulated devices, and signal ARM.
			// Same code loop as for DATA cycle
			if (!sm_intr_slave_state)
				sm_intr_slave_state = (statemachine_state_func) &sm_intr_slave_start;
			while ((sm_intr_slave_state = sm_intr_slave_state())
					&& EVENT_IS_ACKED(mailbox, intr_slave))
				;
		}

		// process ARM commands in master and slave mode
		// standard operation may be interrupt by other requests
		if (arm2pru_req_cached = mailbox.arm2pru_req) {
			// not ARM2PRU_NONE
			switch (arm2pru_req_cached) {
			case ARM2PRU_NOP: // needed to probe PRU run state
				mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
				break;
			case ARM2PRU_ARB_MODE_NONE: // ignore SACK condition
				// from now on, ignore INTR requests and allow DMA request immediately
				sm_arb_worker = &sm_arb_worker_none;
				mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
				break;
			case ARM2PRU_ARB_MODE_CLIENT:
				// request DMA from external Arbitrator
				sm_arb_worker = &sm_arb_worker_client;
				mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
				break;
			case ARM2PRU_ARB_MODE_MASTER:
				sm_arb_worker = &sm_arb_worker_master;
				mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
				break;
			case ARM2PRU_DMA:
				if (mailbox.arbitrator.cpu_BBSY) {
					// ARM CPU emulation did a single word DATA transfer with cpu_DATA_transfer()
					if (mailbox.arbitrator.device_BBSY) {
						// ARM started cpu DATA transfer, but arbitration logic
						// GRANTed a device request in the mean time. Tell ARM.
						mailbox.arm2pru_req = PRU2ARM_DMA_CPU_TRANSFER_BLOCKED; // error
						mailbox.arbitrator.cpu_BBSY = false;
					}
					// start bus cycle
					sm_data_master_state = (statemachine_state_func) &sm_dma_start;
				} else {
					// Emulated device: raise request for emulated or physical Arbitrator.
					// request DMA, arbitrator must've been selected with ARM2PRU_ARB_MODE_*
					sm_arb.device_request_mask |= PRIORITY_ARBITRATION_BIT_NP;
					// sm_arb_worker() evaluates this,extern Arbitrator raises Grant, excution starts in future loop
					// end of DMA is signaled to ARM with signal

					/* TODO: speed up DMA
					 While DMA is active:
					 - SACK active: no GRANT forward necessary
					 no arbitration necessary
					 - INIT is monitored: no DC_LO/INIT monitoring necessary
					 - no scan for new ARM2PRU commands: ARM2PRU_DMA is blocking
					 - smaller chunks ?
					 */
				}
				mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
				break;
			case ARM2PRU_INTR:
				// request INTR, arbitrator must've been selected with ARM2PRU_ARB_MODE_*
				// start one INTR cycle. May be raised in midst of slave cycle
				// by ARM, if access to "active" register triggers INTR.
				sm_arb.device_request_mask |= mailbox.intr.priority_arbitration_bit;
				// sm_arb_worker() evaluates this, extern Arbitrator raises Grant,
				// vector of GRANted level is transfered with statemachine sm_intr_master

				// Atomically change state in a device's associates interrupt register.
				// The Interupt Register is set immediately. No wait for INTR GRANT,
				// INTR level may be blocked.
				if (mailbox.intr.iopage_register_handle)
					deviceregisters.registers[mailbox.intr.iopage_register_handle].value =
							mailbox.intr.iopage_register_value;
				mailbox.arm2pru_req = ARM2PRU_NONE;  // done
				// end of INTR is signaled to ARM with signal
				break;
			case ARM2PRU_INTR_CANCEL:
				// cancels one or more INTR requests. If already Granted, the GRANT is forwarded,
				// and canceled by reaching a "SACK turnaround terminator" or "No SACK TIMEOUT" in the arbitrator.
				sm_arb.device_request_mask &= ~mailbox.intr.priority_arbitration_bit;
				// no completion event, could interfer with other INTRs?
				mailbox.arm2pru_req = ARM2PRU_NONE;  // done
				break;
			case ARM2PRU_INITALIZATIONSIGNAL_SET:
				switch (mailbox.initializationsignal.id) {
				case INITIALIZATIONSIGNAL_ACLO:
					// assert/deassert ACLO
					buslatches_setbits(7, BIT(4), mailbox.initializationsignal.val? BIT(4):0);
					break;
				case INITIALIZATIONSIGNAL_DCLO:
					// assert/deassert DCLO
					buslatches_setbits(7, BIT(5), mailbox.initializationsignal.val? BIT(5):0);
					break;
				case INITIALIZATIONSIGNAL_INIT:
					// assert/deassert INIT
					buslatches_setbits(7, BIT(3), mailbox.initializationsignal.val? BIT(3):0);
					break;
				}
				mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
				break;
			case ARM2PRU_CPU_ENABLE:
				// bool flag much faster to access then shared mailbox member.
				emulate_cpu = mailbox.cpu_enable;
				if (emulate_cpu)
					sm_arb_worker = &sm_arb_worker_master;
				else
					sm_arb_worker = &sm_arb_worker_client;
				mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
				break;
			case ARM2PRU_HALT:
				mailbox.arm2pru_req = ARM2PRU_NONE; // ACK: done
				__halt(); // LA: trigger on timeout of REG_WRITE
				break;
			}
		}

	}
	// never reached
}

#pragma diag_pop

