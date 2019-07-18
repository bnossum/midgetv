# midgetv

RISC-V controller with Wishbone interface specifically for Lattice
iCE40 FPGAs. Midgetv is a non-pipelined, multi-cycle, microcoded design. As a
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
The privilege mode of midgetv is always *machine-mode*.

## Overall goals and results

Goal          | Comment |
------------- | ------- |
< 400 SB_LUTS, 4 EBRs | Not attained yet, uses 5 EBRs, 370 SB_LUT4. Should be possible.  Size varies with included features and toolchain |
Easy interconnect     | External modules accessed using Wishbone |
Full compliance with RV32I as per riscv-spec-v2.2.pdf | Options allow a smaller core, but then breaks full compliance. |
Full compliance with riscv-privileged-v1.10.pdf | It is unlikely anyone will need full compliance here, but as a reference I will endeavor to construct this. A current implementation includes just those registers needed to pass the RISC-V rv32i compliance tests |
Support of "C" standard extension | Not started. If implemented the size will be considerably larger |
Support of "M" standard extension for iCE UltraPlus | Not started. If implemented the size will be considerably larger |

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
numbers will slightly change, so treat them as optimistic, and indicative only.

### iCEcube2
Using iCECube2 for compilation (with Lattice LSE as synthesis tool) give the following for the example "hello world" program:

FPGA/Board                          | SB_LUT4  | EBRs | SRAM | Clock (MHz) | Comment
----------------------------------- | -------- | ---- | ---- | ----------- | --------
`ICE40HX1K-VQ100` `iceblink40-hx1k` | 230 | 5 | 0 | 69 | No `cycle(h)` or `time(h)`. No `instreth`. No interrupts, nor registers `mip`, `mie` or `mstatus`. Minimal instruction decode
`ICE40UP5K-SG48I` `upduino2`        | 370 | 5 | 2 | 29 | `cycle(h)`, `time(h)`, `instret(h)`, interrupts and registers `mip`, `mie` and `mstatus`. Full instruction decode

Note that "Auto lut cascade" must be off in the placer option of
iCEcube2. This is due to the Lattice preference files where
"set_cascading" is used to reduce the size of the core by 31 LUTs.

### yosys/arachne-pnr, icetime
Using Yosys 0.7+515, arachne-pnr 0.1+287+0.
Unfortunately this give the following
(I would have expected numbers comparable with those for iCECube2, only 31 SB_LUTs larger):

FPGA/Board                          | SB_LUT4  | EBRs | SRAM | Clock (MHz) | Comment
----------------------------------- | -------- | ---- | ---- | ----------- | --------------------------
`ICE40HX1K-VQ100` `iceblink40-hx1k` | 337      |  5   |  0   | 60 | 72 LUTS larger than expected
`ICE40UP5K-SG48I` `upduino2`        | 445      |  5   |  2   | 22 | 46 LUTS larger than expected


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

- Cleanup on code, with some optimized code to reinsert
- Verification on startup conditions must be tighter
- Write and test exhaustive CSR code, just now only a minimum exists
- Better documentation
- A number of test programs on modules will be added
- Bootloader program
- Test on external interrupts
- Test on nested interrupts
- Better linker scripts


