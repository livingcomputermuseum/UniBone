/* DL11W.cpp: sample UNIBUS controller with SLU & LTC logic

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
 20/12/2018 djrm copied to make slu device
 14/01/2019 djrm adapted to use UART2 serial port

 */

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include <errno.h>
#include <iostream>
#include <netdb.h>
#include <netinet/in.h>

#include "unibusadapter.hpp"
#include "unibusdevice.hpp"	// definition of class device_c
#include "unibus.h"
#include "dl11w.hpp"
#include "gpios.hpp"

#include "rs232.hpp"

char buffer[BUFLEN + 1];

//-------------------------------------------------

slu_c::slu_c() :
		unibusdevice_c()  // super class constructor
{

	//ip_host.value = IP_HOST; // not used
	//ip_port.value = IP_PORT; // not used

	// static config
	name.value = "SLU";
	type_name.value = "slu_c";
	log_label = "slu";

	set_default_bus_params(SLU_ADDR, SLU_VECTOR + 4, SLU_LEVEL); // base addr, intr-vector, intr level

	// init parameters

	// controller has some register
	register_count = slu_idx_count;

	reg_rcsr = &(this->registers[slu_idx_rcsr]); // @  base addr
	strcpy(reg_rcsr->name, "RCSR"); // Receiver Status Register
	reg_rcsr->active_on_dati = true;
	reg_rcsr->active_on_dato = true;
	reg_rcsr->reset_value = 0 & ! RCSR_RCVR_DONE;
	reg_rcsr->writable_bits = 0xff;

	reg_rbuf = &(this->registers[slu_idx_rbuf]); // @  base addr
	strcpy(reg_rbuf->name, "RBUF"); // Receiver Buffer Register
	reg_rbuf->active_on_dati = true; // no controller state change
	reg_rbuf->active_on_dato = true;
	reg_rbuf->reset_value = 0;
	reg_rbuf->writable_bits = 0xff;

	reg_xcsr = &(this->registers[slu_idx_xcsr]); // @  base addr
	strcpy(reg_xcsr->name, "XCSR"); // Transmitter Status Register
	reg_xcsr->active_on_dati = true;
	reg_xcsr->active_on_dato = true;
	reg_xcsr->reset_value = XCSR_XMIT_RDY; // set
	reg_xcsr->writable_bits = 0xff;

	reg_xbuf = &(this->registers[slu_idx_xbuf]); // @  base addr
	strcpy(reg_xbuf->name, "XBUF"); //Transmitter Buffer Register
	reg_xbuf->active_on_dati = true; // no controller state change
	reg_xbuf->active_on_dato = true;
	reg_xbuf->reset_value = 0;
	reg_xbuf->writable_bits = 0xff;

	// initialize serial format
	baudrate.value = 9600;
	mode.value = "8N1";
}

slu_c::~slu_c() {
}

bool slu_c::on_param_changed(parameter_c *param) {
	if (param == &enabled) {
		cport_nr = 2; /* UART2  */
		if (enabled.new_value) {
			// enable SLU: setup COM port
			if (RS232_OpenComport(cport_nr, baudrate.value, mode.value.c_str())) {
				ERROR("Can not open comport");
				return false; // reject "enable"
			}
			// lock serial format settings
			baudrate.readonly = true;
			mode.readonly = true;

			RS232_cputs(cport_nr, "Comport opened\n\r");
		} else {
			// disable SLU
			RS232_CloseComport(cport_nr);
			// lock serial format settings
			baudrate.readonly = false;
			mode.readonly = false;
		}
	}
	return unibusdevice_c::on_param_changed(param); // more actions (for enable)
}

//--------------------------------------------

// background worker.
void slu_c::worker(void) {
	timeout_c timeout;
	char mychar;
	int i, n;

	while (!worker_terminate) {
		timeout.wait_ms(SLU_MSRATE_MS);

		/* read character from socket */
		if (!(RCSR_RCVR_DONE & rcsr.value)) {
			bzero(buffer, BUFLEN);
#if 1
			if (slu_maint.value) {
				n = 1;
				buffer[0] = rbuf.value;
				buffer[1] = 0;
			} else
#endif
			{
				/* read serial data, if any */
				n = RS232_PollComport(cport_nr, (unsigned char*) buffer, 1);
			}
			for (i = 0; i < n; i++) {
				mychar = buffer[i];
				// transmit chr to bus
				rbuf.value = mychar;
				set_register_dati_value(reg_rbuf, rbuf.value, __func__);

				// signal data on bus ready to read
				rcsr.value |= RCSR_RCVR_DONE;
				set_register_dati_value(reg_rcsr, rcsr.value, __func__);
			}
		}

		// transfer received character to socket
		if (!(XCSR_XMIT_RDY & xcsr.value)) {
			buffer[0] = get_register_dato_value(reg_xbuf);
			RS232_SendByte(cport_nr, buffer[0]);

			// signal data written
			xcsr.value |= XCSR_XMIT_RDY;
			set_register_dati_value(reg_xcsr, xcsr.value, __func__);
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
void slu_c::on_after_register_access(unibusdevice_register_t *device_reg,
		uint8_t unibus_control) {

	if (unibus_control == UNIBUS_CONTROL_DATO) // bus write
		set_register_dati_value(device_reg, device_reg->active_dato_flipflops, __func__);

	switch (device_reg->index) {

	case slu_idx_rcsr:
		if (unibus_control == UNIBUS_CONTROL_DATO) { // bus write
			rcvr_interrupt_enable.value = !!(reg_rcsr->active_dato_flipflops
					& (RCSR_RCVR_INT_ENB));
			rdr_enable.value = !!(reg_rcsr->active_dato_flipflops & (RCSR_RDR_ENB));
		}
		break;

	case slu_idx_xbuf:
		if (unibus_control == UNIBUS_CONTROL_DATO) { // bus write
			// signal data has been written to bus
			xcsr.value &= ~ XCSR_XMIT_RDY;
			set_register_dati_value(reg_xcsr, xcsr.value, __func__);
			// get value from bus write and put it into rx buffer
			xbuf.value = reg_xbuf->active_dato_flipflops;
		}
		break;

	case slu_idx_xcsr:
		if (unibus_control == UNIBUS_CONTROL_DATO) { // bus write
			xmit_interrupt_enable.value = !!(reg_xcsr->active_dato_flipflops
					& (XCSR_XMIT_INT_ENB));
			slu_maint.value = !!(reg_xcsr->active_dato_flipflops & (XCSR_MAINT));
		}
		break;

	case slu_idx_rbuf:
		if (unibus_control == UNIBUS_CONTROL_DATI) { // bus read
			// signal data has been read from bus
			rcsr.value &= ~ RCSR_RCVR_DONE;
			set_register_dati_value(reg_rcsr, rcsr.value, __func__);
		}
		break;

	default:
		break;
	}

}

void slu_c::on_power_changed(void) {
	if (power_down) { // power-on defaults
	}
}

// UNIBUS INIT: clear all registers
void slu_c::on_init_changed(void) {
	// write all registers to "reset-values"
	if (init_asserted) {
		reset_unibus_registers();
		INFO("slu_c::on_init()");
	}
}

//--------------------------------------------------------------------------------------------------

ltc_c::ltc_c() :
		unibusdevice_c()  // super class constructor
{

	// static config
	name.value = "LTC";
	type_name.value = "ltc_c";
	log_label = "ltc";

	set_default_bus_params(LTC_ADDR, LTC_VECTOR, LTC_LEVEL); // base addr, intr-vector, intr level

	// init parameters

	// controller has some register
	register_count = ltc_idx_count;

	reg_lks = &(this->registers[ltc_idx_lks]); // @  base addr
	strcpy(reg_lks->name, "LKS"); // Line Clock Status Register
	reg_lks->active_on_dati = true; // no controller state change
	reg_lks->active_on_dato = true;
	reg_lks->reset_value = 0;
	reg_lks->writable_bits = 0xff;

}

ltc_c::~ltc_c() {
}

bool ltc_c::on_param_changed(parameter_c *param) {
	// no own parameter or "enable" logic here
	return unibusdevice_c::on_param_changed(param); // more actions (for enable)
}

// background worker.
void ltc_c::worker(void) {
	timeout_c timeout;
	while (!worker_terminate) {
		if (ltc_input.value) {
			//should really wait for LTC input trailing edge here
			timeout.wait_ms(10000);
		} else
			timeout.wait_ms(LTC_MSRATE_MS);
#if 0
		printf("[%o",buslatches_getval[0]);
#endif
		if (lke.value) {
			lks.value |= LKS_INT_MON;
			set_register_dati_value(reg_lks, lks.value, __func__);
		}

	}

}

// process DATI/DATO access to one of my "active" registers
void ltc_c::on_after_register_access(unibusdevice_register_t *device_reg,
		uint8_t unibus_control) {

	if (unibus_control == UNIBUS_CONTROL_DATO) // bus write
		set_register_dati_value(device_reg, device_reg->active_dato_flipflops, __func__);

	switch (device_reg->index) {

	case ltc_idx_lks:
		if (unibus_control == UNIBUS_CONTROL_DATI) { // bus read
													 // signal data has been read from bus
			lks.value &= ~ LKS_INT_MON;
			set_register_dati_value(reg_lks, lks.value, __func__);
		}
		if (unibus_control == UNIBUS_CONTROL_DATO) { // bus write
			lks.value = reg_lks->active_dato_flipflops;
			ltc_interrupt_enable.value = !!(reg_lks->active_dato_flipflops & (LKS_INT_ENB));
#if 0
			if (reg_lks->active_dato_flipflops && 1)
			{
				interrupt();
				//DEBUG("Interrupt!");
			}
#endif
		}
		break;

	default:
		break;
	}

}

void ltc_c::on_power_changed(void) {
	if (power_down) { // power-on defaults
	}
}

// UNIBUS INIT: clear all registers
void ltc_c::on_init_changed(void) {
	// write all registers to "reset-values"
	if (init_asserted) {
		reset_unibus_registers();
		INFO("ltc_c::on_init()");
	}
}

