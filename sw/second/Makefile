
TARGETSEBR := wI-ADD-01 wI-ADDI-01 wI-AND-01 wI-ANDI-01 wI-AUIPC-01 \
	wI-BEQ-01 wI-BGE-01 wI-BGEU-01 wI-BLT-01 wI-BLTU-01 wI-BNE-01 \
	wI-DELAY_SLOTS-01 \
	wI-ENDIANESS-01 \
	wI-IO wI-JAL-01 wI-JALR-01 wI-LB-01 wI-LBU-01 wI-LH-01 wI-LHU-01 wI-LUI-01 wI-LW-01 \
	wI-NOP-01 wI-OR-01 wI-ORI-01 wI-RF_size-01 wI-RF_width-01 wI-RF_x0-01 \
	wI-SB-01 wI-SH-01 wI-SLL-01 wI-SLLI-01 wI-SLT-01 wI-SLTI-01 wI-SLTIU-01 wI-SLTU-01 \
	wI-SRA-01 wI-SRAI-01 wI-SRL-01 wI-SRLI-01 wI-SUB-01 wI-SW-01 wI-XOR-01 wI-XORI-01 \
	wI-CSRRC-01 wI-CSRRCI-01 wI-CSRRS-01 wI-CSRRSI-01 wI-CSRRW-01 wI-CSRRWI-01 \
	wI-EBREAK-01 wI-ECALL-01 wI-FENCE.I-01 wI-MISALIGN_JMP-01 wI-MISALIGN_LDST-01 


TARGETSSRAM := $(TARGETSEBR)

OBJDIREBR = ../../obj_dir/second
OBJDIRSRAM = ../../obj_dir/ssecond

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

all: $(BINTARGETSEBR) $(BINTARGETSSRAM)


# When compiling
# Specify only rv32i instructions to be used.
# Bare metal.
# Some include file locations
GCCFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -I ../inc/ -I ./

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

# The binary image is simulated
$(OBJDIREBR)/%.result.txt: $(OBJDIREBR)/%.bin
	$(MIDGETVICE40EBR) -c 0x1000 -s -l $@ -i $<

$(OBJDIRSRAM)/%.result.txt: $(OBJDIRSRAM)/%.bin
	$(MIDGETVICE40SRAM) -c 0x1000 -s -l $@ -i $<

clean:
	rm $(OBJDIREBR)/*bin $(OBJDIRSRAM)/*bin

