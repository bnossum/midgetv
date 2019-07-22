#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------
# TODO: Reinsert generation of optimized control equation storage in two EBRs
#       rather than 3.
#

GEN_CODE_DIR := ../bin
OBJ_DIR := ../obj_dir

TRG := $(GEN_CODE_DIR)/ucodeinitval.hv ../obj_dir/m_2ebr.v

all: $(TRG)

$(OBJ_DIR)/m_2ebr.v:../bin/midgetv_indirectEBR ../code/ucode.h
	../bin/midgetv_indirectEBR > $@
# 
#
# Not the most elegant - before making verilog localparams the utility must be
# compiled. This rule is duplicated in the Makefile of the utilities.
#
../bin/midgetv_genucode:../util/midgetv_genucode.c ../code/ucode.h
	gcc -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $< 

../bin/midgetv_indirectEBR:../util/midgetv_indirectEBR.c ../util/bnvector.c 
	gcc -O3 -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $^ 


$(GEN_CODE_DIR)/ucodeinitval.hv: ../bin/midgetv_genucode 
	../bin/midgetv_genucode > $@

$(GEN_CODE_DIR)/ucodeinitval.hv: | $(GEN_CODE_DIR)

$(GEN_CODE_DIR):
	mkdir -p $(GEN_CODE_DIR)

$(OBJ_DIR)/m_2ebr.v: | $(OBJ_DIR)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean:
	rm $(TRG)
