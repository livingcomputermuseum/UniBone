/* gpios.hpp: UniBone functions for Non-PRU GPIOs

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

#ifndef _GPIOS_H_
#define _GPIOS_H_

#include <stdint.h>
#include <vector>
#include <string>

#include "logsource.hpp"

// device for a set of 32 gpio pins
typedef struct {
	unsigned gpios_in_use; // so much pins from this bank are in use
	uint32_t registerrange_addr_unmapped; //unmapped 	start addr of GPIo register range
	unsigned registerrange_size;

	// start addr of register bank, mapped into memory
	volatile uint8_t *registerrange_start_addr;

	// address of Output Enable Register, mapped into memory.
	// bit<i> = 1: pin i is output, 0 = input
	volatile uint32_t *oe_addr;

	// Address of DATAIN register. Reflects the GPIO pin voltage levels.
	volatile uint32_t *datain_addr;

	// Address of DATAOUT register. Reflects the GPIO output pin voltage levels.
	volatile uint32_t *dataout_addr;

	uint32_t cur_dataout_val; // cached value of dataout register
	// access to this is much faster than the GPIO dataut itself.

// mapped address of "set pin" register
	// bit<i> := 1: gpio pin i is set to H level
	volatile uint32_t *setdataout_addr;

	// mapped address of "clear pin" register
	// bit<i> := 1: gpio pin i is set to H level
	volatile uint32_t *clrdataout_addr;

} gpio_bank_t;

/* access addresses for on gpio pin */
typedef struct {
	char name[80];
	unsigned tag; // marker for processing
	int internal;  // 1 = used internally, for P9.41, P).42 collision
	int direction;
	unsigned bank_idx; // GPIO=0,1,2,3
	gpio_bank_t *bank; // GPIO=0,1,2,3
	unsigned pin_in_bank; // 0..31
	unsigned pin_in_bank_mask; // mask with bit 'gpio_pin_in_bank' set
	unsigned linear_no; // linear index in /sys/class/gpio= 32*bank + pin_in_bnak

} gpio_config_t;

// direction of a pin
#define DIR_INPUT	0
#define DIR_OUTPUT	1

#define MAX_GPIOCOUNT	100

// test pins
// SET(1) -> pin auf H, LED OFF
#define ARM_DEBUG_PIN0(n)	GPIO_SETVAL(gpios->led[0], !!(n))
#define ARM_DEBUG_PIN1(n)	GPIO_SETVAL(gpios->led[1], !!(n))
#define ARM_DEBUG_PIN2(n)	GPIO_SETVAL(gpios->led[2], !!(n))
#define ARM_DEBUG_PIN3(n)	GPIO_SETVAL(gpios->led[3], !!(n))


class gpios_c: public logsource_c {
private:
	void bank_map_registers(unsigned bank_idx, unsigned unmapped_start_addr);
	gpio_config_t *config(const char *name, int direction, unsigned bank_idx,
			unsigned pin_in_bank);
	void export_pin(gpio_config_t *pin);

public:

	gpios_c();
	// list of gpio register banks
	gpio_bank_t banks[4];

	// list of pins pins
	gpio_config_t *pins[MAX_GPIOCOUNT + 1];

	// mapped start addresses of register space for GPIOs
	volatile void *registerrange_start_addr[4];

	gpio_config_t *led[4], *swtch[4], *button, *reg_enable, *bus_enable, *i2c_panel_reset,
			*reg_addr[3], *reg_write, *reg_datin[8], *reg_datout[8], *collision_p9_41,
			*collision_p9_42;

	void init(void);
	void test_toggle(gpio_config_t *gpio);
	void test_loopback(void);
};

#define BUSLATCHES_COUNT	8

// save current state uf gpios and registers,
// to suppress redundant write accesses
typedef struct {
	// # of bits in each register connected bidirectionally to UNIBUS
	// ( for example, LTC ignored)
	unsigned bidi_bitwidth[BUSLATCHES_COUNT]; // # of bits in each
	unsigned bidi_bitmask[BUSLATCHES_COUNT]; // mask with valid bits

	bool read_inverted[BUSLATCHES_COUNT]; // true:  read back inverted with respect to write levels

	// current signal state, used for optimization
	unsigned cur_output_enable; // state of ENABLE
	unsigned cur_reg_sel; // state of SEL A0,A1,A2

	unsigned cur_reg_val[BUSLATCHES_COUNT]; // content of output latches
} buslatches_t;

extern gpios_c *gpios; // singleton

extern buslatches_t buslatches;

// merges the bits of unshifted_val into the gpio output register
// of bank[idx]. target position is given by bitpos, bitfield size by bitmask
// This macro is optimized assuming that writing a memorymapped GPIO register
// takes much longer than ARM internal operations.
#define GPIO_OUTPUTBITS(bank,bitpos,bitmask,unshifted_val) do {	\
		unsigned tmp = (bank)->cur_dataout_val ; \
		tmp &= ~((bitmask) << (bitpos)) ; /* erase bitfield*/	\
		tmp |= ((unshifted_val) & (bitmask)) << (bitpos) ; /* copy val to bitfield*/ \
		(bank)->cur_dataout_val = *((bank)->dataout_addr) = tmp ; \
} while(0)

// set a value by writing a bit mask into output register
#define GPIO_SETVAL(gpio,val) GPIO_OUTPUTBITS((gpio)->bank, (gpio)->pin_in_bank, 1, (val) )

// get a value by reading value register
// Getval(input) reads pin. Getval(output) reads values set.
#define GPIO_GETVAL(gpio) 		(	\
	(gpio)->direction == DIR_OUTPUT ? 	\
 	(!! ( *((gpio)->bank->dataout_addr) & (gpio)->pin_in_bank_mask ) )	\
 	: (!! ( *((gpio)->bank->datain_addr) & (gpio)->pin_in_bank_mask ) )	\
	)

// raw 1 bit signal traces
typedef struct {
	unsigned reg_sel;
	unsigned bit_nr;
	unsigned is_input; // 0 = "74LVTH541 <- DS8641" ; 1 = "74LS377 -> DS8641"
	unsigned is_inverted; // only BG*_OUT
	const char *unibus_name; // UNIBUS signal name
	const char *path; // long info with net list
} buslatches_wire_info_t;

extern buslatches_wire_info_t buslatches_wire_info[];

// compound unibus signals

class unibus_signal_info_c {
public:
	enum id_enum {
		ub_address, ub_data, ub_control, // c1,c0
		ub_msyn,
		ub_ssyn,
		ub_pa,
		ub_pb,
		ub_intr,
		ub_br4,
		ub_br5,
		ub_br6,
		ub_br7,
		ub_bg4,
		ub_bg5,
		ub_bg6,
		ub_bg7,
		ub_npr,
		ub_npg,
		ub_sack,
		ub_bbsy,
		ub_init,
		ub_aclo,
		ub_dclo
	};

	id_enum id;
	std::string name;
	unsigned bitwidth;
	unibus_signal_info_c() {
	}
	;
	unibus_signal_info_c(id_enum id, std::string name, unsigned bitwidth);
};

class unibus_signals_c {
public:
	unibus_signals_c();
	std::vector<unibus_signal_info_c> signals;
	unsigned max_name_len();
	unsigned size();

	void set_val(enum unibus_signal_info_c::id_enum id, unsigned value);
	unsigned get_val(enum unibus_signal_info_c::id_enum id);
};

extern unibus_signals_c *unibus_signals; // singleton

void buslatches_output_enable(bool enable);
void buslatches_register(void);
void buslatches_pru_reset(void);

buslatches_wire_info_t *buslatches_get_wire_info(const char * unibus_name, unsigned is_input);

void buslatches_setval(unsigned reg_sel, unsigned bitmask, unsigned val);
unsigned buslatches_getval(unsigned reg_sel);

void buslatches_test_simple_pattern(unsigned pattern, unsigned reg_sel);
void buslatches_test_simple_pattern_multi(unsigned pattern);

void buslatches_test_timing(uint8_t addr_0_7, uint8_t addr_8_15, uint8_t data_0_7,
		uint8_t data_8_15);

#endif // _GPIOS_H_
