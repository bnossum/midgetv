#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------
#
# Makefile to compile small test programs for midgetv.
# Each program usually consentrate on behavior of
# a single instruction. Except for t101.S and t172, the 
# programs are supposed to be self-checking.
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
	t110 t111 t112 t113 t114 t115 t116 t117 t118 t119 \
	t120 t121 t122 t123 t124 t125 t126 t127 t128 t129 \
	t130 t131 t132 t133 t134 t135 t136 t137 t138 t139 \
	t140 t141 t142 t143 t144 t145 t146 t147 t148 t149 \
	t150 t151 t152 t153 t154 \
	t160 t161 t162 t163 t164 t165 t166 t167      t169 \
	t170      t172 t173 t174 t175 t176 t177 t178 t179 \
	t180 t181 t182 t183 t184 t185 t186 t187 t188 t189 \
	t190 


TARGETSSRAM := t101 t102 t103 t104 t105 t106 t107 t108 t109 \
	t110 t111 t112 t113 t114 t115 t116 t117 t118 t119 \
	t120 t121 t122 t123 t124 t125 t126 t127 t128 t129 \
	t130 t131 t132 t133 t134 t135 t136 t137 t138 t139 \
	t140 t141 t142 t143 t144 t145 t146 t147 t148 t149 \
	t150 t151 t152 t153 t154 \
	t160 t161 t162 t163 t164 t165 t166 t167 t168 t169 \
	t170 t171 t172 t173 t174 t175 t176 t177 t178 t179 \
	t180 t181 t182 t183 t184 t185 t186 t187 t188 t189 \
	t190 \
	t201 t202 t203 

OBJDIREBR := ../../obj_dir/first
OBJDIRSRAM := ../../obj_dir/sfirst

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
RESULTSEBR    := $(foreach i,$(TARGETSEBR),$(OBJDIREBR)/$(i).result.txt)

BINTARGETSSRAM := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).bin)
LSTTARGETSSRAM := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).lst)
RESULTSSRAM    := $(foreach i,$(TARGETSSRAM),$(OBJDIRSRAM)/$(i).result.txt)


all: ../../obj_dir/results.txt $(BINTARGETSEBR) $(BINTARGETSSRAM) \
	$(LSTTARGETSEBR) $(LSTTARGETSSRAM) 

../../obj_dir/results.txt: $(RESULTSEBR) $(RESULTSSRAM)
	cat $(RESULTSEBR) $(RESULTSSRAM) > $@

# When compiling
# Specify only rv32i instructions to be used.
# Bare metal.
# Some include file locations
GCCFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -I ../inc/ -I ./

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
$(OBJDIREBR)/%.result.txt: $(OBJDIREBR)/%.bin
	$(MIDGETVICE40EBR) -c 0x2000 -s  -l $@ -i $<

$(OBJDIRSRAM)/%.result.txt: $(OBJDIRSRAM)/%.bin
	$(MIDGETVICE40SRAM) -c 0x2300 -s  -l $@ -i $<


$(BINTARGETSEBR): | $(OBJDIREBR)

$(BINTARGETSSRAM): | $(OBJDIRSRAM)

$(OBJDIREBR):
	mkdir -p $(OBJDIREBR)

$(OBJDIRSRAM):
	mkdir -p $(OBJDIRSRAM)

clean: 
	rm ../../obj_dir/results.txt $(LSTTARGETSEBR) $(LSTTARGETSSRAM) \
	$(RESULTSEBR) $(RESULTSSRAM) \
	$(OBJDIREBR)/*bin $(OBJDIRSRAM)/*bin \
	$(OBJDIREBR)/*out.map 


