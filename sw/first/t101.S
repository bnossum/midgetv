        # Check addi - visual inspection of simulator dump
        # for verification
        #===========================================================
#include "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif

        # Check addi
        #===========================================================
        .word 0x1234567
_start:
        addi    x28,x1,42       # x28 = 0 + 0x2a = 0x2a
        addi    x16,x28,22      # x16 = 0x2a + 22 = 0x40
        simdump
        simend 
        
