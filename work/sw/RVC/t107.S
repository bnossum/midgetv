        # Find an observed error.
        # Unaligned auipc failed, it gave back pc+2
        # this is because pc was incremented to read the second
        # half of the 32-bit unaligned instruction.
        #===========================================================
#include "midgetv.inc"
        .globl _start

#ifndef onlyEBR
        .section .text
#endif

        #===========================================================
_start:
        auipc   x6,0
        c.li    x3,0
        auipc   x7,0
        addi    x8,x6,6
        c.li    x3,0
        bne     x8,x7,1f
99:     simdump
        simend 
1:
        simdump
        simerr  1
