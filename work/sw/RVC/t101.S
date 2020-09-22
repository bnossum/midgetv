        # Check c.addi
        # Simplest test I can think of, with two RVC instructions
        # for easiest alignemnt
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
        c.addi  x28,28        
        c.addi  x16,-14       
        sub     x1,x28,x16      # 32-bit instr
        li      x2,42           # 32-bit instr
        bne     x2,x1,1f        # 32-bit instr
        simend 
1:
        simerr  1
