# inputfile for demo to select a rk05 device in the "device test" menu.
# Read in with command line option  "demo --cmdfile ..."
# mounts 4 "Mini.Unix" RK05 images
td			# device test menu
.wait 3000		# wait for PDP-11 to reset
m i			# install max UNIBUS memory

sd rk0			# select drive #0
p image tape1.bin       # The BIN disk (RK05)

sd rk1			# select drive #1
p image tape2.bin       # The SRC disk (RK05)

sd rk2			# select drive #2
p image tape3.bin       # The MAN disk (RK05)

.print Disk drive now on track after 5 secs
.wait	6000		# wait until drive spins up
p                       # show all params of RL1


m ll dk.lst
.print RK11 boot loader installed.
.print Start 10000 to boot from drive 0
.print Reload with "m ll"
.print
.print Set terminal to 9600 7O1
.print At @ prompt, select kernel file to boot with "rkmx"
.print Login with "root"

