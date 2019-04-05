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

unibusadapter_c *unibusadapter; // another Singleton
// is registered in device_c.list<devices> ... order of static constructor calls ???

unibusadapter_c::unibusadapter_c() :
		device_c() {
	unsigned i;
	log_label = "UNAPT";

	name.value = "UNIBUSADAPTER";
	type_name.value = "unibusadapter_c";

	for (i = 0; i <= MAX_DEVICE_HANDLE; i++)
		devices[i] = NULL;
	line_INIT = false;
	line_DCLO = false;

}

bool unibusadapter_c::on_param_changed(parameter_c *param) {
	UNUSED(param);
	return true ;
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
void unibusadapter_c::worker() {
	int res;

	// set thread priority to MAX.
	// - fastest response to slect() call in prussdrv_pru_wait_event_timeout()
	//  (minimal I/O latency)
	// - not interrupted by other tasks while running
	// check with tool "top" or "htop".
	worker_init_realtime_priority(rt_max); // set to max prio

	while (!worker_terminate) {
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
		ERROR("Tried to register more than %u devices!", MAX_DEVICE_HANDLE);
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
		if ( IOPAGE_REGISTER_ENTRY(*deviceregisters,device_reg->addr) != 0 )
		FATAL("IO page address conflict: %s implements register at %06o, belongs already to other device.",
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
		ERROR("Can not register device %s, needs %d register, only %d left.",
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
						"Register configuration error for device %s, register idx %u:\n"
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
	if (mailbox->arm2pru_req == ARM2PRU_DMA) {
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

// request a DMA cycle.
// unibus_control = UNIBUS_CONTROL_DATI or _DATO
void unibusadapter_c::request_DMA(unibusdevice_c *device, uint8_t unibus_control,
		uint32_t unibus_addr, uint16_t *buffer, unsigned wordcount) {
// TODO: if another DMA or INTR is active: put request in queue
	UNUSED(device);
	if (request_DMA_active(__func__) || request_INTR_active(__func__))
		return;

	mailbox->dma.startaddr = unibus_addr;
	mailbox->dma.control = unibus_control;
	mailbox->dma.wordcount = wordcount;

	// save params of current transaction
	cur_DMA_unibus_control = unibus_control;
	cur_DMA_buffer = buffer;
	cur_DMA_wordcount = wordcount;

	if (unibus_control == UNIBUS_CONTROL_DATO) {
		// copy data into mailbox->DMA buffer
		memcpy((void*) mailbox->dma.words, buffer, 2 * wordcount);
	}
	DEBUG("DMA start: %s @ %06o, len=%d", unibus->control2text(unibus_control), unibus_addr,
			wordcount);

	// start!
	mailbox->arm2pru_req = ARM2PRU_DMA;
	// PRU now changes state
}

void unibusadapter_c::request_INTR(unibusdevice_c *device, unsigned level, unsigned vector) {
// TODO: if another DMA or INTR is active: put request in queue
	UNUSED(device);

	// it is not an error if the INTR  (at same level) is still pending
	// a device may re-raise its interrupt, an interrupt may remain pending for years.
	if (request_DMA_active(__func__))
		return;
	if (request_INTR_active(NULL))
		return;

	switch (level) {
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
		ERROR("Request_INTR(): Illegal priority %u, aborting", level);
		return;
	}
	mailbox->intr.vector = vector;

	// start!
	mailbox->arm2pru_req = ARM2PRU_INTR;
	// PRU now changes state

}

// device wants to know state of its requests
// also checks for completion if the single current DMA or INTR.
// to be called by device.worker()
// result: false = not yet finished, true = complete,
// error: return NXM status
bool unibusadapter_c::complete_DMA(unibusdevice_c *device, uint32_t *unibus_end_addr,
bool *error) {
// TODO: access correct request in queue
	UNUSED(device);

	// rely on RL11 to check for completion and sorting DMA/INTR requests.
	if (request_DMA_active(NULL))
		return false;

	if (cur_DMA_unibus_control == UNIBUS_CONTROL_DATI) {
		// data were read
		// copy result cur_DMA_wordcount from mailbox->DMA bufuffer to cur_DMA_buffer
		memcpy(cur_DMA_buffer, (void *) mailbox->dma.words, 2 * cur_DMA_wordcount);
	}

	*unibus_end_addr = mailbox->dma.cur_addr;

	*error = mailbox->dma.cur_status != DMA_STATE_READY;
	DEBUG("DMA ready: %s @ %06o..%06o, wordcount %d, data=%06o, %06o, ... %s",
			unibus->control2text(mailbox->dma.control), mailbox->dma.startaddr,
			mailbox->dma.cur_addr, mailbox->dma.wordcount, mailbox->dma.words[0],
			mailbox->dma.words[1], *error ? "TIMEOUT" : "OK");

	return true;
}

// result: false = not yet finished, true = complete,
bool unibusadapter_c::complete_INTR(unibusdevice_c *device) {
// TODO: access correct request in queue
	UNUSED(device);

	// rely on RL11 to check for completion and sorting DMA/INTR requests.
	return request_INTR_active(NULL);
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

