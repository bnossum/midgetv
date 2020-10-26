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

TRG := $(GEN_DIR)/ucodeinitval.hv $(GEN_DIR)/m_2ebr.v $(GEN_DIR)/midgetv_ucodeoptions.hv 

CLUMSY := m_3ebr.v m_alu_carryin.v m_alu.v m_condcode.v m_cyclecnt.v m_ebr.v m_ebr_w16.v m_ebr_w2.v m_ebr_w4.v m_ebr_w8.v m_ice_shortcuts.v \
	m_illegalop.v m_immexp_zfind_q.v m_inputmux.v m_midgetv_core.v m_mimux.v m_opreg.v m_progressctrl.v m_rai.v m_ram_a16.v m_ram_a17.v m_ram.v \
	m_RVC.v m_shiftcounter.v m_shlr.v m_status_and_interrupts.v m_ucodepc.v m_ucode.v m_wai.v




all: ../midgetv.v $(TRG)

../midgetv.v:$(TRG) $(CLUMSY)
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
