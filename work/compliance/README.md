## Running riscv-compliance

First an explanation. I doubt the people behind
https://github.com/riscv/riscv-compliance would be very happy if I
merged `midgetv` compliance into their project. I could not guarantee
to maintain it, and `midgetv` would only be annoying.
But I still want to use the good work of riscv-compliance, and
(obviously) be able to run the compliance tests on `midgetv`. 

In the following I assume `midgetv` has been compiled for
`icebreaker`, see [here](../hwtst/icebreaker). The program included
with the processor should be
[mb](..//sw/hwexamples/midgetv_blast/mb.S) (`mb.S` is an usart
loader program that allow upload and execution of a program on `midgetv`).


This is how I do it:

* This directory holds a slight variation of the `Makefile` in
  `riscv-compliance`. 
  * `RISCV_COMPLIANCE_ROOTDIR` is added
  * `SUITEDIR` is added
  * The rule for `verify` is sligtly changed.

* Directory `riscv-target` and subdirectories are organized as they
  would be if `midgetv` was indeed a part of `riscv-compliance`.

* Do a `make VERBOSE=1` to see how everything fits together.


Finally, if `midgetv` has been compiled with the reduced instruction
set, it will fail in the program "I-MISALIGN_JMP-01,S", this program
must be excluded for rv32imc and rv32ic.


  
  


  
