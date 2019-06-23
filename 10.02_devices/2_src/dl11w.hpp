/* DL11W.hpp: sample UNIBUS controller with SLU & LTC logic

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
 20/12/2018 djrm copied to make DL11-W device
 */
#ifndef _DL11W_HPP_
#define _DL11W_HPP_

#include <fstream>

using namespace std;

#include "utils.hpp"
#include "unibusdevice.hpp"
#include "parameter.hpp"

// socket console settings
//#define IP_PORT 5001
//#define IP_HOST "localhost"

// bus properties
#define DL11A 1
#if DL11A // console (teletype keyboard & printer)
#define SLU_ADDR	0777560
#define SLU_LEVEL	04
#define SLU_VECTOR	060
#elif DL11B // paper tape punch and reader
#define SLU_ADDR	0777550
#define SLU_LEVEL	04
#define SLU_VECTOR	070
#else // other serial device
#define SLU_ADDR	0776500
#define SLU_LEVEL	04
#define SLU_VECTOR	0300
#endif
//#define LTC_ADDR	0777546
// moved here to avoid clash with physical LTC installed
#define LTC_ADDR	0777544
#define LTC_LEVEL   06
#define LTC_VECTOR  0100

// global text buffer size for hostname etc
#define BUFLEN 32

// register bit definitions
#define RCSR_RCVR_ACT    	004000
#define RCSR_RCVR_DONE		000200
#define RCSR_RCVR_INT_ENB   000100
#define RCSR_RDR_ENB		000001

#define RBUF_ERROR			(1 << 15)
#define RBUF_OR_ERR			(1 << 14)
#define RBUF_FR_ERR			(1 << 13)
#define RBUF_P_ERR			(1 << 12)

#define XCSR_XMIT_RDY		000200
#define XCSR_XMIT_INT_ENB   000100
#define XCSR_MAINT			000004
#define XCSR_BREAK          000001

#define LKS_INT_ENB			000100
#define LKS_INT_MON			000200

// background task sleep times
#define SLU_MSRATE_MS  10
#define LTC_MSRATE_MS  50

// unibus register indices
enum slu_reg_index {
	slu_idx_rcsr = 0, slu_idx_rbuf, slu_idx_xcsr, slu_idx_xbuf, slu_idx_count,
};

enum ltc_reg_index {
	ltc_idx_lks = 0, ltc_idx_count,
};

// ------------------------------------------ SLU -----------------------------
class slu_c: public unibusdevice_c {
private:
	int cport_nr; // COM port handle for RS232 library

	unibusdevice_register_t *reg_rcsr;
	unibusdevice_register_t *reg_rbuf;
	unibusdevice_register_t *reg_xcsr;
	unibusdevice_register_t *reg_xbuf;

public:

	slu_c();
	~slu_c();

	//parameter_string_c   ip_host = parameter_string_c(  this, "SLU socket IP host", "host", /*readonly*/ false, "ip hostname");
	//parameter_unsigned_c ip_port = parameter_unsigned_c(this, "SLU socket IP port", "port", /*readonly*/ false, "", "%d", "ip port", 32, 10);
	parameter_unsigned_c baudrate = parameter_unsigned_c(this, "baudrate", "b", /*readonly*/
			false, "", "%d", "Baudrate: 110, 300, ... 115200", 115200, 10);
	parameter_string_c mode = parameter_string_c(this, "mode", "m", /*readonly*/false,
			"Mode: 8N1, 7E1, ... ");

	// @David: duplicating device registers as parameters is not necessary ...
	// they can be seen with "exam" anyhow.
	parameter_unsigned_c rcsr = parameter_unsigned_c(this, "Receiver Status Register", "rcsr", /*readonly*/
			false, "", "%o", "Internal state", 32, 8);
	parameter_unsigned_c rbuf = parameter_unsigned_c(this, "Receiver Buffer Register", "rbuf", /*readonly*/
			false, "", "%o", "Internal state", 32, 8);
	parameter_unsigned_c xcsr = parameter_unsigned_c(this, "Transmitter Status Register",
			"xcsr", /*readonly*/false, "", "%o", "Internal state", 32, 8);
	parameter_unsigned_c xbuf = parameter_unsigned_c(this, "Transmitter Buffer Register",
			"xbuf", /*readonly*/false, "", "%o", "Internal state", 32, 8);

	parameter_bool_c xmit_interrupt_enable = parameter_bool_c(this, "XMIT interrupt enable",
			"xie",/*readonly*/false, "1 = enable interrupt");
	parameter_bool_c rcvr_interrupt_enable = parameter_bool_c(this, "RCVR interrupt enable",
			"rie",/*readonly*/false, "1 = enable interrupt");
	parameter_bool_c slu_maint = parameter_bool_c(this, "XCSR Maintenance", "maint",/*readonly*/
			false, "1 = enable Maintenance mode enabled");
	parameter_bool_c rdr_enable = parameter_bool_c(this, "RDR enable", "rdre",/*readonly*/false,
			"1 = enable reader enable");

	// background worker function
	void worker(void) override;

	// called by unibusadapter on emulated register access
	void on_after_register_access(unibusdevice_register_t *device_reg, uint8_t unibus_control)
			override;

	bool on_param_changed(parameter_c *param) override;  // must implement
	void on_power_changed(void) override;
	void on_init_changed(void) override;
};

//-------------------------------------------- LTC -------------------------------------
class ltc_c: public unibusdevice_c {
private:

	unibusdevice_register_t *reg_lks;

public:

	ltc_c();
	~ltc_c();

	parameter_unsigned_c lks = parameter_unsigned_c(this, "Line Clock Status Register", "lks", /*readonly*/
			false, "", "%o", "Internal state", 32, 8);
	parameter_bool_c lke = parameter_bool_c(this, "LKS timer enable", "lke",/*readonly*/false,
			"1 = enable update of LKS_IMON by timer");
	parameter_bool_c ltc_input = parameter_bool_c(this, "LTC input enable", "ltc",/*readonly*/
			false, "1 = enable update of LKS_IMON by LTC Input");
	parameter_bool_c ltc_interrupt_enable = parameter_bool_c(this, "LTC interrupt enable",
			"lie",/*readonly*/false, "1 = enable interrupt");

	// background worker function
	void worker(void) override;

	// called by unibusadapter on emulated register access
	void on_after_register_access(unibusdevice_register_t *device_reg, uint8_t unibus_control)
			override;

	bool on_param_changed(parameter_c *param) override;  // must implement
	void on_power_changed(void) override;
	void on_init_changed(void) override;
	/*
	 void change_state(unsigned new_state);
	 void do_command_done(void);
	 */
};

#endif
