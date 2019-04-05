/* pru1_statemachine_dma.h: state machine for bus master DMA

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

#ifndef  _PRU1_STATEMACHINE_DMA_H_
#define  _PRU1_STATEMACHINE_DMA_H_



// execution of a state. return : 1, if statemachine stopped
typedef uint8_t (*sm_dma_state_func_ptr)(void);


// Transfers a block of worst as data cycles
typedef struct {
	sm_dma_state_func_ptr state; // current state as ptr to  "state fucntion"
	uint8_t state_timeout; // timeout occured?
	uint16_t *dataptr ; // points to current word in mailbox.words[] ;
	uint16_t cur_wordsleft; // # of words left to transfer
} statemachine_dma_t;



#ifndef  _PRU1_STATEMACHINE_DMA_C_
extern statemachine_dma_t sm_dma;
#endif


void sm_dma_start(void) ;

#endif
