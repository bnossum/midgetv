        # Check legal sw, sh, sb to  output port
        # =============================================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        
        .globl _start
        # =============================================================================
        
#ifndef onlyEBR
        .section .text
#endif
_start:        
        // -----------------------------------------------------------------------------
        // Set trap handler address
//        la      x1,_trap_handler
//        csrrw   x0,mtvec,x1

        // test aligned SW
        li      x1,SLOWREGADR-4
        li      x2,0x01234567
        sw      x2,4(x1)
        lw      x3,4(x1)       
        bne     x2,x3,2f

        // test aligned SH
        li      x2,0x76543210
        sh      x2,4(x1)
        lw      x3,4(x1)
        li      x4,0x01233210
        bne     x3,x4,3f

        sh      x2,6(x1)
        lw      x3,4(x1)
        li      x4,0x32103210
        bne     x3,x4,4f

        // test SB
        li      x2,0xef
        sb      x2,4(x1)
        lw      x3,4(x1)
        li      x4,0x321032ef
        bne     x3,x4,5f
        
        sb      x2,5(x1)
        lw      x3,4(x1)
        li      x4,0x3210efef
        bne     x3,x4,6f
        
        sb      x2,6(x1)
        lw      x3,4(x1)
        li      x4,0x32efefef
        bne     x3,x4,7f
        
        sb      x2,7(x1)
        lw      x3,4(x1)
        li      x4,0xefefefef
        bne     x3,x4,8f
        
        simend

        // -----------------------------------------------------------------------------
        // Exception handler
_trap_handler:
        simerr 111
        


1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:	simerr  5
6:	simerr  6
7:	simerr  7
8:	simerr  8
        
