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





 stream_rcv       stream_xmt                upper end "STREAM"
 \ /            / \
         |              |
 |              +---> ringbuffer      "PATTERN"
 |              |
 +--------------|----rs232.Poll()---< RxD "RS232"
 |              |
 |              +----rs232.Send()---> TxD
 |              |
 |              |
 \ /            / \
   byte_rcv_poll()   byte_xmt_sent()         lower end "BYTE"

 DL11 RCVR         DL11 XMT                DL11
 DATI            DATO                  UNIBUS




 // check RS232 or buffer for data bytes,
 // which shall be "published" by DL11 RCVer
 bool poll_receiver_input(unsigned char *rcvchar) {
 if (input_queue.size()) {
 // in character to send: has priority over RS232 input
 *rcvchar = input_queue.pop() ;
 return true ;
 // should wait for one byte time before delivering next buffer char
 } else
 return rs232.PollComport(rcvchar, 1) ;
 }


 string pattern_buffer ;
 string xmt_search // search expression in transmitter output
 void send_transmitter_output(unsigned char xmtchar) {

 // show output on stdio ?
 if (output_stream)
 output_stream.out(xmtchar) ;
 // save output in ring buffer
 pattern_buffer += xmtchar ;
 if (pattern_buffer.size() >= PATTERN_BUFFER_LEN)
 pattern_buffer.erase(0,1) ; // delete first
 // if search expression appears in pattern buffer:
 if (pattern_buffer.find(xmt_search) !=std::string::npos ) {
 // added char makes search found

 pattern_buffer.clear() ;
 }

 }


 demo:

 dl11 waitfor <timeout_ms> <patternstring>
 dl11 waitfor 1000 @

 dl11.xmt_monitor_clear()
 dl11.xmt_monitor_pattern := <patternstring>
 timeout.start_ms(<timeout_ms>)
 while(!timeout.reached && !dl11_xmt_monitor_pattern_match())
 sleep(1ms) ;
 if (timeout.

 reached() {
 // abort script
 inputline_clearscript();
 }


 -> will clear ringbuffer, montior dl11 output





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

void rs232adapter_c::byte_xmt_sent(unsigned char xmtchar) {
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

