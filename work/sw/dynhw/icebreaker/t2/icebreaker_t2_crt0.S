/* This is a primitive crt0
 */
#define SIM 0
#if SIM
#include "midgetv.inc"
        .section .EBRram, "a"
#else
#include "dynmidgetv.inc"
        .section .text.startup, "a"
#endif        
        # =============================================================================
        
        .option norelax
        .globl _start
        .extern main
        
#if SIM
#else        
        // In the event of any exception, or CSR instruction, count on LEDs and hang.
CSRretadr:      .word 0                 //0x100 Microcode writes PC to CSRretadr when a CSR instruction is seen.
Entry_xRET:     ij      0,0xb6,0        //0x104 Microcode branches to here when MRET/SRET/URET is seen
EntryCSR:                               //0x108 Microcode branches to here when a CSR instruction is seen
#endif
        
StartTrap:
        nop
NMI:
        nop
InternalISR:

1:
        li      x1,LEDREG
        sw      x3,0(x1)                // To LEDs
        addi    x3,x3,1
2:      addi    x1,x1,0x7FF             // Reise for delay loop
        bgt     x1,x0,2b
        j       1b
        
        # =============================================================================
_start:
        /* Because this test program loads CSR code from 0xb4, the bitrate found by midget_blast
         * stored at 0xe8 is overwritten. But the bitrate is also found in register x10.
         * Patch it back to location 0xe8
         */
        sw      x10,0xe8(x0)
        
        la      x1,StartTrap            // Initiate mtvec
        sw      x1,%lo(__mtvec)(x0)
        la      x1,NMI                  // Set up the internal ISR handle
        sw      x1,%lo(__rNMI_IIV)(x0)
        li      x2,0xfffffffc           // Set up stack pointer
        j       main

