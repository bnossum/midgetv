#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

BINDIR = ../../../bin
OBJDIR = ../../../obj_dir

CFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -Os -Wall \
	-DNOCSR=1 -DonlyEBR=1 -DSP_INITVAL=0x400 -I ../../inc/

all: 	../../../hwtst/max_iceblink40-hx1k/ice40loaderprog.hv \
	$(OBJDIR)/fmmorse.lst \

../../../hwtst/max_iceblink40-hx1k/ice40loaderprog.hv: $(OBJDIR)/fmmorse.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/max_upduino2/ice40loaderprog.hv: $(OBJDIR)/fmmorse.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

$(OBJDIR)/fmmorse.o: | $(OBJDIR)/fmmorse_crt0.o

# .SECONDARY:

$(OBJDIR)/%.s:%.c
	riscv32-unknown-elf-gcc -S $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

$(OBJDIR)/%.o:%.c 
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

$(OBJDIR)/%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -I ../../inc/ -Wa,-a=$(OBJDIR)/$*.slst -o $@ $<

%.out:%.o
	riscv32-unknown-elf-ld -TEBRlink.ld -nodefaultlibs -nostartfiles -o $@ $(OBJDIR)/fmmorse_crt0.o $< -M > $(OBJDIR)/$(*F).map

%.bin:%.out
	riscv32-unknown-elf-objcopy -Obinary $< $@ 

%.lst:%.out
	riscv32-unknown-elf-objdump -M numeric,no-aliases -D $< > $@

clean:
	rm -f $(OBJDIR)/fmmorse_crt0.o \
	$(OBJDIR)/fmmorse.bin 
