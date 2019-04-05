/* pru1_buslatches.h: PRU function to access to multiplex signal registers

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
#ifndef _BUSLATCH_H_
#define _BUSLATCH_H_

#include <stdint.h>

#include "pru_pru_mailbox.h"

typedef struct {
	uint8_t cur_reg_val[8]; // content of output latches

	// # of bits in each register connected bidirectionally to UNIBUS
	// ( for example, LTC ignored)
	uint8_t bidi_bitwidth[8]; // # of bits in each
//	uint32_t 	bidi_bitmask[8] ; // mask with valid bits

//	uint8_t 	cur_reg_sel; // state of SEL A0,A1,A2 = PRU1_<8:10>
//	uint32_t 	cur_reg_write ; // state of REG_WRITE= PRU1_11>

} buslatches_t;

#ifndef _BUSLATCH_C_
extern buslatches_t buslatches;
#endif


/*
 * Read timing:
 * 5ns on PRU to ouptput 0/1 level
 * 10ns until register select is stable (includes jitter on addr0:2)
 * 10 ns for 74LVTH to switch
 * 5ns for changing edge voltage level of DATIN signals
 * 5ns for PRU to sync with DATIN signals
 *
 * timing verifyed with buslatches_test()!
 * 74LV541: delay(10)
 * 74LVTH541: delay()
 * */
#define buslatches_get(reg_sel)	(					\
	    ( __R30 = ((reg_sel) << 8) | (1 << 11),				\
	    __delay_cycles(10)                      				\
	), 									\
	(__R31 & 0xff)                            				\
	)

// 8 OK?
#define buslatches_get2(reg_sel,resvar)	do {					\
	__R30 = ((reg_sel) << 8) | (1 << 11) ;				\
	__delay_cycles(10) ;                     				\
	resvar = __R31 & 0xff ;                            				\
} while(0)



// identify register which must be set byte-wise
#define BUSLATCH_REG_IS_BYTE(reg_sel) (                                            \
	((reg_sel) == 2) || ((reg_sel) == 3) || ((reg_sel) == 6) || ((reg_sel) == 7) \
	)

/*******************************************************************************
 Timing write latches 74xx377

1 char = 5ns
lower letter = program event
Upper letter = circuit event

Circuit timing 74HCT377: (74LS a few percent faster)
---------------------------------------------------
Reference = Clock L->H = E
A-E = Setup E* = 22 ns (typ. 12)
C-E = Setup Data = 12 ns (typ. 4)
D-E = pulsewidth = 20ns (typ. 8)
E-B = setup E* = 22 ns (typ 12) deselect

                     a  A  b  B
(A-B)Select E*     ------______--
                     c    C
(C)  Data          XXXXXXXX--XXXX
                       dD  eE
(D+E) Strobe CP       ---____---

=> ac -> d = 10ns (minimal)
d -> be = 15ns


Delay program-circuit

a-A: 5 + 10 ns (PRU + 3:8 74ac138)
b-B = a-A
c-D: 25ns  (pru1_buslatches_pru0_datout.asmsrc)
d-D: 5ns
e-E: 5ns
*******************************************************************************/

#define REGWRITE_SETUP_CYCLES	6 /* errors with 3 */

#define buslatches_setbits(reg_sel,bitmask,val) do {	\
	uint8_t	_tmpval ;                                                           \
	/* assert(reg_sel < 8);                                    	      */\
                                                                                \
	/* merge new value with existing latch content                        */\
	_tmpval = (buslatches.cur_reg_val[reg_sel] & ~(bitmask)) | ((val) & (bitmask)); \
                                                                                \
	/* set data. outputs on PRU0_<0:7>                                    */\
	/* TODO: OPTIMIZE THIS. regsel first? PRU0 first? Signal quality?      */\
	/* critical timing: PRU0 code may need 25 ns, so set it first         */\
	/*pru_pru_mailbox.pru0_r30 = _tmpval;  signal PRU0                        */\
	buslatches_pru0_dataout(_tmpval) ; \
                                                                                \
	/* select is PRU1_<8:10>                                              */\
	/* WRITE is PRU1_11, set L to prepare L->H pulse                      */\
	__R30 = (reg_sel << 8);                                                 \
                                                                                \
	/* setup time for 74ac138: worst 10ns                                 */\
	/* add another 10ns, security for PRU0 delay                          */\
	/* worst case is PRU0 loop:  40ns, here 5 cycles passed.              */\
	buslatches.cur_reg_val[reg_sel] = _tmpval; /* remember state */          \
                                                                                \
	__delay_cycles(REGWRITE_SETUP_CYCLES-2);	/* errors with 3 */						\
	/* "-2": extra time for "cur_regval =" */						\
	/* E0 at 74LS377 reached                                              */  \
                                                                                \
	/* strobe WRITE L->H, latch data and WRITE back to idle               */\
	__R30 = (reg_sel << 8) | (1 << 11);                                     \
                                                                                \
	} while(0)

// set a register as byte.
// no value caching, so register may never be accessed bitwise
// only to be used for 2 (addr0..7), 3 (adr 8..15), 5 (data0..7), 6(data 8..15)
#define buslatches_setbyte(reg_sel,val) do {	\
	/* set data. outputs on PRU0_<0:7>                                    */\
	/* TODO: OPTIMIZE THIS. regsel first? PRU0 first? Signal quality?      */\
	/* critical timing: PRU0 code may need 35 ns, so set it first         */\
	/*pru_pru_mailbox.pru0_r30 = _tmpval;  signal PRU0                        */\
	buslatches_pru0_dataout(val) ; \
                                                                                \
	/* select is PRU1_<8:10>                                              */\
	/* WRITE is PRU1_11, set L to prepare L->H pulse                      */\
	__R30 = ((reg_sel) << 8);                                                 \
                                                                                \
	/* setup time for 74ac138: worst 10ns                                 */\
	/* add another 10ns, security for PRU0 delay                          */\
	/* worst case is PRU0 loop:  25ns, here 5 cycles passed.              */\
	__delay_cycles(REGWRITE_SETUP_CYCLES);	/* errors with 3 */						\
	/* E0 at 74LS377 reached                                              */  \
                                                                                \
	/* strobe WRITE L->H, latch data and WRITE back to idle               */\
	__R30 = ((reg_sel) << 8) | (1 << 11);                                     \
                                                                                \
	} while(0)


void buslatches_reset(void);

// real subroutines, for debugging
uint8_t _buslatches_getval(uint8_t reg_sel);

void _buslatches_setval(uint8_t reg_sel, uint8_t bitmask, uint8_t val);

// extern "C" {
void buslatches_pru0_dataout(uint32_t val) ;

void buslatches_powercycle(void);
void buslatches_test(uint8_t a, uint8_t b,uint8_t c, uint8_t d) ;


#endif
