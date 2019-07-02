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

#include "mailbox.h"

#include "unibus.h"

#include "unibusadapter.hpp"
#include "unibusdevice.hpp"	// definition of class device_c
#include "cpu.hpp"

cpu_c::cpu_c() :
		unibusdevice_c()  // super class constructor
{
	// static config
	name.value = "CPU20";
	type_name.value = "PDP-11/20";
	log_label = "cpu";
	default_base_addr = 0; // none
	default_intr_vector = 0;
	default_intr_level = 0;

	// init parameters
	runmode.value = false;
	init.value = false;

	// current CPU does not publish registers to the bus
	// must be unibusdevice_c then!
	register_count = 0;

	memset(&bus, 0, sizeof(bus));
	memset(&ka11, 0, sizeof(ka11));
	ka11.bus = &bus;
}

cpu_c::~cpu_c() {

}

bool cpu_c::on_param_changed(parameter_c *param) {
	if (param == &enabled) {
		if (!enabled.new_value) {
			// HALT disabled CPU
			runmode.value = false;
			init.value = false;
		}
	} 
	return device_c::on_param_changed(param); // more actions (for enable)
}

extern "C" {
// functions to be used by Angelos CPU emulator
// Result: 1 = OK, 0 = bus timeout
int cpu_dato(unsigned addr, unsigned data) {
	bool timeout;
	mailbox->dma.words[0] = data;
	timeout = !unibus->dma(unibus_c::ARBITRATION_MODE_MASTER, UNIBUS_CONTROL_DATO, addr, 1);
	return !timeout;

}

int cpu_datob(unsigned addr, unsigned data) {
	// TODO DATOB als 1 byte-DMA !
	bool timeout;
	mailbox->dma.words[0] = data;
	timeout = !unibus->dma(unibus_c::ARBITRATION_MODE_MASTER, UNIBUS_CONTROL_DATOB, addr, 1);
	return !timeout;
}

int cpu_dati(unsigned addr, unsigned *data) {
	bool timeout;

	timeout = !unibus->dma(unibus_c::ARBITRATION_MODE_MASTER, UNIBUS_CONTROL_DATI, addr, 1);
	*data = mailbox->dma.words[0];
	// printf("DATI; ba=%o, data=%o\n", addr, *data) ;
	return !timeout;
}
}

// background worker.
void cpu_c::worker(unsigned instance) {
	UNUSED(instance) ; // only one
	timeout_c timeout;
	bool nxm;
	unsigned pc = 0;
	unsigned dr = 0760102;
	unsigned opcode = 0;
	(void) opcode;
	while (!workers_terminate) {
		// run full speed!
		timeout.wait_us(1);

		// timeout.wait_ms(10);

		if (runmode.value != (ka11.state != 0))
			ka11.state = runmode.value;
		condstep(&ka11);
		if (runmode.value != (ka11.state != 0))
			runmode.value = ka11.state != 0;

		if (init.value) {
			// user wants CPU reset
			reset(&ka11);
			init.value = 0;
		}

#if 0
		if (runmode.value) {
			// simulate a fetch
			nxm = !cpu_dati(pc, &opcode);
			if (nxm) {
				printf("Bus timeout at PC = %06o. HALT.\n", pc);
				runmode.value = false;
			}
			pc = (pc + 2) % 0100; // loop around
			// set LEDS
			nxm = !cpu_dato(dr, pc & 0xf);
			if (nxm) {
				printf("Bus timeout at DR = %06o. HALT.\n", dr);
				runmode.value = false;
			}
		}
#endif

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

void cpu_c::on_power_changed(void) {
	if (power_down) { // power-on defaults
	}
}

// UNIBUS INIT: clear all registers
void cpu_c::on_init_changed(void) {
	// write all registers to "reset-values"
	if (init_asserted) {
		reset_unibus_registers();
		INFO("cpu::on_init()");
	}
}

