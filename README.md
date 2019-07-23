## midgetv

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

Midgetv trades speed for size:
  - Smallest: A toy implementation require ~250 SB_LUT4s and 4 EBRs. 
  - Usable: ~400 SB_LUT4s, 2 EBR, 2 SRAMs
  - Largest (so far): With absolutely all options enabled the core need ~422 SB_LUT4s, 18 EBRs and 4 SRAMs.
  - Typical clock frequencies (worst case conditions):
    - ICE40HX1L: 54 MHz
    - ICE40UP5K: 24 MHz

Each RISCV instruction use between 4 clock
cycles and about 40 clock cycles (for shifts of a register
by 31). Average number of clocks per instruction (CPI) is
~9. Unaligned word/hword load/store instructions must be performed in
software (something like [this](sw/first/t160.S)). CSR instructions are 
decoded in microcode, but executed by [emulation  software](sw/inc/midgetv_minimal_csr.S).
The privilege mode of midgetv is always *machine-mode*.

### Overall goals 
 -  [x] Targetable to all ICE40 devices that have EBR
 -  [x] Support for SRAM in ICE40 devices that have SRAM
 -  [x] Easy interconnect
 -  [x] Complience with RV32I as per riscv-spec-v2.2.pdf
 -  [ ] Compliance with riscv-privileged-v1.10.pdf
 -  [ ] Support of "C" standard extension
 -  [ ] Support of "M" standard extension

### Overall results
  - Tested on ICE40HX1K
  - Tested on ICE40UP5K
  - Wishbone interface
  - Passes the RISC-V rv32i compliance tests in simulation
 

### Software requirements

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
  

### Hello World

A C-program (["hello world"](sw/hwexamples/morse/morse.c) in morse) is
compiled to iCE40HX1K and programmed to the iceblink40-hx1k board.
The same program is compiled to iCE40UP5K FPGAs and programmed to the
upduino2 development board. Some resulting sizes of the core is
described below.  These numbers will change, so treat them as
slightly optimistic, and indicative only.

Most of the code of `midgetv` is written in two versions, one
"highlevel" version at RTL, and one "lowlevel" version where I use
those tricks I can to reduce the implementation size.

#### iCEcube2

With iCECube2 for compilation (Lattice LSE as synthesis tool), we get the following sizes and speeds 
for the example "hello world" program:

##### Lowlevel morse example
FPGA/Board                          | SB_LUT4  | EBRs | SRAM | Clock  (MHz)  | Comment
:---------------------------------- | :------- | :--- | :--- | :---------- | :-------------------------
`ICE40HX1K-VQ100` `iceblink40-hx1k` | 247 | 4 | 0 | 62 | No `cycle(h)` or `time(h)`. No `instreth`. No interrupts, nor registers `mip`, `mie` or `mstatus`. Minimal instruction decode. Disregards rule 3.55 of Wishbone B.4.
`ICE40UP5K-SG48I` `upduino2`        | 379 | 4 | 2 | 28 | Most options enabled.

Note that "Auto lut cascade" must be off in the placer option of
iCEcube2. This is due to the Lattice preference files where
"set_cascading" is used to reduce the size of the core.

##### Highlevel morse example
With iCEcube2 for compilation (Synplify Pro as synthesis tool), we get the following:

FPGA/Board                          | SB_LUT4  | EBRs | SRAM | Clock  (MHz)  
:---------------------------------- | :------- | :--- | :--- | :----------  
`ICE40HX1K-VQ100` `iceblink40-hx1k` | 444 | 4 | 0 | 70 
`ICE40UP5K-SG48I` `upduino2`        | 547 | 4 | 2 | 28


#### yosys/arachne-pnr, icetime, lowlevel morse example
Using Yosys 0.7+515, arachne-pnr 0.1+287+0.
Unfortunately this give the following
(I would have expected numbers comparable with those for iCECube2, only larger with the SB_LUTs
I save with lut_cascade): On the other hand yosys do *better* than Synplify Pro on the (ahem..) highlevel code.
Metrics for lowlevel code variant only:

FPGA/Board                          | SB_LUT4   | EBRs | SRAM | Clock (MHz) | Comment
:---------------------------------- | :------- | :--- | :--- | :---------- | :-------------------------
`ICE40HX1K-VQ100` `iceblink40-hx1k` | 354  |  4   |  0   | 60 | 76 LUTS larger than expected
`ICE40UP5K-SG48I` `upduino2`        | 466  |  4   |  2   | 25 | 51 LUTS larger than expected


### Incomplete build instructions

#### 1: Utilities
"make" in directory util to build a few utilities

#### 2: Part of Verilog code
"make" in directory code to generate some Verilog include files.

#### 3: Simulators
"make" in directory tst to compile simulators
 - m_ice40sim_SRAM.bin and
 - m_ice40sim_EBRonly.bin


#### Basic verification of instructions
1. "make" in directory sw/first to compile a bunch of small test
   assembler programs (riscv instructions) to binary images, then
   simulate using simulators made in step 3.
2. "cat ../../obj_dir/results.txt" to see how simulation went.

#### Basic verification of instructions as per riscv conformance testing
1. "make" in directory sw/second to compile a bunch of small test
   assembler programs (stubs around included compliance program code).
   Note that the compliance tests is a dependent project, but I do
   not make that dependency explicit in this project, at least not
   for now.
2. "./runall" to simulate the programs compiled in step 1 (takes some time).
3. "./compareall" to compare simulated output with reference output.

#### Compilation of the "morse" C-program to a development board
Note. This will be modified.
1. "make" in directory sw/hwexamples/morse to:
   - compile morse.c to morse.o
   - compile crt0.S to crt0.o (Note that this crt0 is a joke, very incomplete).
   - link to get morse.bin
   - midgetv_bin2ebr to transform morse.bin to ice40loaderprog.hv in
     directories hwtst/iceblink40-hx1k and hwtst/upduino2
1. Go to directory hwtst/upduino2.
   - near the end of the wrapper toplevel
     verilog file upduino2.v are some hints on how to compile a FPGA image.
   - Alternatively, iceCube2 can be used. A suitable project is hopefully
      available in directory hwtst/upduino2/iCEcube2_flow.
1. Upload to the upduino2 board. A similar procedure is to be followed for
   the iceblink40-hx1k board
   

### Semantic Versioning API specification
1. Input and Output signals to m_midgetv_core.v are parts of the API.
   See module m_midgetv_core in m_midgetv_core.v
2. The memory map of midgetv is part of the API. See midgetv.inc in `sw/inc`
3. The way a binary file is mapped to `localparam` specifications by the
   utility `midgetv_bin2ebr` is part of the API.


### Todo

- Verification on startup conditions must be tighter
- Cleanup on code
- Better documentation
- Write and test exhaustive CSR code, just now only a minimum exists
- A number of test programs on modules will be added
- Bootloader program
- Test on external interrupts
- Test on nested interrupts
- Better linker scripts
- Proper `crt0.S`

