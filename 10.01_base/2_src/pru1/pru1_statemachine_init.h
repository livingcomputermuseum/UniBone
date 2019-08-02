/* pru1_statemachine_init.h: state machine for pulse on INIT

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
#ifndef  _PRU1_STATEMACHINE_INIT_H_
#define  _PRU1_STATEMACHINE_INIT_H_

#include <stdint.h>

#include "pru1_utils.h"	// statemachine_state_func

#define INITPULSE_DELAY_MS	250 	// length of INIT pulse

#ifndef  _PRU1_STATEMACHINE_INIT_C_
extern uint8_t prev_initialization_signals;
#endif

void do_event_initializationsignals(void);

void sm_init_reset(void);
statemachine_state_func sm_init_start();

#endif
