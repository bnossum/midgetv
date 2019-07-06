# midgetv
RISC-V controller with Wishbone interface specifically for Lattice iCE40 FPGAs. midgetv is a non-pipelined, multi-cycle design. A small implementations size is the primary goal of midgetv.

## Goals
- To provide a small RV32I compliant RISC-V ISA controller on the Lattice iCE40 family FPGAs
  - optionally omit the 64-bit counter for cycle counting
  - optionally omit the 64-bit retired instructions counter
  - optionally omit the 64-bit mtime counter.
  - optionally omit CSR instructions
  - optionally omit interrupt handling
- Enable a future extension with a cache, for this reason the SRAM interface of midgetv is close to Wishbone. 
- A thorough simulation of the instructions

## Requirements
- GNU Make
- gcc
  - On the host environment to compile simulation binaries
  - As a cross compiler to compile C and assembler programs for RISC-V.
- Verilator
- emacs (for Verilog-Mode)
- A toolchain for FPGA compilation and upload, for example:
  - iCEcube2 from Lattice
  - A toolchain based on the emminent icestorm project, such as: yosys/arachne-pnr/icepack 
  
## Status 
- Passes internal instruction testing program in simulation
- Passes the RISC-V rv32i compliance tests in simulation
- A compiled C-program ("hello world" in morse) is compiled to iCE40HX1K and programmed to the iceblink40-hx1k board
- The same program is compiled to iCE40UP5K FPGAs and programmed to the upduino2 development board
- Much work remains, but I believe this project to be mature enough to be usefull to others, hence I make arelease.

## Results
Using iCECube2 for compilation give the following for the example "hello world" program:

|                 | Size (in  | Clock speed |
| Board           | SB_LUT4s) | (MHz)       |
| --------------- | --------- | ----------  |
| iceblink40-hx1k | 258       |  75         |
| upduino2        | 353       |  33         |

Real-world usage of midgetv will certainly be larger, and slower.

## Future work
- Cleanup on where produced files appears
- Cleanup on code, with some optimized code to reinsert
- Verification on startup conditions should be tighter
- Bootloader program
- Test on external interrupts
- Test on nested interrupts
- Better linker scripts
- much more.

