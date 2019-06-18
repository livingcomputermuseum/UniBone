/* utils.cpp: misc. utilities

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
   20-may-2018  JH      created
*/

#define _UTILS_CPP_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <signal.h>
#include <time.h>
#include <limits.h>
#include <sys/time.h>
#include <sys/stat.h>

#include <algorithm>

//#include "main.h" // linewidth
#include "logger.hpp"
#include "utils.hpp"

using namespace std;


/*********************************
 * strcpy without buffer overlfow
 */
void strcpy_s(char *dest, int len, const char *src) {
	strncpy(dest, src, len-1) ;
	dest[len-1] = 0 ; // termiante if truncated
}

/*********************************
 *  catching ^C
 */
volatile int SIGINTreceived = 0;

static void SIGINThandler(int dummy __attribute__((unused))) {
	SIGINTreceived++;
	// detach signal handler, only one ^C is caught
	signal(SIGINT, NULL);
}

// catch the next SIGINT = ^C
void SIGINTcatchnext() {
	signal(SIGINT, SIGINThandler); // setup handler for ^C
	SIGINTreceived = 0;
}

void break_here(void) {}


/*** time measuring ***/


timeout_c::timeout_c() {
	log_label = "TO" ;
}

void timeout_c::start(uint64_t duration_ns) {
	this->duration_ns = duration_ns;
	clock_gettime(CLOCK_MONOTONIC, &starttime);
}

uint64_t timeout_c::elapsed_ns(void) {
	struct timespec now;
	clock_gettime(CLOCK_MONOTONIC, &now);
	return BILLION * (now.tv_sec - starttime.tv_sec) + now.tv_nsec - starttime.tv_nsec;
}

bool timeout_c::reached() {
	return (elapsed_ns() > duration_ns);
}

// wait a number of nanoseconds, resolution in 0.1 millisecs
void timeout_c::wait_ns(uint64_t duration_ns) {
	struct timespec ts = { (long) (duration_ns / BILLION), (long) (duration_ns % BILLION) };
	int res = nanosleep(&ts, NULL);
	if (res)
		DEBUG("nanosleep() return a %d", res) ;
}

// wait a number of milliseconds
void timeout_c::wait_ms(unsigned duration_ms) {
	wait_ns(MILLION * duration_ms);
}

void timeout_c::wait_us(unsigned duration_us) {
	wait_ns(1000L * duration_us);
}

// progress: print progress text, break lines
progress_c::progress_c(unsigned linewidth) {
	this->linewidth = linewidth;
	cur_col = 0;
}

void progress_c::init(unsigned linewidth) {
	this->linewidth = linewidth;
	cur_col = 0;
}

void progress_c::put(const char *info) {
	printf("%s", info);
	cur_col += strlen(info);
	if (cur_col >= linewidth) {
		printf("\n");
		cur_col = 0;
	}
	fflush(stdout);
}

/* random number with 24 valid bits
 * RAND_MAX is only guaranteed 15 bits
 */
unsigned random24() {
	unsigned val;
	val = rand() ^ (rand() << 9);
	return val & 0xffffff;
}

char *cur_time_text() {
	static char result[80], millibuff[10];
	timeval cur_time;
	gettimeofday(&cur_time, NULL);
	int millis = cur_time.tv_usec / 1000;
	strftime(result, 26, "%H:%M:%S", localtime(&cur_time.tv_sec));
	sprintf(millibuff, ".%03d", millis);
	strcat(result, millibuff);
	return result;
}

bool fileExists(const std::string& filename) {
	struct stat buf;
	if (stat(filename.c_str(), &buf) != -1) {
		return true;
	}
	return false;
}

// Generates "perror()" printout, 
// msgfmt must have one "%s" field for absolute filename
char *fileErrorText(const char *msgfmt, const char *fname) {
	static char linebuff[PATH_MAX +100];
	char abspath[PATH_MAX] ;
	realpath(fname, abspath);
	sprintf(linebuff, msgfmt, abspath);
	strcat(linebuff, ": ") ;
	strcat (linebuff, strerror(errno)) ;
//	perror(linebuff);
	return linebuff ;
}


// add a number of microseconds to a time
struct timespec timespec_add_us(struct timespec ts, unsigned us) {
	ts.tv_nsec += us * 1000;
	while (ts.tv_nsec >= BILLION) { // loops only once
		ts.tv_sec++;
		ts.tv_nsec -= BILLION;
	}
	return ts;
}

// add microseconds to current time
struct timespec timespec_future_us(unsigned offset_us) {
	struct timeval tv;
	struct timespec ts;
	gettimeofday(&tv, NULL);
	ts.tv_sec = tv.tv_sec;
	ts.tv_nsec = 1000L * tv.tv_usec;
	return timespec_add_us(ts, offset_us);
}

/*
 bool caseInsCompare(const string& s1, const string& s2) {
 return((s1.size() == s2.size()) &&
 equal(s1.begin(), s1.end(), s2.begin(), caseInsCharCompareN));
 }
 */

