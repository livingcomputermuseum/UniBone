/* unibusadapter.cpp: connects multiple "unibusdevices" to the PRU UNIBUS interface

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

 unibusadapter
 connects multiple "devices" with unibus-interface implmented by PRU

 - A thread waits for Register Interrupts and routes them to the
 correct controller
 ( UNIBUS -> Controllers)
 - a scheduler accepts INTR and DMA request in a fifo
 and generates ordered cmds for the PRU
 (also simulates slot order)
 Controllers -> UNIBUS
 - allows controllers and memory to register and deregister
 in the deviceregister tables  (devices.h)
 Distrubutes INIT to all registered controllers.

 recieves DMA and INTR request from many devices
 Issues only one INTR or one DMA to the PRU
 (INTR parallel with DMA not possible,
 multiple INTR levels in parallel not possible)
 */
#define _UNIBUSADAPTER_CPP_

//#include <iostream>
//#include <fstream>
#include <ios>
#include <string.h>
#include <pthread.h>
#include <assert.h>
#include <queue>

// TEST
//#include <unistd.h> // sleep()
//#include <sys/time.h>

using namespace std;

#include "logsource.hpp"
#include "logger.hpp"
#include "mailbox.h"
#include "gpios.hpp"
#include "prussdrv.h"
#include "pruss_intc_mapping.h"
#include "iopageregister.h"
#include "unibusadapter.hpp"

dma_request_c::dma_request_c(uint8_t unibus_control, uint32_t unibus_addr, uint16_t* buffer,
		uint32_t wordcount) :
		_unibus_control(unibus_control), _unibus_start_addr(unibus_addr), _unibus_end_addr(0), _buffer(
				buffer), _wordcount(wordcount), _isComplete(false), _success(false) {

}

dma_request_c::~dma_request_c() {

}

irq_request_c::irq_request_c(unsigned level, unsigned vector) :
		_level(level), _vector(vector), _isComplete(false) {

}

irq_request_c::~irq_request_c() {

}

void* bus_worker(void *context) {
	unibusadapter_c* bus = reinterpret_cast<unibusadapter_c*>(context);
	bus->dma_worker();
	return nullptr;
}

unibusadapter_c *unibusadapter; // another Singleton
// is registered in device_c.list<devices> ... order of static constructor calls ???

unibusadapter_c::unibusadapter_c() :
		device_c(), _busWakeup_cond(PTHREAD_COND_INITIALIZER), _requestFinished_cond(
		PTHREAD_COND_INITIALIZER), _busWorker_mutex(PTHREAD_MUTEX_INITIALIZER) {
	unsigned i;
	log_label = "UNAPT";

	name.value = "UNIBUSADAPTER";
	type_name.value = "unibusadapter_c";

	for (i = 0; i <= MAX_DEVICE_HANDLE; i++)
		devices[i] = NULL;
	line_INIT = false;
	line_DCLO = false;

	//
	// Start bus worker thread
	//
	pthread_attr_t attribs;
	pthread_attr_init(&attribs);

	int status = pthread_create(&_busWorker_pthread, &attribs, &bus_worker,
			reinterpret_cast<void*>(this));

	if (status != 0) {
		FATAL("Failed to start unibus worker thread.  Status 0x%x", status);
	}
}

bool unibusadapter_c::on_param_changed(parameter_c *param) {
	// no own parameter or "enable" logic
	return device_c::on_param_changed(param); // more actions (for enable)
}

void unibusadapter_c::on_power_changed(void) {

}

void unibusadapter_c::on_init_changed(void) {
}

// set state of INIT
void unibusadapter_c::worker_init_event() {
	unsigned device_handle;
	unibusdevice_c *device;
	// notify device on changed of INIT line
	DEBUG("worker_init_event(): INIT %s", line_INIT ? "asserted" : "deasserted");
	for (device_handle = 0; device_handle <= MAX_DEVICE_HANDLE; device_handle++)
		if ((device = devices[device_handle])) {
			device->init_asserted = line_INIT;
			device->on_init_changed();
		}

	// Clear bus request queues
	rundown_bus_requests();
}

void unibusadapter_c::worker_power_event() {
	unsigned device_handle;
	unibusdevice_c *device;
	// notify device on changed of INIT line
	DEBUG("worker_power_event(): DCLO %s", line_DCLO ? "asserted" : "deasserted");
	for (device_handle = 0; device_handle <= MAX_DEVICE_HANDLE; device_handle++)
		if ((device = devices[device_handle])) {
			device->power_down = line_DCLO;
			device->on_power_changed();
		}

	// Clear bus request queues
	rundown_bus_requests();
}

// process DATI/DATO access to active device registers

void unibusadapter_c::worker_deviceregister_event() {
	unsigned device_handle;
	unibusdevice_c *device;
	device_handle = mailbox->events.device_handle;
	assert(device_handle);
	device = devices[device_handle];
	unsigned evt_idx = mailbox->events.device_register_idx;
	uint32_t evt_addr = mailbox->events.addr;
	// normally evt_data == device_reg->shared_register->value
	// but shared value gets desorted if INIT in same event clears the registers before DATO
	uint16_t evt_data = mailbox->events.data;
	unibusdevice_register_t *device_reg = &(device->registers[evt_idx]);
	uint8_t unibus_control = mailbox->events.unibus_control;

	/* call device event callback

	 The PRU has only one "value" for each register, but "active" registers have separate
	 read(DATI) and write(DATO) flipflops. So if register is "active:
	 BEFORE processing of logic state changes:
	 DATO: save written value into .active_write_val
	 restore changed shared PRU register with .active_read_val for next read
	 */
	if (device_reg->active_on_dati && !UNIBUS_CONTROL_ISDATO(unibus_control)) {
		// register is read with DATI, this changes the logic state
		evt_addr &= ~1; // make even
		assert(evt_addr == device->base_addr.value + 2 * evt_idx);
		unibus_control = UNIBUS_CONTROL_DATI;
		// read access: dati-flipflops do not change

		// signal: changed by UNIBUS
		device->log_register_event("DATI", device_reg);

		device->on_after_register_access(device_reg, unibus_control);
	} else if (device_reg->active_on_dato && UNIBUS_CONTROL_ISDATO(unibus_control)) {
//		uint16_t reg_value_written = device_reg->shared_register->value;
		//	restore value accessible by DATI
		device_reg->shared_register->value = device_reg->active_dati_flipflops;
		// Restauration of shared_register->value IS NOT ATOMIC against device logic threads.
		// Devices must use only reg->active_dati_flipflops !
		switch (unibus_control) {
		case UNIBUS_CONTROL_DATO:
			// write into a register with separate read/write flipflops
			assert(evt_addr == device->base_addr.value + 2 * evt_idx);
			// clear unused bits, save written value
			device_reg->active_dato_flipflops = evt_data & device_reg->writable_bits;
			// signal: changed by UNIBUS
			device->log_register_event("DATO", device_reg);
			break;
		case UNIBUS_CONTROL_DATOB:
			// UNIBUS may access only 8bit half of register with DATOB.
			// convert all active registers accesses to 16 bit
			evt_data &= device_reg->writable_bits; // clear unused bits
			// save written value
			if (evt_addr & 1) // odd address: bits 15:8 written
				device_reg->active_dato_flipflops = (device_reg->active_dato_flipflops & 0x00ff)
						| (evt_data & 0xff00);
			else
				// even address : bits 7:0 written
				device_reg->active_dato_flipflops = (device_reg->active_dato_flipflops & 0xff00)
						| (evt_data & 0x00ff);
			unibus_control = UNIBUS_CONTROL_DATO; // simulate 16 bit access
			// signal: changed by UNIBUS
			device->log_register_event("DATOB", device_reg);
			break;
		}
		device->on_after_register_access(device_reg, unibus_control);
		/*
		 DEBUG(LL_DEBUG, LC_UNIBUS, "dev.reg=%d.%d, %s, addr %06o, data %06o->%06o",
		 device_handle, evt_idx,
		 unibus_c::control2text(mailbox->event.unibus_control), evt_addr,
		 oldval, device_reg->shared_register->value);
		 */
	}
// only in worker()!! Starts PRU	mailbox->events.eventmask &= ~EVENT_DEVICEREGISTER; // clear bit
}

// runs in background, catches and distributes PRU events
void unibusadapter_c::worker(unsigned instance) {
	UNUSED(instance) ; // only one
	int res;

	// set thread priority to MAX.
	// - fastest response to select() call in prussdrv_pru_wait_event_timeout()
	//  (minimal I/O latency)
	// - not interrupted by other tasks while running
	// check with tool "top" or "htop".
	worker_init_realtime_priority(rt_max); // set to max prio

	while (!workers_terminate) {
		// Timing:
		// This is THE ONE mechanism where "realtime meets Linux"
		// To respond to the PRU signal, Linux must wake up schedule this thread
		// Test:
		// - set RT prio of this worker thread to true 100% (SCHED_FIFO. max prio,
		//		/proc/sys/kernel/sched_rt_runtime_us = -1
		// - let the PRU pulse a GPIO on signal_set
		// - let this worker raise a GPIO while its active
		// - verify with scope that PRU - signal to worker start is about 100-300us
		//	MUST NOT GET LARGER on any Linux activity,

		// main loop
		// wait 0.1 sec, just tell
		/* The prussdrv_pru_wait_event() function returns the number of times
		 the event has taken place, as an unsigned int. There is no out-of-
		 band value to indicate error (and it can wrap around to 0 if you
		 run the program just a whole lot of times). */
		res = prussdrv_pru_wait_event_timeout(PRU_EVTOUT_0, 100000/*us*/);
//res = prussdrv_pru_wait_event(PRU_EVTOUT_0);
		// PRU may have raised more than one event before signal is accepted.
		// single combination of only INIT+DATI/O possible
		prussdrv_pru_clear_event(PRU_EVTOUT_0, PRU0_ARM_INTERRUPT);
		// uses select() internally: 0 = timeout, -1 = error, else event count received
		while (res > 0 && mailbox->events.eventmask) { // res is const
//			SET_DEBUG_PIN0(1) ; // debug: PRU event accepted
		// Process multiple events sent by PRU.
		//
		// while ARM accepts the signal, the PRU may set more events
		// critical a mix of INIT and DATI/DATO: RESET and register access follow directly
		// But no DATI/DATO occurs while INIT active. So reconstruct event order by
		// processing order: INIT_DEASSERT, DATI/O, INIT_ASSERT, DCLO/ACLO
			bool init_raising_edge = false;
			bool init_falling_edge = false;
			bool dclo_raising_edge = false;
			bool dclo_falling_edge = false;
			// DEBUG("mailbox->events: mask=0x%x", mailbox->events.eventmask);
			if (mailbox->events.eventmask & EVENT_INITIALIZATIONSIGNALS) {
				// robust: any change in ACLO/DCL=INIT updates state of all 3.
				// Initial DCLO-cycle to PDP_11 intialize these states
				if (mailbox->events.initialization_signals_cur & INITIALIZATIONSIGNAL_INIT) {
					if (!line_INIT)
						init_raising_edge = true;
					line_INIT = true;
				} else {
					if (line_INIT)
						init_falling_edge = true;
					line_INIT = false;
				}
				if (mailbox->events.initialization_signals_cur & INITIALIZATIONSIGNAL_DCLO) {
					if (!line_DCLO)
						dclo_raising_edge = true;
					line_DCLO = true;
				} else {
					if (line_DCLO)
						dclo_falling_edge = true;
					line_DCLO = false;
				}
				DEBUG(
						"EVENT_INITIALIZATIONSIGNALS: (sigprev=0x%x,) cur=0x%x, init_rais=%d, init_fall=%d, dclo_rais=%d, dclo_fall=%d",
						mailbox->events.initialization_signals_prev,
						mailbox->events.initialization_signals_cur, init_raising_edge,
						init_falling_edge, dclo_raising_edge, dclo_falling_edge);

				mailbox->events.eventmask &= ~EVENT_INITIALIZATIONSIGNALS; // ACK, now PRU continues

				if (dclo_raising_edge || dclo_falling_edge)
					worker_power_event(); // power signal power change
			}
			if (init_falling_edge) // INIT asserted -> deasserted.  DATI/DATO cycle only possible after that.
				worker_init_event();
			if (mailbox->events.eventmask & EVENT_DEVICEREGISTER) {
				// DATI/DATO
				// DEBUG("EVENT_DEVICEREGISTER:  control=%d, addr=%06o", (int)mailbox->events.unibus_control, mailbox->events.addr);
				worker_deviceregister_event();
				mailbox->events.eventmask &= ~EVENT_DEVICEREGISTER; // ACK, now PRU continues
			}
			if (init_raising_edge) // INIT deasserted -> asserted DATI/DATO cycle only possible before that.
				worker_init_event();

		}
//SET_DEBUG_PIN0(0) ; // debug: PRU event processed

		// Signal to PRU: continue UNIBUS cycles now with SSYN deassert
	}
}

// register_device ... "plug" the device into UNIBUs backplane
// - assign handle
// - setup register map for a device
// uses device.handle, startaddress, "active" attribute of registers
// result: shared addressmap changed,
// device.register[] point into shared register descriptors.
// dumb and additive
// result: false = failure
bool unibusadapter_c::register_device(unibusdevice_c& device) {
	bool register_handle_used[MAX_REGISTER_COUNT]; // index by handle
	unsigned i;
	unsigned register_handle;
	unsigned device_handle;

	INFO("UnibusAdapter: Registering device %s", device.name.value.c_str());

	assert(device.handle == 0); // must not be installed already
	assert(device.register_count <= MAX_REGISTERS_PER_DEVICE);

	// assign to "backplane position"
	// search next free "slot"
	device_handle = 1; // reserve 0 for special use
	while (device_handle <= MAX_DEVICE_HANDLE && devices[device_handle] != NULL)
		device_handle++;
	if (device_handle > MAX_DEVICE_HANDLE) {
		ERROR("register_device() Tried to register more than %u devices!", MAX_DEVICE_HANDLE);
		return false;
	}
	devices[device_handle] = &device;
	device.handle = device_handle; // tell the device its slots

	// lookup iopage_register_handles[]
	memset(register_handle_used, 0, sizeof(register_handle_used)); // all 0

	// verify: does the device implement a register address already
	// in use by another device? it happened!
	for (i = 0; i < device.register_count; i++) {
		unibusdevice_register_t *device_reg = &(device.registers[i]);
		device_reg->addr = device.base_addr.value + 2 * i;
		if ( IOPAGE_REGISTER_ENTRY(*deviceregisters,device_reg->addr)!= 0 )
		FATAL("register_device() IO page address conflict: %s implements register at %06o, belongs already to other device.",
		device.name.value.c_str(), device_reg->addr);
	}

	for (i = 0; i < 0x1000; i++) {
		// scan all addresses in IO page
		register_handle = deviceregisters->iopage_register_handles[i];
		assert(register_handle < MAX_REGISTER_COUNT);
		if (register_handle)
			register_handle_used[register_handle] = true;
	}
	// allocate new handles for registers of device
	// we could try to find a "hole" of size device->register_count, but simply add to the end
	// find highest handle uses so far.
	register_handle = 0; // biggest handle in use
	// handle#0 not to be used!
	for (i = 1; i < MAX_REGISTER_COUNT; i++)
		if (register_handle_used[i])
			register_handle = i;
	unsigned free_handles = MAX_REGISTER_COUNT - register_handle - 1;
	if (free_handles < device.register_count) {
		ERROR("register_device() can not register device %s, needs %d register, only %d left.",
				device.name.value.c_str(), device.register_count, free_handles);
		return false;
	}
	register_handle++; // first free handle

	// add registers of device (controller) to global shared register map

	for (i = 0; i < device.register_count; i++) {
		unibusdevice_register_t *device_reg = &(device.registers[i]);
		volatile iopageregister_t *shared_reg = &deviceregisters->registers[register_handle];
		// complete link to device
		device_reg->device = &device;
		device_reg->index = i;
		device_reg->addr = device.base_addr.value + 2 * i;

		device_reg->shared_register = shared_reg; // link controller register to shared descriptor
		device_reg->shared_register_handle = register_handle;
		shared_reg->value = device_reg->reset_value; // init
		shared_reg->writable_bits = device_reg->writable_bits;
		shared_reg->event_flags = 0;
		// "active" devices are marked with controller handle
		if (device_reg->active_on_dati || device_reg->active_on_dato) {
			if (device_reg->active_on_dati && !device_reg->active_on_dato) {
				FATAL(
						"register_device() Register configuration error for device %s, register idx %u:\n"
								"A device register may not be passive on DATO and active on DATI.\n"
								"Passive DATO -> value written only saved in shared UNIBUS reg value\n"
								"Active DATI: shared UNIBUS reg value updated from flipflops -> DATO value overwritten\n"
								"make DATO active too -> datao value saved in DATO flipflops",
						device.name.value.c_str(), i);
			}
			shared_reg->event_device_handle = device.handle;
			shared_reg->event_device_register_idx = i; // # of register in device
			if (device_reg->active_on_dati)
				shared_reg->event_flags |= IOPAGEREGISTER_EVENT_FLAG_DATI;
			if (device_reg->active_on_dato)
				shared_reg->event_flags |= IOPAGEREGISTER_EVENT_FLAG_DATO;
		} else {
			shared_reg->event_device_handle = 0;
			shared_reg->event_device_register_idx = 0; // not used, PRU handles logic
		}
		// write register handle into IO page address map
		uint32_t addr = device.base_addr.value + 2 * i; // devices have always sequential address register range!
		IOPAGE_REGISTER_ENTRY(*deviceregisters,addr)= register_handle;
// printf("!!! register @0%06o = reg 0x%x\n", addr, reghandle) ;
		register_handle++;
	}

	return true;
}

// unregister_device ... "plugout" the device from UNIBUs backplane
// - clear handle
// - remove device registers from shared address maps
void unibusadapter_c::unregister_device(unibusdevice_c& device) {
	unsigned i;

	assert(device.handle > 0); // must have been installed

	INFO("UnibusAdapter: UnRegistering device %s.", device.name.value.c_str());

	// remove "from backplane"
	devices[device.handle] = NULL;
	device.handle = 0;

	for (i = 0; i < device.register_count; i++) {
		uint32_t addr = device.base_addr.value + 2 * i; // devices have always sequential address register range!
		IOPAGE_REGISTER_ENTRY(*deviceregisters,addr)= 0;
		// register descriptor remain unchanged, also device->members
	}
}

/* interface for devices to issue DMA and INTR

 **** !!! TODO: SORTING and SERIALIZING of requests required !!!! ***

 device has "slot" nr after registration
 */

// internal only: is any DMA or INTR issued by UNIBONE active?
// false: UNIBUS DMA or INTR pending or in progress
// true: new DMA or INTR may be started
bool unibusadapter_c::request_DMA_active(const char *error_info) {
	if (mailbox->arm2pru_req == ARM2PRU_DMA_ARB_NONE
			|| mailbox->arm2pru_req == ARM2PRU_DMA_ARB_CLIENT
			|| mailbox->arm2pru_req == ARM2PRU_DMA_ARB_MASTER) {
		if (error_info)
			ERROR("%s: DMA requests active!", error_info);
		return true;
	}
// TODO: check queue for another device request
// rely on RL11 to check for completion and sorting DMA/INTR requests.
	return false;
}

// if error_info: create error if INTR running
bool unibusadapter_c::request_INTR_active(const char *error_info) {
	if (mailbox->arm2pru_req == ARM2PRU_INTR) {
		if (error_info)
			ERROR("%s: INTR requests active!", error_info);
		return true;
	}
// TODO: check queue for another device request
// rely on RL11 to check for completion and sorting DMA/INTR requests.
	return false;
}

// Request a DMA cycle from Arbitrator.
// unibus_control = UNIBUS_CONTROL_DATI or _DATO
// unibus_end_addr = last accessed address (success or timeout) and timeout condition
// result: false on UNIBUS timeout
bool unibusadapter_c::request_client_DMA(uint8_t unibus_control, uint32_t unibus_addr,
		uint16_t *buffer, uint32_t wordcount, uint32_t *unibus_end_addr) {

	//
	// Acquire bus mutex; append new request to queue.
	// bus worker will wake and service the request in due time.
	//
	dma_request_c request(unibus_control, unibus_addr, buffer, wordcount);

	pthread_mutex_lock(&_busWorker_mutex);
	_dmaRequests.push(&request);
	pthread_cond_signal(&_busWakeup_cond);
	pthread_mutex_unlock(&_busWorker_mutex);

	DEBUG("DMA start: %s @ %06o, len=%d", unibus->control2text(unibus_control), unibus_addr,
			wordcount);

	//
	// Wait for request to finish.
	//
	pthread_mutex_lock(&_busWorker_mutex);
	while (!request.IsComplete()) {
		pthread_cond_wait(&_requestFinished_cond, &_busWorker_mutex);
	}
	pthread_mutex_unlock(&_busWorker_mutex);

	if (unibus_end_addr)
		*unibus_end_addr = request.GetUnibusEndAddr();

	return request.GetSuccess();
}

void unibusadapter_c::dma_worker() {
	//worker_init_realtime_priority(rt_device);
	while (true) {
		dma_request_c* dmaReq = nullptr;
		irq_request_c* irqReq = nullptr;

		//
		// Wait for the next request.
		//
		pthread_mutex_lock(&_busWorker_mutex);
		while (_dmaRequests.empty() && _irqRequests.empty()) {
			pthread_cond_wait(&_busWakeup_cond, &_busWorker_mutex);
		}

		//
		// We have a request: prioritize IRQ over DMA, dequeue from the requisite
		// queue and get to work.
		//
		if (!_irqRequests.empty()) {
			irqReq = _irqRequests.front();
			_irqRequests.pop();
		} else {
			dmaReq = _dmaRequests.front();
			_dmaRequests.pop();
		}
		pthread_mutex_unlock(&_busWorker_mutex);

		// Sanity check: Should be no active DMA or interrupt requests on the PRU.
		assert(!request_DMA_active(nullptr) && !request_INTR_active(nullptr));

		if (dmaReq) {
			// We do the DMA transfer in chunks so we can handle arbitrary buffer sizes.
			// (the PRU mailbox has limited space available.)
			// Configure the DMA transfer.

			uint32_t maxTransferSize = 512;

			uint32_t wordCount = dmaReq->GetWordCount();
			uint32_t unibusAddr = dmaReq->GetUnibusStartAddr();
			uint32_t bufferOffset = 0;

			while (wordCount > 0) {
				uint32_t chunkSize = std::min(maxTransferSize, wordCount);

				mailbox->dma.startaddr = unibusAddr + bufferOffset * 2;
				mailbox->dma.control = dmaReq->GetUnibusControl();
				mailbox->dma.wordcount = chunkSize;

				// Copy outgoing data into maibox DMA buffer
				if (dmaReq->GetUnibusControl() == UNIBUS_CONTROL_DATO) {
					memcpy((void*) mailbox->dma.words, dmaReq->GetBuffer() + bufferOffset,
							2 * chunkSize);
				}

				//
				// Start the PRU:
				mailbox->arm2pru_req = ARM2PRU_DMA_ARB_CLIENT;

				//
				// Wait for the transfer to complete.
				// TODO: we're polling the mailbox; is there a more efficient way to do this?
				timeout_c timeout;
				int retries = 0;
				while (request_DMA_active(nullptr) && retries < 10000) {
					timeout.wait_us(50);
					retries++;
				}

				//
				// TODO: this should not be necessary.  There are rare occasions
				// where it appears that the PRU dma transfer is interrupted
				// but never clears the DMA active flag, so we hang in the loop above
				// forever.
				// Nothing to do in that case but give up.
				// And log the issue.  Should get to the root of this..
				//
				if (retries == 10000) {
					ERROR("dma timeout");
				}

				if (dmaReq->GetUnibusControl() == UNIBUS_CONTROL_DATI) {
					// Copy data read from mailbox to user's buffer.
					memcpy(dmaReq->GetBuffer() + bufferOffset, (void *) mailbox->dma.words,
							2 * chunkSize);
				}
				wordCount -= chunkSize;
				bufferOffset += chunkSize;
			}

			dmaReq->SetUnibusEndAddr(mailbox->dma.cur_addr);
			dmaReq->SetSuccess(mailbox->dma.cur_status == DMA_STATE_READY);
			// no success: UnibusEndAddr is first failed address

			assert(
					dmaReq->GetUnibusStartAddr() + dmaReq->GetWordCount() * 2
							== mailbox->dma.cur_addr + 2);

			//
			// Signal that the request is complete.
			//
			pthread_mutex_lock(&_busWorker_mutex);
			dmaReq->SetComplete();
			pthread_cond_signal(&_requestFinished_cond);
			pthread_mutex_unlock(&_busWorker_mutex);
		} else {
			// Handle interrupt request
			switch (irqReq->GetInterruptLevel()) {
			case 4:
				mailbox->intr.priority_bit = ARBITRATION_PRIORITY_BIT_B4;
				break;

			case 5:
				mailbox->intr.priority_bit = ARBITRATION_PRIORITY_BIT_B5;
				break;

			case 6:
				mailbox->intr.priority_bit = ARBITRATION_PRIORITY_BIT_B6;
				break;

			case 7:
				mailbox->intr.priority_bit = ARBITRATION_PRIORITY_BIT_B7;
				break;

			default:
				ERROR("Request_INTR(): Illegal priority %u, aborting",
						irqReq->GetInterruptLevel());
				return;
			}

			mailbox->intr.vector = irqReq->GetVector();

			// start!
			mailbox->arm2pru_req = ARM2PRU_INTR;
			// PRU now changes state

			// Signal that the request has been raised.
			pthread_mutex_lock(&_busWorker_mutex);
			irqReq->SetComplete();
			pthread_cond_signal(&_requestFinished_cond);
			pthread_mutex_unlock(&_busWorker_mutex);

			// Wait for the transfer to complete.
			// TODO: we're polling the mailbox; is there a more efficient way to
			// do this? (as w/dma)
			timeout_c timeout;
			while (request_INTR_active(nullptr)) {
				timeout.wait_us(50);
			}
		}
	}
}

void unibusadapter_c::rundown_bus_requests() {
	//
	// Cancel all pending DMA and IRQ requests, freeing threads waiting
	// on completion.
	//
	pthread_mutex_lock(&_busWorker_mutex);
	while (!_dmaRequests.empty()) {
		dma_request_c* dmaReq = _dmaRequests.front();
		dmaReq->SetSuccess(false);
		dmaReq->SetComplete();
		pthread_cond_signal(&_requestFinished_cond);
		_dmaRequests.pop();
	}
	while (!_irqRequests.empty()) {
		irq_request_c* irqReq = _irqRequests.front();
		irqReq->SetComplete();
		pthread_cond_signal(&_requestFinished_cond);
		_irqRequests.pop();
	}
	pthread_mutex_unlock(&_busWorker_mutex);

}

void unibusadapter_c::request_INTR(uint32_t level, uint32_t vector) {
	//
	// Acquire bus mutex; append new request to queue.
	// bus worker will wake and service the request in due time.
	//
	irq_request_c request(level, vector);

	pthread_mutex_lock(&_busWorker_mutex);
	_irqRequests.push(&request);
	pthread_cond_signal(&_busWakeup_cond);
	pthread_mutex_unlock(&_busWorker_mutex);

	//
	// Wait for request to finish.
	//
	pthread_mutex_lock(&_busWorker_mutex);
	while (!request.IsComplete()) {
		pthread_cond_wait(&_requestFinished_cond, &_busWorker_mutex);
	}
	pthread_mutex_unlock(&_busWorker_mutex);

	//
	// And we're done.
	//
}

// debugging: print PRU sharead regsster map
void unibusadapter_c::print_shared_register_map() {
	unsigned i;
	uint32_t addr;
	unsigned register_handle;
	unsigned device_handle;
	volatile iopageregister_t *shared_reg;

// registers by address
	printf("Device registers by IO page address:\n");
	for (i = 0; i < 0x1000; i++) {
		// scan all addresses in IO page
		addr = 0760000 + 2 * i;
		register_handle = IOPAGE_REGISTER_ENTRY(*deviceregisters, addr);
		if (register_handle) {
			shared_reg = &(deviceregisters->registers[register_handle]);
			printf("%06o=reg[%2u] ", addr, register_handle);
			printf("cur val=%06o, writable=%06o. ", shared_reg->value,
					shared_reg->writable_bits);
			// "passive" registers are not linked to controllers.
			// better use MSB of event_controller_handle to mark "active"?
			if (shared_reg->event_device_handle == 0)
				printf("passive reg (not linked to device).\n");
			else {
				printf("active reg linked to device #%u.reg[%2u]\n",
						shared_reg->event_device_handle, shared_reg->event_device_register_idx);
			}

		}
	}

// dump known devices
	printf("Registered devices by handle:\n");
	for (device_handle = 0; device_handle <= MAX_DEVICE_HANDLE; device_handle++)
		if (devices[device_handle] != NULL) {
			unibusdevice_c *dev = devices[device_handle];
			printf("Device #%u \"%s\" @%06o: %u registers\n", device_handle,
					dev->name.value.c_str(), dev->base_addr.value, dev->register_count);
			assert(dev->register_count <= MAX_REGISTERS_PER_DEVICE);
			for (i = 0; i < dev->register_count; i++) {
				unibusdevice_register_t *device_reg = &(dev->registers[i]);
				char s_active[80];
				if (device_reg->active_on_dati || device_reg->active_on_dato) {
					strcpy(s_active, "active ");
					if (device_reg->active_on_dati)
						strcat(s_active, "dati ");
					if (device_reg->active_on_dato)
						strcat(s_active, "dato");
				} else
					strcpy(s_active, "passive");
				printf("  Reg[%2u]@%06o: %s, resetval=%06o, writable=%06o.\n", i,
						dev->base_addr.value + 2 * i, s_active,
						(unsigned) device_reg->reset_value,
						(unsigned) device_reg->writable_bits);
			}
		}
}

