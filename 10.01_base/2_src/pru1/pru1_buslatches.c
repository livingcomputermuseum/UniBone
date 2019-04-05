/* pru1_buslatches.c: PRU function to access to multiplex signal registers

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
*/

#define _BUSLATCHES_C_

#include <stdlib.h>
#include <stdint.h>

#include "pru1_utils.h"
#include "mailbox.h"

#include "pru_pru_mailbox.h"
#include "pru1_buslatches.h"

volatile register uint32_t __R30;
volatile register uint32_t __R31;

buslatches_t buslatches;

// set register signals to standard
// all outputs to "inactive"
// init state
// UNIBUS lines all H / only BR4567, NPR_OUT auf LOW
void buslatches_reset() {
//	unsigned i;
	// chips are all 8bit width, but not all input/outputs are
	// connected to bidirektional terminated UNIBUS lines.
	// see PCB schematic!

	// invalidate cached register_state
//	buslatches.cur_reg_sel = 0xff; // invalid
//	buslatches.cur_reg_write = 1 ; // idle level is H

	// init all outputs: UNIBUS lines now all H = inactive

	buslatches_setbits(0, 0xff, 0x1f); // BG,NPG OUT: inactive = driver H = UNIBUS L
	buslatches_setbits(1, 0xff, 0x00); // all other: inactive = driver L = UNIBUS H
	buslatches_setbyte(2, 0x00);
	buslatches_setbyte(3, 0x00);
	buslatches_setbits(4, 0xff, 0x00);
	buslatches_setbyte(5, 0x00);
	buslatches_setbyte(6, 0x00);
	buslatches_setbits(7, 0xff, 0x00);

	// standard position: select register 4 with MSYN/SSYM
	// buslatches_setval(4, 0xff, 0x00);
}

#ifdef USED
/*
 *  read the REG_DATIN[0..7] pins
 */
uint8_t _buslatches_getval(uint8_t reg_sel) {
	// assert(reg_sel < 8);
	// assert: REG_WRITE always L

	// Always one of the input latches is driving the GPIOs

	if (buslatches.cur_reg_sel != reg_sel) {
		// repeated read to same address, or read after write,
		// don't need register setup and latch delay

		// select is PRU1_<8:10>
		// WRITE is PRU1_11, always H
		__R30 = (reg_sel << 8) | (1 << 11);
		buslatches.cur_reg_sel = reg_sel;
		// setup time for 74ac138: worst 10ns
		// setup time for 74LV541: 40ns at 3.3V
		// (setup time for 74lcx244: < 10ns !)
		// -> 8 cycles need, 2 already passed
		// Timing by code execution DANGEROUS if optimizer re-arranges!
		__delay_cycles(9);// 6 calculated, but not enough !!!!
	}

	// input latches now switch, value at PRU1_<0:7>
	return __R31 & 0xff;
}
#endif

#ifdef USED
// transfers a value in r14 to PRU0
// PRU0 writes this then to DATAOUT pins
// read-in on PRU 0 with
// loop:
//	xin	14,&r14,4
//  mov r40,r14
//	jmp loop
void pru1_pru0_dataout(uint32_t val) {
	// A 32bit parameter is received in r14
	// copy to PRU0 XFR area
	// "14" = device id of "other PRU"
	__asm(" xout 	14,&r14,4");
}
#endif

#ifdef USED
/*
 * write the REG_DATOUT[0..7] pins into one latch
 * only bits "bitmask" are written
 * cllaed with literal values for reg_sel and bitmask
 * verify inlining! (--auto_inline=)
 */
void _buslatches_setval(uint8_t reg_sel, uint8_t bitmask, uint8_t val) {
	// assert(reg_sel < 8);

	// merge new value with existing latch content
	val = (buslatches.cur_reg_val[reg_sel] & ~bitmask) | (val & bitmask);

	// set data. outputs on PRU0_<0:7>
	// critical timing: PRU0 code may need 35 ns, so set it first
	pru_pru_mailbox.pru0_r30 = val;// signal PRU0

	// select is PRU1_<8:10>
	__R30 = (reg_sel << 8);
	// WRITE is PRU1_11, set L to prepare L->H pulse

	// No optimization for unchanged reg_select here:
	// We still have to wait for PRU0 outputting data
	buslatches.cur_reg_sel = reg_sel;

	// setup time for 74ac138: worst 10ns
	// add another 10ns, security for PRU0 delay
	// worst case is PRU0 loop:  40ns, here 3 cycles passed. can be trimmed down?
	__delay_cycles(5);
	// E0 at 74LS377 reached

	// strobe WRITE L->H, latch data and WRITE back to idle
	__R30 = (reg_sel << 8) | (1 << 11);
	buslatches.cur_reg_val[reg_sel] = val;// remember state
}
#endif




/* Emulate a power cycle with ACLO/DCLO patterns
 */
void buslatches_powercycle() {
	// INIT: latch[7], bit 3
	// ACLO: latch[7], bit 4
	// DCLO: latch[7], bit 5
	buslatches_setbits(7, BIT(4), BIT(4)); // ACLO asserted
	__delay_cycles(MILLISECS(250)); // "power supply shuts down"
	buslatches_setbits(7, BIT(5), BIT(5)); // DCLO asserted
	__delay_cycles(MILLISECS(250)); // "power is OFF now"
	buslatches_setbits(7, BIT(4), 0); // ACLO deasserted
	__delay_cycles(MILLISECS(250)); // "power supply stabilizing"
	buslatches_setbits(7, BIT(5), 0); // DCLO deasserted
	// CPU has to generate INIT and BBSY
}

// timing test of register select logic
// write 4 values to full 8 bit latches 2,3,5,6
// read back and compare.
// errorflag is PRU1.12
volatile register uint32_t __R30;
volatile register uint32_t __R31;

// #define TEST_66MHZ
#define TEST_WRITE_READ_DELAY
// #define TEST_CROSSTALK
// #define TEST_WRITE_READ_VERIFY

void buslatches_test(uint8_t a, uint8_t b, uint8_t c, uint8_t d) {

	// be sure the PRU1 GPI are in "Direct Input Mode"
	// spruh73n, chapter 4.4.1.2.3.2,
	CT_CFG.GPCFG1_bit.PRU1_GPI_MODE = 0;

	DEBUG_PIN_SET(0); // clear, no error

#ifdef TEST_66MHZ
	while (1) {
		__R30 |= (1 << 12); // set PRU1.12
		__R30 &= ~(1 << 12); // clear PRU1.12
	}
#endif

#ifdef TEST_WRITE_READ_DELAY
	// measures total time between GPI out and GPUIO in.
	// should be 10ns, is 40ns !
	// separate DATIN7 from 74LVTH, connect to PRU1.12
	while (1) {
		__R30 |= (1 << 12); // set PRU1.12
		while (!(__R31 & 0x80))
		;// wait until readback on DATAIN7

		__R30 &= ~(1 << 12);// clear PRU1.12
		while (__R31 & 0x80)
		;// wait until readback on DATAIN7
	}
#endif

#ifdef TEST_CROSSTALK
	// const pattern of 00 ff 00 ff on latch inputs.
	// register selct causes fast switch of all 8 DATAIN.
	// Crosstalk on logic analyzers?
	a = c = 0x00;
	b = d = 0xff;
	// read/write sequence: mix of read-read and read-write
	buslatches_setbyte(2, a)
	;
	buslatches_setbyte(3, b)
	;
	buslatches_setbyte(5, c)
	;
	buslatches_setbyte(6, d)
	;

	while (mailbox.arm2pru_req == ARM2PRU_BUSLATCH_TEST) {
		uint8_t resvar;
		// echo DATA0 read only
		buslatches_get2(2,resvar);
		DEBUG_PIN_SET(buslatches_get(2) != a);
		// buslatches_debug_set(resvar & 1);
		buslatches_get2(3,resvar);
		DEBUG_PIN_SET(buslatches_get(3) != b);
		//buslatches_debug_set(resvar & 1);
		buslatches_get2(5,resvar);
		DEBUG_PIN_SET(buslatches_get(5) != c);
		//buslatches_debug_set(resvar & 1);
		buslatches_get2(6,resvar);
		DEBUG_PIN_SET(buslatches_get(6) != d);
		//buslatches_debug_set(resvar & 1);
	}
#endif

#ifdef TEST_WRITE_READ_VERIFY
	// write moving patterns into latches, read back and verify.
	// PRU1.12 is set on mismatch
	while (mailbox.arm2pru_req == ARM2PRU_BUSLATCH_TEST) {

		// read/write sequence: mix of read-read and read-write
		buslatches_setbyte(2, a)
		;
		buslatches_setbyte(3, b)
		;
		buslatches_setbyte(5, c)
		;
		if (buslatches_get(2) != a)
		DEBUG_PIN_PULSE_100NS
		;// show error flag. cleared by next reg_sel
		buslatches_setbyte(6, d)
		;
		if (buslatches_get(3) != b)
		DEBUG_PIN_PULSE_100NS;
		if (buslatches_get(5) != c)
		DEBUG_PIN_PULSE_100NS;
		if (buslatches_get(6) != d)
		DEBUG_PIN_PULSE_100NS;
		a++;
		b++;
		c++;
		d++;
	}
#endif
}
