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
#include <queue>

#include "iopageregister.h"
#include "unibusdevice.hpp"

class dma_request_c
{
public:
    dma_request_c(
        uint8_t unibus_control,
        uint32_t unibus_addr,
        uint16_t *buffer,
        uint32_t wordcount);

    ~dma_request_c();

    uint8_t GetUnibusControl() { return _unibus_control; }
    uint32_t GetUnibusStartAddr() { return _unibus_start_addr; } 
    uint16_t* GetBuffer() { return _buffer; }
    uint32_t  GetWordCount() { return _wordcount; }
    uint32_t GetUnibusEndAddr() { return _unibus_end_addr; }
    void SetUnibusEndAddr(uint32_t end) { _unibus_end_addr = end; }

    bool IsComplete() { return _isComplete; }
    bool GetSuccess() { return _success; }

    void SetComplete() { _isComplete = true; }
    void SetSuccess(bool success) { _success = success; }

private:

    uint8_t         _unibus_control;
    uint32_t        _unibus_start_addr;
    uint32_t        _unibus_end_addr;
    uint16_t*       _buffer;
    uint32_t        _wordcount;

    bool            _isComplete;
    bool            _success;
};

class irq_request_c
{
public:
    irq_request_c(
        uint32_t level,
        uint32_t vector);

    ~irq_request_c();

    uint32_t GetInterruptLevel() { return _level; }
    uint32_t GetVector() { return _vector; }
    bool IsComplete() { return _isComplete; }

    void SetComplete() { _isComplete = true; }

private:
    uint32_t _level;
    uint32_t _vector;
    bool     _isComplete;
};
 

// is a device_c. need a thread (but no params)
class unibusadapter_c: public device_c {

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
        void dma_worker(void);      // background DMA worker
 
	bool register_device(unibusdevice_c& device);
	void unregister_device(unibusdevice_c& device);

	bool request_DMA_active(const char *error_info) ;
	bool request_INTR_active(const char *error_info) ;

	bool request_client_DMA(uint8_t unibus_control, uint32_t unibus_addr,
			uint16_t *buffer, uint32_t wordcount, uint32_t *unibus_end_addr);
	void request_INTR(uint32_t level, uint32_t vector);
        void rundown_bus_requests(void);

	void print_shared_register_map(void);

private:
 
        std::queue<dma_request_c*> _dmaRequests;
        std::queue<irq_request_c*> _irqRequests;
        pthread_t _busWorker_pthread;
        pthread_cond_t _busWakeup_cond;
        pthread_cond_t _requestFinished_cond;
        pthread_mutex_t _busWorker_mutex;
};

extern unibusadapter_c *unibusadapter; // another Singleton

#endif
