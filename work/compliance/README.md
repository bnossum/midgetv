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

* Finally, if `midgetv` has been compiled with the reduced instruction
  set, it will fail in the program "I-MISALIGN_JMP-01,S", this program
  must be excluded for rv32imc and rv32ic. 


Inside the framework of the Makefiles, for each test program, the
following happens:

* cat I-ADD-01.elf.bin > /dev/ttyUSB1
  * The `midgetv` in `icebraker` has a bit-bang usart, the program `mb`
    residing in `midgetv` is set up to load a new program.
  * I-ADD-01.elf.bin is processed to be in a form recognizable by by
    `mb` (see the link file).
  
* The script `sig_from_board.sh` is executed.
  * it first emits a character 'G' to start the program, then
  * it records the response, which is the signature of the test
     program,
  * The response is finished with the text `Done`,
  * The response is stored as the signature of the test program
  * After `midgetv` has emitted `Done`, it resets itself so it is
    ready to accept a new test program.
    
* The makefile system proceeds to the next test.

Presently there is a race condition in this. After `midgetv` has
answered `Done`, it takes a certain time before it is ready to receive
a new test program. So ideally the PC should hold for 1 second before
it continues with the next program. As I have never seen any problems
here, I leave the error as is.


  
