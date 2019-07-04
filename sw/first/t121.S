        # Check auipc
        #===========================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
_start:
        auipc   x5,0x0f000
        lui     x6,0x0f000      // Have checked that this seems to work 
        sub     x4,x5,x6        // x4 = _start;
        la      x7,_start
        bne     x4,x7,1f
        simend
1:      simerr  1
        
