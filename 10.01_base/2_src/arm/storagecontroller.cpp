/* storagecontroller.cpp: a unibus device with several "storagedrives" attached

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

 A unibus device with several "storagedrives"
 supports the "attach" command
 */
#include "utils.hpp"

#include "storagecontroller.hpp"

storagecontroller_c::storagecontroller_c() :
		unibusdevice_c() {
	// sub class (Like "RL11") must create drives into array
	this->drivecount = 0;
}

storagecontroller_c::~storagecontroller_c() {
}

// implements params, so must handle "change"
bool storagecontroller_c::on_param_changed(parameter_c *param) {
	if (param == &enabled) {
		if (!enabled.new_value)
			// power/up/down attached drives, then plug to UNIBUS
			// if disable, disable also the drives ("contreolelr plugged from UNIBUS)")
			// on enable, leave them disabled (user may decide which to use)
			for (unsigned i = 0; i < drivecount; i++)
				storagedrives[i]->enabled.set(false);
	} 
	return unibusdevice_c::on_param_changed(param); // more actions (for enable)
}

// forward BUS events to connected storage drives

// drives are powered if controller is powered
void storagecontroller_c::on_power_changed() {
	vector<storagedrive_c*>::iterator it;
	for (it = storagedrives.begin(); it != storagedrives.end(); it++) {
		(*it)->power_down = power_down;
		(*it)->on_power_changed();
	}
}

// drives get INIT if controller got it
void storagecontroller_c::on_init_changed() {
	vector<storagedrive_c*>::iterator it;
	for (it = storagedrives.begin(); it != storagedrives.end(); it++) {
		(*it)->init_asserted = init_asserted;
		(*it)->on_init_changed();
	}
}

