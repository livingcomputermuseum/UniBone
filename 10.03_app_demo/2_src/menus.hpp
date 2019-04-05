/* menus.hpp: user menus for tests

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

 15-May-2018  JH      created
 */

#ifndef MENUS_H_
#define MENUS_H_

#include <stdint.h>

#include "unibusdevice.hpp"

class menus_c {
private:
	// UniBone should emulate this address range
	uint32_t emulated_memory_start_addr;
	uint32_t emulated_memory_end_addr;

	void print_arbitration_info(const char *indent);
	char *getchoice(void);
	void emulate_memory(void);
	void print_params(parameterized_c *parameterized, parameter_c *p);

	unibusdevice_register_t * device_register_by_id(unibusdevice_c *device, char *specifier);

	void menu_info(void);
	void menu_gpio(void);
	void menu_panel(void);
	void menu_mailbox(void);
	void menu_buslatches(void);
	void menu_ddrmem_slave_only(void);
	void menu_masterslave(void);
	void menu_interrupts(void);
	void menu_devices(void);
	void menu_device_exercisers(void);

public:
	int linewidth; 	// width of screen for menu display

	void menu_main(void);
};

extern menus_c *menus; // Singleton

#endif /* MENUS_H_ */
