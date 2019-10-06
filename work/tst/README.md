### General comments

This directory mostly contains source code used for Verilator test benches.
In general, the test program is named as the module. That is, module
`m_alu` (that resides in [`m_alu.v`](../code/m_alu.v) has testbenchh
[`m_alu.cpp`](m_alu.cpp), and when compiled, give the executable
`m_alu.bin` in [this](../bin) directory.

Many of the modules under test have parameters. Notably, most modules
exists in a highlevel RTL and a lowlevel "iCE40-primitive"
version. Selection of what to really simulate is done on an *ad hoc*
basis, I do not simultaneously make a test for the lowlevel and
highlevel code, etc.

### Testin ALU carry in

The program `m_alu_carryin` iterates over all possible inputs to
[`m_alu_carryin`](../code/m_alu_carryib.v) and compares with a facit.

### Testing the ALU

The program `m_alu` iterates over all defined ALU operations, all
inputs, for a 8-bit wide ALU, and compares with a facit. By induction,
the 32-bit ALU should behave equivalently.

