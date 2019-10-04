/* cpu.cpp: PDP-11/05 CPU

 Copyright (c) 2018, Angelo Papenhoff, Joerg Hoppe

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


 23-nov-2018  JH      created

 In worker() Angelos 11/05 CPU is  running.
 Can do bus amster DAGTIDATO.
 */

#include <string.h>
#include <stdarg.h>

#include "mailbox.h"
#include "gpios.hpp"	// ARM_DEBUG_PIN*

#include "unibus.h"

#include "unibusadapter.hpp"
#include "unibusdevice.hpp"	// definition of class device_c
#include "cpu.hpp"

int dbg = 0;

/*** functions to be used by Angelos CPU emulator ***/

/* Adapter procs to Angelos CPU are not members of cpu_c class
 and need one global reference.
 */
static cpu_c *unibone_cpu = NULL;

// route "trace()" to unibone_cpu->logger
void unibone_log(unsigned msglevel, const char *srcfilename, unsigned srcline, const char *fmt,
		...) {
	va_list arg_ptr;
	va_start(arg_ptr, fmt);
	//vprintf(fmt, arg_ptr) ;
	//va_end(arg_ptr); va_start(arg_ptr, fmt);
	logger->vlog(unibone_cpu, msglevel, srcfilename, srcline, fmt, arg_ptr);
	va_end(arg_ptr);
}

void unibone_logdump(void) {
//	logger->dump(logger->default_filepath);
	logger->dump(); // stdout
}

// called before opcode fetch of next instruction
// This is the point in time were INTR requests are checked and GRANTed
// (PRU implementation may limit NPR GRANTs also to this time)
void unibone_on_before_instruction(void) {
	// after that the CPU should check for received INTR vectors
	// in its microcode service() step.c

	// allow PRU do to produce GRANT for device requests
	mailbox_execute (ARM2PRU_ARB_GRANT_INTR_REQUESTS);
	// Block CPU thread
	while (mailbox->arbitrator.ifs_intr_arbitration_pending) {
// often 60-80 us, So just idle loop the CPU thread
//		timeout_c::wait_us(1);
	}
}

// Result: 1 = OK, 0 = bus timeout
int unibone_dato(unsigned addr, unsigned data) {
	uint16_t wordbuffer = (uint16_t) data;

	dbg = 1;
	unibusadapter->cpu_DATA_transfer(unibone_cpu->data_transfer_request, UNIBUS_CONTROL_DATO,
			addr, &wordbuffer);
	dbg = 0;
	return unibone_cpu->data_transfer_request.success;
}

int unibone_datob(unsigned addr, unsigned data) {
	uint16_t wordbuffer = (uint16_t) data;
	// TODO DATOB als 1 byte-DMA !
	dbg = 1;
	unibusadapter->cpu_DATA_transfer(unibone_cpu->data_transfer_request, UNIBUS_CONTROL_DATOB,
			addr, &wordbuffer);
	dbg = 0;
	return unibone_cpu->data_transfer_request.success;
}

int unibone_dati(unsigned addr, unsigned *data) {
	uint16_t wordbuffer;
	dbg = 1;
	unibusadapter->cpu_DATA_transfer(unibone_cpu->data_transfer_request, UNIBUS_CONTROL_DATI,
			addr, &wordbuffer);
	*data = wordbuffer;
	dbg = 0;
	// printf("DATI; ba=%o, data=%o\n", addr, *data) ;

	return unibone_cpu->data_transfer_request.success;
}

// CPU has changed the arbitration level, just forward
// if this is called as result of INTR fector PC and PSW fetch,
// mailbox->arbitrator.cpu_priority_level was CPU_PRIORITY_LEVEL_FETCHING
// In that case, PRU is allowed now to grant BGs again.
void unibone_prioritylevelchange(uint8_t level) {
	mailbox->arbitrator.ifs_priority_level = level;
}

// CPU executes RESET opcode -> pulses INIT line
void unibone_bus_init(unsigned pulsewidth_ms) {
	unibus->init(pulsewidth_ms);
}

cpu_c::cpu_c() :
		unibuscpu_c()  // super class constructor
{
	// static config
	name.value = "CPU20";
	type_name.value = "PDP-11/20";
	log_label = "cpu";
	default_base_addr = 0; // none
	default_intr_vector = 0;
	default_intr_level = 0;
	priority_slot.value = 0; // not used

	// init parameters
	runmode.value = false;
	init.value = false;

	// current CPU does not publish registers to the bus
	// must be unibusdevice_c then!
	register_count = 0;

	memset(&bus, 0, sizeof(bus));
	memset(&ka11, 0, sizeof(ka11));
	ka11.bus = &bus;

	// link to global instance ptr
	assert(unibone_cpu == NULL);// only one possible
	unibone_cpu = this; // Singleton
}

cpu_c::~cpu_c() {
	unibone_cpu = NULL;
}

bool cpu_c::on_param_changed(parameter_c *param) {
	if (param == &enabled) {
		if (!enabled.new_value) {
			init.value = false;
			// HALT disabled CPU
			stop();
		} else {
			// enable active: assert CPU starts stopped
			stop();
		}
	} else if (param == &runmode) {
		if (runmode.new_value) {
			start();
		} else {
			stop();
		}
	}

	return unibusdevice_c::on_param_changed(param); // more actions (for enable)
}

// start CPU logic on PRU and switch arbitration mode
void cpu_c::start() {
	runmode.value = true;
	mailbox->cpu_enable = 1;
	mailbox_execute(ARM2PRU_CPU_ENABLE);
	unibus->set_arbitrator_active(true);
}

// stop CPU logic on PRU and switch arbitration mode
void cpu_c::stop() {
	ka11.state = 0;
	runmode.value = false;
	mailbox->cpu_enable = 0;
	mailbox_execute(ARM2PRU_CPU_ENABLE);
	unibus->set_arbitrator_active(false);
}

// background worker.
// Started/stopped on param "enable"
void cpu_c::worker(unsigned instance) {
	UNUSED(instance); // only one
	timeout_c timeout;
	// bool nxm;
	// unsigned pc = 0;
	//unsigned dr = 0760102;
	unsigned opcode = 0;
	(void) opcode;

	power_event = power_event_none;

	// run with lowest priority, but without wait()
	// => get all remaining CPU power
	worker_init_realtime_priority(none_rt);
	//worker_init_realtime_priority(device_rt);

	timeout.wait_us(1);

	while (!workers_terminate) {
		// speed control is difficult, force to use more ARM cycles
//			if (runmode.value != (ka11.state != 0))
//				ka11.state = runmode.value;
		if (runmode.value && (ka11.state == 0))
			ka11.state = 1; // HALTED -> RUNNING
		else if (!runmode.value)
			// HALT position inside instructions !!!
			ka11.state = 0; // WAITING|RUNNING =- HALTED
		int prev_ka11_state = ka11.state;
		ka11_condstep(&ka11);
		if (prev_ka11_state > 0 && ka11.state == 0) {
			// CPU run on HALT, sync runmode
			runmode.value = false;
			printf("CPU HALT at %06o.\n", ka11.r[7]);
		}

		// serialize asynchronous power events
		if (runmode.value) {
			// don't call power traps if HALTed. Also not on CONT.
			if (power_event == power_event_down)
				ka11_pwrdown(&unibone_cpu->ka11);
			// stop stop some time after power down
			else if (power_event == power_event_up)
				ka11_pwrup(&unibone_cpu->ka11);
			power_event = power_event_none; // processed
		}

		if (init.value) {
			// user wants CPU reset
			ka11_reset(&ka11);
			init.value = 0;
		}
	}
}

// process DATI/DATO access to one of my "active" registers
// !! called asynchronuously by PRU, with SSYN asserted and blocking UNIBUS.
// The time between PRU event and program flow into this callback
// is determined by ARM Linux context switch
//
// UNIBUS DATO cycles let dati_flipflops "flicker" outside of this proc:
//      do not read back dati_flipflops.
void cpu_c::on_after_register_access(unibusdevice_register_t *device_reg,
		uint8_t unibus_control) {
	// nothing todo
	UNUSED(device_reg);
	UNUSED(unibus_control);
}

// CPU received interrupt vector from UNIBUS
// PRU triggers this via unibusadapter, 
// mailbox->arbitrator.cpu_priority_level is CPU_PRIORITY_LEVEL_FETCHING
// CPU fetches PSW and calls unibone_prioritylevelchange(), which
// sets mailbox->arbitrator.cpu_priority_level and 
// PRU is allowed now to grant BGs again.
void cpu_c::on_interrupt(uint16_t vector) {
	// CPU sequence:
	// push PSW to stack
	// push PC to stack 
	// PC := *vector
	// PSW := *(vector+2)
	ka11_setintr(&unibone_cpu->ka11, vector);
}

