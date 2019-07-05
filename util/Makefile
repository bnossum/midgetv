#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

# The investigate<x> programs should be removed


all:  ../bin/midgetv_bin2ebr \
	../bin/investigate1  ../bin/investigate2 \
	../bin/investigate3  ../bin/investigate4 \
	../bin/investigate5  ../bin/investigate6 \
	../bin/investigate7  ../bin/investigate8 \
	../bin/investigate10 \
	../bin/investigate11 \
	../bin/tablefold  \
	../bin/genucodeeq ../bin/investigate13 \
	../bin/investigate14 ../bin/investigate15


../bin/midgetv_bin2ebr:midgetv_bin2ebr.c
	gcc -Wall -Wextra -o $@ $< 

../bin/note2:note2.c
	gcc -Wall -Wextra -o $@ $< 

../bin/investigate1:investigate1.c ../code/ucode.h
	gcc -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $< 

../bin/investigate2:investigate2.c ../code/ucode.h
	gcc -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $<

../bin/investigate3:investigate3.c ../code/ucode.h
	gcc -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $< 

#  ../code/ucode.h dependency
../bin/investigate4:investigate4.c bnvector.c
	gcc -Wall -Wextra -mpopcnt -Dnakedfname=../code/ucode.h -o $@ $^

../bin/investigate5:investigate5.c bnvector.c 
	gcc -Wall -Wextra -mpopcnt -O3 -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/investigate6:investigate6.c bnvector.c 
	gcc -Wall -Wextra -mpopcnt -O3 -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/investigate7:investigate7.c bnvector.c 
	gcc -Wall -Wextra -mpopcnt -O3 -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/investigate8:investigate8.c bnvector.c 
	gcc -Wall -Wextra -mpopcnt -O3 -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/investigate9:investigate9.c bnvector.c 
	gcc -Wall -Wextra -mpopcnt -O3 -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/investigate10:investigate10.c bnvector.c 
	gcc -Wall -Wextra -mpopcnt -O3 -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/investigate11:investigate11.c bnvector.c 
	gcc -Wall -Wextra -mpopcnt -O3 -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/tablefold:tablefold.c ../code/ucode.h
	gcc -Wall -Wextra -O3 -Dnakedfname=../code/ucode.h -o $@ $< 

../bin/genucodeeq: genucodeeq.c ../code/ucode.h
	gcc -Wall -Wextra -Os -Dnakedfname=../code/ucode.h -o $@ $< 

../bin/investigate13:investigate13.c bnvector.c 
	gcc -Wall -Wextra -mpopcnt -O3 -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/investigate14:investigate14.c bnvector.c 
	gcc -Wall -Wextra -mpopcnt -O3 -Dnakedfname=../code/ucode.h -o $@ $^ 

../bin/investigate15:investigate15.c bnvector.c 
	gcc -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $^ 
