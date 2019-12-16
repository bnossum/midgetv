#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

TRG := ../bin/midgetv_bin2ebr ../bin/midgetv_genucode  ../bin/midgetv_indirectEBR \
	../bin/iceblinkcom ../bin/atest ../bin/midgetv_prepare_defines

# ../bin/midgetv_tablefold ../bin/midgetv_ucode_linepermutate

all:$(TRG)

../bin/iceblinkcom: iceblinkcom.c
	gcc -Wall -Wextra -I /usr/include/libusb-1.0  -o $@ $< -lusb-1.0

../bin/midgetv_genucode:../util/midgetv_genucode.c ../code/ucode.h
	gcc -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $< 

../bin/midgetv_bin2ebr:midgetv_bin2ebr.c
	gcc -Wall -Wextra -o $@ $< 

../bin/midgetv_indirectEBR:midgetv_indirectEBR.c bnvector.c 
	gcc -O3 -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/midgetv_ucode_linepermutate:midgetv_ucode_linepermutate.c bnvector.c 
	gcc -O3 -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $^ 

#../bin/midgetv_tablefold:midgetv_tablefold.c ../code/ucode.h
#	gcc -Wall -Wextra -O3 -Dnakedfname=../code/ucode.h -o $@ $< 

../bin/atest:atest.c bnvector.c 
	gcc -O3 -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/tablefold:tablefold.c
	gcc -O3 -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/midgetv_prepare_defines:midgetv_prepare_defines.c
	gcc -Wall -Wextra -o $@ $< 


clean:
	rm $(TRG)
