/* demo_regs.hpp: sample UNIBUS controller with register logic

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
#ifndef _DEMO_REGS_HPP_
#define _DEMO_REGS_HPP_

#include "utils.hpp"
#include "unibusdevice.hpp"
#include "parameter.hpp"

class demo_regs_c: public unibusdevice_c {
private:

public:

	parameter_unsigned_c access_count = parameter_unsigned_c(this, "access_count",
			"ac",/*readonly*/
			true, "", "%u", "Total # of register accesses", 32, 10);

	demo_regs_c();

	// background worker function
	void worker(void) override;

	// called by unibusadapter on emulated register access
	void on_after_register_access(unibusdevice_register_t *device_reg, uint8_t unibus_control)
			override;

	bool on_param_changed(parameter_c *param) override;  // must implement
	void on_power_changed(void) override;
	void on_init_changed(void) override;
};

#endif
