/* storagedrive.cpp: disk or tape drive, with an image file as storage medium.

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

  A storagedrive is a disk or tape drive, with an image file as storage medium.
  a couple of these are connected to a single "storagecontroler"
    supports the "attach" command
 */
#include <assert.h>

#include <fstream>
#include <ios>
using namespace std;

#include "storagedrive.hpp"

storagedrive_c::storagedrive_c(storagecontroller_c *controller) :
		device_c() {
	this->controller = controller;
	/*
	 // parameters for all drices
	 param_add(&unitno) ;
	 param_add(&capacity) ;
	 param_add(&image_filepath) ;
	 */
}

// implements params, so must handle "change"
bool storagedrive_c::on_param_changed(parameter_c *param) {
	UNUSED(param) ;
	return true ;
}



// http://www.cplusplus.com/doc/tutorial/files/

// open a file, if possible.
// set the file_readonly flag
// creates file, if not existing
// result: OK= true, else false
bool storagedrive_c::file_open(string imagefname, bool create) {
	file_readonly = false;
	if (file_is_open())
		file_close(); // after RL11 INIT
	f.open(imagefname, ios::in | ios::out | ios::binary | ios::ate);
	if (f.is_open())
		return true;

	// is readonly? try open for read only

	// try again readonly
	f.open(imagefname, ios::in | ios::binary | ios::ate);
	if (f.is_open()) {
		file_readonly = true;
		return true;
	}

	if (!create)
		return false;

	// try to create
	// https://stackoverflow.com/questions/17260394/fstream-not-creating-new-file/18160837
	f.open(imagefname, ios::out);
	f.close();
	f.open(imagefname, ios::in | ios::out | ios::binary | ios::ate);
	return f.is_open();
}

bool storagedrive_c::file_is_open() {
	return f.is_open();
}

/* read "len" bytes from file into buffer
 * if file is too short, 00s are read
 * it is assumed that buffer has at least a size of "len"
 */
void storagedrive_c::file_read(uint8_t *buffer, uint64_t position, unsigned len) {
	assert(file_is_open());
	// 1. fill the buffer with 00s
	memset(buffer, 0, len);

	// 2. move read pointer
	f.seekg(position);
	// may be at eof now, doesn't matter

	// 3. read as byte count, may abort at end of file
	f.read((char *) buffer, len);
}

/* write "len" bytes from buffer into file at position "offset"
 * if file too short, it is extended
 */
void storagedrive_c::file_write(uint8_t *buffer, uint64_t position, unsigned len) {
	// uint8_t *fillbuff;
	assert(file_is_open());
	assert(!file_readonly); // caller must take care
	/*
	 // get current file size
	 f.seekp(0, ios::end) ; // move to end
	 p = f.tellp(); // current file len

	 // fill 00s until 'pos' reached
	 if (p == -1)
	 p = 0 ;
	 if (p < offset) {
	 unsigned fillcount = offset - p; // 00's to write
	 // extedn file with 00's
	 fillbuff = (uint8_t *) malloc(fillcount);
	 memset(fillbuff, 0, fillcount);
	 f.write((const char *)fillbuff, fillcount);
	 free(fillbuff);
	 }
	 */
	// move write pointer to target position
	f.seekp(position);

//	p = f.tellp(); // position now < target?
	// p = -1 after seekp(0) ??? Some discussion about this!
//	assert(p == (int64_t )position);

	// 3. write data
	f.write((const char*) buffer, len);
	f.flush();
}

uint64_t storagedrive_c::file_size(void)
{
	f.seekp(0, ios::end);
        return f.tellp();
}

void storagedrive_c::file_close(void) {
	assert(file_is_open());
	f.close();
	file_readonly = false ;
}

