/* This is a primitive crt0 for check_illegals_xxx.c
 */

#include "dynmidgetv.inc"

        # =============================================================================

#define rtmp    x5        
        # =============================================================================
        
        .section .DYNEBRram, "a"
        .option norelax
        .globl _start
        .extern main
        
        
        // In the event of any exception, or CSR instruction, count on LEDs and hang.
CSRretadr:      .word 0                 //0x100 Microcode writes PC to CSRretadr when a CSR instruction is seen.
Entry_xRET:     ij      0,0xb6,0        //0x104 Microcode branches to here when MRET/SRET/URET is seen
EntryCSR:                               //0x108 Microcode branches to here when a CSR instruction is seen

StartTrap:
        j       TrapHandle
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
        .global nrillegaltraps
nrillegaltraps:        
        .word    0
        .extern opcode
        # =============================================================================
TrapHandle:
        sw      rtmp,%lo(_ex_rtmp)(x0)          // Store working register
        lw      rtmp,%lo(__mcause)(x0)          // Trap is illegal instruction?
        addi    rtmp,rtmp,-2                    //
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
        la      a0,UnexpTrap
        jal     puts
        la      a0,opcode
        lw      a0,0(a0)
        jal     puthex32
        j       InternalISR

UnexpTrap:
        .string "Unexp Trap:"
        
        # =============================================================================
_start:
        la      x1,StartTrap            // Initiate mtvec
        sw      x1,%lo(__mtvec)(x0)
        la      x1,NMI                  // Set up the internal ISR handle
        sw      x1,%lo(__rNMI_IIV)(x0)
        j       main

        # =============================================================================
        .global testbed16
        .global testbed32
testbed16:
testbed32:
        .hword  0
        .hword  0
        ret
        
        # =============================================================================
/////////////////////////////////////////////////////////////////////////////
/* Bitbang a character to the USART                
 * At entry:
 * ra   Return address
 * a0   character to output
 * At exit:
 * a0   corrupted
 * Requires: 
 *    sp legal and 2 free words of stack.
 *    mcycle implemented
 *    bitrate present in 0x000000e8
 *
 * As a convenience, a '\n' may be output as '\r\n'
 */
        .global putchar
putchar: 
        addi    sp,sp,-8
        sw      t0,0(sp)                // Store t0
        sw      t1,4(sp)                // Store t1
        slli    a0,a0,1                 // c <<= 1
        andi    a0,a0,1023              // c |= 0x3ff;
        ori     a0,a0,512               // c |= 0x200;
#if DOS_CRLF                
        li      t1,512 + 20             // Outputs '\n' ?
        bne     t1,a0,1f                // No

        li      a0,13                   // '\r'
        mv      t1,ra                   // save
        jal     ra,putchar              // Recurse
        mv      ra,t1                   // restore
        li      a0,512 + 20             // restore
#endif        
1:      
        lw      t0,0xe8(x0)             // __freefornow_e8(x0) is bitrate
        slli    t0,t0,4                 // t = bitrate*16;
        lw      t1,0x8c(x0)             // n = mcycle
        add     t0,t0,t1                // t = bitrate*16 + n;
        bgeu    t0,t1,2f                // if ( t >= n ) goto L2;
        addi    t0,x0,100               // t = 100;                                        
1:      //                                 L1:;
        lw      t1,0x8c(x0)             // n = mcycle;
        bltu    t0,t1,1b                // if ( 100 < mcycle ) goto L1;
2:      //                                 L2:;
        lui     t0,0x60000              //
        sw      a0,8(t0)                // UART->D = c;
        srai    a0,a0,1                 // c >>= 1;
        lw      t0,0xe8(x0)             // __freefornow_e8(x0) // 
        add     t1,t1,t0                // n += bitrate;
3:      //                                 L4:;
        lw      t0,0x8c(x0)             // tt = mcycle;;
        bltu    t0,t1,3b                // if ( mcycle < b ) goto L3;
        bne     a0,x0,2b                // if ( c ) goto L2;
putchar_tail2:                 
        lw      t1,4(sp)                // Restore t1
putchar_tail1:         
        lw      t0,0(sp)                // Restore t0
        addi    sp,sp,8                 // Restore SP
        jalr    x0,0(ra)                // Return

/* Write a string to the UART
 * 
 * At entry:
 * ra   Return address
 * a0   Points to string to output
 * At exit:
 * a0   corrupted
 * Requires: 
 *    sp legal and +2 free words of stack.
 */
        .global puts
puts:         
        addi    sp,sp,-8                // Make space to store registers used
        sw      t0,0(sp)                // Store t0
        sw      ra,4(sp)                // Store return adrress
        mv      t0,a0                   // char *p = s;  
        j       2f                      // do {
1:      jal     ra,putchar              //     bn_asm_putchar(c);
        addi    t0,t0,1                 //     s++;
2:      lbu     a0,0(t0)                //     c = *s;
        bne     a0,x0,1b                // } while ( c );
        lw      ra,4(sp)                // Restore return address
        lw      t0,0(sp)                // Restore t0
        addi    sp,sp,8                 // Restore sp
        jalr    x0,0(ra)                // Return

        .global getchar
getchar:
        addi    sp,sp,-20 
        sw      t0,0(sp)
        sw      t1,4(sp)
        sw      t2,8(sp)
        sw      t3,12(sp)
        sw      t4,16(sp)
        li      t4,1                    // Bitmask
        lw      t3,0xe8(x0)             // Bitrate
        srli    t3,t3,1                 // Bitrate/2
        lui     t0,0x60000              // Wait until RX high.
1:      lw      a0,8(t0)                // We may possibly be in the previous transaction, 
        beq     a0,x0,1b                // because we cheat on the frame bit.
1:      lw      a0,8(t0)                // Wait until RX low, the start bit (also clears a0).
        bne     a0,x0,1b                // When the startbit was detected,
        lw      t1,0x8c(x0)             // mcycle has a specific value
2:      lw      t2,0xe8(x0)             // Bitrate
        add     t3,t3,t2                // When to sample
1:      lw      t2,0x8c(x0)
        sub     t2,t2,t1                // Delta time
        bltu    t2,t3,1b                // Wait for a specific time, 1.5 or 1 bit time
        lw      t2,8(t0)                // Sample RX
        beq     t2,x0,1f
        or      a0,a0,t4
1:      add     t4,t4,t4                // Shift bitmask
        addi    t2,t4,-0x100            // Sampled 8 bits?
        bne     t2,x0,2b                // 
        // Know I am here
        lw      t4,16(sp)
        lw      t3,12(sp)
        lw      t2,8(sp)
        addi    sp,sp,12
        jump    putchar_tail2,t0
//        lw      t1,4(sp)
//        lw      t0,0(sp)
//        addi    sp,sp,20
//        ret

        
        .global puthex32
puthex32:       
// In:   a0 value to write
//       ra Return address        
        addi    sp,sp,-12
        sw      t0,0(sp)
        sw      t1,4(sp)
        sw      ra,8(sp)
        mv      t0,a0
        li      t1,28
1:      srl     a0,t0,t1
        andi    a0,a0,0xf        
        li      ra,10
        blt     a0,ra,2f
        addi    a0,a0,'a'-'0'-10
2:      addi    a0,a0,'0'
        jal     ra,putchar
        addi    t1,t1,-4
        bge     t1,x0,1b
        lw      ra,8(sp)
        lw      t1,4(sp)
        lw      t0,0(sp)
        addi    sp,sp,12
        ret

