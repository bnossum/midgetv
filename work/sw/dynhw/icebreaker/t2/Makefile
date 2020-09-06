#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

BIN = ../../../../bin
OBJ = ../../../../obj_dir

COMPLIACE_SOURCE = ../../../../../../riscv-compliance/riscv-test-suite/rv32i/src/
COMPLIANCE_TEST_ENV = ../../../../../../riscv-compliance/riscv-test-env/

CFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -Os -Wall -Wextra\
	-DNOCSR=1 -DonlyEBR=1 -DSP_INITVAL=0x400 -I ./ -I ../../../inc/ -I $(COMPLIACE_SOURCE) -I $(COMPLIANCE_TEST_ENV)


all: $(OBJ)/icebreaker_t2.bin $(OBJ)/icebreaker_t2.lst 


$(OBJ)/icebreaker_t2.o: | $(OBJ)/icebreaker_t2_crt0.o $(OBJ)/icebreaker_compliance.o $(OBJ)/icebreaker_t2_minimal_csr.o


#$(OBJ)/%.o:%.c 
#	riscv32-unknown-elf-gcc -c $(CFLAGS) -I ./ -o $@ $<

.SECONDARY:

$(OBJ)/%.S:%.c 
	riscv32-unknown-elf-gcc -S $(CFLAGS) -I ./ -o $@ $<

$(OBJ)/%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -o $@ $<

%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -o $@ $<

%.out:%.o
	riscv32-unknown-elf-ld -TDYNSRAMlink.ld -nodefaultlibs -nostartfiles -o $@ $(OBJ)/icebreaker_t2_crt0.o $(OBJ)/icebreaker_compliance.o $(OBJ)/icebreaker_t2_minimal_csr.o $< -M > $(OBJ)/$(*F).map


%.bin:%.out
	riscv32-unknown-elf-objcopy -Obinary $< $@ 

%.lst:%.out
	riscv32-unknown-elf-objdump --full-contents -M numeric,no-aliases -D $< > $@

clean:
	rm -f $(OBJ)/icebreaker_t2.bin $(OBJ)/icebreaker_t2.lst $(OBJ)/icebreaker_t2.o $(OBJ)/icebreaker_t2_crt0.o \
	$(OBJ)/icebreaker_t2.s $(OBJ)/icebreaker_t2.S $(OBJ)/icebreaker_t2_crt0.slst $(OBJ)/icebreaker_t2.map $(OBJ)/icebreaker_t2.out \
	$(OBJ)/icebreaker_compliance.o  $(OBJ)/icebreaker_t2_minimal_csr.o
