## Utilities

### midgetv_genucode

The microcode of `midgetv` is compiled from a C header form to
`localparam` Verilog suitable to be stored in 3 EBRs (see m_3ebr.v).

### midgetv_indirectEBR

The microcode of `modgetv` is compiled from a C header form to a
Verilog module that uses 2 EBRs.

### midgetv_bin2ebr

The program running in `midgetv` at power-on must be in initialized
EBR. These EBRs also holds constants used by `midgetv`. The seqence is
as follows:

- Write an assembler or C program `myprog.c`
  Include a file that contains `midgetv` constructions, this is
  probably `sw/inc/midgetv.inc`.
- Compile `myprog.c` to `myprog.bin` by some tool, for example
  `riscv32-unknown-elf-gcc`. When linking use a linker script
  that suits `midgetv`
- Transform the binary image to Verilog `localparam`. This is
  done by `midgetv_bin2ebr`.


