        # Check bus error when accessing undefined IO address
        # If we have a faulting input device that holds ACK_I high, (note, rule 3.55
        # in Wishbone B.4), this test program will fail.
        # See also comment at start.
        # =============================================================================

#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        
        .globl _start
        # =============================================================================
        
#ifndef onlyEBR
        .section .text
#endif

        # =============================================================================
StartTrap:
        li      x2,5
        lw      x3,%lo(__mcause)(x0)
        beq     x10,x0,CheckOffendingLW
        li      x11,2
        bltu    x10,x11,CheckOffendingLH
        beq     x10,x11,CheckOffendingLHU
        li      x11,4
        bltu    x10,x11,CheckOffendingLB
        beq     x10,x11,CheckOffendingLBU
        li      x11,6
        li      x2,7
        bltu    x10,x11,CheckOffendingSW
        beq     x10,x11,CheckOffendingSH
        li      x11,8
        bltu    x10,x11,CheckOffendingSB
        li      x2,1
        beq     x10,x11,CheckOffendingJALR
        
        simerr  111

CheckOffendingLW:
        la      x5,OffendingLW
        j       Common

CheckOffendingLH:
        la      x5,OffendingLH
        j       Common
        
CheckOffendingLHU:
        la      x5,OffendingLHU
        j       Common
        
CheckOffendingLB:
        la      x5,OffendingLB
        j       Common
        
CheckOffendingLBU:
        la      x5,OffendingLBU
        j       Common

CheckOffendingSW:
        la      x5,OffendingSW
        j       Common
        
CheckOffendingSH:
        la      x5,OffendingSH
        j       Common

CheckOffendingSB:
        la      x5,OffendingSB
        j       Common

CheckOffendingJALR:
        /* midgetv has no Physical Memory Protection.
         * It still offer some support for detection of execution in I/O regions.
         * On access to unresponsive memory, we set mcause = 1, mtval =
         * offending address, but mepc is not correct, and the link register
         * is lost. Hence there is no way to return to an executiong program.
         * The main problem for midgetv is that the link register is already 
         * overwritten, so continuation is not possible. To rectify this is
         * deemed to expensive.
         */
        bne     x2,x3,2f                // Check mcause == 1
        lw      x3,%lo(__mtval)(x0)
        bne     x1,x3,3f                // Check mtval, should be NOSUCHREG_ADR
        simend // <---------------------// End of simulation
        
        simerr 66
        
Common: 
        bne     x2,x3,2f                // Check mcause, 5 or 7 depending on test
        lw      x3,%lo(__mtval)(x0)
        bne     x1,x3,3f                // Check mtval, should be NOSUCHREG_ADR
        lw      x3,%lo(__mepc)(x0)
        bne     x5,x3,4f                // Check mepce, should match facit in x5
        addi    x3,x3,4
        sw      x3,%lo(__mepc)(x0)      // Prepare for MRET

        sw      x0,%lo(__mtval)(x0)     // Clear to ensure these are later
        sw      x9,%lo(__mcause)(x0)    // updated
        li      x10,99
        mret
        
2:      simerr  2
3:      simerr  3
4:      simerr  4
        
        # =============================================================================
_start:
        # First find out if the program is compiled with NO_CYCLECNT == 1
        # If we have no cycle counter, this testprogram can not be used.
        lw      x1,%lo(__mcycle)(x0)
        lw      x2,%lo(__mcycle)(x0)
        add     x1,x1,1
        beq     x1,x2,NO_CYCLECNT_eq_1
        
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)   
        
        li      x1,NOSUCHREG_ADR

        
OffendingLW:    
        lw      x2,0(x1)

        li      x10,1
OffendingLH:
        lh      x2,0(x1)

        li      x10,2
OffendingLHU:
        lhu     x2,0(x1)
        
        li      x10,3
OffendingLB:
        lb      x2,0(x1)

        li      x10,4
OffendingLBU:
        lbu     x2,0(x1)

        li      x10,5
OffendingSW:
        sw      x2,0(x1)

        li      x10,6
OffendingSH:
        sh      x2,0(x1)

        li      x10,7
OffendingSB:
        sb      x2,0(x1)

        // Try to jump and link to undefined region -- will not return
        li      x10,8
OffendingJALR:  
        jalr    x30,0(x1)
        
//        li      x11,99
//        bne     x10,x11,1f
//        simend
        
1:      simerr  99

NO_CYCLECNT_eq_1:
        // No cycle counter, so no way to get buserrors. Simply end
        simend
