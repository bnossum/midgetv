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
        
        // The linker script will write EBR ram from location 0xb4. There are fixed addresses
        // to obey, so the start here is:
x__mepc:         .word 0                 // 0xb4 10110100  0x2d For exception handling
x__mcause:       .word 0                 // 0xb8 10111000  0x2e For exception handling
x__mtval:        .word 0                 // 0xbc 10111100  0x2f For exception handling
x__mscratch:     .word 0                 // 0xc0 Used by CSR code
x__misa:         .word 0x40800105        // 0xc4 Used by CSR code. RV32I base ISA, nonstd. ext. present, XLEN = 32. RVC implemented
x_ex_dup_x0:     .word 0 		// 0xc8 | Used by CSR emulation. These
x_ex_rCSRadr:    .word 1 		// 0xcc | locations must be consequtive
x_ex_rCSRty:     .word 2 		// 0xd0 | 
x_ex_rrs1:       .word 3 		// 0xd4 | 
x_ex_rrd:        .word 4 		// 0xd8 | 
x_ex_rtmp:       .word 5 		// 0xdc | 
x_mtime:         .word 0 		// 0xe0 Read/write from user code. Updated by internal interrupt
x_mtimeh:        .word 0 		// 0xe4 Read/write from user code. Updated by internal interrupt
x__freefornow_e8:.word 0                 // 0xe8 By convention used to store bitrate
x__minstreth:    .word 0 		// 0xec Read/write from user code. Updated by internal interrupt
x__mcycleh:      .word 0 		// 0xf0 Read/write from user code. Updated by internal interrupt
x__freefornow_f4:.word 0                 // 0xf4 By convention used by compliance test code
x__mtimecmp:     .word 0xffffffff	// 0xf8 Read/write from user code. 
x__mtimecmph:    .word 0xffffffff	// 0xfc Read/write from user code. 
//        .org 0x100  			//
        
        // In the event of any exception, or CSR instruction, count on LEDs and hang.
CSRretadr:      .word 0                 //0x100 Microcode writes PC to CSRretadr when a CSR instruction is seen.
Entry_xRET:     ij      0,0xb6,0        //0x104 Microcode branches to here when MRET/SRET/URET is seen
EntryCSR:                               //0x108 Microcode branches to here when a CSR instruction is seen
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
        .global nrillegaltraps
nrillegaltraps:        
        .word    0
        .extern opcode

        # =============================================================================
TrapHandle:
        sw      a0,_ex_rtmp(x0)               // Store working registers
        lw      a0,__mcause(x0)               // Trap is illegal instruction?        
        addi    a0,a0,-2                    //
        bnez    a0,UnexpectedTrap             // Should not have any other traps
ContinueTrap:
        lw      a0,%lo(nrillegaltraps)(x0)
        addi    a0,a0,1
        sw      a0,%lo(nrillegaltraps)(x0)

        // Want to ignore the illegal instruction.
        lw      a0,%lo(__mepc)(x0)            // a0 == faulting address
        addi    a0,a0,4                     // Return to next instr
        sw      a0,%lo(CSRretadr)(x0)
        lw      a0,%lo(_ex_rtmp)(x0)          // restore working register
        ij      0,0x100,0                       // Exit
        
UnexpectedTrap:
        // Use main program stack in this test, sloppy, will regret it!
        sw      ra,%lo(_ex_rrs1)(x0)
        la      a0,preambletxt
        jal     puts
        lw      a0,__mcause(x0)                 
        jal     puthex32
        la      a0,mtvaltxt
        jal     puts
        lw      a0,__mtval(x0)
        jal     puthex32
        
        la      a0,UnexpTrap
        jal     puts
        la      a0,opcode
        lw      a0,0(a0)
        jal     puthex32
        lw      ra,%lo(_ex_rrs1)(x0)
        j       ContinueTrap

        
        # =============================================================================
TrapHandleRVC:
        sw      rtmp,_ex_rtmp(x0)               // Store working registers
        sw      a0,%lo(_ex_rrd)(x0)             //
        lw      rtmp,__mcause(x0)               // Trap is illegal instruction?        
        addi    rtmp,rtmp,-2                    //
        bnez    rtmp,UnexpectedTrapRVC          // Should not have any other traps
ContinueTrapRVC:
        lw      rtmp,%lo(nrillegaltraps)(x0)
        addi    rtmp,rtmp,1
        sw      rtmp,%lo(nrillegaltraps)(x0)

        // Want to ignore the illegal instruction.
        // If the core is rv32ic or rv32imc, we must find out if the instruction was 16 or 32 bits.
        lw      rtmp,%lo(__mepc)(x0)            // rtmp == faulting address
        lhu     a0,0(rtmp)                      // get low 16 bits of instruction
        andi    a0,a0,3                         // examine low 2 bits
        addi    a0,a0,-3
        bne     a0,x0,1f                        // Jump if 16-bit instruction
        addi    rtmp,rtmp,2
1:      addi    rtmp,rtmp,2                     // Return to next instr
        sw      rtmp,%lo(CSRretadr)(x0)

        lw      a0,%lo(_ex_rrd)(x0)             // restore working register
        lw      rtmp,%lo(_ex_rtmp)(x0)
        ij      0,0x100,0                       // Exit
UnexpectedTrapRVC:
        // Use main program stack in this test, sloppy, will regret it!
        sw      ra,%lo(_ex_rrs1)(x0)
        la      a0,preambletxt
        jal     puts
        lw      rtmp,__mcause(x0)                 
        jal     puthex32
        la      a0,mtvaltxt
        jal     puts
        lw      a0,__mtval(x0)
        jal     puthex32
        
        la      a0,UnexpTrap
        jal     puts
        la      a0,opcode
        lw      a0,0(a0)
        jal     puthex32
        lw      ra,%lo(_ex_rrs1)(x0)
        j       ContinueTrapRVC

preambletxt:
        .string "\n mcause:"
mtvaltxt:
        .string " mtval:"
UnexpTrap:
        .string " Unexp Trap:"
        
        # =============================================================================
        .align 2

        # =============================================================================

        # =============================================================================
VerySimpleTrapHandle:
        li      t5,0                            
        lw      t6,%lo(__mepc)(x0)              
        addi    t6,t6,4
        sw      t6,%lo(CSRretadr)(x0)
        ij      0,0x100,0                       // Exit

        # =============================================================================

        // Return: 0  rv32i
        //         1  rv32im
        //         2  rv32ic
        //         3  rv32imc
        .global Coretype
Coretype:
        .word   0  
        
_start:
        sw      x10,0xe8(x0);           // Transfer bitrate back to expected location after loading
        li      x2,0xfffffffc           // Initiate stack pointer

        la      x1,NMI                  // Set up the internal ISR handle (not used)
        sw      x1,%lo(__rNMI_IIV)(x0)

        // First set a fake trap handler
        la      a0,VerySimpleTrapHandle
        sw      a0,%lo(__mtvec)(x0)
        li      t5,1
        .word   0x02000033              // mul     x0,x0,x0
        addi    a0,t5,0                 // rv32im(c), a0 = 1, 0 otherwise
        j       UnalignedInstr
        // Here only if RVC not implemented
        sw      a0,Coretype,t0

        // Instal a more complete trap handler
        la      x1,TrapHandle           // Initiate mtvec
        j       1f
        
        .hword  0x0001                  // C.NOP
UnalignedInstr: 
        .hword  0x0001                  // C.NOP
        // Here only if RVC implemented
        ori     a0,a0,2
        sw      a0,Coretype,t0
      
        // Now instal a more complete trap handler
        la      x1,TrapHandleRVC        // Initiate mtvec
1:      sw      x1,%lo(__mtvec)(x0)
        tail     main

        # =============================================================================
        .global testbed16
testbed16:
        .hword 0x0
        .hword 0x8082           // C.JR x1 that is"ret"
        ret                     // Needed when RVC is not included
        
        .global testbed32
testbed32:
        .word  0
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

