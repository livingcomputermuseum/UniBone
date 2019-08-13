# "demo" cmd Testsequence for DL11W
dc	# "demo" menu: device without cpu
sd dl11
.print Test of DL11-W, without CPU.
.print Put UniBone in emtpy backplane.
.print Connect serial terminal emulator to UniBone "UART2", set to 9600 8N1
.input
en dl11

INIT
E
.print expected:
.print EXAM reg #0 RCSR 777560 -> 000000
.print EXAM reg #1 RBUF 777562 -> 000000
.print EXAM reg #2 XCSR 777564 -> 000200
.print EXAM reg #3 XBUF 777566 -> 000000


. print Send chars "Hello". Fast, chars may get lost
d xbuf 110
d xbuf 145
d xbuf 154
d xbuf 154
d xbuf 157
d xbuf 15
d xbuf 12

.print Now press an "a" on terminal keyboard
.input
e rcsr
e rbuf
e rcsr
.print Expected: rcsr = 200, rbuf = 141, rcsr = 000 (reading rbuf cleared "RCV_DONE")

.print Now press a "yz" on terminal keyboard
.input
e rcsr
e rbuf
e rcsr
.print Expected: rcsr = 200, rbuf = 14172 ("z"), rcsr = 000

.print switch terminal to 7NO. press "c"
e rbuf
.print Expected: rbuf = 373 (c +parity)

.print Check BREAK receive:
.print Set terminal to 300 baud, send a space (0x20) -> looots of 00s
e rbuf
.print Expected: a "0" with framing error: 170000
.print Set terminal back to 9600 baud
.input

.print Maintenance self receive
d xcsr 4	# MAINT ON
d xbuf 123	# sent "S"
e
.print Expected: rcsr = 200, rbuf = 123 (sent char "S" received back)
















