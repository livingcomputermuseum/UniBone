# Inputfile for demo to execute "Hello world"
# Uses emulated CPU and (physical or emulated) DL11
# Read in with command line option  "demo --cmdfile ..."

dc			# "device with cpu" menu

m i   			# emulate missing memory

sd dl11
# p b 300			# reduced baudrate
en dl11			# switch on emulated DL11
p

### Enable KW11 clock
en kw11
sd kw11


### Enable 2 RL drives
en rl			# enable RL11 controller
sd rl
p il 4		# use BR4

en rl0			# enable drive #0
sd rl0			# select
p emulation_speed 10	# 10x speed. Load disk in 5 seconds
# set type to "rl02"
p runstopbutton 0	# released: "LOAD"
p powerswitch 1		# power on, now in "load" state
p image scratch0.rl02 	# mount image file with test pattern
p runstopbutton 1	# press RUN/STOP, will start
#.end

en rl1			# enable drive #1
sd rl1			# select
p emulation_speed 10	# 10x speed. Load disk in 5 seconds
# set type to "rl02"
p runstopbutton 0	# released: "LOAD"
p powerswitch 1		# power on, now in "load" state
p image scratch1.rl02 	# mount image file with test pattern
p runstopbutton 1	# press RUN/STOP, will start


### Enable 2 RK05 drives
en rk			# enable RK11 controller

en rk0			# enable drive #0
sd rk0			# select
p image scratch0.rk

en rk1			# enable drive #1
sd rk1			# select
p image scratch1.rk

### Enable 2 MSCP drives
en uda0			# enable drive #0
sd uda0			# select
# set type to "RA80"
p type RA80
p image scratch0.ra80 	# mount image file with test pattern

en uda1			# enable drive #1
sd uda1			# select
p type RA80
p image scratch1.ra80

.wait 5000	# wait to spin up

m ll multiarb.lst		# load test program


en cpu20		# switch on emulated 11/20 CPU
sd cpu20		# select
p

init

.print Emulated PDP-11/20 CPU will now output "Hello world"
.print and enter a serial echo loop on DL11 at 177650.
.print Make sure physical CPU is disabled.

.input

p run 1

# .print CPU20 started... wait for auto-typed input.
# dl11 rcv 5000 <This\x20text\x20is\x20typed\x20and\x20echoed\x0d\0x0a>



