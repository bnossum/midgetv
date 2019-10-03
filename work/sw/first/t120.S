        # Check lui
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        lui     x5,0x12345
        lui     x6,0xedcbb
        add     x1,x5,x6
        bne     x1,x0,1f
        simend
1:      simerr  1
        
