/* rs232adapter.cpp: route byte xmt/rcv interface to stream and RS232

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

 8-aug-2019	JH      edit start

 This is a stream router.
 - Main interface is a byte-port with sent/poll functions
 - the bytestream can be routed to a RS232 object for TxD and RxD
 - the bytestream can be routed to two streams: rcv/xmt
 - for the xmt stream a pattern matcher is implemented, which search for strigns in the stream

 To be used to router DL11 RCV/XMT ports to RS232 and/or program functions


 .     stream_rcv     stream_xmt                 upper end "STREAM"        .
 .        \ /            / \                                               .
 .         |              |                                                .
 .         |              +---> ringbuffer       "PATTERN"                 .
 .         |              |                                                .
 .         |    loopback  |                                                .
 .        rcv  <----------|---< byte_loopback()                            .
 .      decoder           |                                                .
 .       buffer           |                                                .
 .         |              |                                                .
 .         +-----<--------|---< rs232.Poll()---< RxD "RS232"               .
 .         |              |                                                .
 .         |              +---> rs232.Send()---> TxD "RS232"               .
 .         |              |                                                .
 .        \ /            / \                                               .
 .   byte_rcv_poll()   byte_xmt_send()           lower end "BYTE"          .
 .                                                                         .
 .      DL11 RCVR         DL11 XMT               DL11                      .
 .         DATI            DATO                  UNIBUS                    .



 */
#include <string.h>
#include <assert.h>
#include <pthread.h>
#include "rs232adapter.hpp"

rs232adapter_c::rs232adapter_c() {
	log_label = "ADP232";

	rs232 = NULL;
	stream_rcv = NULL;
	stream_xmt = NULL;
	rcv_termios_error_encoding = false;
	rcv_decoder.clear();
	pattern_stream_data[0] = 0;
	pattern[0] = 0;
	pattern_found = false;
	baudrate = 0; // default: no delay
	rcv_baudrate_delay.start_us(0); // start with elapsed() == true"
}

// BYTE interface: check for received char (from stream or RS232)
// Attention: must produce 0xff 0 sequences for termios encoded byte errors
//	and 0xff 0xff for \ff
// If IGNPAR=0, PARMRK=1: error on <char> received as \377 \0 <char>
// \377 received as \377 \377
bool rs232adapter_c::byte_rcv_poll(unsigned char *rcvchar) {

	pthread_mutex_lock(&mutex);
	bool result = false;
	// mixing input streams, with RS232 priority

	// loopback or part of previous 0xff,0xff sequence ?
	int c = rcv_decoder.get();
	if (c != EOF) {
		*rcvchar = c;
		result = true;
	}
	if (!result && rs232) {
		// rs2323 must be programmed to generate 0xff 0xff sequences
		result = rs232->PollComport(rcvchar, 1);
	}

	if (stream_rcv && !result) {
		// deliver next char from stream delayed, with simulated baudrate
		if (baudrate == 0 || rcv_baudrate_delay.reached()) {
			int c = stream_rcv->get();
			if (c != EOF) {
				*rcvchar = c;
				if (rcv_termios_error_encoding && c == 0xff) {
					// mark 2nd 0xff for output on next call
					rcv_decoder.clear();
					rcv_decoder.put(0xff);
				}
				result = true;
				if (baudrate != 0)
					rcv_baudrate_delay.start_us(10 * MILLION / baudrate); // assume 10 bits per char
			}
		}
	}
	pthread_mutex_unlock(&mutex);
	return result;
}

void rs232adapter_c::byte_xmt_send(unsigned char xmtchar) {
	if (rs232)
		rs232->SendByte(xmtchar);
	if (stream_xmt)
		stream_xmt->put(xmtchar);
	// pattern ring buffer
	unsigned n = strlen(pattern);
	if (n) {
		// put new chars at end of string
		unsigned m = strlen(pattern_stream_data);
		assert(m < pattern_max_len);
		pattern_stream_data[m] = xmtchar;
		pattern_stream_data[m + 1] = 0;
		// only keep the last chars in buffer.
		while ((m = strlen(pattern_stream_data)) > n)
			// strip first char, should loop only once
			memmove(pattern_stream_data, pattern_stream_data + 1, m);
		if (strstr(pattern_stream_data, pattern))
			pattern_found = true; // user must clear
	}
//	pattern_buffer.
}

void rs232adapter_c::byte_loopback(unsigned char xmtchar) {
	// not a queue, only single char (DL11 loopback)
	rcv_decoder.clear();
	rcv_decoder.put(xmtchar);
	if (rcv_termios_error_encoding && xmtchar == 0xff)
		rcv_decoder.put(0xff);
	// fill intermediate buffer with seqeunce to receive
}

void rs232adapter_c::set_pattern(char *pattern) {
	strncpy(this->pattern, pattern, pattern_max_len);
	pattern_found = false;
	pattern_stream_data[0] = 0;
}

