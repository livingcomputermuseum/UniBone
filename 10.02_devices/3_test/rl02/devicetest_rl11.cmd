# inputfile for demo to select a rl1 device in the "device test" menu.
# Read in with command line option  "demo --cmdfile ..."
td			# device test menu
.wait 3000		# wait for PDP-11 to reset
m i			# install max UNIBUS memory
sd rl0			# select the "rl1" disk drive
p emulation_speed 10	# 10x speed. Load disk nor 5 seconds
# set type to "rl02"
p runstopbutton 0		# released: "LOAD"
p powerswitch 1		# power on, now in "load" state
p image test.rl02 	# mount image file with test pattern
p runstopbutton 1	# press RUN/STOP, will start
.print Disk drive now on track after 5 secs
.wait	6000		# wait until drive spins up
p                       # show all params of RL1



.end

# program a "status check"
# d DA 13	# load DA with code and RESET
# d CS 4		# cmd "GET STATUS", no interrupt
# e		#examine all. MP is drive status

# program a "seek" from 0 to cylinder 500 (0764). no interrupt
# d DA 175005 # (500 << 7) | 0x4 | 1
# d CS 6 # funcx 3 = seek
# program a "seek" back to 0
# d DA 177601  # (511 << 7) | 1

# verify seek
d DA 13	# load DA with code and RESET
d CS 4		# cmd "GET STATUS", no interrupt


# read 4 sectors = 512 words into memory @ 10000
#  rl02 image create with c:\Progs\RetroCmp\RandomDiskImage\
d DA 177601  # (511 << 7) | 1  # seek to zero
d CS 6           # seek
.wait 1000
d DA 104225      # (0421 << 7) | 4 | 1  # seek to 273
d CS 6		# seek to cyl 421, head1
.wait 1000
d CS 10		# read header
.wait 1000
e MP		# 1043xx verify: track is 421, head is 1
.wait 1000
m f 11064	# init memory 0x1234
d 1 10000	# set BA
d DA 104344	# set DA cyl=0421, sc=44:47
d MP 177000	# set MP =  -wordcount = - 512
# d CS  14	# read data
# now DA = 104350 (at invalid sector 40)
# m d		# dump memory to disk. verify mem@BA contains sector data
# at mem 10000=0x1000: 10401 (bigendian 0x1 11 = cyl 273)
#                000400 (bigendian 0x00 01 = head
#		022000 (big endian 0x24 = sector 0x24 = 044 = 36
# offset in diskimage: 0x559c00
# at mem 010400=0x1100: 10401,400,22400 sector 0x25 = 045 = 37
# at mem 011000=0x1200: 10401,400,23000 sector 0x26 = 046 = 38
# at mem 011400=0x1300: 10401,400,23400 sector 0x27 = 047 = 39


# Read Test 2
# request too much data: invalid sector 1 word
#
# d MP 176777	# set MP =  -wordcount = - 513
# d CS 14 read
# e CS # => status must show "OPI"

# Read test 3
# request only 1 word --- rest of sector untouched!
# d MP 177777
# d CS 14

# Read test 4: NXM
# read 512 words, wie 1)
# aber address = 757400 -> nur 256 byte = 128 word = 1 sector writable
# d BA 157400	# set BA<15:0>
# d DA 104344	# set DA cyl=0421, sc=44:47
# d MP 177000	# set MP =  -wordcount = - 512
# d CS  74  # read sector, wuth ba<17:16> set   14 |(3 >> 4)
# => CS = 120275 (NXM)
# BA = 160002 	(addr AFTER invalid ADDR)
# DA = 104345 	1 sector read



# Write test 1
# init memory with const data, then write 4 sector into mounbted rl02 image
# condition form read test1: mem= 0x1234, cyl=0421, head = 1, wordlen= 1024 = 4 sectors
# BA = 10000
#
# d CS  12	# write data
# now DA = 104350 (at invalid sector 40)
# m d		# dump memory to disk. verify mem@BA contains sector data
# file offset = 5610496 = 0x55:9C00
# verify changed RL image: 0x55:9C00- 0x55:99FF


