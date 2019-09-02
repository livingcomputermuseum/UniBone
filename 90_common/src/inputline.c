/* inputline.c: Advanced routines for user text input

 Copyright (c) 2012-2016, Joerg Hoppe
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


 23-Feb-2012  JH      created


 Not called "readline", because this is the big Unix function for the same task.
 It is used here.

 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <time.h>

#include "kbhit.h"
#include "inputline.h"

/*
 * get input from user
 * - shall be run in seperate thread, with abort/query status fucntionality
 * - shall use readline() under *ix, DOS support under Windows
 * - can use fgets in early development stages
 * - can read input from a file
 * format of cmd file:
 *	"# text" is comment and ignored
 *	empty lines are ignored
 *	leading, tralingspace removed
 * Example:
 #  inputfile for demo to select a rl1 device in the "device test" menu.
 # Read in with command line option  "demo --cmdfile ..."
 td			# device test menu
 sd rl1			# select the "rl1" disk drive
 p powerswitch 1		# power on, now in "load" state
 p image test.rl02 	# load image file
 # set to "rl02"
 # load image file with test pattern
 p es 10 	# 10x speed: startup not 45 seconds!
 p load_switch 1	# load cartridge, spin up
 .wait 5000	# internal command
 .print Drive now spun up?
 p			# show all params
 .end	# ignore remaing content

 */

static FILE *inputline_file = NULL;

// reset input source and internal states
void inputline_init() {
	// close file, if open
	if (inputline_file)
		fclose(inputline_file);
	inputline_file = NULL;
}

// check, if line contains an internal "inputlien" command
// (line stripped from spaces)
// .wait <millisecs>
// .print <text>
// result: true = internal command processed
//	false = unkwown
static int inputline_internal(char *line) {
	if (!strncasecmp(line, ".wait", 5)) {
		struct timespec ts;
		unsigned millis;
		sscanf(line + 5, "%d", &millis);
		ts.tv_sec = millis / 1000;
		ts.tv_nsec = 1000000L * (millis % 1000);
		printf("<<<\n");
		printf("<<< Input: waiting for %d milli seconds >>>\n", millis);
		nanosleep(&ts, NULL);
		printf("<<<\n");
		return 1;
	} else if (!strncasecmp(line, ".print", 6)) {
		printf("<<< %s\n", line + 7);
		return 1;
	} else if (!strncasecmp(line, ".input", 6)) {
		char buffer[100];
		printf("<<< Press ENTER to continue.\n");
		// flush stuff on stdin. (Eclipse remote debugging)
		while (os_kbhit())
			;

		fgets(buffer, sizeof(buffer), stdin);
		return 1;
	} else if (!strncasecmp(line, ".end", 3)) {
		// close input file
		fclose(inputline_file);
		inputline_file = NULL;
		return 1;
	}
	return 0;
}

char *inputline(char *buffer, int buffer_size, const char *prompt) {
	char *s;
	if (inputline_file != NULL) {
		// read from file
		int ready = 0;
		while (!ready && inputline_file != NULL) {
			/*** read line from text file ***/
			if (fgets(buffer, buffer_size, inputline_file) == NULL) {
				fclose(inputline_file);
				inputline_file = NULL; // file empty, or unreadable
				ready = 1;
			} else {
				// remove terminating "\n"
				for (s = buffer; *s; s++)
					if (*s == '\n')
						*s = '\0';
				// remove comments after #
				for (s = buffer; *s; s++)
					if (*s == '#')
						*s = 0;
				// trim leading space
				for (s = buffer; *s && isspace(*s); s++)
					;
				memmove(buffer, s, strlen(buffer));
				s = buffer + strlen(buffer) - 1;
				while (s > buffer && isspace(*s))
					s--;
				// points to last "non-white" char now
				s++;
				*s = 0; // trunc the spaces

				// if empty line: repeat
				if (*buffer == 0)
					continue;
				if (!inputline_internal(buffer)) {
					printf("%s\n", buffer);
					ready = 1;
				}
			}
		}
	}
	if (inputline_file == NULL) {
		/*** read interactive ***/
		if (prompt && *prompt)
			printf("%s", prompt);
		fgets(buffer, buffer_size, stdin);
		// remove terminating "\n"
		for (s = buffer; *s; s++)
			if (*s == '\n')
				*s = '\0';
	}
	return buffer;
}

bool inputline_fopen(char *filename) {
	inputline_file = fopen(filename, "r");
	return (inputline_file != NULL);
}

