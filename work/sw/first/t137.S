        # Check jalr misaligned instruction fetch exception
        # =============================================================================
#include "midgetv.inc"
        .globl _start

        # =============================================================================
StartTrap:
        # Should get here with mcause = 0, mepc = offending, mtval = _A
        lw      x1,%lo(__mcause)(x0)
        bne     x1,x0,1f
        lw      x1,%lo(__mepc)(x0)
        la      x2,offending
        bne     x1,x2,2f
        lw      x1,%lo(__mtval)(x0)
        la      x2,A
        bne     x1,x2,3f
// Work to be done?        
//#ifndef onlyEBR
//        csrrc   x4,mstatus,x0   # Essentially check MIE == 0
//        li      x5,0x00001800   # but here also check MSTATUS as expected
//        bne     x4,x5,4f
//#endif        
        simend
        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7

#ifndef onlyEBR
        .section .text
#endif

        
_start:
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)
        la      x1,TRG
offending:     
        jalr     x0,x1,2        # jalr hword aligned address, should give exception
        nop

TRG:    
        .hword  0xbbaa
A:      


        
