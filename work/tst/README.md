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

#### Testing ALU carry in

`m_alu_carryin.bin` iterates over all possible inputs to
[`m_alu_carryin`](../code/m_alu_carryin.v) and compares with a facit.

#### Testing the ALU

`m_alu.bin` iterates over all defined ALU operations, all
inputs, for a 8-bit wide ALU, and compares with a facit. By induction,
the 32-bit ALU should behave equivalently.

#### Testing the cycle counter

Module [`m_cyclecnt`](../code/m_cyclecnt.v) is tested.
`m_cyclecnt.bin` tests that `corerunning` is set high after 128 cycles,
that `buserror` works as intended, and that output muxing works as
intended. 

#### Testing the shift counter

Module [`m_shiftcounter`](../code/m_shiftcounter.v) is tested with exhaustive inputs.

#### Testing instruction decode

Interpret any 32-bit word as an instruction, and see that the value
`minx` used to set the microcode program counter matches the intended
location in the microcode store. So a specific part of module
[`m_ucodepc`](../code/m_ucodepc.v) is tested. 

