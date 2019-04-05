# full memory emulation
m
.wait 5000	# wait for PDP-11 to reset through ACLO/DCLO
m         	# emulate full memory
.wait 1000
lp zkma.ptap    # load into memory


.print *************************************************************
.print Now start ZKMA on PDP-11.
.print On M9312: "L 200" , "S"
.print ZKMA should only test 0-157776
.print
.print After that, start  UniBone DMA test in parallel on upper mem.
.print Command: "tr 200000 757776"
.print *************************************************************


