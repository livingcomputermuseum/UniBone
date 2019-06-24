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
#include <assert.h>
#include <errno.h>
#include <iostream>
#include <netdb.h>
#include <netinet/in.h>

#include "utils.hpp"
#include "gpios.hpp"
#include "unibusadapter.hpp"
#include "unibusdevice.hpp"	// definition of class device_c
#include "unibus.h"
#include "dl11w.hpp"

#include "rs232.hpp"

//-------------------------------------------------

slu_c::slu_c() : unibusdevice_c() {
	set_workers_count(2); // receiver and transmitte have own threads

	//ip_host.value = IP_HOST; // not used
	//ip_port.value = IP_PORT; // not used

	// static config
	name.value = "SLU";
	type_name.value = "slu_c";
	log_label = "slu";

	// SLU has 2 Interrupt vectors: base = RCV, base+= XMT
	set_default_bus_params(SLU_ADDR, SLU_VECTOR, SLU_LEVEL); // base addr, intr-vector, intr level

	// init parameters

	// controller has some register
	register_count = slu_idx_count;

	reg_rcsr = &(this->registers[slu_idx_rcsr]); // @  base addr
	strcpy(reg_rcsr->name, "RCSR"); // Receiver Status Register
	reg_rcsr->active_on_dati = false;
	reg_rcsr->active_on_dato = true;
	reg_rcsr->reset_value = 0;
	reg_rcsr->writable_bits = 0xff;

	reg_rbuf = &(this->registers[slu_idx_rbuf]); // @  base addr
	strcpy(reg_rbuf->name, "RBUF"); // Receiver Buffer Register
	reg_rbuf->active_on_dati = true;
	reg_rbuf->active_on_dato = true; // required for "active on dati""
	reg_rbuf->reset_value = 0;
	reg_rbuf->writable_bits = 0x00;

	reg_xcsr = &(this->registers[slu_idx_xcsr]); // @  base addr
	strcpy(reg_xcsr->name, "XCSR"); // Transmitter Status Register
	reg_xcsr->active_on_dati = false;
	reg_xcsr->active_on_dato = true;
	reg_xcsr->reset_value = XCSR_XMIT_RDY; // set
	reg_xcsr->writable_bits = 0xff;

	reg_xbuf = &(this->registers[slu_idx_xbuf]); // @  base addr
	strcpy(reg_xbuf->name, "XBUF"); //Transmitter Buffer Register
	reg_xbuf->active_on_dati = false; // no controller state change
	reg_xbuf->active_on_dato = true;
	reg_xbuf->reset_value = 0;
	reg_xbuf->writable_bits = 0xff;

	// initialize serial format
	serialport.value = "ttyS2"; // labeled "UART2" on PCB
	baudrate.value = 9600;
	mode.value = "8N1";
}

slu_c::~slu_c() {
}

bool slu_c::on_param_changed(parameter_c *param) {
	if (param == &enabled) {
		if (enabled.new_value) {
			// enable SLU: setup COM serial port
			// setup for BREAK and parity evaluation
			if (rs232.OpenComport(serialport.value.c_str(), baudrate.value, mode.value.c_str(),
			true)) {
				ERROR("Can not open serial port %s", serialport.value.c_str());
				return false; // reject "enable"
			}

			// lock serial port and settings
			serialport.readonly = true;
			baudrate.readonly = true;
			mode.readonly = true;

			INFO("Serial port %s opened", serialport.value.c_str());
			rs232.cputs("Serial port opened\n\r");
		} else {
			// disable SLU
			rs232.CloseComport();
			// unlock serial port and settings
			serialport.readonly = false;
			baudrate.readonly = false;
			mode.readonly = false;
			INFO("Serial port %s closed", serialport.value.c_str());
		}
	}
	return unibusdevice_c::on_param_changed(param); // more actions (for enable)
}

//--------------------------------------------

// Update RCSR
void slu_c::set_rcsr_dati_value(void) {
	uint16_t val = (rcv_active ? RCSR_RCVR_ACT : 0) | (rcv_done ? RCSR_RCVR_DONE : 0)
			| (rcv_intr_enable ? RCSR_RCVR_INT_ENB : 0);
	set_register_dati_value(reg_rcsr, val, __func__);
}

// PDP-11 writes into RCSR
void slu_c::eval_rcsr_dato_value(void) {
	uint16_t val = get_register_dato_value(reg_rcsr);
	bool old_rdr_enab = rcv_rdr_enb;
	bool old_intr = rcv_done && rcv_intr_enable;

	rcv_intr_enable = val & RCSR_RCVR_INT_ENB ? 1 : 0;
	rcv_rdr_enb = val & RCSR_RDR_ENB ? 1 : 0;
	if (!old_rdr_enab && rcv_rdr_enb)
		rcv_done = 0; // raising edge clears rcv_done
	// if rcvr_done and int enable goes high: INTR
	bool new_intr = rcv_done && rcv_intr_enable;
	if (!old_intr && new_intr) // raising edge
		interrupt(intr_vector.value, intr_level.value);
}

// Update RBUF, readonly
void slu_c::set_rbuf_dati_value(void) {
	uint16_t val = (rcv_or_err ? RBUF_OR_ERR : 0) | (rcv_fr_err ? RBUF_FR_ERR : 0)
			| (rcv_p_err ? RBUF_P_ERR : 0);
	if (val) // set general error flag
		val |= RBUF_ERROR;
	val |= rcv_buffer; // received char in bits 7..0
	set_register_dati_value(reg_rbuf, val, __func__);
}

// Update Transmit Status Register XCSR
void slu_c::set_xcsr_dati_value(void) {
	uint16_t val = (xmt_ready ? XCSR_XMIT_RDY : 0) | (xmt_intr_enable ? XCSR_XMIT_INT_ENB : 0)
			| (xmt_maint ? XCSR_MAINT : 0) | (xmt_break ? XCSR_BREAK : 0);
	set_register_dati_value(reg_xcsr, val, __func__);
}

void slu_c::eval_xcsr_dato_value(void) {
	uint16_t val = get_register_dato_value(reg_xcsr);
	bool old_intr = xmt_ready && xmt_intr_enable;
	bool old_break = xmt_break;

	xmt_intr_enable = val & XCSR_XMIT_INT_ENB ? 1 : 0;
	xmt_maint = val & XCSR_MAINT ? 1 : 0;
	xmt_break = val & XCSR_BREAK ? 1 : 0;
	// if xmt_ready and int enable goes high: INTR
	bool new_intr = xmt_ready && xmt_intr_enable;
	if (!old_intr && new_intr) // raising edge
		interrupt(intr_vector.value + 4, intr_level.value);
	if (old_break != xmt_break)
		rs232.SetBreak(xmt_break);
}

void slu_c::eval_xbuf_dato_value(void) {
	// transmit data buffer contains only the character in bits 7..0
	xmt_buffer = get_register_dato_value(reg_xbuf) & 0xff;
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

//	if (unibus_control == UNIBUS_CONTROL_DATO) // bus write 
//		set_register_dati_value(device_reg, device_reg->active_dato_flipflops, __func__);

	switch (device_reg->index) {

	case slu_idx_rcsr:
		if (unibus_control == UNIBUS_CONTROL_DATO) { // bus write into RCSR
			pthread_mutex_lock(&on_after_rcv_register_access_mutex); // signal changes atomic against UNIBUS accesses
			eval_rcsr_dato_value(); // may generate INTR
			set_rcsr_dati_value();
			// ignore reader enable
			pthread_mutex_unlock(&on_after_rcv_register_access_mutex);
		}
		break;
	case slu_idx_rbuf: { // DATI/DATO: is read only, but write also clears "rcvr_done"
		// signal data has been read from bus
		pthread_mutex_lock(&on_after_rcv_register_access_mutex);
		rcv_done = 0;
		set_rcsr_dati_value();
		pthread_mutex_unlock(&on_after_rcv_register_access_mutex);
	}
		break;
	case slu_idx_xcsr:
		if (unibus_control == UNIBUS_CONTROL_DATO) { // bus write
			pthread_mutex_lock(&on_after_xmt_register_access_mutex);
			eval_xcsr_dato_value(); // may trigger INTR
			set_xcsr_dati_value();
			pthread_mutex_unlock(&on_after_xmt_register_access_mutex);
		}
		break;
	case slu_idx_xbuf:
		if (unibus_control == UNIBUS_CONTROL_DATO) { // bus write into XBUF
			pthread_mutex_lock(&on_after_xmt_register_access_mutex);
			eval_xbuf_dato_value();
			xmt_ready = 0; // signal worker: xmt_data pending
			set_xcsr_dati_value();
			// on_after_register_access_cond used for xmt worker
			pthread_cond_signal(&on_after_xmt_register_access_cond);
			pthread_mutex_unlock(&on_after_xmt_register_access_mutex);
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
		rcv_active = 0;
		rcv_done = 0;
		rcv_intr_enable = 0;
		rcv_or_err = 0;
		rcv_fr_err = 0;
		rcv_p_err = 0;
		rcv_buffer = 0;
		xmt_ready = 1;
		xmt_intr_enable = 0;
		xmt_maint = 0;
		xmt_break = 0;
		INFO("slu_c::on_init()");
	}
}

// background worker.
void slu_c::worker_rcv(void) {
	timeout_c timeout;
	int n;
	char buffer[BUFLEN + 1];

	// 1. poll with frequency > baudrate, to see single bits
	unsigned poll_periods_us = 1000000 / baudrate.value;

	while (!workers_terminate) {
		timeout.wait_us(poll_periods_us);
		// "query
		// rcv_active: can only be set by polling the UART inpit GPIiO pin?
		// at the moments, it is onyl sen on maintenance loopback xmt
		/* read serial data, if any */
		if (rs232.PollComport((unsigned char*) buffer, 1)) {
			pthread_mutex_lock(&on_after_rcv_register_access_mutex); // signal changes atomic against UNIBUS accesses
			rcv_or_err = rcv_fr_err = rcv_p_err = 0;
			if (rcv_done) // not yet cleared? overrun!
				rcv_or_err = 1;
			if (buffer[0] == 0xff) {
				/* How to receive framing and parity errors:  see termios(3)
				 If IGNPAR=0, PARMRK=1: error on <char> received as \377 \0 <char> 
				 \377 received as \377 \377
				 */
				n = rs232.PollComport((unsigned char*) buffer, 1);
				assert(n);	// next char after 0xff escape immediately available

				if (buffer[0] == 0) { // error flags
					rcv_fr_err = rcv_p_err = 1;
					n = rs232.PollComport((unsigned char*) buffer, 1);
					assert(n); // next char after 0xff 0 seq is data"
					rcv_buffer = buffer[0];
					rcv_done = 1;
				} else if (buffer[0] == 0xff) { // enocoded 0xff
					rcv_buffer = 0xff;
				} else {
					WARNING("Received 0xff <stray> seqeuence");
					rcv_buffer = buffer[0];
				}
			} else
				// received non escaped data byte
				rcv_buffer = buffer[0];
			rcv_done = 1;
			set_rbuf_dati_value();
			set_rcsr_dati_value(); // INTR!
			pthread_mutex_unlock(&on_after_rcv_register_access_mutex); // signal changes atomic against UNIBUS accesses
		}
	}
}

void slu_c::worker_xmt(void) {
	timeout_c timeout;
	assert(!pthread_mutex_lock(&on_after_register_access_mutex));
	while (!workers_terminate) {
		// 1. wait for xmt signal
		int res = pthread_cond_wait(&on_after_xmt_register_access_cond, &on_after_xmt_register_access_mutex);
		// on_after_xmt_register_access_mutex remains locked all the time
		if (res != 0) {
			ERROR("SLU::worker_xmt() pthread_cond_wait = %d = %s>", res, strerror(res));
			continue;
		}

		// 2. transmit
		rs232.SendByte(xmt_buffer);
		xmt_ready = 0;
		set_xcsr_dati_value();
		if (xmt_maint) { // loop back: simulate data byte coming in
			pthread_mutex_lock(&on_after_rcv_register_access_mutex);
			rcv_active = 1;
			set_rcsr_dati_value();
			pthread_mutex_unlock(&on_after_rcv_register_access_mutex);
		}

		// 3. wait for data byte being shifted out
		pthread_mutex_unlock(&on_after_xmt_register_access_mutex);
		timeout.wait_us(rs232.TransmissionTime_us);
		pthread_mutex_lock(&on_after_xmt_register_access_mutex);
		if (xmt_maint)
			// put sent byte into rcv buffer, receiver will poll it
			rs232.LoopbackByte(xmt_buffer);
		xmt_ready = 1;
		set_rcsr_dati_value(); // generates interrupt
		set_xcsr_dati_value();
		// has rcv or xmt interrupt priority on maintennace loop back
	}
	assert(!pthread_mutex_unlock(&on_after_xmt_register_access_mutex));
}

void slu_c::worker(unsigned instance) {
	// 2 parallel worker() instances: 0 and 1 
	if (instance == 0)
		worker_rcv();
	else
		worker_xmt();

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
void ltc_c::worker(unsigned instance) {
	UNUSED(instance); // only one
	timeout_c timeout;
	while (!workers_terminate) {
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
			interrupt(intr_vector.value, intr_level.value);
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

