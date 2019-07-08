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
I try not to tie-in this code to any particular tools, but there are certain dependencies:

- GNU Make
- gcc
  - On the host environment to compile some utility programs and simulation binaries
  - As a cross compiler to compile C and assembler programs for RISC-V.
- Verilator for simulation
- emacs (for Verilog-Mode)
- A toolchain for FPGA compilation and upload, for example:
  - iCEcube2 from Lattice
  - A toolchain based on the emminent icestorm project, such as: yosys/arachne-pnr/icepack 
  
## Status 
- Passes internal instruction testing program in simulation
- Passes the RISC-V rv32i compliance tests in simulation
- A compiled C-program ("hello world" in morse) is compiled to iCE40HX1K and programmed to the iceblink40-hx1k board
- The same program is compiled to iCE40UP5K FPGAs and programmed to the upduino2 development board
- Much work remains, but I believe this project to be mature enough to be useful to others, hence I make a release.

## Results
Using iCECube2 for compilation give the following for the example "hello world" program:

| Board           | SB_LUT4  | EBRs | SRAM | Clock (MHz) |
| --------------- | -------- | ---- | ---- | ----------- |
| iceblink40-hx1k | 258      |  5   |  0   | 75          |
| upduino2        | 353      |  5   |  2   | 33          |

Note that "Auto lut cascade" must be off in the placer option of iCEcube2.

Real-world usage of midgetv will certainly be larger, and slower.

## Abbreviated, incomplete build instructions

### 1: Utilities
"make" in directory util to build a few utilities

### 2: Part of Verilog code
"make" in directory code to generate some verilog include files.

### 3: Simulators
"make" in direcory tst to compile simulators
 - m_ice40sim.bin and
 - m_ice40sim_EBRonly.bin


### Basic verification of instructions
1. "make" in directory sw/first to compile a bunch of small test
   assembler programs (riscv instructions) to binary images, then
   simulate using simulators made in step 2.
2. "cat results.txt" to see how simulation went.

### Basic verification of instructions as per riscv conformance testing.
1. "make" in directory sw/second to compile a bunch of small test
   assembler programs (stubs around included compliance program code).
   Note that the compliance tests is a dependent project, but I do
   not make that dependency explicit in this project, at least not
   for now.
2. "./runall" to simulate the programs compiled in step 3 (takes some time).
3. "./compareall" to compare simulated output with reference output.

### Compilation of a the "morse" C-program to a development board
Note. This will be modified.
1. "make" in directory sw/hwexamples/morse to:
   - compile morse.c to morse.o
   - compile crt0.S to crt0.s (Note that this crt0 is a joke, very incomplete).
   - link to get morse.bin
   - midgetv_bin2ebr to transform morse.bin to ice40loaderprog.hv in
     directories tsthw/iceblink40-hx1k and tsthw/upduino2
2. Go to directory tsthw/upduino2.
   - In the top of the wrapper toplevel
     verilog file upduino2.v are some hints on how to compile a FPGA image.
   - Alternatively, an iceCube2 should be available in directory
     tsthw/upduino2/iCEcube2_flow.
3. Upload to the upduino2 board. A similar procedure is to be followed for
   the iceblink40-hx1k board
   

## Future work
- Cleanup on where produced files appears, then add produced files to a release
- Cleanup on code, with some optimized code to reinsert
- Verification on startup conditions must be tighter
- A number of test programs on modules will be added
- Bootloader program
- Test on external interrupts
- Test on nested interrupts
- Better linker scripts
- much more

