
CFLAGS = -mabi=ilp32 -march=rv32i -nodefaultlibs -nostartfiles -Os -Wall -Wa,-adhln=$*.slst \
	-DNOCSR=1 -DonlyEBR=1 -DSP_INITVAL=0x400 

all : crt0.o morse.lst simmorse \
	../../../tsthw/upduino2/ice40loaderprog.hv \
	../../../tsthw/iceblink40-hx1k/ice40loaderprog.hv morse.s

../../../tsthw/iceblink40-hx1k/ice40loaderprog.hv: ../../../tsthw/upduino2/ice40loaderprog.hv
	cp $< $@

../../../tsthw/upduino2/ice40loaderprog.hv: morse.bin 
	../../../bin/midgetv_bin2ebr -i $< -o $@

simmorse:morse.c
	gcc -Wall -Wextra -Dsim=1 -o $@ $< 



.SECONDARY:

%.s:%.c
	riscv32-unknown-elf-gcc -S $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

%.o:%.c 
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -o $@ $<

%.o:%.S
	riscv32-unknown-elf-gcc -c $(CFLAGS) -TEBRlink.ld  -I ./ -I ../../inc/ -Wa,-a=$*.slst -o $@ $<

%.out:%.o
	riscv32-unknown-elf-ld -TEBRlink.ld -nodefaultlibs -nostartfiles -o $@ crt0.o $< -M > $(*F).map

%.bin:%.out
	riscv32-unknown-elf-objcopy -Obinary $< $@ 

%.lst:%.out
	riscv32-unknown-elf-objdump -M numeric,no-aliases -D $< > $@

clean:
	rm *.o *.out *.bin *~  *.lst *.slst $(BINTARGETS) $(LSTTARGETS) simmorse
