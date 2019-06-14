/* unibusdevice.cpp: abstract device with interface to unibusadapter

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

  abstract unibus device
  maybe mass storage controller or other device implementing
  UNIBUS IOpage registers.
  sets device register values depending on internal status,
  reacts on register read/write over UNIBUS by evaluation of PRU events.
*/
//#include <string>
//using namespace std;
#include "logger.hpp"
#include "unibusadapter.hpp"
#include "unibusdevice.hpp"

unibusdevice_c::unibusdevice_c() :
		device_c() {
	handle = 0;
	register_count = 0;
	default_base_addr = 0;
	default_intr_vector = 0;
	default_intr_level = 0;
	log_channelmask = 0; // no logging until set
}

unibusdevice_c::~unibusdevice_c() {
}

void unibusdevice_c::install(uint32_t base_addr, unsigned intr_vector, uint8_t intr_level) {
	this->base_addr.value = base_addr;
	this->intr_vector.value = intr_vector;
	this->intr_level.value = intr_level;
	unibusadapter->register_device(*this); // -> device_c ?
	// now has handle

	// initial power event.
	power_down = true;
	on_power_changed();
	power_down = false;
	on_power_changed();
}

void unibusdevice_c::install(void) {
	install(default_base_addr, default_intr_vector, default_intr_level);
}

void unibusdevice_c::uninstall(void) {
	unibusadapter->unregister_device(*this);
}

unibusdevice_register_t *unibusdevice_c::register_by_name(string name) {
	unsigned i;
	for (i = 0; i < register_count; i++) {
		unibusdevice_register_t *reg = &(registers[i]);
		if (reg->name && !strcasecmp(name.c_str(), reg->name))
			return reg;
	}
	return NULL;
}

unibusdevice_register_t *unibusdevice_c::register_by_unibus_address(uint32_t addr) {
	unsigned i;
	for (i = 0; i < register_count; i++) {
		unibusdevice_register_t *reg = &(registers[i]);
		if (reg->addr == addr)
			return reg;
	}
	return NULL;
}

// set value of UNIBUS register which can be read by DATI
// passive register: simply set value in shared PRU RAM
// active: set additionally "read" flipflops
void unibusdevice_c::set_register_dati_value(unibusdevice_register_t *device_reg,
		uint16_t value, const char *debug_info) {
//	if (device_reg->active_on_dati)
	// always set dati_flipflops, needed to restore value written with DATO
	device_reg->active_dati_flipflops = value;
	device_reg->shared_register->value = value;

	// signal: changed by device logic
	log_register_event(debug_info, device_reg);
}
/*
 // same as if UNIBUS DATO has written the register
 void unibusdevice_c::set_register_dato_value(unibusdevice_register_t *device_reg,
 uint16_t value) {
 if (device_reg->active_on_dato) {
 device_reg->active_dato_flipflops = value;
 // do not change value seen with UNIBUS DATI
 } else
 device_reg->shared_register->value = value;
 }
 */
// get value of UNIBUS register which has been written by DATO
uint16_t unibusdevice_c::get_register_dato_value(unibusdevice_register_t *device_reg) {
	if (device_reg->active_on_dato)
		return device_reg->active_dato_flipflops;
	else
		return device_reg->shared_register->value;
}

// write the reset value into all registers (helper for UNIBUS INIT)
void unibusdevice_c::reset_unibus_registers() {
	unsigned i;
	for (i = 0; i < register_count; i++) {
		unibusdevice_register_t *reg = &(registers[i]);
		set_register_dati_value(reg, reg->reset_value, __func__);
		// log_register_event("RESET", reg) ;
	}
}

// set an UNIBUS interrupt condition with intr_vector and intr_level
void unibusdevice_c::interrupt(void) {
	// delegate to unibusadapter_c
	unibusadapter->request_INTR(intr_level.value, intr_vector.value);
	// WARNING("unibusdevice_c::interrupt() TODO: generated interrupt!");
}

// log register state changes:
//  print event info
// - print full register content to logger
// "active" registers are printed as <datiflipflop></datoflipflop>

void unibusdevice_c::log_register_event(const char *change_info,
		unibusdevice_register_t *changed_reg) {
	// do not use std:: string .. hand coded because of performance
	char buffer[1024];
	unsigned i;

	if (logger->ignored(this, LL_DEBUG))
		return; // channel not enabled: quick return

	buffer[0] = 0;

	// event info could be like "DATI CS" or "CHNG DA"
	if (change_info)
		strcat(buffer, change_info);
	if (changed_reg) {
		strcat(buffer, " ");
		strcat(buffer, changed_reg->name);
	}
	if (change_info || changed_reg)
		strcat(buffer, ":");

	// dump all registers.
	// if too much (examples: memory emulator): only the changed register
	if (register_count <= 8) {
		for (i = 0; i < register_count; i++) {
			char buff1[80];
			unibusdevice_register_t *reg = &(registers[i]);
			if (reg->active_on_dati || reg->active_on_dato)
				sprintf(buff1, " %s=%06o/%06o", reg->name, reg->shared_register->value,
						reg->active_dato_flipflops);
			else
				sprintf(buff1, " %s=%06o", reg->name, reg->shared_register->value);
			strcat(buffer, buff1);
		}
	} else {
		// only the changed register
		sprintf(buffer, "%s=%06o", changed_reg->name, changed_reg->shared_register->value);
	}
	DEBUG(buffer);
}
