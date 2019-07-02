/* pru1_statemachine_arbitration.h: state machine for INTR/DMA arbitration

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

   29-jun-2019	JH		rework: state returns ptr to next state func
   12-nov-2018  JH      entered beta phase
*/
#ifndef  _PRU1_STATEMACHINE_ARBITRATION_H_
#define  _PRU1_STATEMACHINE_ARBITRATION_H_

#include "pru1_utils.h"	// statemachine_state_func

typedef struct {
	uint8_t priority_bit ; // single priority bit for this arbitration process
	// one of ARBITRATION_PRIORITY_*
} statemachine_arbitration_t;


#ifndef  _PRU1_STATEMACHINE_ARBITRATION_C_
extern statemachine_arbitration_t sm_arb;
#endif

statemachine_state_func sm_arb_start(uint8_t priority_bit);
statemachine_state_func sm_arb_state_idle(void) ;

#endif
