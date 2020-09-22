#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------
#
# Makefile to compile small test programs for midgetv.
# Each program usually consentrate on behavior of
# a single instruction.
#
# Many programs can be compiled to an image residing only
# in EBR, and to an image residing in SRAM. This is needed
# because timing is different for instructions in SRAM and
# EBR.
#
# Usefull to find how all simulations starts, first
# remove the -s (silent flag) from simulation, then:
# make clean; make | grep "^0000... " > first_instr.txt
#

TARGETSEBR  := t101 t102 t103 t104 t105 t106 t107 t108 t109 \
	t110 t111

TARGETSSRAM := t101 t102 t103 t104 t105 t106 t107 t108 t109 \
	t110 t111

OBJDIREBR := ../../obj_dir/RVC
OBJDIRSRAM := ../../obj_dir/sRVC

# .SECONDARY:

#
# Midget with no SRAM, 8k EBR, etc.
# 
#MIDGETVICE40EBR = ../../tmp/m_ice40sim_EBRonly.bin
MIDGETVICE40EBR = ../../bin/m_ice40sim_EBRonly.bin

#
# Midget with 64k sram, 1k EBR, etc
#
#MIDGETVICE40SRAM = ../../tmp/m_ice40sim_SRAM.bin
MIDGETVICE40SRAM = ../../bin/m_ice40sim_SRAM.bin


BINTARGETSEBR := $(foreach i,$(TARGETSEBR),$(OBJDIREBR)/$(i).bin)
LSTTARGETSEBR := $(foreach i,$(TARGETSEBR),$(OBJDIREBR)/$(i).lst)
RESULTSEBR    := $(foreach i,$(TARGETSEBR),$(OBJDIREBR)/$(i).RVCresult.txt)

BINTARGETSSRAM := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).bin)
LSTTARGETSSRAM := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).lst)
RESULTSSRAM    := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).RVCresult.txt)


all: ../../obj_dir/RVCresults.txt $(BINTARGETSEBR) $(BINTARGETSSRAM) \
	$(LSTTARGETSEBR) $(LSTTARGETSSRAM) 

../../obj_dir/RVCresults.txt: $(RESULTSEBR) $(RESULTSSRAM)
	cat $(RESULTSEBR) $(RESULTSSRAM) > $@

# When compiling
# Specify only rv32i instructions to be used.
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
$(OBJDIREBR)/%.RVCresult.txt: $(OBJDIREBR)/%.bin
	$(MIDGETVICE40EBR) -c 0x1000 -s  -l $@ -i $<

$(OBJDIRSRAM)/%.RVCresult.txt: $(OBJDIRSRAM)/%.bin
	$(MIDGETVICE40SRAM) -c 0x2300 -s  -l $@ -i $<


$(BINTARGETSEBR): | $(OBJDIREBR)

$(BINTARGETSSRAM): | $(OBJDIRSRAM)

$(OBJDIREBR):
	mkdir -p $(OBJDIREBR)

$(OBJDIRSRAM):
	mkdir -p $(OBJDIRSRAM)

clean: 
	rm ../../obj_dir/RVCresults.txt $(LSTTARGETSEBR) $(LSTTARGETSSRAM) \
	$(RESULTSEBR) $(RESULTSSRAM) \
	$(OBJDIREBR)/*bin $(OBJDIRSRAM)/*bin \
	$(OBJDIREBR)/*out.map 


