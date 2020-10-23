#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------
# TODO: Reinsert generation of optimized control equation storage in two EBRs
#       rather than 3.
#

GEN_DIR := ../generated
BIN_DIR := ../bin

TRG := $(GEN_DIR)/m_2ebr.v $(GEN_DIR)/midgetv_ucodeoptions.hv 

# $(GEN_DIR)/ucodeinitval.hv 

all: ../midgetv.v $(TRG)

../midgetv.v:$(TRG)
	$(BIN_DIR)/make_monolithic > $@

$(GEN_DIR)/m_2ebr.v:$(BIN_DIR)/midgetv_indirectEBR ../code/ucode.h
	$(BIN_DIR)/midgetv_indirectEBR > $@
# 
#
# Not the most elegant - before making verilog localparams the utility must be
# compiled. This rule is duplicated in the Makefile of the utilities.
#
$(BIN_DIR)/midgetv_genucode:../util/midgetv_genucode.c ../code/ucode.h $(GEN_DIR)/midgetv_ucodeoptions.hv
	gcc -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $<  ../util/bnvector.c 

$(BIN_DIR)/midgetv_indirectEBR:../util/midgetv_indirectEBR.c ../util/bnvector.c ../code/ucode.h $(GEN_DIR)/midgetv_ucodeoptions.hv
	gcc -O3 -Wall -Wextra -Dnakedfname=../code/ucode.h -o $@ $< ../util/bnvector.c 

$(GEN_DIR)/midgetv_ucodeoptions.hv: midgetv_ucodeoptions.h
	$(BIN_DIR)/midgetv_prepare_defines < $< > $@ 

$(GEN_DIR)/ucodeinitval.hv: $(BIN_DIR)/midgetv_genucode 
	$(BIN_DIR)/midgetv_genucode > $@

$(GEN_DIR)/ucodeinitval.hv: | $(GEN_DIR)

$(GEN_DIR)/m_2ebr.v: | $(GEN_DIR)

$(GEN_DIR)/midgetv_ucodeoptions.hv: | $(GEN_DIR)

$(GEN_DIR):
	mkdir -p $(GEN_DIR)


clean:
	rm $(TRG)
