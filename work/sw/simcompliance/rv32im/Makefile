#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

TARGETSEBR := wDIV wDIVU wMULH wMULHSU wMULHU wMUL wREM wREMU

TARGETSSRAM := $(TARGETSEBR)

OBJDIREBR = ../../../obj_dir/rv32im
OBJDIRSRAM = ../../../obj_dir/srv32im

#
# Midget with no SRAM, 8k EBR, etc.
# 
MIDGETVICE40EBR = ../../bin/m_ice40sim_EBRonly.bin

#
# Midget with 64k sram, 1k EBR, etc
#
MIDGETVICE40SRAM = ../../bin/m_ice40sim.bin


BINTARGETSEBR := $(foreach i,$(TARGETSEBR),$(OBJDIREBR)/$(i).bin)
LSTTARGETSEBR := $(foreach i,$(TARGETSEBR),$(OBJDIREBR)/$(i).lst)
RESULTSEBR    := $(foreach i,$(TARGETSEBR),$(OBJDIREBR)/$(i).result.txt)

BINTARGETSSRAM := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).bin)
LSTTARGETSSRAM := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).lst)
RESULTSSRAM    := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).result.txt)

all: $(BINTARGETSEBR) $(BINTARGETSSRAM) $(LSTTARGETSEBR)


# When compiling
# Specify only rv32im instructions to be used.
# Bare metal.
# Some include file locations
GCCFLAGS = -mabi=ilp32 -march=rv32im -nodefaultlibs -nostartfiles -I ../../inc/ -I ./ -I ../../../../../riscv-compliance/riscv-test-suite/rv32im/src/ \
	-I ../../../../../riscv-compliance/riscv-test-env/

# When linking, flags to make map file.
LDFLAGS = -nodefaultlibs -nostartfiles --discard-none --cref -Map $@.map


# From assembler to object file
$(OBJDIREBR)/%.o : %.S 
	riscv32-unknown-elf-gcc -DNOCSR=1 -DonlyEBR=1 -TEBRlink.ld $(GCCFLAGS) -o $@ $<

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

# Directories for result may need to be made
$(OBJDIREBR):
	mkdir -p $(OBJDIREBR)

$(OBJDIRSRAM):
	mkdir -p $(OBJDIRSRAM)

# Directories must exist before results are compiled
$(BINTARGETSEBR): | $(OBJDIREBR)

$(BINTARGETSSRAM): | $(OBJDIRSRAM)


clean:
	rm $(OBJDIREBR)/*bin $(OBJDIRSRAM)/*bin \
	$(OBJDIREBR)/*map $(OBJDIRSRAM)/*map
