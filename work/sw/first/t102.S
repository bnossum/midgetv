        # Check beq
        #===========================================================
#include        "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif

_start:
        addi    x1,x0,42
        addi    x2,x0,42
        beq     x1,x2,2f        # Test branch on equal, should be taken
        simerr  1               # Error, should not be here
        .zero 0x10
2:      beq     x2,x3,3f        # Test branch on equal, should not be taken
        simend                  # End of simulation
        .zero 12
3:      simerr   2              # Error, should not be here
