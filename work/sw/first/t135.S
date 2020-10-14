        # Check conditional branch misaligned instruction fetch exception
        # =============================================================================
#include "midgetv.inc"
        .globl _start

        # =============================================================================
StartTrap:
        # Should get here with mcause = 0, mepc = _start, mtvalue = _A
        lw      x1,%lo(__mcause)(x0)
        bne     x1,x0,1f
        lw      x1,%lo(__mepc)(x0)
        la      x2,Offending
        bne     x1,x2,2f
        lw      x1,%lo(__mtval)(x0)
        la      x2,_A
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
4:      simdump
        simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7

NoRVCimp:
        lw      x1,%lo(__mepc)(x0)
        addi    x1,x1,4
        sw      x1,%lo(__mepc)(x0)
        mret
        
#ifndef onlyEBR
        .section .text
#endif

FakeSuccess:
        simend
        
atest:  .word 0xbadbabe
        .equ ATEST , atest
        
_start:
        // First find out if RVC is implemented. If it is, we report "success"
        la      x1,NoRVCimp
        sw      x1,%lo(__mtvec)(x0)
        .hword  0x4081          // C.LI x1,0
        .hword  0x4081          // C.LI x1,0
        beq     x1,x0,FakeSuccess
        
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)   
Offending:
        beq     x0,x0,_A          # Branch to hword aligned address, should cause exception
        .word   0xbaddead0
        .hword  0xbbaa
_A:      


        
