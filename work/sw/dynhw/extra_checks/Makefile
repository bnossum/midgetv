#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

BIN = ../../../bin
OBJ = ../../../obj_dir

CFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -Os -Wall -Wextra\
	-DNOCSR=1 -DonlyEBR=1 -DSP_INITVAL=0x400 -I ./ -I ../../inc/ 


all: $(OBJ)/check_illegals_rv32i.bin $(OBJ)/check_illegals_rv32i.lst

$(OBJ)/check_illegals_rv32i.o: | $(OBJ)/check_illegals_rv32i_crt0.o 

$(OBJ)/%.o:%.c 
	riscv32-unknown-elf-gcc -c $(CFLAGS) -I ./ -o $@ $<

.SECONDARY:

$(OBJ)/%.S:%.c 
	riscv32-unknown-elf-gcc -S $(CFLAGS) -I ./ -o $@ $<

$(OBJ)/%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -o $@ $<

%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -o $@ $<

%.out:%.o
	riscv32-unknown-elf-ld -TDYNEBRlink.ld -nodefaultlibs -nostartfiles -o $@ $(OBJ)/check_illegals_rv32i_crt0.o $< -M > $(OBJ)/$(*F).map

%.bin:%.out
	riscv32-unknown-elf-objcopy -Obinary $< $@ 

%.lst:%.out
	riscv32-unknown-elf-objdump -x -s -M numeric,no-aliases -D $< > $@

clean:
	rm -f $(OBJ)/check_illegals_rv32i.bin $(OBJ)/check_illegals_rv32i.lst $(OBJ)/check_illegals_rv32i.o $(OBJ)/check_illegals_rv32i_crt0.o \
	$(OBJ)/check_illegals_rv32i.s $(OBJ)/check_illegals_rv32i.S $(OBJ)/check_illegals_rv32i_crt0.slst $(OBJ)/check_illegals_rv32i.map $(OBJ)/check_illegals_rv32i.out
