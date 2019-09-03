
# "demo" test of parallel DMA/INTR
# runs multiarb.mac
#
# Execute this with active PDP-11 CPU and in halted state
d 	# active PDP-11 CPU, devices
# tm	# HALTed

en dl11		# work with simulated DL11
sd dl11
p rb 300	# "type" slowly
p		# show params

pwr
#.wait 1000		# wait for CPU to start

m i 			# emulate memory

### Enable KW11 clock
en kw11
sd kw11
p freq 100


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

##########################################
m ll multiarb.lst	# load test program
.print Now starting test program at 1000 via PDP-11 console

dl11 rcv 1000 L\x201000\r
# dl11 rcv 500 S\r


.wait 5000
dbg c
.print Debug logs cleared.
