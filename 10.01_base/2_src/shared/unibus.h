/* unibus.h: shared structs used in PRU and ARM

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
 19-may-2018  JH      created

 */

#ifndef _UNIBUS_H_
#define _UNIBUS_H_

#include <stdint.h>

#define UNIBUS_WORDCOUNT	0x20000	// 128KiW = 256 KiB

// bus transaction. can be directly assigned to lines C1,C0
#define UNIBUS_CONTROL_DATI	0x00 // 16 bit word from slave to master
#define UNIBUS_CONTROL_DATIP	0x01 // DATI, inhibts core restore. DATO must follow.
#define UNIBUS_CONTROL_DATO	0x02 // 16 bit word from master to slave
#define UNIBUS_CONTROL_DATOB	0x03 // 8 bit byte  from master to slave
// data<15:8> for a00 = 1, data<7:0> for a00 = 0
#define UNIBUS_CONTROL_ISDATO(c) (!!((c) & 0x02)) // check for DATO/B

#define UNIBUS_TIMEOUTVAL	0xffffffff // EXAM result for bus timeout

// This simple byte/word union works only because PDP-11,ARM and PRU all are little endian.
// "PDP-11 is little-endian (with least significant bytes first)."
// "BeagleBone Debian: lscpu shows that it is little endian."
// pru c-compile is NOT called with --endian=big
typedef struct {
	union {
		uint16_t words[UNIBUS_WORDCOUNT];
		uint8_t bytes[2 * UNIBUS_WORDCOUNT];
	};
} unibus_memory_t;

#ifdef ARM
// included only by ARM code
#include "logsource.hpp"
#include "utils.hpp"

// parameter and functions for low level UNIBUS control

class dma_request_c;
class intr_request_c;

class unibus_c: public logsource_c {
public:
	enum arbitration_mode_enum {
		ARBITRATION_MODE_NONE = 0,	// no BR*/BG*, NR/NPG SACK protocoll
		ARBITRATION_MODE_CLIENT = 1,	// external Arbitrator (running PDP-11 CPU) required
		ARBITRATION_MODE_MASTER = 2	// implmenet Arbitrator
	// with or without physical CPU for arbitration
	};

private:

	timeout_c timeout;

public:

	unibus_c();
	~unibus_c();

	static char *control2text(uint8_t control);
	static char *data2text(unsigned val);

	void init(unsigned pulsewidth_ms);
	static void set_arbitration_mode(enum arbitration_mode_enum arbitration_mode);

	void powercycle(void);

	// functions of unibusadapter to do simple DMA 
	dma_request_c *dma_request;
	//intr_request_c *intr_request;

	bool dma(enum unibus_c::arbitration_mode_enum arbitration_mode, bool blocking, uint8_t control,
			uint32_t startaddr, uint16_t *buffer, unsigned wordcount);

	void mem_read(enum unibus_c::arbitration_mode_enum arbitration_mode, uint16_t *words,
			uint32_t unibus_start_addr, uint32_t unibus_end_addr, bool *timeout);
	void mem_write(enum unibus_c::arbitration_mode_enum arbitration_mode, uint16_t *words,
			unsigned unibus_start_addr, unsigned unibus_end_addr, bool *timeout);

	void mem_access_random(enum unibus_c::arbitration_mode_enum arbitration_mode,
			uint8_t unibus_control, uint16_t *words, uint32_t unibus_start_addr,
			uint32_t unibus_end_addr, bool *timeout, uint32_t *block_counter);

	uint32_t test_sizer(enum unibus_c::arbitration_mode_enum arbitration_mode);

	uint16_t testwords[UNIBUS_WORDCOUNT];

	void test_mem(enum unibus_c::arbitration_mode_enum arbitration_mode, uint32_t start_addr,
			uint32_t end_addr, unsigned mode);

};

extern unibus_c *unibus;

#endif /* ARM */

#endif /* _UNIBUS_H_ */
