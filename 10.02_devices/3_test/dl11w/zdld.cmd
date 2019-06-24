# "demo" cmd Testsequence for DL11W
d	# "demo" menu: device with cpu
sd dl11
.print Test of DL11-W, with PDP-11 CPU.
.print Connect serial terminal emulator to UniBone "UART2", set to 9600 8N1
.input

en dl11

pwr

.wait 1000
.print must see Bootloader prompt on UART2 now!

m i


m lp /root/10.02_devices/3_test/dl11w/ZDLDI0.BIN
.print Now start ZDLD at address 200