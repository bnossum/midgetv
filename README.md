# midgetv
RISC-V controller with Wishbone interface specifically for Lattice iCE40 FPGAs. midgetv is a non-pipelined, multicycle design. A small implementations size is the primary goal of midgetv.


### Requirements
- GNU Make
- gcc
  - On the host environment to compile simulation binaries
  - As a cross compiler to compile C and assembler programs for RISC-V.
- Verilator
- emacs (for Verilog-Mode)
- A toolchain for FPGA compilation and upload, for example:
  - iCEcube2 from Lattice
  - yosys/arachne-pnr/icepack 
  - ?
  
