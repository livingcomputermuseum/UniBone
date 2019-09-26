/* gpios.cpp: UniBone functions for Non-PRU GPIOs

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


 21-may-2019  JH      added UNIBUS signals
 12-nov-2018  JH      entered beta phase
 */

#define _GPIOS_CPP_

#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <assert.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>

#include "mailbox.h"

#include "pru.hpp"
#include "utils.hpp"
#include "logsource.hpp"
#include "logger.hpp"
#include "bitcalc.h"

#include "gpios.hpp"

// see spruh73n.pdf
// address range of GPIO related registers. [spruh73n] page 181
#define GPIO_SIZE 	0x1000 // size of each GPIO register range
#define GPIO0_START_ADDR 0x44E07000
#define GPIO1_START_ADDR 0x4804C000
#define GPIO2_START_ADDR 0x481AC000
#define GPIO3_START_ADDR 0x481AE000 // offset in each GPIO register range
#define GPIO_OE_ADDROFFSET 0x134
#define GPIO_DATAIN_ADDROFFSET 0x138
#define GPIO_DATAOUT_ADDROFFSET 0x13c
#define GPIO_SETDATAOUT_ADDROFFSET 0x194
#define GPIO_CLEARDATAOUT_ADDROFFSET 0x190

gpios_c *gpios; // Singleton

buslatches_t buslatches;


gpios_c::gpios_c() {
	log_label = "GPIOS";
}

/* fill the 4 gpio_banks with values and
 *	map addresses
 */
void gpios_c::bank_map_registers(unsigned bank_idx, unsigned unmapped_start_addr) {
	int fd;
	gpio_bank_t *bank;

	assert(bank_idx < 4);
	fd = open((char*) "/dev/mem", O_RDWR);
	if (!fd)
		FATAL("Can not open /dev/mem");

	bank = &(banks[bank_idx]);
	bank->gpios_in_use = 0;
	bank->registerrange_addr_unmapped = unmapped_start_addr; // info only
	INFO("GPIO%d registers at %X - %X (size = %X)", bank_idx, unmapped_start_addr,
			unmapped_start_addr + GPIO_SIZE - 1, GPIO_SIZE);
	bank->registerrange_start_addr = (uint8_t *) mmap(0, GPIO_SIZE, PROT_READ | PROT_WRITE,
	MAP_SHARED, fd, unmapped_start_addr);
	if (bank->registerrange_start_addr == MAP_FAILED)
		FATAL("Unable to map GPIO%d", bank_idx);

	bank->oe_addr = (uint32_t *) (bank->registerrange_start_addr + GPIO_OE_ADDROFFSET);
	bank->datain_addr = (uint32_t *) (bank->registerrange_start_addr + GPIO_DATAIN_ADDROFFSET);
	bank->dataout_addr =
			(uint32_t *) (bank->registerrange_start_addr + GPIO_DATAOUT_ADDROFFSET);
	bank->setdataout_addr = (uint32_t *) (bank->registerrange_start_addr
			+ GPIO_SETDATAOUT_ADDROFFSET);
	bank->clrdataout_addr = (uint32_t *) (bank->registerrange_start_addr
			+ GPIO_CLEARDATAOUT_ADDROFFSET);
}

gpio_config_t *gpios_c::config(const char *name, int direction, unsigned bank_idx,
		unsigned pin_in_bank) {
	gpio_config_t *result = (gpio_config_t *) malloc(sizeof(gpio_config_t));
	if (name)
		strcpy(result->name, name);
	else
		strcpy(result->name, "");
	if (strlen(result->name) > 0)
		result->internal = 0;
	else
		result->internal = 1;
	result->direction = direction;
	assert(bank_idx < 4);
	result->bank_idx = bank_idx;
	result->bank = &(banks[bank_idx]);
	result->bank->gpios_in_use++;
	result->pin_in_bank = pin_in_bank;
	result->linear_no = 32 * bank_idx + pin_in_bank;
	result->pin_in_bank_mask = 1 << pin_in_bank;

	return result;
}

// "export" a pin over the sys file system
// this is necessary for GPIO2&3, despite we operate memory mapped.
void gpios_c::export_pin(gpio_config_t *pin) {
	char fname[256];
	FILE *f;
	struct stat statbuff;

	sprintf(fname, "/sys/class/gpio/export");
	f = fopen(fname, "w");
	if (!f)
		FATAL("Can not open %s", fname);
	fprintf(f, "%d\n", pin->linear_no);
	fclose(f);

	// verify: now there should appear the control directory for the pin
	sprintf(fname, "/sys/class/gpio/gpio%d", pin->linear_no);
	if (stat(fname, &statbuff) != 0 || !S_ISDIR(statbuff.st_mode))
		FATAL("Gpio control dir %s not generated", fname);

}

/* export the NON-PRU pins: */
void gpios_c::init() {
	unsigned n;
	gpio_config_t *gpio;

	bank_map_registers(0, GPIO0_START_ADDR);
	bank_map_registers(1, GPIO1_START_ADDR);
	bank_map_registers(2, GPIO2_START_ADDR);
	bank_map_registers(3, GPIO3_START_ADDR);

	// fill pin database
	n = 0;
	pins[n++] = led[0] = config("LED0", DIR_OUTPUT, 1, 0);
	pins[n++] = led[1] = config("LED1", DIR_OUTPUT, 1, 1);
	pins[n++] = led[2] = config("LED2", DIR_OUTPUT, 1, 2);
	pins[n++] = led[3] = config("LED3", DIR_OUTPUT, 1, 3);
	pins[n++] = swtch[0] = config("SW0", DIR_INPUT, 1, 4);
	pins[n++] = swtch[1] = config("SW1", DIR_INPUT, 1, 5);
	pins[n++] = swtch[2] = config("SW2", DIR_INPUT, 1, 6);
	pins[n++] = swtch[3] = config("SW3", DIR_INPUT, 1, 7);
	pins[n++] = button = config("BUTTON", DIR_INPUT, 1, 12);
	pins[n++] = reg_enable = config("REG_ENABLE", DIR_OUTPUT, 1, 14);
	pins[n++] = bus_enable = config("BUS_ENABLE", DIR_OUTPUT, 1, 13);
	pins[n++] = i2c_panel_reset = config("PANEL_RESET", DIR_OUTPUT, 1, 28);

	// double functions on header: P9.41 set other pin function to tristate
	pins[n++] = collision_p9_41 = config(NULL, DIR_INPUT, 3, 20);
	pins[n++] = collision_p9_42 = config(NULL, DIR_INPUT, 3, 18);

	pins[n] = NULL; // end mark

	// program pins registers
	// echo no  > /sys/class/gpio/export_pin

	for (n = 0; (gpio = pins[n]); n++)
		export_pin(gpio);

	// set pin directions
	// a) echo in|out > /sys/class/gpio/gpio<no>/direction
	// b) bitmask in pin->gpio_bank_oe_addr
	for (n = 0; (gpio = pins[n]); n++) {
		unsigned reg = *(gpio->bank->oe_addr);
		// bit set in OE register: pin is input.
		reg &= ~gpio->pin_in_bank_mask; // clear bit
		if (gpio->direction == DIR_INPUT)
			reg |= gpio->pin_in_bank_mask;
		*(gpio->bank->oe_addr) = reg;
	}

	// init output register cache with values (after export_pin!)
	for (n = 0; n < 4; n++)
		// bus error, if no gpio registered from this bank
		if (banks[n].gpios_in_use > 0)
			banks[n].cur_dataout_val = *(banks[n].dataout_addr);

	// set the 4 LEDs to OFF
	for (n = 0; n < 4; n++)
		GPIO_SETVAL(led[n], 1)
		; // inverted drivers

	// shared with LEDs
	ARM_DEBUG_PIN0(0) ;
	ARM_DEBUG_PIN1(0) ;
	ARM_DEBUG_PIN2(0) ;
	ARM_DEBUG_PIN3(0) ;
		
}

/*
 * Toggle in high speed, break with ^C
 */
void gpios_c::test_toggle(gpio_config_t *gpio) {
	INFO("Highspeed toggle pin %s, stop with ^C.", gpio->name);

	// Setup ^C catcher
	SIGINTcatchnext();
	// high speed loop
	while (!SIGINTreceived) {
		// run, baby, run!
		// the access macros:
		GPIO_SETVAL(gpio, 1)
		;
		GPIO_SETVAL(gpio, 0)
		;
		// fastest possible:
		// *(gpio->bank->setdataout_addr) = gpio->pin_in_bank_mask;
		//*(gpio->bank->clrdataout_addr) = gpio->pin_in_bank_mask;
	}
}

/* visible loop back
 * Switches control LEDs
 * Button controls UNIBUS reg_enable
 */
void gpios_c::test_loopback(void) {
	timeout_c timeout;

	INFO("Manual loopback test, stop with ^C");
	INFO("Switch control LEDs, button controls \"UNIBUS enable\".");

	// Setup ^C catcher
	SIGINTcatchnext();
	// high speed loop
	while (!SIGINTreceived) {
		GPIO_SETVAL(led[0], GPIO_GETVAL(swtch[0]));
		GPIO_SETVAL(led[1], GPIO_GETVAL(swtch[1]));
		GPIO_SETVAL(led[2], GPIO_GETVAL(swtch[2]));
		GPIO_SETVAL(led[3], GPIO_GETVAL(swtch[3]));
		GPIO_SETVAL(bus_enable, GPIO_GETVAL(button));
		timeout.wait_ms(10);
	}
}

/* return a string with board signal path for an UNIBUS signal
 * used as error info for loopback failures
 */
buslatches_wire_info_t buslatches_wire_info[] = { //
//
		// Register 0 write (PRU -> 74LS377 -> DS8641)
				{ 0, 0, 0, 1, "BG4_OUT",
						"P9.31 -> J10.1 DATOUT_0 -> U05.03 -> U05.02 -> U08.14 -> U08.15 -> BG4_OUT" },	//
				{ 0, 1, 0, 1, "BG5_OUT",
						"P9.29 -> J10.2 DATOUT_1 -> U05.04 -> U05.05 -> U08.11 -> U08.12 -> BG5_OUT" },	//
				{ 0, 2, 0, 1, "BG6_OUT",
						"P9.30 -> J10.3 DATOUT_2 -> U05.07 -> U05.06 -> U08.02 -> U08.01 -> BG6_OUT" },	//
				{ 0, 3, 0, 1, "BG7_OUT",
						"P9.28 -> J10.4 DATOUT_3 -> U05.08 -> U05.09 -> U08.05 -> U08.04 -> BG7_OUT" },	//
				{ 0, 4, 0, 1, "NPG_OUT",
						"P9.42 -> J10.5 DATOUT_4 -> U05.13 -> U05.12 -> U07.14 -> U07.15 -> NPG_OUT" },	//
				{ 0, 5, 0, 0, "n.c.",
						"P9.27 -> J10.6 DATOUT_5 -> U05.14 -> U05.15 -> U07.11 -> U07.12 -> n.c." },//
				{ 0, 6, 0, 0, "n.c.",
						"P9.41 -> J10.7 DATOUT_6 -> U05.17 -> U05.16 -> U07.02 -> U07.01 -> n.c." },//
				{ 0, 7, 0, 0, "n.c.",
						"P9.25 -> J10.8 DATOUT_7 -> U05.18 -> U05.19 -> U07.05 -> U07.04 -> n.c." },//
//
// Register 0 read (PRU <- 74LVTH541 <- 74LS244)
				{ 0, 0, 1, 0, "BG4",
						"P8.45 <- J17.1 DATIN_0 <- U04.18 <- U04.02 <- U06.18 <- U06.02 <- BG4_IN" },//
				{ 0, 1, 1, 0, "BG5",
						"P8.46 <- J17.2 DATIN_1 <- U04.17 <- U04.03 <- U06.16 <- U06.04 <- BG5_IN" },//
				{ 0, 2, 1, 0, "BG6",
						"P8.43 <- J17.3 DATIN_2 <- U04.16 <- U04.04 <- U06.14 <- U06.06 <- BG6_IN" },//
				{ 0, 3, 1, 0, "BG7",
						"P8.44 <- J17.4 DATIN_3 <- U04.15 <- U04.05 <- U06.12 <- U06.08 <- BG7_IN" },//
				{ 0, 4, 1, 0, "NPG",
						"P8.41 <- J17.5 DATIN_4 <- U04.14 <- U04.06 <- U06.09 <- U06.11 <- NPG_IN" },//
				{ 0, 5, 1, 0, "LTC",
						"P8.42 <- J17.6 DATIN_5 <- U04.13 <- U04.07 <- U06.07 <- U06.13 <- LTC" },//
				{ 0, 6, 1, 0, "n.c.",
						"P8.39 <- J17.7 DATIN_6 <- U04.12 <- U04.08 <- U06.05 <- U06.15 <- n.c." },	//
				{ 0, 7, 1, 0, "n.c.",
						"P8.40 <- J17.8 DATIN_7 <- U04.11 <- U04.09 <- U06.03 <- U06.13 <- n.c." },	//
//
// Register 1 write  (PRU -> 74LS377 -> DS8641)
				{ 1, 0, 0, 0, "BR4",
						"P9.31 -> J10.1 DATOUT_0 -> U30.03 -> U30.02 -> U31.14 -> U31.15 -> BR4" },	//
				{ 1, 1, 0, 0, "BR5",
						"P9.29 -> J10.2 DATOUT_1 -> U30.04 -> U30.05 -> U31.11 -> U31.12 -> BR5" },	//
				{ 1, 2, 0, 0, "BR6",
						"P9.30 -> J10.3 DATOUT_2 -> U30.07 -> U30.06 -> U31.02 -> U31.01 -> BR6" },	//
				{ 1, 3, 0, 0, "BR7",
						"P9.28 -> J10.4 DATOUT_3 -> U30.08 -> U30.09 -> U31.05 -> U31.04 -> BR7" },	//
				{ 1, 4, 0, 0, "NPR",
						"P9.42 -> J10.5 DATOUT_4 -> U30.13 -> U30.12 -> U32.14 -> U32.15 -> NPR" },	//
				{ 1, 5, 0, 0, "SACK",
						"P9.27 -> J10.6 DATOUT_5 -> U30.14 -> U30.15 -> U32.11 -> U32.12 -> SACK" },//
				{ 1, 6, 0, 0, "BBSY",
						"P9.41 -> J10.7 DATOUT_6 -> U30.17 -> U30.16 -> U32.02 -> U32.01 -> BBSY" },//
				{ 1, 7, 0, 0, "n.c.",
						"P9.25 -> J10.8 DATOUT_7 -> U30.18 -> U30.19 -> U32.05 -> U32.04 -> n.c." },//
//
// Register 1 read (PRU <- 74LVTH541 <- DS8641)
				{ 1, 0, 1, 0, "BR4",
						"P8.45 <- J17.1 DATIN_0 <- U29.18 <- U29.02 <- U31.13 <- U31.15 <- BR4" },//
				{ 1, 1, 1, 0, "BR5",
						"P8.46 <- J17.2 DATIN_1 <- U29.17 <- U29.03 <- U31.10 <- U31.12 <- BR5" },//
				{ 1, 2, 1, 0, "BR6",
						"P8.43 <- J17.3 DATIN_2 <- U29.16 <- U29.04 <- U31.03 <- U31.01 <- BR6" },//
				{ 1, 3, 1, 0, "BR7",
						"P8.44 <- J17.4 DATIN_3 <- U29.15 <- U29.05 <- U31.06 <- U31.04 <- BR7" },//
				{ 1, 4, 1, 0, "NPR",
						"P8.41 <- J17.5 DATIN_4 <- U29.14 <- U29.06 <- U32.13 <- U32.15 <- NPR" },//
				{ 1, 5, 1, 0, "SACK",
						"P8.42 <- J17.6 DATIN_5 <- U29.13 <- U29.07 <- U32.10 <- U32.12 <- SACK" },	//
				{ 1, 6, 1, 0, "BBSY",
						"P8.39 <- J17.7 DATIN_6 <- U29.12 <- U29.08 <- U32.03 <- U32.01 <- BBSY" },	//
				{ 1, 7, 1, 0, "n.c.",
						"P8.40 <- J17.8 DATIN_7 <- U29.11 <- U29.09 <- U32.06 <- U32.04 <- n.c." },	//
//
// Register 2 write  (PRU -> 74LS377 -> DS8641)
				{ 2, 0, 0, 0, "A00",
						"P9.31 -> J10.1 DATOUT_0 -> U10.03 -> U10.02 -> U11.14 -> U11.15 -> A00" },	//
				{ 2, 1, 0, 0, "A01",
						"P9.29 -> J10.2 DATOUT_1 -> U10.04 -> U10.05 -> U11.11 -> U11.12 -> A01" },	//
				{ 2, 2, 0, 0, "A02",
						"P9.30 -> J10.3 DATOUT_2 -> U10.07 -> U10.06 -> U11.02 -> U11.01 -> A02" },	//
				{ 2, 3, 0, 0, "A03",
						"P9.28 -> J10.4 DATOUT_3 -> U10.08 -> U10.09 -> U11.05 -> U11.04 -> A03" },	//
				{ 2, 4, 0, 0, "A04",
						"P9.42 -> J10.5 DATOUT_4 -> U10.13 -> U10.12 -> U12.14 -> U12.15 -> A04" },	//
				{ 2, 5, 0, 0, "A05",
						"P9.27 -> J10.6 DATOUT_5 -> U10.14 -> U10.15 -> U12.11 -> U12.12 -> A05" },	//
				{ 2, 6, 0, 0, "A06",
						"P9.41 -> J10.7 DATOUT_6 -> U10.17 -> U10.16 -> U12.02 -> U12.01 -> A06" },	//
				{ 2, 7, 0, 0, "A07",
						"P9.25 -> J10.8 DATOUT_7 -> U10.18 -> U10.19 -> U12.05 -> U12.04 -> A07" },	//
//
// Register 2 read (PRU <- 74LVTH541 <- DS8641)
				{ 2, 0, 1, 0, "A00",
						"P8.45 <- J17.1 DATIN_0 <- U09.18 <- U09.02 <- U11.13 <- U11.15 <- A00" },//
				{ 2, 1, 1, 0, "A01",
						"P8.46 <- J17.2 DATIN_1 <- U09.17 <- U09.03 <- U11.10 <- U11.12 <- A01" },//
				{ 2, 2, 1, 0, "A02",
						"P8.43 <- J17.3 DATIN_2 <- U09.16 <- U09.04 <- U11.03 <- U11.01 <- A02" },//
				{ 2, 3, 1, 0, "A03",
						"P8.44 <- J17.4 DATIN_3 <- U09.15 <- U09.05 <- U11.06 <- U11.04 <- A03" },//
				{ 2, 4, 1, 0, "A04",
						"P8.41 <- J17.5 DATIN_4 <- U09.14 <- U09.06 <- U12.13 <- U12.15 <- A04" },//
				{ 2, 5, 1, 0, "A05",
						"P8.42 <- J17.6 DATIN_5 <- U09.13 <- U09.07 <- U12.10 <- U12.12 <- A05" },//
				{ 2, 6, 1, 0, "A06",
						"P8.39 <- J17.7 DATIN_6 <- U09.12 <- U09.08 <- U12.03 <- U12.01 <- A06" },//
				{ 2, 7, 1, 0, "A07",
						"P8.40 <- J17.8 DATIN_7 <- U09.11 <- U09.09 <- U12.06 <- U12.04 <- A07" },//
//
// Register 3 write  (PRU -> 74LS377 -> DS8641)
				{ 3, 0, 0, 0, "A08",
						"P9.31 -> J10.1 DATOUT_0 -> U14.03 -> U14.02 -> U15.14 -> U15.15 -> A08" },	//
				{ 3, 1, 0, 0, "A09",
						"P9.29 -> J10.2 DATOUT_1 -> U14.04 -> U14.05 -> U15.11 -> U15.12 -> A09" },	//
				{ 3, 2, 0, 0, "A10",
						"P9.30 -> J10.3 DATOUT_2 -> U14.07 -> U14.06 -> U15.02 -> U15.01 -> A10" },	//
				{ 3, 3, 0, 0, "A11",
						"P9.28 -> J10.4 DATOUT_3 -> U14.08 -> U14.09 -> U15.05 -> U15.04 -> A11" },	//
				{ 3, 4, 0, 0, "A12",
						"P9.42 -> J10.5 DATOUT_4 -> U14.13 -> U14.12 -> U16.14 -> U16.15 -> A12" },	//
				{ 3, 5, 0, 0, "A13",
						"P9.27 -> J10.6 DATOUT_5 -> U14.14 -> U14.15 -> U16.11 -> U16.12 -> A13" },	//
				{ 3, 6, 0, 0, "A14",
						"P9.41 -> J10.7 DATOUT_6 -> U14.17 -> U14.16 -> U16.02 -> U16.01 -> A14" },	//
				{ 3, 7, 0, 0, "A15",
						"P9.25 -> J10.8 DATOUT_7 -> U14.18 -> U14.19 -> U16.05 -> U16.04 -> A15" },	//
//
// Register 3 read (PRU <- 74LVTH541 <- DS8641)
				{ 3, 0, 1, 0, "A08",
						"P8.45 <- J17.1 DATIN_0 <- U13.18 <- U13.02 <- U15.13 <- U15.15 <- A08" },//
				{ 3, 1, 1, 0, "A09",
						"P8.46 <- J17.2 DATIN_1 <- U13.17 <- U13.03 <- U15.10 <- U15.12 <- A09" },//
				{ 3, 2, 1, 0, "A10",
						"P8.43 <- J17.3 DATIN_2 <- U13.16 <- U13.04 <- U15.03 <- U15.01 <- A10" },//
				{ 3, 3, 1, 0, "A11",
						"P8.44 <- J17.4 DATIN_3 <- U13.15 <- U13.05 <- U15.06 <- U15.04 <- A11" },//
				{ 3, 4, 1, 0, "A12",
						"P8.41 <- J17.5 DATIN_4 <- U13.14 <- U13.06 <- U16.13 <- U16.15 <- A12" },//
				{ 3, 5, 1, 0, "A13",
						"P8.42 <- J17.6 DATIN_5 <- U13.13 <- U13.07 <- U16.10 <- U16.12 <- A13" },//
				{ 3, 6, 1, 0, "A14",
						"P8.39 <- J17.7 DATIN_6 <- U13.12 <- U13.08 <- U16.03 <- U16.01 <- A14" },//
				{ 3, 7, 1, 0, "A15",
						"P8.40 <- J17.8 DATIN_7 <- U13.11 <- U13.09 <- U16.06 <- U16.04 <- A15" },//
//
// Register 4 write  (PRU -> 74LS377 -> DS8641)
				{ 4, 0, 0, 0, "A16",
						"P9.31 -> J10.1 DATOUT_0 -> U26.03 -> U26.02 -> U27.14 -> U27.15 -> A16" },	//
				{ 4, 1, 0, 0, "A17",
						"P9.29 -> J10.2 DATOUT_1 -> U26.04 -> U26.05 -> U27.11 -> U27.12 -> A17" },	//
				{ 4, 2, 0, 0, "C0",
						"P9.30 -> J10.3 DATOUT_2 -> U26.07 -> U26.06 -> U27.02 -> U27.01 -> C0" },//
				{ 4, 3, 0, 0, "C1",
						"P9.28 -> J10.4 DATOUT_3 -> U26.08 -> U26.09 -> U27.05 -> U27.04 -> C1" },//
				{ 4, 4, 0, 0, "MSYN",
						"P9.42 -> J10.5 DATOUT_4 -> U26.13 -> U26.12 -> U28.14 -> U28.15 -> MSYN" },//
				{ 4, 5, 0, 0, "SSYN",
						"P9.27 -> J10.6 DATOUT_5 -> U26.14 -> U26.15 -> U28.11 -> U28.12 -> SSYN" },//
				{ 4, 6, 0, 0, "n.c.",
						"P9.41 -> J10.7 DATOUT_6 -> U26.17 -> U26.16 -> U28.02 -> U28.01 -> n.c." },//
				{ 4, 7, 0, 0, "n.c.",
						"P9.25 -> J10.8 DATOUT_7 -> U26.18 -> U26.19 -> U28.05 -> U28.04 -> n.c." },//
//
// Register 4 read (PRU <- 74LVTH541 <- DS8641)
				{ 4, 0, 1, 0, "A16",
						"P8.45 <- J17.1 DATIN_0 <- U25.18 <- U25.02 <- U27.13 <- U27.15 <- A16" },//
				{ 4, 1, 1, 0, "A17",
						"P8.46 <- J17.2 DATIN_1 <- U25.17 <- U25.03 <- U27.10 <- U27.12 <- A17" },//
				{ 4, 2, 1, 0, "C0",
						"P8.43 <- J17.3 DATIN_2 <- U13.16 <- U13.04 <- U27.03 <- U27.01 <- C0" },//
				{ 4, 3, 1, 0, "C1",
						"P8.44 <- J17.4 DATIN_3 <- U13.15 <- U13.05 <- U27.06 <- U27.04 <- C1" },//
				{ 4, 4, 1, 0, "MSYN",
						"P8.41 <- J17.5 DATIN_4 <- U25.14 <- U25.06 <- U28.13 <- U28.15 <- MSYN" },	//
				{ 4, 5, 1, 0, "SSYN",
						"P8.42 <- J17.6 DATIN_5 <- U25.13 <- U25.07 <- U28.10 <- U28.12 <- SSYN" },	//
				{ 4, 6, 1, 0, "n.c.",
						"P8.39 <- J17.7 DATIN_6 <- U25.12 <- U25.08 <- U28.03 <- U28.01 <- n.c." },	//
				{ 4, 7, 1, 0, "n.c.",
						"P8.40 <- J17.8 DATIN_7 <- U25.11 <- U25.09 <- U28.06 <- U28.04 <- n.c." },	//
//
// Register 5 write  (PRU -> 74LS377 -> DS8641)
				{ 5, 0, 0, 0, "D00",
						"P9.31 -> J10.1 DATOUT_0 -> U18.03 -> U18.02 -> U19.14 -> U19.15 -> D00" },	//
				{ 5, 1, 0, 0, "D01",
						"P9.29 -> J10.2 DATOUT_1 -> U18.04 -> U18.05 -> U19.11 -> U19.12 -> D01" },	//
				{ 5, 2, 0, 0, "D02",
						"P9.30 -> J10.3 DATOUT_2 -> U18.07 -> U18.06 -> U19.02 -> U19.01 -> D02" },	//
				{ 5, 3, 0, 0, "D03",
						"P9.28 -> J10.4 DATOUT_3 -> U18.08 -> U18.09 -> U19.05 -> U19.04 -> D03" },	//
				{ 5, 4, 0, 0, "D04",
						"P9.42 -> J10.5 DATOUT_4 -> U18.13 -> U18.12 -> U20.14 -> U20.15 -> D04" },	//
				{ 5, 5, 0, 0, "D05",
						"P9.27 -> J10.6 DATOUT_5 -> U18.14 -> U18.15 -> U20.11 -> U20.12 -> D05" },	//
				{ 5, 6, 0, 0, "D06",
						"P9.41 -> J10.7 DATOUT_6 -> U18.17 -> U18.16 -> U20.02 -> U20.01 -> D06" },	//
				{ 5, 7, 0, 0, "D07",
						"P9.25 -> J10.8 DATOUT_7 -> U18.18 -> U18.19 -> U20.05 -> U20.04 -> D07" },	//
//
// Register 5 read (PRU <- 74LVTH541 <- DS8641)
				{ 5, 0, 1, 0, "D00",
						"P8.45 <- J17.1 DATIN_0 <- U17.18 <- U17.02 <- U19.13 <- U19.15 <- D00" },//
				{ 5, 1, 1, 0, "D01",
						"P8.46 <- J17.2 DATIN_1 <- U17.17 <- U17.03 <- U19.10 <- U19.12 <- D01" },//
				{ 5, 2, 1, 0, "D02",
						"P8.43 <- J17.3 DATIN_2 <- U17.16 <- U17.04 <- U19.03 <- U19.01 <- D02" },//
				{ 5, 3, 1, 0, "D03",
						"P8.44 <- J17.4 DATIN_3 <- U17.15 <- U17.05 <- U19.06 <- U19.04 <- D03" },//
				{ 5, 4, 1, 0, "D04",
						"P8.41 <- J17.5 DATIN_4 <- U17.14 <- U17.06 <- U20.13 <- U20.15 <- D04" },//
				{ 5, 5, 1, 0, "D05",
						"P8.42 <- J17.6 DATIN_5 <- U17.13 <- U17.07 <- U20.10 <- U20.12 <- D05" },//
				{ 5, 6, 1, 0, "D06",
						"P8.39 <- J17.7 DATIN_6 <- U17.12 <- U17.08 <- U20.03 <- U20.01 <- D06" },//
				{ 5, 7, 1, 0, "D07",
						"P8.40 <- J17.8 DATIN_7 <- U17.11 <- U17.09 <- U20.06 <- U20.04 <- D07" },//
//
// Register 6 write  (PRU -> 74LS377 -> DS8641)
				{ 6, 0, 0, 0, "D08",
						"P9.31 -> J10.1 DATOUT_0 -> U22.03 -> U22.02 -> U23.14 -> U23.15 -> D08" },	//
				{ 6, 1, 0, 0, "D09",
						"P9.29 -> J10.2 DATOUT_1 -> U22.04 -> U22.05 -> U23.11 -> U23.12 -> D09" },	//
				{ 6, 2, 0, 0, "D10",
						"P9.30 -> J10.3 DATOUT_2 -> U22.07 -> U22.06 -> U23.02 -> U23.01 -> D10" },	//
				{ 6, 3, 0, 0, "D11",
						"P9.28 -> J10.4 DATOUT_3 -> U22.08 -> U22.09 -> U23.05 -> U23.04 -> D11" },	//
				{ 6, 4, 0, 0, "D12",
						"P9.42 -> J10.5 DATOUT_4 -> U22.13 -> U22.12 -> U24.14 -> U24.15 -> D12" },	//
				{ 6, 5, 0, 0, "D13",
						"P9.27 -> J10.6 DATOUT_5 -> U22.14 -> U22.15 -> U24.11 -> U24.12 -> D13" },	//
				{ 6, 6, 0, 0, "D14",
						"P9.41 -> J10.7 DATOUT_6 -> U22.17 -> U22.16 -> U24.02 -> U24.01 -> D14" },	//
				{ 6, 7, 0, 0, "D15",
						"P9.25 -> J10.8 DATOUT_7 -> U22.18 -> U22.19 -> U24.05 -> U24.04 -> D15" },	//
//
// Register 6 read (PRU <- 74LVTH541 <- DS8641)
				{ 6, 0, 1, 0, "D08",
						"P8.45 <- J17.1 DATIN_0 <- U21.18 <- U21.02 <- U23.13 <- U23.15 <- D08" },//
				{ 6, 1, 1, 0, "D09",
						"P8.46 <- J17.2 DATIN_1 <- U21.17 <- U21.03 <- U23.10 <- U23.12 <- D09" },//
				{ 6, 2, 1, 0, "D10",
						"P8.43 <- J17.3 DATIN_2 <- U21.16 <- U21.04 <- U23.03 <- U23.01 <- D10" },//
				{ 6, 3, 1, 0, "D11",
						"P8.44 <- J17.4 DATIN_3 <- U21.15 <- U21.05 <- U23.06 <- U23.04 <- D11" },//
				{ 6, 4, 1, 0, "D12",
						"P8.41 <- J17.5 DATIN_4 <- U21.14 <- U21.06 <- U24.13 <- U24.15 <- D12" },//
				{ 6, 5, 1, 0, "D13",
						"P8.42 <- J17.6 DATIN_5 <- U21.13 <- U21.07 <- U24.10 <- U24.12 <- D13" },//
				{ 6, 6, 1, 0, "D14",
						"P8.39 <- J17.7 DATIN_6 <- U21.12 <- U21.08 <- U24.03 <- U24.01 <- D14" },//
				{ 6, 7, 1, 0, "D15",
						"P8.40 <- J17.8 DATIN_7 <- U21.11 <- U21.09 <- U24.06 <- U24.04 <- D15" },//
//
// Register 7 write  (PRU -> 74LS377 -> DS8641)
				{ 7, 0, 0, 0, "INTR",
						"P9.31 -> J10.1 DATOUT_0 -> U34.03 -> U34.02 -> U35.14 -> U35.15 -> INTR" },//
				{ 7, 1, 0, 0, "PA",
						"P9.29 -> J10.2 DATOUT_1 -> U34.04 -> U34.05 -> U35.11 -> U35.12 -> PA" },//
				{ 7, 2, 0, 0, "PB",
						"P9.30 -> J10.3 DATOUT_2 -> U34.07 -> U34.06 -> U35.02 -> U35.01 -> PB" },//
				{ 7, 3, 0, 0, "INIT",
						"P9.28 -> J10.4 DATOUT_3 -> U34.08 -> U34.09 -> U35.05 -> U35.04 -> INIT" },//
				{ 7, 4, 0, 0, "ACLO",
						"P9.42 -> J10.5 DATOUT_4 -> U34.13 -> U34.12 -> U36.14 -> U36.15 -> ACLO" },//
				{ 7, 5, 0, 0, "DCLO",
						"P9.27 -> J10.6 DATOUT_5 -> U34.14 -> U34.15 -> U36.11 -> U36.12 -> DCLO" },//
				{ 7, 6, 0, 0, "n.c.",
						"P9.41 -> J10.7 DATOUT_6 -> U34.17 -> U34.16 -> U36.02 -> U36.01 -> n.c." },//
				{ 7, 7, 0, 0, "n.c.",
						"P9.25 -> J10.8 DATOUT_7 -> U34.18 -> U34.19 -> U36.05 -> U36.04 -> n.c." },//
//
// Register 7 read  (PRU <- 74LVTH541 <- DS8641)
				{ 7, 0, 1, 0, "INTR",
						"P8.45 <- J17.1 DATIN_0 <- U33.18 <- U33.02 <- U35.13 <- U35.15 <- INTR" },	//
				{ 7, 1, 1, 0, "PA",
						"P8.46 <- J17.2 DATIN_1 <- U33.17 <- U33.03 <- U35.10 <- U35.12 <- PA" },//
				{ 7, 2, 1, 0, "PB",
						"P8.43 <- J17.3 DATIN_2 <- U33.16 <- U33.04 <- U35.03 <- U35.01 <- PB" },//
				{ 7, 3, 1, 0, "INIT",
						"P8.44 <- J17.4 DATIN_3 <- U33.15 <- U33.05 <- U35.06 <- U35.04 <- INIT" },	//
				{ 7, 4, 1, 0, "ACLO",
						"P8.41 <- J17.5 DATIN_4 <- U33.14 <- U33.06 <- U36.13 <- U36.15 <- ACLO" },	//
				{ 7, 5, 1, 0, "DCLO",
						"P8.42 <- J17.6 DATIN_5 <- U33.13 <- U33.07 <- U36.10 <- U36.12 <- DCLO" },	//
				{ 7, 6, 1, 0, "n.c.",
						"P8.39 <- J17.7 DATIN_6 <- U33.12 <- U33.08 <- U36.03 <- U36.01 <- n.c." },	//
				{ 7, 7, 1, 0, "n.c.",
						"P8.40 <- J17.8 DATIN_7 <- U33.11 <- U33.09 <- U36.06 <- U36.04 <- n.c." },	//
				{ 0, 0, 0, 0, NULL, NULL } 	// End mark
		};

// search a register bit by UNIBUS signal name and direction
buslatches_wire_info_t *buslatches_get_wire_info(const char *unibus_name, unsigned is_input) {
	unsigned i;
	buslatches_wire_info_t *si;

	for (i = 0; (si = &buslatches_wire_info[i]) && si->path; i++)
		if (si->is_input == is_input && !strcasecmp(si->unibus_name, unibus_name))
			return si;
	return NULL; // not found
}

// print info for a loop back mismatch bitmask
static void buslatches_print_wire_path(unsigned reg, unsigned mismatch_bitmask) {
	unsigned bit;
	unsigned bitmask;
	unsigned i;
	buslatches_wire_info_t *si;

	for (bit = 0; bit < 8; bit++) {
		bitmask = 1 << bit;
		if (mismatch_bitmask & bitmask) {
			// search for write path

			printf("Signal path for bus latch %u, bit %u (mask 0x%02x):\n", reg, bit,
					(1 << bit));
			for (i = 0; (si = &buslatches_wire_info[i]) && si->path; i++)
				if (si->reg_sel == reg && !si->is_input && si->bit_nr == bit)
					printf("  Write: %s\n", si->path);
			for (i = 0; (si = &buslatches_wire_info[i]) && si->path; i++)
				if (si->reg_sel == reg && si->is_input && si->bit_nr == bit)
					printf("  Read : %s\n", si->path);
		}
	}
}
// enable=1: activate UNIBUS drivers
// activate AFTER RPU code started and reset bus latches values
void buslatches_output_enable(bool enable) {
	enable = !!enable;
	GPIO_SETVAL(gpios->bus_enable, enable);
	buslatches.cur_output_enable = enable;
}

// register signals to standard
// all outputs to standard:
// init state
void buslatches_register() {
	unsigned i;
// chips are all 8bit width, but not all input/outputs are
// connected to bidirektional terminated UNIBUs lines.
// see PCB schematic!
	buslatches.bidi_bitwidth[0] = 5; // BG4567, NPG
// LTC on .6 ignored, is input only
	buslatches.bidi_bitwidth[1] = 7; // BR4..BR7,NPR,SACK,BBSY
	buslatches.bidi_bitwidth[2] = 8; // addresses 0..7 ;
	buslatches.bidi_bitwidth[3] = 8; // addresses 8..15
	buslatches.bidi_bitwidth[4] = 6; // A16,17,C0,C1, MSYN,SSYN
	buslatches.bidi_bitwidth[5] = 8; // data 0..7
	buslatches.bidi_bitwidth[6] = 8; // data 8..15
	buslatches.bidi_bitwidth[7] = 6; // INTR,PA,PB,INIT,ACLO,DCLO
	for (i = 0; i < BUSLATCHES_COUNT; i++) {
		buslatches.read_inverted[i] = false;
		buslatches.bidi_bitmask[i] = BitmaskFromLen32[buslatches.bidi_bitwidth[i]];
	}
//  BG4567, NPG are read back non inverted from UNIBUS
	buslatches.read_inverted[0] = true;

}

// UNIBUS lines all H / only BR4567, NPR_OUT auf LOW
// PRU1 does it
void buslatches_pru_reset() {
	assert(pru->prucode_id == pru_c::PRUCODE_TEST);
	mailbox_execute(ARM2PRU_BUSLATCH_INIT);
}

// read the REG_DATIN[0..7] pins
// highly optimized, to reduce access to memory mapped gpio registers
unsigned buslatches_getval(unsigned reg_sel) {
// PRU1 does it
	mailbox->buslatch.addr = reg_sel;
	while (mailbox->buslatch.addr != reg_sel)
		; // cache !

	mailbox_execute(ARM2PRU_BUSLATCH_GET);

	return mailbox->buslatch.val; // PRU1 has put the result here
}

// write the REG_DATOUT[0..7] pins into one latch
// only bits "bitmask" are written. Other bits are cleared (PRU logic)
void buslatches_setval(unsigned reg_sel, unsigned bitmask, unsigned val) {
	mailbox->buslatch.addr = reg_sel;
	mailbox->buslatch.bitmask = bitmask & 0xff;
	mailbox->buslatch.val = val;

	mailbox_execute(ARM2PRU_BUSLATCH_SET);
}

// some pattern tests on a register latch
// register is set, drives UNIBUS lines, and is
// immediately read back and compared.
// pattern:
// 1: count upwards
// 2: moving one
// 3: moving zero
// 4: toggle between 0x00 and 0xff
// 5: random values
// read back and compare values
// stop with ^C
void buslatches_test_simple_pattern(unsigned pattern, unsigned reg_sel) {
	unsigned idx, setval = 0, chkval;
	unsigned bitwidth, bitmask;
	unsigned count;
	assert(reg_sel < BUSLATCHES_COUNT);
	bitwidth = buslatches.bidi_bitwidth[reg_sel];
	bitmask = buslatches.bidi_bitmask[reg_sel];

	switch (pattern) {
	case 1:
		printf("Highspeed count register latch %d, stop with ^C.\n", reg_sel);
		break;
	case 2:
		printf("Highspeed \"moving ones\" in register latch %d, stop with ^C.\n", reg_sel);
		break;
	case 3:
		printf("Highspeed \"moving zeros\" in register latch %d, stop with ^C.\n", reg_sel);
		break;
	case 4:
		printf("Highspeed toggle 0x00 - 0xff in register latch %d, stop with ^C.\n", reg_sel);
		break;
	case 5:
		printf("Highspeed random values in register latch %d, stop with ^C.\n", reg_sel);
		break;
	}

// Setup ^C catcher
	SIGINTcatchnext();
// high speed loop
	idx = 0;
	count = 0;
	while (!SIGINTreceived) {
		/* 1. generate pattern */
		switch (pattern) {
		case 1: // count upwards
			setval = idx;
			idx = (idx + 1) & bitmask; // period = bitwidth
			break;
		case 2: // moving ones
			setval = (1 << idx);
			idx = (idx + 1) % bitwidth; // period = bitwidth
			break;
		case 3: // moving zeros
			setval = ~(1 << idx);
			idx = (idx + 1) % bitwidth; // period = bitwidth
			break;
		case 4: // toggle 0x00 0xff
			setval = idx & 1 ? 0x00 : 0xff; // period = 2
			idx = !idx;
			break;
		case 5:
			setval = rand() & 0xff; // slow?
			break;
		}

		/* 2. write pattern into output latches. */
		setval &= bitmask; // do not test unconnected lines
		buslatches_setval(reg_sel, 0xff, setval);

		/* 3. read back pattern in output latches over UNIBUS into input muxes */
		chkval = buslatches_getval(reg_sel);
		if (buslatches.read_inverted[reg_sel])
			chkval = ~chkval; // input latches invert
		chkval &= bitmask;
		if (chkval != setval) {
			printf("pass %u test_register_simple_pattern(%d, %d): wrote 0x%x, read 0x%x\n",
					count, pattern, reg_sel, setval, chkval);

			if (reg_sel == 0) {
				printf("Testing BR*,NPR with BG*,NPG feedback.\n");
				printf("Are there 5*3 jumpers in the \"||\"\n");
				printf("                             \"--\" position?\n");
			}
			buslatches_print_wire_path(reg_sel, setval ^ chkval);
			return;
		}
		count++;
	}
	printf("\n%u tests successful.\n", count);
}

// shuffles entries in mailbox.exerciser work list
static void buslatches_exerciser_random_order() {
	for (unsigned i = 0; i < 2 * BUSLATCHES_COUNT; i++) {
		unsigned reg_sel1 = rand() % BUSLATCHES_COUNT;
		unsigned reg_sel2 = rand() % BUSLATCHES_COUNT;
		uint8_t tmp;
		// swap addr and testval
		tmp = mailbox->buslatch_exerciser.addr[reg_sel1];
		mailbox->buslatch_exerciser.addr[reg_sel1] = mailbox->buslatch_exerciser.addr[reg_sel2];
		mailbox->buslatch_exerciser.addr[reg_sel2] = tmp;
		tmp = mailbox->buslatch_exerciser.writeval[reg_sel1];
		mailbox->buslatch_exerciser.writeval[reg_sel1] =
				mailbox->buslatch_exerciser.writeval[reg_sel2];
		mailbox->buslatch_exerciser.writeval[reg_sel2] = tmp;
	}
}

void buslatches_test_simple_pattern_multi(unsigned pattern) {
	unsigned pass_no; // global test number counter
	uint64_t total_errors, total_tests;
	unsigned reg_sel; // register address
	unsigned testval[BUSLATCHES_COUNT]; // test data for all latches

	switch (pattern) {
//	case 1:
//		printf("Highspeed count register latch %d, stop with ^C.\n", reg_sel);
//		break;
	case 2:
		printf("Highspeed \"moving ones\" in register latches, stop with ^C.\n");
		break;
	case 3:
		printf("Highspeed \"moving zeros\" in register latches, stop with ^C.\n");
		break;
	case 4:
		printf("Highspeed toggle 0x00 - 0xff in register latches, stop with ^C.\n");
		break;
	case 5:
		printf("Highspeed random values in register latches, stop with ^C.\n");
		break;
	default:
		printf("Error: unknown test pattern %u.\n", pattern);
	}

	pass_no = 0;
	total_errors = 0;
	total_tests = 0;

	// Setup ^C catcher
	SIGINTcatchnext();
	// high speed loop
	while (!SIGINTreceived) {
		// 1 cycle = 8 bits of 8 registers
		// some tests are no-op because of reduced bitwidth

		/* 1. generate pattern. Output: testval[reg_addr] */
		switch (pattern) {
		case 2: // moving ones, linear addressing
			for (reg_sel = 0; reg_sel < BUSLATCHES_COUNT; reg_sel++) {
				unsigned bitidx = pass_no % 8; // circle all 8 bits per register
				unsigned regidx = (pass_no / 8) % BUSLATCHES_COUNT; // circle all registers
				// set only one bit
				if (reg_sel == regidx)
					testval[reg_sel] = 1 << bitidx;
				else
					testval[reg_sel] = 0;
			}
			break;
		case 3: // moving zeros, linear addressing
			for (reg_sel = 0; reg_sel < BUSLATCHES_COUNT; reg_sel++) {
				// clear only one bit
				unsigned bitidx = pass_no % 8; // circle all 8 bits per register
				unsigned regidx = (pass_no / 8) % BUSLATCHES_COUNT; // circle all registers
				if (reg_sel == regidx)
					testval[reg_sel] = ~(1 << bitidx);
				else
					testval[reg_sel] = 0xff;
			}
			break;
		case 4: // toggle all regs simultaneously 0x00, 0xff, 0xff, ...
			// linear addressing
			for (reg_sel = 0; reg_sel < BUSLATCHES_COUNT; reg_sel++) {
				if (pass_no & 1)
					testval[reg_sel] = 0xff;
				else
					testval[reg_sel] = 0x00;
			}
			break;
		case 5:
			// random values, random addressing
			for (reg_sel = 0; reg_sel < BUSLATCHES_COUNT; reg_sel++)
				testval[reg_sel] = rand() & 0xff; // slow?
			break;
		default:
			printf("Error: unknown test pattern %u.\n", pattern);
		}

		// mask out unimplemented bits
		for (reg_sel = 0; reg_sel < BUSLATCHES_COUNT; reg_sel++)
			testval[reg_sel] &= buslatches.bidi_bitmask[reg_sel];

		// Setup mailbox for PRU buslatch exerciser
		// it tests always 8 accesses
		for (reg_sel = 0; reg_sel < BUSLATCHES_COUNT; reg_sel++) {
			mailbox->buslatch_exerciser.addr[reg_sel] = reg_sel;
			mailbox->buslatch_exerciser.writeval[reg_sel] = testval[reg_sel];
			mailbox->buslatch_exerciser.readval[reg_sel] = 0xff; // invalid at the moment
		}
		// shuffle worklist to create random access order
		buslatches_exerciser_random_order();

		// alternatingly use byte or bit access procedures
		// unindented synchronoized with moving one/moving zero or other peridioc tests
		mailbox->buslatch_exerciser.pattern = (pass_no
				% MAILBOX_BUSLATCH_EXERCISER_PATTERN_COUNT);

		mailbox_execute(ARM2PRU_BUSLATCH_EXERCISER);

		// check: mailbox readvalues == write values ?
		for (unsigned i = 0; i < BUSLATCHES_COUNT; i++) {
			reg_sel = mailbox->buslatch_exerciser.addr[i];
			unsigned writeval = mailbox->buslatch_exerciser.writeval[i];
			unsigned readval = mailbox->buslatch_exerciser.readval[i];
			unsigned bitmask = buslatches.bidi_bitmask[reg_sel];
			total_tests++;
			if (buslatches.read_inverted[reg_sel])
				readval = ~readval; // input latches invert
			readval &= bitmask;
			if (readval != writeval) {
				total_errors++;
				printf(
						"Error buslatches_test_simple_pattern_multi(pattern=%d), pass %u, pattern = %d:\n",
						pattern, pass_no, (unsigned) mailbox->buslatch_exerciser.pattern);
				printf("  register %u: wrote 0x%x, read back 0x%x, error bit mask 0x%02x\n",
						reg_sel, writeval, readval, writeval ^ readval);
				if (i == 0)
					printf("  No prev addr/val history\n");
				else {
					// prinout previous test data. for access pattern see "pattern" and sourcecode
					printf("  Prev addr/val history:");
					for (unsigned j = 0; j < i; j++)
						printf(" %u/0x%02x", mailbox->buslatch_exerciser.addr[j],
								mailbox->buslatch_exerciser.writeval[j]);
					printf(".\n");
				}
				if (reg_sel == 0) {
					printf("Testing BR*,NPR with BG*,NPG feedback.\n");
					printf("Are there 5*3 jumpers in the \"||\"\n");
					printf("                             \"--\" position?\n");
				}
				buslatches_print_wire_path(reg_sel, writeval ^ readval);
				printf("%llu of %llu tests failed, error rate = %0.5f%% = %gppm)\n\n",
						total_errors, total_tests, 100.0 * total_errors / total_tests,
						1000000.0 * total_errors / total_tests);
			}
		}

		pass_no++;
	}

	if (total_errors == 0)
		printf("\n%llu tests successful.\n", total_tests);
	else
		printf("\n%llu of %llu tests failed, error rate = %0.5f%% = %gppm)\n", total_errors,
				total_tests, 100.0 * total_errors / total_tests,
				1000000.0 * total_errors / total_tests);
}

/* stress test on highspeed timing
 * PRU generates max speed reaed/write sequences on
 // ADDR<0:7>, ADDR <8:15>, DATA<0:7> and <DATA8:15>
 */
void buslatches_test_timing(uint8_t addr_0_7, uint8_t addr_8_15, uint8_t data_0_7,
		uint8_t data_8_15) {
	timeout_c timeout;
	printf("PRU generates max speed read/write sequences on 4 full 8bit\n");
	printf("latches with these start patterns:\n");
	printf(
			"ADDR<0:7> = 0x%02x, ADDR<8:15> = 0x%02x, DATA<0:7> = 0x%02x, <DATA8:15> = 0x%02x.\n",
			addr_0_7, addr_8_15, data_0_7, data_8_15);
	printf("Read/write mismatches are signaled with PRU1.12 == 1.\n");
	printf("Connect logic analyzer probes to: \n");
	printf("  REG_SEL, REG_WRITE, REG_DATIN, REG_DATOUT, PRU1.12 .\n");
	printf("End with ^C.\n");

	mailbox->buslatch_test.addr_0_7 = addr_0_7;
	mailbox->buslatch_test.addr_8_15 = addr_8_15;
	mailbox->buslatch_test.data_0_7 = data_0_7;
	mailbox->buslatch_test.data_8_15 = data_8_15;

// Setup ^C catcher
	SIGINTcatchnext();

	mailbox->arm2pru_req = ARM2PRU_BUSLATCH_TEST; // start PRU test loop

	while (!SIGINTreceived) {
		timeout.wait_ms(0);
	}
// stop PRU loop by settting something != ARM2PRU_BUSLATCH_TEST
	mailbox->arm2pru_req = ARM2PRU_BUSLATCH_INIT; //
	timeout.wait_ms(1);
	if (mailbox->arm2pru_req != ARM2PRU_NONE)
		printf("Stopping PRU test loop failed!\n");
	else
		printf("PRU test loop stopped.\n");
}

/**** GPIO access to UNIBUS sigbals ****/
unibus_signals_c *unibus_signals; // singleton

unibus_signal_info_c::unibus_signal_info_c(enum unibus_signal_info_c::id_enum id, string name,
		unsigned bitwidth) {
	this->id = id;
	this->name = name;
	this->bitwidth = bitwidth;
}

unibus_signals_c::unibus_signals_c() {
// fill dictionary
// order like in DEC manual
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_address, "ADDR", 18));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_data, "DATA", 16));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_control, "C1,C0", 2));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_msyn, "MSYN", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_ssyn, "SSYN", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_pa, "PA", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_pb, "PB", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_intr, "INTR", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_br4, "BR4", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_br5, "BR5", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_br6, "BR6", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_br7, "BR7", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_bg4, "BG4", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_bg5, "BG5", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_bg6, "BG6", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_bg7, "BG7", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_npr, "NPR", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_npg, "NPG", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_sack, "SACK", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_bbsy, "BBSY", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_init, "INIT", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_aclo, "ACLO", 1));
	signals.push_back(unibus_signal_info_c(unibus_signal_info_c::ub_dclo, "DCLO", 1));
}

unsigned unibus_signals_c::max_name_len() {
	return 5; // see above
}

unsigned unibus_signals_c::size() {
	return signals.size();
}

void unibus_signals_c::set_val(enum unibus_signal_info_c::id_enum id, unsigned value) {
	switch (id) {
	case unibus_signal_info_c::ub_address:
		buslatches_setval(2, 0xff, value); // ADDR0:7
		buslatches_setval(3, 0xff, value >> 8); // ADDR8:15
		buslatches_setval(4, 0x03, value >> 12); // ADDR16,17
		break;
	case unibus_signal_info_c::ub_data:
		buslatches_setval(5, 0xff, value); // DATA0:7
		buslatches_setval(6, 0xff, value >> 8); // DATA8:15
		break;
	case unibus_signal_info_c::ub_control:
		buslatches_setval(4, 0x0C, value << 2); // C1 = 0x8, C0 = 0x4
		break;
	case unibus_signal_info_c::ub_msyn:
		buslatches_setval(4, 0x10, value << 4); // MSYN = 0x10
		break;
	case unibus_signal_info_c::ub_ssyn:
		buslatches_setval(4, 0x20, value << 5); // ssyn=0x20
		break;
	case unibus_signal_info_c::ub_pa:
		buslatches_setval(7, 0x02, value << 1);
		break;
	case unibus_signal_info_c::ub_pb:
		buslatches_setval(7, 0x04, value << 2);
		break;
	case unibus_signal_info_c::ub_intr:
		buslatches_setval(7, 0x01, value);
		break;
	case unibus_signal_info_c::ub_br4:
		buslatches_setval(1, 0x01, value);
		break;
	case unibus_signal_info_c::ub_br5:
		buslatches_setval(1, 0x02, value << 1);
		break;
	case unibus_signal_info_c::ub_br6:
		buslatches_setval(1, 0x04, value << 2);
		break;
	case unibus_signal_info_c::ub_br7:
		buslatches_setval(1, 0x08, value << 3);
		break;
	case unibus_signal_info_c::ub_bg4:
		buslatches_setval(0, 0x01, !value);
		break;
	case unibus_signal_info_c::ub_bg5:
		buslatches_setval(0, 0x02, (!value) << 1);
		break;
	case unibus_signal_info_c::ub_bg6:
		buslatches_setval(0, 0x04, (!value) << 2);
		break;
	case unibus_signal_info_c::ub_bg7:
		buslatches_setval(0, 0x08, (!value) << 3);
		break;
	case unibus_signal_info_c::ub_npr:
		buslatches_setval(1, 0x10, value << 4);
		break;
	case unibus_signal_info_c::ub_npg:
		buslatches_setval(0, 0x10, (!value) << 4);
		break;
	case unibus_signal_info_c::ub_sack:
		buslatches_setval(1, 0x20, value << 5);
		break;
	case unibus_signal_info_c::ub_bbsy:
		buslatches_setval(1, 0x40, value << 6);
		break;
	case unibus_signal_info_c::ub_init:
		buslatches_setval(7, 0x08, value << 3);
		break;
	case unibus_signal_info_c::ub_aclo:
		buslatches_setval(7, 0x10, value << 4);
		break;
	case unibus_signal_info_c::ub_dclo:
		buslatches_setval(7, 0x20, value << 5);
		break;
	}
}

unsigned unibus_signals_c::get_val(enum unibus_signal_info_c::id_enum id) {
	unsigned result = 0;
	switch (id) {
	case unibus_signal_info_c::ub_address:
		result = buslatches_getval(2); // ADDR0:7
		result |= buslatches_getval(3) << 8; // ADDR8:15
		result |= (buslatches_getval(4) & 0x03) << 16; // ADDR8:15
		break;
	case unibus_signal_info_c::ub_data:
		result = buslatches_getval(5); // DATA0:7
		result |= buslatches_getval(6) << 8; // DATA8:15
		break;
	case unibus_signal_info_c::ub_control:
		result = (buslatches_getval(4) & 0x0c) >> 2; // C1 = 0x8, C0 = 0x4
		break;
	case unibus_signal_info_c::ub_msyn:
		result = (buslatches_getval(4) & 0x10) >> 4; // MSYN = 0x10
		break;
	case unibus_signal_info_c::ub_ssyn:
		result = (buslatches_getval(4) & 0x20) >> 5; // ssyn=0x20
		break;
	case unibus_signal_info_c::ub_pa:
		result = (buslatches_getval(7) & 0x02) >> 1;
		break;
	case unibus_signal_info_c::ub_pb:
		result = (buslatches_getval(7) & 0x04) >> 2;
		break;
	case unibus_signal_info_c::ub_intr:
		result = (buslatches_getval(7) & 0x01);
		break;
	case unibus_signal_info_c::ub_br4:
		result = (buslatches_getval(1) & 0x01);
		break;
	case unibus_signal_info_c::ub_br5:
		result = (buslatches_getval(1) & 0x02) >> 1;
		break;
	case unibus_signal_info_c::ub_br6:
		result = (buslatches_getval(1) & 0x04) >> 2;
		break;
	case unibus_signal_info_c::ub_br7:
		result = (buslatches_getval(1) & 0x08) >> 3;
		break;
	case unibus_signal_info_c::ub_bg4:
		result = !(buslatches_getval(0) & 0x01);
		break;
	case unibus_signal_info_c::ub_bg5:
		result = !(buslatches_getval(0) & 0x02) >> 1;
		break;
	case unibus_signal_info_c::ub_bg6:
		result = !(buslatches_getval(0) & 0x04) >> 2;
		break;
	case unibus_signal_info_c::ub_bg7:
		result = !(buslatches_getval(0) & 0x08) >> 3;
		break;
	case unibus_signal_info_c::ub_npr:
		result = (buslatches_getval(1) & 0x10) >> 4;
		break;
	case unibus_signal_info_c::ub_npg:
		result = !(buslatches_getval(0) & 0x10) >> 4;
		break;
	case unibus_signal_info_c::ub_sack:
		result = (buslatches_getval(1) & 0x20) >> 5;
		break;
	case unibus_signal_info_c::ub_bbsy:
		result = (buslatches_getval(1) & 0x40) >> 6;
		break;
	case unibus_signal_info_c::ub_init:
		result = (buslatches_getval(7) & 0x08) >> 3;
		break;
	case unibus_signal_info_c::ub_aclo:
		result = (buslatches_getval(7) & 0x10) >> 4;
		break;
	case unibus_signal_info_c::ub_dclo:
		result = (buslatches_getval(7) & 0x20) >> 5;
		break;
	}
	return result;
}

