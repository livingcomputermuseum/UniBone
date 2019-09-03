/* unibuscpu.cpp: base class for all CPU implementations

 Copyright (c) 2019, Joerg Hoppe
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


27-aug-2019	JH      start
 */

#include "unibuscpu.hpp"

void unibuscpu_c::on_power_changed(void) {
// called within a bus_cycle, and initiates other cycles?!
//assert(dbg==0) ;
	if (power_down) { // power-on defaults
		INFO("CPU: ACLO failed");
		power_event = power_event_down;
//			ka11_pwrdown(&the_cpu->ka11);
		// ACLO failed. 
		// CPU traps to vector 24 and has 2ms time to execute code
	} else {
		INFO("CPU: DCLO restored");
		power_event = power_event_up;
//			ka11_pwrup(&the_cpu->ka11);
		// DCLO restored
		// CPU loads PC and PSW from vector 24 
		// if HALTed: do nothing, user is expected to setup PC and PSW ?
	}

}

// UNIBUS INIT: clear all registers
void unibuscpu_c::on_init_changed(void) {
// a CPU does not react to INIT ... else its own RESET would reset it.
}


