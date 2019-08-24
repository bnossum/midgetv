#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

BIN = ../../../bin
OBJ = ../../../obj_dir

CFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -Os -Wall -Wextra\
	-DNOCSR=1 -DonlyEBR=1 -DSP_INITVAL=0x2f00  -I ../../inc/

all: $(OBJ)/xmodemboot.lst \
	../../../hwtst/max_upduino2/ice40loaderprog.hv


../../../hwtst/max_upduino2/ice40loaderprog.hv: $(OBJ)/xmodemboot.bin 
	../../../bin/midgetv_bin2ebr < $< > $@


# .SECONDARY:

$(OBJ)/%.s:%.c
	riscv32-unknown-elf-gcc -S $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

$(OBJ)/%.o:%.c 
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

$(OBJ)/%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -I ../../inc/ -Wa,-a=$(OBJ)/$*.slst -o $@ $<

%.out:%.o
	riscv32-unknown-elf-ld -TEBRlink.ld -nodefaultlibs -nostartfiles -o $@ $(OBJ)/crt0.o $(OBJ)/ab.o $< -M > $(OBJ)/$(*F).map

%.bin:%.out
	riscv32-unknown-elf-objcopy -Obinary $< $@ 

%.lst:%.out
	riscv32-unknown-elf-objdump -M numeric,no-aliases -D $< > $@

$(OBJ)/xmodemboot.o: $(OBJ)/crt0.o $(OBJ)/ab.o

clean:
	rm -f $(OBJ)/crt0.o \
	$(OBJ)/xmodemboot.bin \
	../../../hwtst/max_upduino2/ice40loaderprog.hv

