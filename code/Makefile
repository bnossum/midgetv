#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------
# TODO: Reinsert generation of optimized control equation storage in two EBRs
#       rather than 3.
#

GEN_CODE_DIR := ../bin

TRG := $(GEN_CODE_DIR)/ucodeinitval.hv

all: $(TRG)

# # m_2ebr.v
# 
# m_2ebr.v:../bin/midgetv_genucode_permutated ucode_permutated.h
# 	../bin/midgetv_genucode_permutated > m_2ebr.v
# 
# ../bin/ucode_linepermutate: ../util/ucode_linepermutate.c ../util/bnvector.c ../code/ucode.h
# 	gcc -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ ../util/ucode_linepermutate.c ../util/bnvector.c 
# 
# ../util/ucode_linepermutate.c:../code/ucode.h
# 	touch ../util/ucode_linepermutate.c
# 
# ucode_permutated.h: ../bin/ucode_linepermutate
# 	../bin/ucode_linepermutate -o ucode_permutated.h
# 
# ../bin/midgetv_genucode_permutated: ucode_permutated.h
# 	gcc -Wall -Wextra -Dnakedfname=../code/ucode_permutated.h -o $@ ../util/midgetv_genucode_permutated.c  
#

#
# Not the most elegant - before making verilog localparams the utility must be
# compiled. This rule is duplicated in the Makefile of the utilities.
#
../bin/midgetv_genucode:../util/midgetv_genucode.c ../code/ucode.h
	gcc -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $< 

$(GEN_CODE_DIR)/ucodeinitval.hv: ../bin/midgetv_genucode 
	../bin/midgetv_genucode > $@

$(GEN_CODE_DIR)/ucodeinitval.hv: | $(GEN_CODE_DIR)

$(GEN_CODE_DIR):
	mkdir -p $(GEN_CODE_DIR)

clean:
	rm $(TRG)
