#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

BIN = ../../../bin
OBJ = ../../../obj_dir

CFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -Os -Wall -Wextra\
	-DNOCSR=1 -DonlyEBR=1 -DSP_INITVAL=0x400 -I ./ -I ../../inc/ 

all: $(OBJ)/autobaud.lst \
	../../../hwtst/upduino2/ice40loaderprog.hv \
	../../../hwtst/max_upduino2/ice40loaderprog.hv \
	../../../hwtst/icebreaker/ice40loaderprog.hv 

../../../hwtst/upduino2/ice40loaderprog.hv: $(OBJ)/autobaud.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/max_upduino2/ice40loaderprog.hv: $(OBJ)/autobaud.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/icebreaker/ice40loaderprog.hv: $(OBJ)/autobaud.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

$(OBJ)/autobaud.o: | $(OBJ)/autobaud_crt0.o 

# .SECONDARY:

$(OBJ)/%.s:%.c
	riscv32-unknown-elf-gcc -S $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

$(OBJ)/%.o:%.c 
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

$(OBJ)/%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -Wa,-a=$(OBJ)/$*.slst -o $@ $<

%.out:%.o
	riscv32-unknown-elf-ld -TEBRlink.ld -nodefaultlibs -nostartfiles -o $@ $(OBJ)/autobaud_crt0.o $< -M > $(OBJ)/$(*F).map

%.bin:%.out
	riscv32-unknown-elf-objcopy -Obinary $< $@ 

%.lst:%.out
	riscv32-unknown-elf-objdump -M numeric,no-aliases -D $< > $@

clean:
	rm -f $(OBJ)/autobaud_crt0.o \
	$(OBJ)/autobaud.bin \
	../../../hwtst/upduino2/ice40loaderprog.hv \
	../../../hwtst/max_upduino2/ice40loaderprog.hv 

