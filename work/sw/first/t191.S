        // Midgetv has neither a PMA checker, or PMP. It does, however, give
        // instruction access fault on bus-error. The ways we can get to
        // an illegal region is:
        // JALR                   Unconditional jump register and link
        // JAL                    Unconditional jump and link
        // BEQ/BNE/BLT(U)/BGE(U)  Conditional brances
        // IJ                     Custom-0 unconditional indirect jump
        // fall-over-the-edge     simply execute past the end of a legal region.
        // There exists a few other ways:
        // The trap handling vector can point to an illegal area. If so, midgetv
        //      will DIE at the first trap/interrupt.
        // The internal interrupt/NMI trap can point to an illegal area. If so,
        //      ???
        //
        // This test program is full of fragile code, it runs on a setup with
        // EBRAWIDTH    11
        // SRAMADRWIDTH 16
        // MTIMETAP     0  (so no system registers)
        //
        // Registers are considered as global variables.
        // The test for SRAM should be expanded to also include tests in EBR
        // =============================================================================
#include "midgetv.inc"
#include "midgetv_minimal_csr.S"
        
        .globl _start
        # =============================================================================
        
#ifndef onlyEBR
        .section .text
#endif



#if onlyEBR
        // =============================================================================
        // Some position dependent code for EBR version
PositionDependentTests:
        /*
        I now want to test JAL. JAL can jump +/- 1Mbyte from PC, so in order to get 
        close to an illegal range I first feed PC a higher value by using the fact 
        that the EBR is aliased.

        This comment is outdated, the code is moved.
        
        Test_JAL:                                      PC       Instruction........
                jump    Aliased_Test_JAL,x1            0000025c auipc    x1,0x40000
                                                       00000260 jalr     x0,-2040(x1)
                la      x31,0x40000a78                 3ffffa64 lui      x31,0x40001
                                                       3ffffa68 addi     x31,x31,-1416
                li      x30,0x3ffffa74                 3ffffa6c lui      x30,0x40000
        Is_Aliased_Test_JAL:                           3ffffa70 addi     x30,x30,-1420
                .word 0x00401c6f                       3ffffa74 jal      x24,40000a78

        */
#define Aliased_Test_JAL .+0x3ffff808
Test_JAL:
        li      x30,0x3ffffa3c          // Adr of failing instruction
        la      x31,0x40000a40          // Adr of failing target
        jump    Aliased_Test_JAL,x1     // Construction to bump up PC.
Is_Aliased_Test_JAL:
        // Ideally I would now do:
        // jal     x0,A_Label_High_Up
        //
        // .org 0x40000a78
        // A_Label_High_Up:
        // but this is not possible to code
        .word 0x0040106f                // JAL x0,.+0x1004, so to 0x40000a78
        nop 

        /*
        Comment out of date:
        I now want to test conditional branch.
        The same problems of encoding applies.
        When executing here, PC = 0x3ffffa88
        Ideally I would now do:
        // beq  x0,x0,A_Label_High_Up
        // ...
        // .org 0x40000288
        // A_Label_High_Up:
        but this is not possible to code.
        */
        la      x31,0x40000254 // Adr of failing target
        li      x30,0x3ffffa54 // Adr of failing instruction
Is_Aliased_Test_bcond:
        .word   0x000e3  // BEQ x0,x0,.+0x800 

        nop

        /* So for the last test, we may fall off the edge of the world */
        j       EBR_EndOfTheWorld
        
#else
        // =============================================================================
        // Some position dependent code for SRAM version
PositionDependentTests:
        // =============================================================================
        /* 
        Here I make use of an implementation with no system registers. Then then
        memory region at 0x7xxxxxxx is illegal. Comment is outdated
                                                PC       Instruction......
                la      x31,0x7ff000a0          ffff0088 lui      x31,0x7ff00
                                                ffff008c addi     x31,x31,160
                li      x30,0x800000a0          ffff0090 lui      x30,0x80000
                                                ffff0094 addi     x30,x30,160        
                jump    Aliased_Test_JAL,x1     ffff0098 auipc    x1,0x80010
        Is_Aliased_Test_JAL:                    ffff009c jalr     x0,8(x1)   
                .word 0x8000006f                800000a0 jal      x0,7ff000a0
        */

Test_JAL:
        la      x31,0x7ff00018 // Adr of failing target
        li      x30,0x80000018 // Adr of failing instruction 
#define Aliased_Test_JAL .-0x7fff0000+8
        jump    Aliased_Test_JAL,x1     // Construction to decrease PC to 0x8000xxxx
//        auipc    x1,0x80010 
//        jalr     x1,8(x1)           
Is_Aliased_Test_JAL:
        .word 0x8000006f
//        .word 0x80000c6f



/* Two issues was found when making this test code.
        1. When testing JAL of the form "jal x0,cte".
           Microcode writes the return address to the return register
           using WTRG. When WTRG == x0, register jj is written instead.
           But then jj will point to the next instruction instead of
           the failing instruction.
           This also affetcts JALR, which merges into JAL microcode.
        2. consequtive "jal(r)/jal(r)" where the last jal(r)
           accesses an illegal region will fail. This is because
           jal(r) does not update jj, so jj retains the value written
           to it by the instruction before the jal(r) sequence.

   The solution was to add one more ucode instruction to the JAL
   sequence. jj is now updated at JAL_3
*/        
simend // TMP
        /* Test of a branch to empty region */
        la      x31,0x7ffff82c  // Adr of failing target
        la      x30,0x8000002c  // Adr of falling instruction        
        .word   0x800000e3      // BEQ x0,x0,-0x800

        /* So for the last test, we may fall of the dge of the world
           Must change the aliasing of PC here.
        */
        li      x1,0xfffffff0
        jalr    x0,0(x1)
#endif        


        
CUSTOM0:
        .word   0x60000000        
        
TrapHandle:     
// =============================================================================
        add     x1,x3,x5 // Just a sentinel
        lw      x1,%lo(__mcause)(x0)
        li      x2,1
        bne     x1,x2,1f        // Do we see "Instruction access fault"

        /* In 3.1.17: For instruction access-fault or
        page-fault exceptions on systems with variable-length
	instructions, mtval will contain the virtual
        address of the portion of the instruction that caused the
	fault while mepc will point to the beginning
        of the instruction.
        */

        lw      x1,%lo(__mtval)(x0)
        bne     x1,x31,2f

        lw      x1,%lo(__mepc)(x0)
        bne     x1,x30,3f


        addi    x16,x16,-1
        beq     x0,x16,AllTestsDone
        
        // Exception target address was as expected. Now
        // just continue after the failing instruction
        lw      x1,%lo(__mepc)(x0)
        addi    x1,x1,4
        sw      x1,%lo(__mepc)(x0)
        mret

        // No cycle counter, so no way to get bus-errors. Simply end        
AllTestsDone:   
        simend

1:      simerr  1
2:      simerr  2
3:      simerr  3

        

NO_CYCLECNT_eq_1:
        simend
        
        // =============================================================================
NoRVCimp:
        lw      x12,%lo(__mepc)(x0)
        addi    x12,x12,4
        sw      x12,%lo(__mepc)(x0)
        mret

        // =============================================================================
_start:
        /* First find out if the program is compiled with NO_CYCLECNT == 1
         * If we have no cycle counter, this testprogram can not be used,
         * because then bus-error can't occur.
         */
        lw      x1,%lo(__mcycle)(x0)
        lw      x2,%lo(__mcycle)(x0)
        add     x1,x1,1
        beq     x1,x2,NO_CYCLECNT_eq_1


        /* Find out if RVC is implemented. If it is, I presently mask
         * an error when we execute out of a legal region, see [1] below
        */
        la      x12,NoRVCimp
        sw      x12,%lo(__mtvec)(x0)
        .hword  0x4601          // C.LI x12,0
        .hword  0x4601          // C.LI x12,0
        
        // Install trap handle
        la      x1,TrapHandle
        sw      x1,%lo(__mtvec)(x0)        

#if onlyEBR
        li      x16,5 // The number of tests to perform
#else        
        li      x16,4
#endif        
        // =============================================================================
//        // To show what happens if mtvec is set to an illegal area, uncomment this
//        li      x1,0x60000000
//        sw      x1,%lo(__mtvec)(x0)
//        .word   0

        // =============================================================================
        // Resonable high level tests...
Test_JALR:
        li      x31,IOREGION
        la      x30,JALRtag-4
        jalr    x1,0(x31)
JALRtag:

        /* Test of IJ, the custom-0 extension
        */
        la      x31,IOREGION // Adr of failing target
        la      x30,TheCUSTOMinstruction // Adr of instr (aliased)
        add     x2,x2,x2 // To find location in simulation
        lw      x2,0(x30)
        la      x1,CUSTOM0
TheCUSTOMinstruction:   
        ij      0,0,1
        
        j       PositionDependentTests
        
        simerr 33
        

        // =============================================================================
#if onlyEBR        
        /*
        Finally, we may get to an illegal range by falling over the edege
        When we branch here, the PC is aliased to 0x3ffffff8
        */
        
        
        .org 0x7e8
EBR_EndOfTheWorld:
        li      x31,0x40000000 // Adr of failing target

        /*
         * [1] Error detected. When RVC is included, the address of the
         * failing instruction is very wrong. Unsure if I can correct
         * this. See issue [?].
         *
         */
        beq     x12,x0,1f
        // No RVC
        mv      x30,x31        // Adr of failing instruction
        j       2f
1:      // RVC, the address is wrong, actually register yy
        lw      x30,%lo(__yy)(x0)
2:
        nop
        // Fall into illegal range
#else
        // SRAM wraps around to location 0, which is part of EBR
        simerr 13
//        
//        .org 0xfff0
//SRAM_EndOfTheWorld:
////        add     x1,x2,x3
//        //        simend
//        li      x31,0x40000000 // Adr of failing target
//        mv      x30,x31        // Adr of failing instruction
//        nop
//        nop
//        // Fall into illegal range
        
#endif

