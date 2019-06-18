/* mailbox.h: Command and status data structures common to ARM and PRU

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


#ifndef _MAILBOX_H_
#define _MAILBOX_H_

#include <stdint.h>
#include "unibus.h"

// arm to pru
#define ARM2PRU_NONE	0	// don't change
#define ARM2PRU_HALT	1	// run PRU1 into halt
#define ARM2PRU_MAILBOXTEST1	2
#define ARM2PRU_BUSLATCH_INIT	3	// reset all mux registers to "neutral"
#define ARM2PRU_BUSLATCH_SET	4	// set a mux register
#define ARM2PRU_BUSLATCH_GET	5 	// read a mux register
#define ARM2PRU_BUSLATCH_EXERCISER	6 	// exercise 8 accesses to mux registers
#define ARM2PRU_BUSLATCH_TEST	7 	// read a mux register
#define ARM2PRU_INITPULSE	8 	// pulse UNIBUS INIT
#define ARM2PRU_POWERCYCLE	9 	// ACLO/DCLO power cycle simulation
#define ARM2PRU_DMA_ARB_NONE		10               // DMA without NPR/NPG/SACK arbitration 
#define ARM2PRU_DMA_ARB_CLIENT		11               // DMA with arbitration by external Arbitrator
#define ARM2PRU_DMA_ARB_MASTER		12               // DMA as Arbitrator
#define ARM2PRU_DDR_FILL_PATTERN	13	// fill DDR with test pattern
#define ARM2PRU_DDR_SLAVE_MEMORY	14	// use DDR as UNIBUS slave memory
#define ARM2PRU_INTR	15               // INTR, only with arbitration

// possible states of DMA machine
#define DMA_STATE_READY	0        	// idle
#define DMA_STATE_ARBITRATING	1	// in NPR/NPG/SACK arbitration
#define DMA_STATE_RUNNING	2	// transfering data
#define DMA_STATE_TIMEOUTSTOP	3	// stop because of UNIBUS timeout
#define DMA_STATE_INITSTOP	4	// stop because INIT signal sensed

// bits BR*/NPR interrupts in buslatch 0 and 1
#define ARBITRATION_PRIORITY_BIT_B4	0x01
#define ARBITRATION_PRIORITY_BIT_B5	0x02
#define ARBITRATION_PRIORITY_BIT_B6	0x04
#define ARBITRATION_PRIORITY_BIT_B7	0x08
#define ARBITRATION_PRIORITY_BIT_NP	0x10
#define ARBITRATION_PRIORITY_MASK	0x1f

#include "ddrmem.h"

/***** start of shared structs *****/
// on PRU. all struct are byte-packed, no "#pragma pack" there
// (support answer 20.5.2018,  issue CODEGEN-4832)
#ifdef ARM
#pragma pack(push,1)
#endif

typedef struct {
	uint32_t addr; // register 0..7
	uint32_t val; // value set/get.
} mailbox_test_t;

typedef struct {
	uint32_t addr; // register 0..7
	uint32_t bitmask; // change only these bits in register
	uint32_t val; // value set/get.
} mailbox_buslatch_t;

#define MAILBOX_BUSLATCH_EXERCISER_PATTERN_COUNT	4
typedef struct {
	uint8_t	pattern ; // input: which access pattern?
	uint8_t addr[8] ; // access sequence of register addresses
	uint8_t writeval[8] ; // data value for each
	uint8_t readval[8] ; // read back results
} mailbox_buslatch_exerciser_t;


typedef struct {
	uint8_t addr_0_7;	// start values for test sequence
	uint8_t addr_8_15;
	uint8_t data_0_7;
	uint8_t data_8_15;
} mailbox_buslatch_test_t;

// data for a requested DMA operation
#define	MAX_DMA_WORDCOUNT	512
typedef struct {
	// take care of 32 bit word borders for struct members
	uint8_t cur_status; // 0 = idle, 1 = running, 2 = timeout error
	uint8_t control; // cycle to perform: only DATO, DATI allowed
	uint16_t wordcount; // # of remaining words transmit/receive, static
	uint32_t cur_addr; // current address in tranwfer, if timeout: offending address.
	uint32_t startaddr; // address of 1st word to transfer
	uint16_t words[MAX_DMA_WORDCOUNT]; // buffer for rcv/xmt data
} mailbox_dma_t;

// vector for an INTR transaction
typedef struct {
	uint16_t vector; // interrupt vector to be transferred
	uint8_t priority_bit; // one of ARBITRATION_PRIORITY_B[4-7]
} mailbox_intr_t;

// event triggered on UNIBUS access to "active" device registers
// set by PRU, read by ARM on event. Bitmask.
#define EVENT_DEVICEREGISTER 	0x01
#define EVENT_INITIALIZATIONSIGNALS 	0x02

// states of initialization section lines. Bitmask = latch[7]
#define INITIALIZATIONSIGNAL_INIT	(1 << 3)
#define INITIALIZATIONSIGNAL_ACLO	(1 << 4)
#define INITIALIZATIONSIGNAL_DCLO	(1 << 5)

typedef struct {
	uint8_t eventmask; // bitwise.  triggered, 0 = invalid/ACKEed by ARM
	/*** EVENT_DEVICEREGISTER ***/
	// info about register access
	uint8_t unibus_control; // DATI,DATO,DATOB
	// handle of controller
	uint8_t device_handle;
	// # of register in device space
	uint8_t device_register_idx;
	// UNIBUS address accessed
	uint32_t addr; // accessed address: odd/even important for DATOB
	uint16_t data ; // data vale for DATO event

	/*** EVENT_INITIALIZATIONSIGNALS ***/
	uint8_t initialization_signals_prev; // on event: a signal changed from this ...
	uint8_t initialization_signals_cur; // ... to this

	// uint8_t dummy[2]; // make record multiple of dword !!!
} mailbox_events_t;

typedef struct {

	// generic request/response flags
	uint32_t arm2pru_req;
	uint32_t arm2pru_resp;

	// physical location of shared DDR memory. PDP-11 memory words.
	volatile ddrmem_t *ddrmem_base_physical;

	// set by PRU, read by ARM on event
	mailbox_events_t events;

	// data structs for misc. opcodes
	union {
		mailbox_test_t mailbox_test;
		mailbox_buslatch_t buslatch;
		mailbox_buslatch_test_t buslatch_test;
		mailbox_buslatch_exerciser_t	buslatch_exerciser;	
		mailbox_dma_t dma;
		mailbox_intr_t intr;
	};
} mailbox_t;

#ifdef ARM
#pragma pack(pop)
#endif
/***** end of shared structs *****/

#ifdef ARM

// included by ARM code
#ifndef _MAILBOX_CPP_
extern volatile mailbox_t *mailbox;
#endif

// interface to mailbox.c on ARM application
void mailbox_print(void);
int mailbox_connect(void);
void mailbox_test1(void);
void mailbox_execute(uint8_t request, uint8_t stopcode);

#else
// included by PRU code
#ifndef _MAILBOX_C_
extern volatile far mailbox_t mailbox;
#endif

// code to send an register access event
// iopageregister_t *reg
#define DO_EVENT_DEVICEREGISTER(_reg,_unibus_control,_addr,_data)	do { \
			/* register read changes device state: signal to ARM */ 	\
			mailbox.events.unibus_control = _unibus_control ;				\
			mailbox.events.device_handle = _reg->event_device_handle ;\
			mailbox.events.device_register_idx = _reg->event_device_register_idx ; \
			mailbox.events.addr = _addr ;									 \
			mailbox.events.data = _data ;									 \
			mailbox.events.eventmask |= EVENT_DEVICEREGISTER ; /* data for ARM valid now*/ \
			PRU2ARM_INTERRUPT ; 											\
			/* leave SSYN asserted until mailbox.event.signal ACKEd to 0 */ \
		} while(0)

#endif

#endif // _MAILBOX_H_
