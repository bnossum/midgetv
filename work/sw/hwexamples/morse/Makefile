#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

BINDIR = ../../../bin
OBJDIR = ../../../obj_dir

CFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -Os -Wall \
	-DNOCSR=1 -DonlyEBR=1 -DSP_INITVAL=0x400 

all: $(BINDIR)/simmorse ../../../hwtst/upduino2/ice40loaderprog.hv \
	../../../hwtst/iceblink40-hx1k/ice40loaderprog.hv \
	../../../hwtst/max_iceblink40-hx1k/ice40loaderprog.hv \
	../../../hwtst/max_upduino2/ice40loaderprog.hv \
	../../../hwtst/for_size_estimate/ice40loaderprog.hv \
	../../../hwtst/icebreaker/ice40loaderprog.hv \
	$(OBJDIR)/morse.lst \

../../../hwtst/iceblink40-hx1k/ice40loaderprog.hv: $(OBJDIR)/morse.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/max_iceblink40-hx1k/ice40loaderprog.hv: $(OBJDIR)/morse.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/upduino2/ice40loaderprog.hv: $(OBJDIR)/morse.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/max_upduino2/ice40loaderprog.hv: $(OBJDIR)/morse.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/for_size_estimate/ice40loaderprog.hv: $(OBJDIR)/morse.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

../../../hwtst/icebreaker/ice40loaderprog.hv: $(OBJDIR)/morse.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@


$(BINDIR)/simmorse:morse.c
	gcc -Wall -Wextra -Dsim=1 -o $@ $< 

$(OBJDIR)/morse.o: | $(OBJDIR)/morse_crt0.o

# .SECONDARY:

$(OBJDIR)/%.s:%.c
	riscv32-unknown-elf-gcc -S $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

$(OBJDIR)/%.o:%.c 
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

$(OBJDIR)/%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -I ../../inc/ -Wa,-a=$(OBJDIR)/$*.slst -o $@ $<

%.out:%.o
	riscv32-unknown-elf-ld -TEBRlink.ld -nodefaultlibs -nostartfiles -o $@ $(OBJDIR)/morse_crt0.o $< -M > $(OBJDIR)/$(*F).map

%.bin:%.out
	riscv32-unknown-elf-objcopy -Obinary $< $@ 

%.lst:%.out
	riscv32-unknown-elf-objdump -M numeric,no-aliases -D $< > $@

clean:
	rm -f $(BINDIR)/simmorse \
	$(OBJDIR)/morse_crt0.o \
	$(OBJDIR)/morse.bin \
	../../../hwtst/upduino2/ice40loaderprog.hv \
	../../../hwtst/iceblink40-hx1k/ice40loaderprog.hv
