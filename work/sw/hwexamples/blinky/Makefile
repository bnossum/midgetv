
OBJDIREBR := ../../../obj_dir/first
OBJDIRSRAM := ../../../obj_dir/sfirst

# When compiling
# Specify only rv32i instructions to be used.
# Bare metal.
# Some include file locations
GCCFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -I ../../inc/ -I ./

# When linking, flags to make map file.
LDFLAGS = -nodefaultlibs -nostartfiles --discard-none --cref -Map $@.map

all: ../../../hwtst/upduino2/ice40loaderprog.hv \
	../../../hwtst/max_upduino2/ice40loaderprog.hv \
	../../../hwtst/iceblink40-hx1k/ice40loaderprog.hv \
	../../../hwtst/max_iceblink40-hx1k/ice40loaderprog.hv \
	../../../hwtst/icebreaker/ice40loaderprog.hv


../../../hwtst/upduino2/ice40loaderprog.hv:$(OBJDIREBR)/blinky.bin
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/max_upduino2/ice40loaderprog.hv:$(OBJDIREBR)/blinky.bin
	../../../bin/midgetv_bin2ebr -w 11 -i $< -o $@

../../../hwtst/iceblink40-hx1k/ice40loaderprog.hv:$(OBJDIREBR)/blinky.bin
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/max_iceblink40-hx1k/ice40loaderprog.hv:$(OBJDIREBR)/blinky.bin
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/icebreaker/ice40loaderprog.hv:$(OBJDIREBR)/blinky.bin
	../../../bin/midgetv_bin2ebr -i $< -o $@

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


clean:
	rm $(OBJDIREBR)/blinky.bin

