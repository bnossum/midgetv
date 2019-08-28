#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

BIN = ../../../bin
OBJ = ../../../obj_dir

CFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -Os -Wall -Wextra\
	-DNOCSR=1 -DonlyEBR=1 -DSP_INITVAL=0x2f00  -I ../../inc/

all:	$(OBJ)/mb.lst \
	$(OBJ)/mb2.lst \
	../../../hwtst/upduino2/ice40loaderprog.hv \
	../../../hwtst/max_upduino2/ice40loaderprog.hv \
	../../../hwtst/max_iceblink40-hx1k/ice40loaderprog.hv \
	$(OBJ)/inspiration_midgetv_blast.lst \
	$(OBJ)/dummy.o \
	$(OBJ)/mbc.lst

../../../hwtst/upduino2/ice40loaderprog.hv: $(OBJ)/mb.bin 
	../../../bin/midgetv_bin2ebr < $< > $@

../../../hwtst/max_upduino2/ice40loaderprog.hv: $(OBJ)/mb.bin 
	../../../bin/midgetv_bin2ebr < $< > $@

../../../hwtst/max_iceblink40-hx1k/ice40loaderprog.hv: $(OBJ)/mb2.bin 
	../../../bin/midgetv_bin2ebr < $< > $@

# .SECONDARY:

$(OBJ)/%.s:%.c
	riscv32-unknown-elf-gcc -S $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

$(OBJ)/%.o:%.c 
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

$(OBJ)/%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -I ../../inc/ -Wa,-a=$(OBJ)/$*.slst -o $@ $<

%mb.out:%mb.o
	riscv32-unknown-elf-ld -TEBRlink.ld -nodefaultlibs -nostartfiles -o $@ $< -M > $(OBJ)/$(@F).map

%mbc.out:%mbc.o
	riscv32-unknown-elf-ld -TEBRlink.ld -nodefaultlibs -nostartfiles -o $@ $< -M > $(OBJ)/$(@F).map

%mb2.out:%mb2.o
	riscv32-unknown-elf-ld -TEBRlink.ld -nodefaultlibs -nostartfiles -o $@ $< -M > $(OBJ)/$(*F).map


%.out:%.o
	riscv32-unknown-elf-ld -TEBRlink.ld -nodefaultlibs -nostartfiles -o $@ $(OBJ)/crt0.o $(OBJ)/dummy.o $< -M > $(OBJ)/$((*F).map

# Suitable for midgetv_blast. riscv32-unknown-elf-ld -TEBRlink.ld -nodefaultlibs -nostartfiles -o $@ $(OBJ)/crt0.o $(OBJ)/ab.o $< -M > $(OBJ)/$(*F).map

%.bin:%.out
	riscv32-unknown-elf-objcopy -Obinary $< $@ 

%.lst:%.out
	riscv32-unknown-elf-objdump -M numeric,no-aliases -D $< > $@

# $(OBJ)/midgetv_blast.o: $(OBJ)/crt0.o $(OBJ)/ab.o

clean:
	rm -f \
	$(OBJ)/mb.lst \
	$(OBJ)/mb2.lst \
	../../../hwtst/upduino2/ice40loaderprog.hv

