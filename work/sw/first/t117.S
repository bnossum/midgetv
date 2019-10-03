        # Check sltu
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        addi    x3,x0,1
        addi    x1,x0,22
        addi    x25,x0,25
        sltu    x2,x1,x25       # x2 == 1 because 22 < 25
        bne     x2,x3,1f        #
        addi    x2,x0,2 
        sltu    x2,x1,x2        # x2 == 0 because (22 < 2) false
        bne     x2,x0,1f        #
        addi    x22,x0,22
        sltu    x2,x1,x22        # x2 == 0 because ( 22 < 22) false
        bne     x2,x0,1f
        simend
1:      simerr  1
        
