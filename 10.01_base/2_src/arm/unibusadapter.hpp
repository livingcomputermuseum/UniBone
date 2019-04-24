/* unibusadapter.hpp: connects multiple "unibusdevices" to the PRU UNIBUS interface

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
#ifndef _UNIBUSADAPTER_HPP_
#define _UNIBUSADAPTER_HPP_

#include <thread>

#include "iopageregister.h"
#include "unibusdevice.hpp"

// is a device_c. need a thread (but no params)
class unibusadapter_c: public device_c {
private:
	// save params of current DMA transaction
	volatile uint8_t cur_DMA_unibus_control; // DATI? DATO?
	uint16_t *cur_DMA_buffer;
	volatile unsigned cur_DMA_wordcount;

public:
	unibusadapter_c();

	// list of registered devices.
	// Defines GRANT priority:
	// Lower index = "nearer to CPU" = higher priority
	unibusdevice_c *devices[MAX_DEVICE_HANDLE + 1];

	volatile bool	line_INIT ; // current state of these UNIBUS signals
	volatile bool 	line_DCLO ;

	bool on_param_changed(parameter_c *param) override;  // must implement
	void on_power_changed(void) override; // must implement
	void on_init_changed(void) override; // must implement

	void worker_init_event(void) ;
	void worker_power_event(void) ;
	void worker_deviceregister_event(void) ;
	void worker(void) override; // background worker function

	bool register_device(unibusdevice_c& device);
	void unregister_device(unibusdevice_c& device);

	bool request_DMA_active(const char *error_info) ;
	bool request_INTR_active(const char *error_info) ;

	bool request_DMA(unibusdevice_c *device, uint8_t unibus_control, uint32_t unibus_addr,
			uint16_t *buffer, unsigned wordcount);
	void request_INTR(unibusdevice_c *device, unsigned level, unsigned vector);
	bool complete_DMA(unibusdevice_c *device, uint32_t *unibus_end_addr, bool *error);
	bool complete_INTR(unibusdevice_c *device);

	void print_shared_register_map(void);

};

extern unibusadapter_c *unibusadapter; // another Singleton

#endif
