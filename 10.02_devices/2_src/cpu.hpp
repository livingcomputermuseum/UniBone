/* cpu.hpp: PDP-11/05 CPU

 Copyright (c) 2018, Angelo Papenhoff, Joerg Hoppe
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


 23-nov-2018  JH      created
 */
#ifndef _CPU_HPP_
#define _CPU_HPP_

using namespace std;

#include "utils.hpp"
//#include "unibusadapter.hpp"
//#include "unibusdevice.hpp"
#include "unibuscpu.hpp"
#include "cpu20/11.h"
#include "cpu20/ka11.h"

class cpu_c: public unibuscpu_c {
private:

	//unibusdevice_register_t *switch_reg;
	//unibusdevice_register_t *display_reg;

public:

	cpu_c();
	~cpu_c();

	// used for DATI/DATO, operated by unibusadapter
	dma_request_c data_transfer_request = dma_request_c(this);

	bool on_param_changed(parameter_c *param) override;  // must implement

	parameter_bool_c runmode = parameter_bool_c(this, "run", "r",/*readonly*/
	false, "1 = CPU running, 0 = halt");
	parameter_bool_c init = parameter_bool_c(this, "init", "i",/*readonly*/
	false, "1 = CPU initializing");

	struct Bus bus; // UNIBUS interface of CPU
	struct KA11 ka11; // Angelos CPU state

	void start(void) ;
	void stop(void) ;


	// background worker function
	void worker(unsigned instance) override;

	// called by unibusadapter on emulated register access
	void on_after_register_access(unibusdevice_register_t *device_reg, uint8_t unibus_control)
			override;

	void on_interrupt(uint16_t vector);

};

#endif
