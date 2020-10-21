#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------
#
# Makefile to compile small test programs for midgetv.
# Each program usually consentrate on behavior of
# a single instruction. This directory contains
# program that investigate errors found during
# compliance testing

TARGETSEBR  := t400 t401 t402


TARGETSSRAM := t400 t401 t402

OBJDIREBR := ../../obj_dir/second
OBJDIRSRAM := ../../obj_dir/ssecond

# .SECONDARY:

#
# Midget with no SRAM, 8k EBR, etc.
# 
MIDGETVICE40EBR = ../../bin/m_ice40sim_EBRonly.bin

#
# Midget with 64k sram, 1k EBR, etc
#
MIDGETVICE40SRAM = ../../bin/m_ice40sim_SRAM.bin


BINTARGETSEBR := $(foreach i,$(TARGETSEBR),$(OBJDIREBR)/$(i).bin)
LSTTARGETSEBR := $(foreach i,$(TARGETSEBR),$(OBJDIREBR)/$(i).lst)
RESULTSEBR    := $(foreach i,$(TARGETSEBR),$(OBJDIREBR)/$(i).result2.txt)

BINTARGETSSRAM := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).bin)
LSTTARGETSSRAM := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).lst)
RESULTSSRAM    := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).result2.txt)


all: ../../obj_dir/results2.txt $(BINTARGETSEBR) $(BINTARGETSSRAM) \
	$(LSTTARGETSEBR) $(LSTTARGETSSRAM) 

../../obj_dir/results2.txt: $(RESULTSEBR) $(RESULTSSRAM)
	cat $(RESULTSEBR) $(RESULTSSRAM) > $@

# When compiling
# Bare metal.
# Some include file locations
GCCFLAGS = -mabi=ilp32 -march=rv32imc -nodefaultlibs -nostartfiles -I ../inc/ -I ./

# When linking, flags to make map file.
LDFLAGS = -nodefaultlibs -nostartfiles --discard-none --cref -Map $@.map


# From assembler to object file
$(OBJDIREBR)/%.o : %.S 
	riscv32-unknown-elf-gcc -DNOCSR=1 -DonlyEBR=1 -DSP_INITVAL=0x2000 -TEBRlink.ld $(GCCFLAGS) -o $@ $<

$(OBJDIRSRAM)/%.o : %.S 
	riscv32-unknown-elf-gcc -DNOCSR=1 -TSRAMlink.ld $(GCCFLAGS) -o $@ $<

# Linking 
$(OBJDIREBR)/%.out : $(OBJDIREBR)/%.o
	riscv32-unknown-elf-ld $(LDFLAGS) -TEBRlink.ld -o $@ $<

$(OBJDIRSRAM)/%.out : $(OBJDIRSRAM)/%.o
	riscv32-unknown-elf-ld $(LDFLAGS) -TSRAMlink.ld -o $@ $<

# From a linked .out file to a binary image
%.bin : %.out
	riscv32-unknown-elf-objcopy -O binary $< $@ 

# List file **after** linking
%.lst:%.out
	riscv32-unknown-elf-objdump -M numeric,no-aliases -D $< > $@

# The binary image is simulated
$(OBJDIREBR)/%.result2.txt: $(OBJDIREBR)/%.bin
	$(MIDGETVICE40EBR) -c 0x2000 -s  -l $@ -i $<

$(OBJDIRSRAM)/%.result2.txt: $(OBJDIRSRAM)/%.bin
	$(MIDGETVICE40SRAM) -c 0x2300 -s  -l $@ -i $<


$(BINTARGETSEBR): | $(OBJDIREBR)

$(BINTARGETSSRAM): | $(OBJDIRSRAM)

$(OBJDIREBR):
	mkdir -p $(OBJDIREBR)

$(OBJDIRSRAM):
	mkdir -p $(OBJDIRSRAM)

clean: 
	rm ../../obj_dir/results2.txt $(LSTTARGETSEBR) $(LSTTARGETSSRAM) \
	$(RESULTSEBR) $(RESULTSSRAM) \
	$(OBJDIREBR)/*bin $(OBJDIRSRAM)/*bin \
	$(OBJDIREBR)/*out.map 


