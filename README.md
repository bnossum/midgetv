# midgetv

RISC-V controller with Wishbone interface specifically for Lattice
iCE40 FPGAs. midgetv is a non-pipelined, multi-cycle, microcoded design. As a
module, the interconnect of midgetv may be shown as this:

   
                       +----------------+
                CLK_I ->                |- WE_O
                RST_I -|                |- STB_O
                start -|    midgetv     |- CYC_O
                       |                |- SEL_O[3:0] 
                 meip -|                |- ADR_O[31:0]
                ACK_I -|                |- DAT_O[31:0]
    DAT_I[IWIDTH-1:0] -|                |
                       |                |- corerunning
                       |                |- dbga[31:0]
                       +----------------+

Midgetv trades speed for size. Each RISCV instruction uses between 4
clock cycles (for ADDI) and around 40 clock cycles (for shifts of a
register by 31). Average number of clocks per instruction (CPI) seems to be
around 10. Unaligned word/hword load/store instructions must be performed in
software and is really slow. CSR instructions are implemented partly
in microcode, but mostly in software; slow! Interrupt response is also slow. 


## Overall goals and results

| Goal          | Result | Comment |
| ------------- | ------ | ------- |
| Small implementations size | < 400 SB_LUT4 | Size varies with included features and toolchain |
| Easy interconnect to external modules with Wishbone | Done | |
| Full compliance with RV32I as per riscv-spec-v2.2.pdf | Yes? | Presently a number of instructions use a partial instruction decode. All RV32I instructions seem to work. But consider for example `slli`. The encoding is `{7'b0000000, shamt[4:0], rs1[4:0], 3'b001, rd[4:0], 7'b0010011}`. midgetv does not check that the upper 7 bits are `7'h0`. |
| Full compliance with riscv-privileged-v1.10.pdf | Partially done | It is unlikely anyone will need full compliance here, but as a reference I will endeavor to construct this. A current implementation includes just those registers needed to pass the RISC-V rv32i compliance tests |
| Support of "C" standard extension | | Not started |
| Support of "M" standard extension for iCE UltraPlus | | Not started |

## Requirements

I try not to tie-in this code to any particular tools, but there are
certain dependencies. To compile the code with least effort you need:

- GNU Make
- gcc
  - On the host environment to compile some utility programs and simulation binaries.
  - As a cross compiler to compile C and assembler programs for RISC-V.
- Verilator to build the simulator(s)
- Emacs if you want to modify the code easily (for Verilog-Mode)
- A toolchain for FPGA compilation and upload, for example:
  - iCEcube2 from Lattice
  - A toolchain based on the eminent icestorm project, such as: yosys/arachne-pnr/icepack

All my work is done under Linux.
  
## Status 
- Passes internal instruction testing program in simulation
- Passes the RISC-V rv32i compliance tests in simulation
- A C-program ("hello world" in morse) is compiled to
  iCE40HX1K and programmed to the iceblink40-hx1k board
- The same program is compiled to iCE40UP5K FPGAs and programmed to
  the upduino2 development board

## Results

NB. Real-world usage of midgetv will certainly be larger, and
slower. While I still make modifications to the Verilog code, these
numbers will slightly change, so treat them as indicative only.

### iCEcube2
Using iCECube2 for compilation give the following for the example "hello world" program:

Board           | FPGA            | SB_LUT4  | EBRs | SRAM | Clock (MHz)
--------------- | --------------- | -------- | ---- | ---- | -----------
iceblink40-hx1k | ICE40HX1K-VQ100 | 258      |  5   |  0   | 75         
upduino2        | ICE40UP5K-SG48I | 353      |  5   |  2   | 33         

Note that "Auto lut cascade" must be off in the placer option of
iCEcube2. This is due to the Lattice preference files where
"set_cascading" is used to reduce the size of the core by 31 LUTs.

### yosys/arachne-pnr, icetime
Unfortunately this give the following
(I would have expected numbers comparable with those for iCECube2, only 31 SB_LUTs larger):

Board           | FPGA            | SB_LUT4  | EBRs | SRAM | Clock (MHz)
--------------- | --------------- | -------- | ---- | ---- | -----------
iceblink40-hx1k | ICE40HX1K-VQ100 | 330      |  5   |  0   | 40         
upduino2        | ICE40UP5K-SG48I | 428      |  5   |  2   | 24         

But I know my tools are dated:
- Yosys 0.7+515 (git sha1 3545c0f, clang 3.8.0-2ubuntu4 -fPIC -Os)
- arachne-pnr 0.1+287+0 (git sha1 6701132, g++ 5.4.0-6ubuntu1~16.04.9 -O2)


## Incomplete build instructions

### 1: Utilities
"make" in directory util to build a few utilities

### 2: Part of Verilog code
"make" in directory code to generate some verilog include files.

### 3: Simulators
"make" in directory tst to compile simulators
 - m_ice40sim_SRAM.bin and
 - m_ice40sim_EBRonly.bin


### Basic verification of instructions
1. "make" in directory sw/first to compile a bunch of small test
   assembler programs (riscv instructions) to binary images, then
   simulate using simulators made in step 3.
2. "cat ../../obj_dir/results.txt" to see how simulation went.

### Basic verification of instructions as per riscv conformance testing
1. "make" in directory sw/second to compile a bunch of small test
   assembler programs (stubs around included compliance program code).
   Note that the compliance tests is a dependent project, but I do
   not make that dependency explicit in this project, at least not
   for now.
2. "./runall" to simulate the programs compiled in step 1 (takes some time).
3. "./compareall" to compare simulated output with reference output.

### Compilation of the "morse" C-program to a development board
Note. This will be modified.
1. "make" in directory sw/hwexamples/morse to:
   - compile morse.c to morse.o
   - compile crt0.S to crt0.o (Note that this crt0 is a joke, very incomplete).
   - link to get morse.bin
   - midgetv_bin2ebr to transform morse.bin to ice40loaderprog.hv in
     directories tsthw/iceblink40-hx1k and tsthw/upduino2
1. Go to directory tsthw/upduino2.
   - In the top of the wrapper toplevel
     verilog file upduino2.v are some hints on how to compile a FPGA image.
   - Alternatively, iceCube2 can be used. A suitable project is hopefully
      available in directory tsthw/upduino2/iCEcube2_flow.
1. Upload to the upduino2 board. A similar procedure is to be followed for
   the iceblink40-hx1k board
   

## Semantic Versioning API specification
1. Input and Output signals to m_midgetv_core.v are parts of the API.
   See module m_midgetv_core in m_midgetv_core.v
2. The memory map of midgetv is part of the API. See midgetv.inc in `sw/inc`
3. The way a binary file is mapped to `localparam` specifications by the
   utility `midgetv_bin2ebr` is part of the API.


## Todo

- Test program for corner cases, instructions that 'nearly' are
  supported.  Among these are `wfi` encoded with fields `rs1` and or
  `rs2` != 0, and other similar cases.
- Cleanup on code, with some optimized code to reinsert
- Verification on startup conditions must be tighter
- Write and test exhaustive CSR code, just now only a minimum exists
- Better documentation
- A number of test programs on modules will be added
- Bootloader program
- Test on external interrupts
- Test on nested interrupts
- Better linker scripts
- much more

