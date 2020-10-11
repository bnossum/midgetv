        # Recreate a faulty situation in check_illegals.
        # Did not trap on FLW. The error may be due to many causes,
        # so this is a messy test program
        # =============================================================================
#include "midgetv.inc"
//#include "midgetv_minimal_csr.S"

        .globl _start
        # =============================================================================
        .org 0x108
StartTrap:
        j       TrapHandle
NMI:    nop
        
InternalISR:

1:
        li      x1,LEDREG
        sw      x3,0(x1)                // To LEDs
        addi    x3,x3,1
2:      addi    x1,x1,0x7FF             // Reise for delay loop
        bgt     x1,x0,2b
        j       1b

        # =============================================================================
        .global nrillegaltraps
nrillegaltraps:        
        .word    0
        .extern opcode
        # =============================================================================
TrapHandle:
#define rtmp    x5
        sw      rtmp,%lo(_ex_rtmp)(x0)          // Store working register
        lw      rtmp,%lo(__mcause)(x0)          // Trap is illegal instruction?        
        addi    rtmp,rtmp,-2                    //
        simend
        bnez    rtmp,UnexpectedTrap             // Should not have any other traps
        lw      rtmp,nrillegaltraps
        addi    rtmp,rtmp,1
        sw      rtmp,%lo(nrillegaltraps)(x0)
        lw      rtmp,%lo(__mepc)(x0)            // Ignore the illegal instruction
        addi    rtmp,rtmp,4                     // Return to next instr
        andi    rtmp,rtmp,0xfffffffc            // but ensure it is 32-word aligned
        sw      rtmp,%lo(CSRretadr)(x0)
        lw      rtmp,%lo(_ex_rtmp)(x0)          // restore working register
        ij      0,0x100,0                       // Exit
UnexpectedTrap:
        addi    a0,rtmp,2
//        jal     puthex32
//        la      a0,UnexpTrap
//        jal     puts
//        la      a0,opcode
//        lw      a0,0(a0)
//        jal     puthex32
        simend
        nop
        nop     
        nop
        nop
        nop     
        j       InternalISR

UnexpTrap:
        .string "Unexp Trap:"
        
        .org 0x1a0
_start:
        sw      x10,232(x0)
        li      x2,0xfffffffc
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)
        la      x1,NMI
        sw      x1,%lo(__rNMI_IIV)(x0)
        tail    main

testbed16:
testbed32:
        .word   0x00000007
        ret
        
        .section .text
main:
        li      x10,0x06004033
        la      x11,testbed32
        sw      x10,0(x11)
        tail    testbed32
        
        //         // -----------------------------------------------------------------------------
//         // Set trap handler address
//         la      x10,_trap_handler
//         la      x11,__mtvec
//         sw      x10,0(x11)
//         li      x28,0
// 
//         .word   0x06004033
//         nop
//         simend
// 
//         
//         // -----------------------------------------------------------------------------
// _trap_handler:
//         lw      x10,__mcause
//         addi    x11,x10,0
//         addi    x11,x10,0
//         simend
// //        addi    x28,x28,1
// //        la      x31,__mepc
// //        lw      x30,0(x31)
// //        la      x29,LastOne
// //        beq     x29,x30,AtEnd
// //        addi    x30,x30,4
// //        sw      x30,0(x31)
// //        mret
// //
// //AtEnd:
// //        li      x27,6
// //        bne     x28,x27,Failed
// //        simend
// //
// //Failed:
// //        simerr  2
