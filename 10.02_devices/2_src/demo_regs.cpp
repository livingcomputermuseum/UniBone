/* demo_regs.cpp: sample UNIBUS controller with register logic

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

 demo_regs:
 a device to test the event and
 implements 64 registers at start of IOpage
 0760000.. 0760076
 all registers are marked as "active":
 DATI and DATO are routed via events into the controller logic
 UNIBUS is stopped with long SSYN

 Registers have no functions, are simple memory cells.
 */
#include <stdio.h>
#include <stdint.h>
#include <assert.h>
//#include <iostream>

#include "utils.hpp"
#include "logger.hpp"
#include "unibus.h"
#include "unibusadapter.hpp"
#include "unibusdevice.hpp"	// definition of class device_c
#include "demo_regs.hpp"

demo_regs_c::demo_regs_c() :
		unibusdevice_c()  // super class constructor
{
	unsigned i;

	// static config
	name.value = "DEMO_REGS";
	type_name.value = "demo_regs_c";
	log_label = "dr";

	
	set_default_bus_params(0760000, 0, 0) ; // base addr, intr-vector, intr level

	register_count = 32; // up to 760076
	// registers are "active": receive "on_after_register_access"
	for (i = 0; i < this->register_count; i++) {
		unibusdevice_register_t *reg = &(this->registers[i]);
		sprintf(reg->name, "reg[0%03o]", i); // name is register offset
		reg->active_on_dati = true; // controller state change on read
		reg->active_on_dato = true; // writing changes controller state
		reg->reset_value = 0;
		reg->writable_bits = 0xffff;  // all registers are memory cells
	}
	// dynamic state
	access_count.value = 0;

}

bool demo_regs_c::on_param_changed(parameter_c *param) {
	// no own parameter or "enable" logic
	return unibusdevice_c::on_param_changed(param); // more actions (for enable)
}

// background worker.
// Just print a heart beat
void demo_regs_c::worker(void) {
	timeout_c timeout;
	while (!worker_terminate) {
		timeout.wait_ms(1000);
		cout << ".";
	}
}

// process DATI/DATO access to one of my "active" registers
// !! called asynchronuously by PRU, with SSYN asserted and blocking UNIBUS.
// The time between PRU event and program flow into this callback
// is determined by ARM Linux context switch
//
// UNIBUS DATO cycles let dati_flipflops "flicker" outside of this proc:
//      do not read back dati_flipflops.
void demo_regs_c::on_after_register_access(unibusdevice_register_t *device_reg,
		uint8_t unibus_control) {

	// emulate a plain memory cell: written values can be read unchanged
	if (unibus_control == UNIBUS_CONTROL_DATI) {
	}

	if (unibus_control == UNIBUS_CONTROL_DATO)
		set_register_dati_value(device_reg, device_reg->active_dato_flipflops, __func__);
	// this is also called for some DATIs, no action anyhow.

	access_count.value++;
	// DEBUG writes to disk & console ... measured delay up to 30ms !
	//DEBUG(LL_DEBUG, LC_demo_regs, "[%6u] reg +%d @ %06o %s", accesscount, (int ) device_reg->index,
	//		device_reg->addr, unibus_c::control2text(unibus_control));
}

void demo_regs_c::on_power_changed(void) {
	if (power_down) { // power-on defaults
	}
}

// UNIBUS INIT: clear all registers
void demo_regs_c::on_init_changed(void) {
	// write all registers to "reset-values"
	if (init_asserted) {
		reset_unibus_registers();
		INFO("demo_regs_c::on_init()");
	}
}

