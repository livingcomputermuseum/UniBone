# "demo" cmd Testsequence for DL11W
d	# "demo" menu: device with cpu
sd dl11
.print Test of DL11-W, with PDP-11 CPU.
.print Connect serial terminal emulator to UniBone "UART2", set to 9600 8N1
.input

en dl11
en kw11

pwr

.wait 1000
.print must see Bootloader prompt on UART2 now!

m i

en rl
en rl0
sd rl0
p emulation_speed 10
p runstopbutton 0	# released: "LOAD"
p powerswitch 1		# power on, now in "load" state
p image xxdp25.rl02 	# mount image file
	p runstopbutton 1

m lp /root/10.02_devices/3_test/dl11w/ZDLDI0.BIN
.print Now start ZDLD at address 200
.print Or boot XXDP from DL, then execute "R ZDLDI0"
.print Set switch register with "D 176"
.print 100000 = HALT on error,  2000=error flags, 400= test BREAK, 100=disable KW11
# d 176 100000 # HALT on error
