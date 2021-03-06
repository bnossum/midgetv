![picture of midgetv](doc/m_midgetv_core.png)
                       
## midgetv
midgetv is a RISC-V implementation written specifically for ice40*
FPGAs. The base ISA is RV32I. Standard extensions Zicsr and Zifencei
are always included. Standard extension C, M can be compiled in.

midgetv uses Wishbone b4 for interconnect.

### To use midgetv
Include [midgetv.v](work/midgetv.v) into your project, and instantiate
`m_midgetv_core`. The program to run on the core is given by
parameters `prg00` through `prg0F`, usually generated by transforming
a binary RISC-V program with the utility `midgetv_bin2ebr`.


More (rather unstructured) information is available
[here](doc/generalinfo.md).


### Semantic Versioning API specification
1. Signal interface to module [`m_midgetv_core`](work/code/m_midgetv_core.v) is part of the API.
2. The coarse [memory map](work/sw/inc/midgetv.inc) of midgetv is part of the API. 
3. The way a binary file is mapped to `localparam` specifications by the
   utility [`midgetv_bin2ebr`](work/util/midgetv_bin2ebr.c) is part of the API.
