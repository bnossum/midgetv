# midgetv
RISC-V controller with Wishbone interface specifically for Lattice iCE40 FPGAs. midgetv is a non-pipelined, multi-cycle design. A small implementations size is the primary goal of midgetv.

# Goals
- To provide a small RV32I compliant RISC-V ISA controller on the Lattice iCE40 family FPGAs
  - optionally omit the 64-bit counter for cycle counting
  - optionally omit the 64-bit retired instructions counter
  - optionally omit the 64-bit mtime counter.
  - optionally omit CSR instructions
  - optionally omit interrupt handling
- Enable a future extension with a cache, for this reason the SRAM interface of midgetv is close to Wishbone. 
- A thorough simulation of the instructions

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
  - I believe more options exists
  
