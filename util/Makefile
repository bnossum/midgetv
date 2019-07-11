#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

TRG := ../bin/midgetv_bin2ebr ../bin/midgetv_genucode

all:$(TRG)

../bin/midgetv_genucode:../util/midgetv_genucode.c ../code/ucode.h
	gcc -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $< 

../bin/midgetv_bin2ebr:midgetv_bin2ebr.c
	gcc -Wall -Wextra -o $@ $< 

clean:
	rm $(TRG)
