#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

GEN_CODE_DIR := ../bin

all: $(GEN_CODE_DIR)/ucodeinitval.hv

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

$(GEN_CODE_DIR)/ucodeinitval.hv: ../bin/midgetv_genucode 
	../bin/midgetv_genucode > $@

$(GEN_CODE_DIR)/ucodeinitval.hv: | $(GEN_CODE_DIR)

$(GEN_CODE_DIR):
	mkdir -p $(GEN_CODE_DIR)
