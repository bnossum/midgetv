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
- Much work remains, but I believe this project to be mature enough to be useful to others, hence I make a release.

## Results
Using iCECube2 for compilation give the following for the example "hello world" program:

| Board           | Size (in SB_LUT4s) | EBRs | SRAM | Clock (MHz)       |
| --------------- | --------- | -------- | -------- | ----------  |
| iceblink40-hx1k | 258       |  5 | 0 | 75         |
| upduino2        | 353       |  5 | 2 | 33         |

Real-world usage of midgetv will certainly be larger, and slower.

## Abbreviated, incomplete build instructions

# Basic verification of instructions
1. "make" in directory code to compile ucode.h to ucodeinitval.hv
2. "make" in directory tst to compile simulators
   - m_ice40sim.bin and
   - m_ice40sim_EBRonly.bin
3. "make" in directory sw/first to compile a bunch of small test
   assembler programs (riscv instructions) to binary images, then
   simulate using simulators made in step 2.
4. "cat results.txt" to see how simulation went.

# Basic verification of instructions as per riscv conformance testing.
1. As above
2. As above
3. "make" in directory sw/second to compile a bunch of small test
   assembler programs (stubs around included compliance program code).
   Note that the compliance tests is a dependent project, but I do
   not make that dependency explicit in this project, at least not
   for now.
4. "runall" to simulate the programs compiled in step 3 (takes some time).
5. "compareall" to compare simulated output with reference output.

# Compilation of a the "morse" C-program to a development board
Note. This will be modified.
1. As above
2. "make" in directory util to compile midgetv_bin2ebr, an utility that
   mappes a binary image program to EBR initial values.
3. "make" in directory sw/hwexamples/morse to:
   - compile morse.c to morse.o
   - compile crt0.S to crt0.s
   - link to get morse.bin
   - midgetv_bin2ebr to transform morse.bin to ice40loaderprog.hv in
     directories tsthw/iceblink40-hx1k and tsthw/upduino2
4. Go to directory tsthw/upduino2.
   a. In the top of thw wrapper toplevel
      verilog file upduino2.v are some hints on how to compile a FPGA image.
   b. Alternatively, an iceCube2 should be available in directory
      tsthw/upduino2/iCEcube2_flow.
5. Upload to the upduino2 board. A similar procedure is to be followed for
   the iceblink40-hx1k board
   

## Future work
- Cleanup on where produced files appears
- Cleanup on code, with some optimized code to reinsert
- Verification on startup conditions should be tighter
- Bootloader program
- Test on external interrupts
- Test on nested interrupts
- Better linker scripts
- much more.

