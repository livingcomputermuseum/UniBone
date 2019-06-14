# inputfile for demo to select a rl1 device in the "device test" menu.
# Read in with command line option  "demo --cmdfile ..."
td			# device test menu
.wait 3000		# wait for PDP-11 to reset
m i			# install max UNIBUS memory

# mount RT11 v5.5 in RL02 #0 and start
sd rl0			# select drive #0
p emulation_speed 10	# 10x speed. Load disk in 5 seconds
# set type to "rl02"
p runstopbutton 0	# released: "LOAD"
p powerswitch 1		# power on, now in "load" state
p image rt11v55.rl02 	# mount image file with test pattern
p runstopbutton 1	# press RUN/STOP, will start

# mount RT11 GAMES in RL02 #1 and start
sd rl1			# select drive #1
p emulation_speed 10	# 10x speed. Load disk in 5 seconds
# set type to "rl02"
p runstopbutton 0	# released: "LOAD"
p powerswitch 1		# power on, now in "load" state
p image rt11games.rl02 	# mount image file with test pattern
p runstopbutton 1	# press RUN/STOP, will start

# mount scratch2 in RL02 #2 and start
sd rl2			# select drive #2
p emulation_speed 10	# 10x speed. Load disk in 5 seconds
# set type to "rl02"
p runstopbutton 0	# released: "LOAD"
p powerswitch 1		# power on, now in "load" state
p image scratch2.rl02 	# mount image file with test pattern
p runstopbutton 1	# press RUN/STOP, will start

# mount scratch3 in RL02 #3 and start
sd rl3			# select drive #3
p emulation_speed 10	# 10x speed. Load disk in 5 seconds
# set type to "rl02"
p runstopbutton 0	# released: "LOAD"
p powerswitch 1		# power on, now in "load" state
p image scratch3.rl02 	# mount image file with test pattern
p runstopbutton 1	# press RUN/STOP, will start

.print Disk drive now on track after 5 secs
.wait	6000		# wait until drive spins up
p                       # show all params of RL1

m ll dl.lst
.print RL11 boot loader installed.
.print Start 10000 to boot from drive 0, 10010 for drive 1, ...
.print Reload with "m ll"



