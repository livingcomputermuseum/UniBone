# Wrapper for macro11.exe or any other MACRO-11 assembler
#
# Parameters:
SRC=multiarb.mac
LST=multiarb.lst

MACRO11=$HOME/91_3rd_party/MACRO11/macro11

# The output of MACRO-11 is an object module that must be linked before it can be loaded.
# Macro11.exe has no linking step, so ONLY ABSOLUTE SYMBOLS are allowed in the code!
# A relocatable symbol (= relative to module start) is marked with an single quote '
# See pages 3-15, 4-1 and 6-14 of "PDP-11 MACRO-11 Langugage Reference Manual (Version 5.5, Oct 1987, AA-KX10A-TC).pdf"


# I use modified http://www.dbit.com/pub/pdp11/macro11/
# "-e AMA" = ".ENABL AMA" = assemble relocatable addrs as absolute, since we have no linker
# "-e LISTHEX = list binary code in hex notation (instead of octal)

# $MACRO11 -e AMA $SRC -l $LST
$MACRO11 $SRC -l $LST

# generate a listing with binary code in hex notation
# (support for logic analyzer evaluation)
$MACRO11 -e listhex $SRC -l $LST.hex


