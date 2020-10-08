#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

BIN = ../../../bin
OBJ = ../../../obj_dir

CFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -Os -Wall -Wextra\
	-DNOCSR=1 -DonlyEBR=1 -DSP_INITVAL=0x400 -I ./ -I ../../inc/ \

# intermixed C and assembler:
# -Wa,-alh

all: $(OBJ)/check_illegals.bin $(OBJ)/check_illegals.lst  \
	$(OBJ)/t112.bin $(OBJ)/t112.lst

# $(OBJ)/t112.o: $(OBJ)/check_illegals_crt0.o 

$(OBJ)/check_illegals.o: $(OBJ)/check_illegals_crt0.o 

$(OBJ)/%.o:%.c 
	riscv32-unknown-elf-gcc -c $(CFLAGS) -I ./ -o $@ $<


$(OBJ)/%.S:%.c 
	riscv32-unknown-elf-gcc -S $(CFLAGS) -I ./ -o $@ $<

$(OBJ)/%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -o $@ $<

%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -o $@ $<

%t112.out:%t112.o
	riscv32-unknown-elf-ld -Tlink.ld -nodefaultlibs -nostartfiles -o $@ $< -M > $(OBJ)/$(*F).map

%.out:%.o
	riscv32-unknown-elf-ld -Tlink.ld -nodefaultlibs -nostartfiles -o $@ $(OBJ)/check_illegals_crt0.o $< -M > $(OBJ)/$(*F).map


%.bin:%.out
	riscv32-unknown-elf-objcopy -O binary $< $@ 

%.lst:%.out
	riscv32-unknown-elf-objdump -x -s -M numeric,no-aliases -D $< > $@

clean:
	rm -f $(OBJ)/check_illegals.bin $(OBJ)/check_illegals.lst $(OBJ)/check_illegals.o $(OBJ)/check_illegals_crt0.o \
	$(OBJ)/check_illegals.s $(OBJ)/check_illegals.S $(OBJ)/check_illegals_crt0.slst $(OBJ)/check_illegals.map $(OBJ)/check_illegals.out
