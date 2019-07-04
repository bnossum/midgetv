        # CSRRW
        # 
        # =============================================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        
        .globl _start
        # =============================================================================

#ifndef onlyEBR
        .section .text
#endif
ERR:        
1:      simerr  1
2:      simerr  2
3:      simerr  3
4:      simerr  4
5:      simerr  5
6:      simerr  6
7:      simerr  7
8:      simerr  8
9:      simerr  9
10:     simerr  10
11:     simerr  11
12:     simerr  12
13:     simerr  13
14:     simerr  14
15:     simerr  15
16:     simerr  16
17:     simerr  17
18:     simerr  18
        
_start:
        //
        // First for mtvec
        //
        
        // Check csrrw with both source and target register in the "safe range"
        li      x12,0x12
        csrrw   x11,mtvec,x12
        bnez    x11,1b                          // Read back 0?
        lw      x11,%lo(__mtvec)(x0)
        bne     x12,x11,2b                      // Updated to 0x12?
        
        // Again
        li      x13,0x34
        csrrw   x11,mtvec,x13
        bne     x11,x12,3b                      // Read back 0x12?
        lw      x11,%lo(__mtvec)(x0)
        bne     x13,x11,4b                      // Updated to 0x34?
        
        // Check with source register in low number
        li      x2,0x56
        csrrw   x11,mtvec,x2
        bne     x11,x13,5b                      // Read back 0x34?
        lw      x11,%lo(__mtvec)(x0)
        bne     x2,x11,6b                       // Updated to 0x56?
        
        // Check with destination register in low number
        li      x3,0x78
        csrrw   x1,mtvec,x3                    
        bne     x1,x2,7b                        // Read back 0x56
        lw      x11,%lo(__mtvec)(x0)
        bne     x3,x11,8b                       // Updated to 0x78?
        
        // Check misa
        li      x22,0x40800100        
        csrrw   x1,misa,x3
        bne     x1,x22,9b
        lw      x11,%lo(__misa)(x0)
        bne     x3,x11,10b
        
        // Check mscratch
        csrrw   x1,mscratch,x3
        bnez    x1,12b
        lw      x11,%lo(__mscratch)(x0)
        bne     x3,x11,12b
        
        // Check mepc
        csrrw   x1,mepc,x3
        bnez    x1,12b
        lw      x11,%lo(__mepc)(x0)
        bne     x3,x11,12b
        
        // Check mcause
        csrrw   x1,mcause,x3
        bnez    x1,12b
        lw      x11,%lo(__mcause)(x0)
        bne     x3,x11,12b
        
        // Check mtval
        csrrw   x1,mtval,x3
        bnez    x1,12b
        lw      x11,%lo(__mtval)(x0)
        bne     x3,x11,12b
        
        simend
