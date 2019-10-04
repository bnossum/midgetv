![picture of midgetv](doc/m_midgetv_core.png)
                       
## midgetv
   
Midgetv is non-pipelined and microcoded - it trades speed for
size. The smallest possibly useful implementation requires around 256
SB_LUT4s and 4 EBRs. The smallest implementation that successfully
executes all programs in the rv32i test suite in simulation is 271
SB_LUT4s and 6 EBRs. Currently, the largest implementation require
around 411 SB_LUT4s, 18 EBRs and 4 SPRAMS. Typical clock frequencies
(worst case conditions):
 - ICE40HX1K: 65 MHz
 - ICE40UP5K: 24 MHz

Each RISCV instruction use between 4 clock cycles and about 40 clock
cycles (for shifts of a register by 31). Average number of clocks per
instruction (CPI) is ~9. Unaligned word/hword load/store instructions
must be performed in software (something like
[this](work/sw/first/t160.S)). CSR instructions are decoded in
microcode, but executed by
[emulation software](work/sw/inc/midgetv_minimal_csr.S).  The
privilege mode of midgetv is always *machine-mode*.

### Overall goals 
 -  [x] Targetable to all ICE40 devices that have EBR
 -  [x] Support for SRAM in ICE40 devices that have SRAM
 -  [x] Easy interconnect
 -  [x] Complience with RV32I as per riscv-spec-v2.2.pdf
 -  [ ] Compliance with riscv-privileged-v1.10.pdf
 -  [ ] Support of "C" standard extension
 -  [ ] Support of "M" standard extension

### Overall results
  - Tested on ICE40HX1K using a iceblink40-hx1k board
  - Tested on ICE40UP5K using a UPDuino2 board
  - Passes the RISC-V rv32i compliance tests in simulation

### Software requirements

I try not to tie-in this code to any particular tools, but to compile the code with 
least effort you need:

- GNU Make
- gcc
  - On the host environment to compile some utility programs and simulation binaries.
  - As a cross compiler to compile C and assembler programs for RISC-V.
- Verilator to build the simulator(s)
- Emacs if you want to modify the code easily (for Verilog-Mode)
- A toolchain for FPGA compilation and upload, for example:
  - iCEcube2 from Lattice
  - A toolchain based on the very impressive icestorm project, such as: yosys/arachne-pnr/icepack

All my work is done under Linux.

### Examples of midgetv on hardware
See [here](work/hwtst)

### Example programs
See [here](work/sw/hwexamples)

### Simulation of midgetv in Verilator
See [here](work/tst) for the simulator code. Many small programs to test specific instructions in midgetv is [here](work/sw/first), and code to do the riscv compliance test suite is [here](work/sw/second).



### Semantic Versioning API specification
1. Signal interface to module [`m_midgetv_core`](work/code/m_midgetv_core.v) is part of the API.
2. The coarse [memory map](work/sw/inc/midgetv.inc) of midgetv is part of the API. 
3. The way a binary file is mapped to `localparam` specifications by the
   utility [`midgetv_bin2ebr`](work/util/midgetv_bin2ebr.c) is part of the API.


### Future plans
- Bootloader program (nearly there)
- Write and test exhaustive CSR code, just now only a minimum exists
- Test on external interrupts
- Test on nested interrupts/exceptions
- Cleanup on code
- Better documentation
- Better linker scripts
- Proper `crt0.S`
- Table that show clockcycles used per instruction
