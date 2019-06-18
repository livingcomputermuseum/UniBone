# inputfile for demo to select a rk05 device in the "device test" menu.
# Read in with command line option  "demo --cmdfile ..."
# mounts 3 "Unixv6" RK05 images
d			# device test menu
pwr
.wait 3000		# wait for PDP-11 to reset
m i			# install max UNIBUS memory

# Deposit bootloader into memory
m ll dk.lst

sd rk0			# select drive #0
p image v6bin.rk

sd rk1			# select drive #1
p image v6doc.rk

sd rk2			# select drive #2
p image v6src.rk

.print Disk drive now on track after 5 secs
.wait	6000		# wait until drive spins up
p                       # show all params of RL1


.print RK drives ready.
.print RK11 boot loader installed.
.print Start 10000 to boot from drive 0
.print Reload boot loader with "m ll"
.print Set terminal to 9600 7O1
.print On @ prompt, select kernel to run: "rkunix"


