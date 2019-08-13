# "demo" test sequences for basic interrupt test
#
# Testprogram "intrtst" evaluates chars from DL11,
# but input can be given by deposit char to 7776.

ti  	# enter menu
pwr	# restart PDP-11
.wait 1000
m		# emulate missing memory
ll intrtst.lst # load PDP-11 test program

.print Now start Program on PDP-11.
.print On M9312: "L <startaddr>" , "S"
.input

.print First all tests with looong blocking ISRs in "Slow" mode
d 7776 'S

.print *************************************************************************
.print *** Test 1: single INTR
.print 4 Interrupts raised in order
.print 	Set CPU level to 0 (all levels BR4..BR7 enabled)
d 7776 '0
.wait 1000
i 4 40
.wait 250
i 5 50
.wait 250
i 6 60
.wait 250
i 7 70
.wait 250
.print PDP-11 should respond "<ISR 40>" "<ISR 50>" "<ISR 60>" "<ISR 70>"
.input

.print *************************************************************************
.print *** Test 2: INTR Priority
.print CPU INTR disabled, 4 Interrupts raised and not processed
.print
.print 	Set CPU level to 7 (all levels BR4..BR7 disabled)
d 7776 '7
.wait 1000
i 4 40
i 5 50
i 6 60
i 7 70
.print PDP-11 should raise no ISRs.
.print Set CPU level to 6, PDP-11 should respond "ISR 70"
d 7776 '6
.wait 1000

.print Set CPU level to 0
d 7776 '0
.print PDP-11 should respond "ISR 60" "ISR 50" "ISR 40"
.input


.print *************************************************************************
.print *** Test 3: raise INTR while others are processed
.print The printout "ISR <vector>" needs some time and is done on CPU priority level 7
.print (with INTR disabled). In that time other ISR are requested
.print 	Set CPU level to 0 (all levels BR4..BR7 enabled)
d 7776 '0
.wait 1000
i 4 40
i 6 60
i 5 50
i 7 70
.print PDP-11 should respond "ISR 40" "ISR 70" "ISR 60" "ISR 50"
.input


.print *************************************************************************
.print *** Test 4: raise INTR multiple
.print The printout "ISR <vector>" needs some time and is done on CPU priority level 7
.print (with INTR disabled). In that time INTR are re-raised again.
.print This is a "CPU interrupt overload" scenario, ISRs are not called as often
.print as required.
.print Set CPU level to 0 (all levels BR4..BR7 enabled)
d 7776 '0
.wait 1000
i 4 40 	# accepted, ISR called blocking
i 7 70	# ISR 70 scheduled
i 7 70  # re-raise ignored
i 7 70  # re-raise ignored
i 4 40  # ISR 40 scheduled
i 4 40  # re-raise ignored
i 7 70  # re-raise ignored
i 4 40  # re-raise ignored
i 4 40  # re-raise ignored
i 4 40  # re-raise ignored
# end ISR 40: call ISR 70 (highest prio), then ISR 40-
.print PDP-11 should call only two ISRs:"ISR 40", "ISR 70" "ISR 40"
.input


.print *************************************************************************
.print *** Test 5: INTR Slot priority
.print Test: raise INTR while others are processed
.print The printout "ISR <vector>" needs some time and is done on CPU priority level 7
.print (with INTR) disabled. In that time other ISR are requested and waiting.
.print Set CPU level to 7 (all levels BR4..BR7 disabled)
d 7776 '7
.wait 1000
# i <level> <slot> <vector>
i 4 1 110
i 4 2 120
i 5 10 70
i 5 11 100
i 6 20 50
i 6 21 60
i 7 14 40 	# is first (waiting on PRU, highest prio), not sorted as not blocked
i 7 12 20
i 7 11 10
i 7 13 30
.print Set CPU level to 0
d 7776 '0
.print PDP-11 should process ISRs sorted first by level, then by slot:"ISR 40, 10, 20, ... 120"
.input

.print *** Test 6: repeat INTR Slot priority, fast ISR
d 7776 'F
d 7776 '7
.wait 1000
# i <level> <slot> <vector>
i 4 1 110       # is #4
i 4 2 120
i 5 10 70       # is #3
i 5 11 100
i 6 20 50       # is #2 (waiting on PRU, prio after 7)
i 6 21 60
i 7 14 40 	# is #1 (waiting on PRU, highest prio), not sorted as not blocked
i 7 12 20
i 7 11 10
i 7 13 30
.print Set CPU level to 0
d 7776 '0
.print PDP-11 should process ISRs sorted first by level, then by slot:"ISR 40, 10, 20, ... 120"
d 7776 'F	# display ISR log
.input


.print *************************************************************************
.print *** Test 7: DMA priority
.print Start multi-chunk DMA "1" on less priorized slot,
.print then one "2" in priorized slot into same memory.
.print DMA "2" is interrupting DMA "1" on firstchunk of "1"

# dma is non blocking and DEPOSITing
# dma <channel> <from> <to> <fill>
# channel #0 has higher slot prority than #1

dma 1 100000 757776 1
dma 0 100000 757776 2

.wait 1000	# wait for DMAs to complete
.print Check: So first data words are "2" (DMA channel 1 runs 2nd).
e 100000
.print Last data words are "1" (DMA channel 1 finished later and overwrote channel 0's data)
e 757776
.input


d 7776 '0	# all INTR enabled
.wait 1000
d 7776 'S	# slow ISR is printing text
.wait 1000

.print *************************************************************************
.print Test 8: DMA and INTR mixed
.print Set CPU level to 0 (all levels BR4..BR7 enabled)
.print Verify in logic analyzer, that DMA interupts
.print while ISR 70 is printing its text.
.print Trigger LA on 2nd SACK H->L
.input
i 7 70
dma 0 100000 757776 123   	# trigger on 2nd SACK
i 4 40
.print Is Interrupt BR4 40 services after first DMA chunk or at the end (both OK!)






