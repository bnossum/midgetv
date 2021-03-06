// RISC-V Compliance IO Test Header File
// Copyright 2020, Baard Nossum
// See LICENSE for license details
//
// Description: Commom header file for RV32I tests

#ifndef _COMPLIANCE_TEST_H
#define _COMPLIANCE_TEST_H

#include "riscv_test.h"

//-----------------------------------------------------------------------
// RV Compliance Macros
//-----------------------------------------------------------------------

#define RV_COMPLIANCE_HALT              \
        call    FN_compliance_halt ;    \

#define RV_COMPLIANCE_RV32M                                                   \
        RVTEST_RV32M       
        
#define RV_COMPLIANCE_RV64V                                                  \
        RVTEST_RV64V                                                          \

/* This macro is used as a tag to insert support code for midgetv
   Conventionally it is defined as RVTEST_CODE_BEGIN, which serves the same
   purposes.

   The bitrate used to load this program is found in register x10, and we 
   patch it to its normal location at absolute address 0x000000e8.
   We initiate the stack pointer, and that is it.
 */
#define RV_COMPLIANCE_CODE_BEGIN                	\
        .section .text;                      	        \
        .align 4;                                       \
        .globl _start;                          	\
_start:                                         	\
        sw      x10,0xe8(x0);                   	\
        li      x2,0xfffffffc;                          \
        call    FN_WaitForGo;                           \
        
#define RV_COMPLIANCE_CODE_END                                                \
        RVTEST_CODE_END                                                       \

#define RV_COMPLIANCE_DATA_BEGIN                                              \
        RVTEST_DATA_BEGIN                                                     \

#define RV_COMPLIANCE_DATA_END                                                \
        RVTEST_DATA_END                                                       \


/* midgetv has one custom instruction */
.macro ij rdnr=0,ofs=0,rs1nr=0
.word (((\ofs) & 0xfff)<<20) + (((\rs1nr) & 31)<<15) + (((\rdnr) & 31)<<7) + 0b0001011
.endm
        
#define LEDREG         0x60000004
#define UARTREG        0x60000008



#define __jj 0x80
#define __yy 0xb0        
#define DIRTY_ADR_ex_dup_x0 0xc8

/* I make use of the fact (I HOPE it is a fact) that
   this file is included only once in each test program, and that
   this inclusion appears before any code-generating macros are
   used.
*/
         
/*         
   Microcode of midgetv rely on some locations in EBRram.
*/
        .option push
        .option norvc
        .section .magicconstants, "a"

__mepc:         .word 0xdeadbabe
__mcause:       .word 0
__mtval:        .word 0
__mscratch:     .word 0
__misa:         .word 0x40800104
_ex_dup_x0:     .word 0
_ex_rCSRadr:    .word 1
_ex_rCSRty:     .word 2
_ex_rrs1:       .word 3
_ex_rrd:        .word 4
_ex_rtmp:       .word 5
_mtime:         .word 0
_mtimeh:        .word 0
__freefornow_e8:.word 0
__minstreth:    .word 0
__mcycleh:      .word 0
__freefornow_f4:.word 0
__mtimecmp:     .word 0xffffffff
__mtimecmph:    .word 0xffffffff
CSRretadr:      .word 0
Entry_xRET:     ij      0,0xb6,0
EntryCSR:

#define changeme_mtime 0xe0
#define changeme_mtimeh 0xe4        

        //     Defined SCR 
        //     registers         mapped to (see midgetv.inc)
#define csradr_misa     0x301 // 0xc4 __misa      
#define csradr_mtvec    0x305 // 0xa4 __mtvect    
#define csradr_mscratch 0x340 // 0xc0 __mscratch   
#define csradr_mepc     0x341 // 0xb4 __mepc
#define csradr_mcause   0x342 // 0xb8 __mcause
#define csradr_mtval    0x343 // 0xbc __mtval

        
#define rCSRadr x1
#define rCSRty  x2        
#define rrs1    x3
#define rrd     x4
#define rtmp    x5

        // -------------------------------------------------------
        // Microcode dictates that a few location have special meaning:
        // 0x100  Here the address of the CSR instruction is stored
        // 0x104  We chose to decode (U/S/M)RET in such a way that an emulation
        //        stub is present. Conceivably this may help if midgetv is
        //        enlarged to cover more than Machine mode
        // 0x108  This is the entry points of the 6 CSR instructions.
//        .org 0x108
        // We have already decoded the CSR address in register __yy
        // This register is used by many microcode instructions, but 
        // not "sw" or "lw".
        sw      rCSRadr,%lo(_ex_rCSRadr)(x0)    //

mb_start: // Note. This label is for restarting midgetv after midgetv has been restored
        //   at the end of execution of the program.

        sw      rCSRty,%lo(_ex_rCSRty)(x0)      // 
        sw      rrs1,%lo(_ex_rrs1)(x0)          //
        sw      rrd, %lo(_ex_rrd)(x0)           //
        sw      rtmp,%lo(_ex_rtmp)(x0)          //
        lw      rCSRadr,%lo(__yy)(x0)           // Get CSR address from the volatile __yy register
        lw      rCSRty,%lo(CSRretadr)(x0)
        lbu     rCSRty,1(rCSRty)                // Get bits [15:8] of the CSR instruction
        
        // CSRRW   0bx001xxxx   0xffffffb0  
        // CSRRS   0bx010xxxx   0xffffffe0
        // CSRRC   0bx011xxxx   0xfffffff0
        // CSRRWI  0bx101xxxx   0x00000010
        // CSRRSI  0bx110xxxx   0x00000020
        // CSRRCI  0bx111xxxx   0x00000030
        andi    rCSRty,rCSRty,0x70      // Isolate
        addi    rCSRty,rCSRty,-0x40     // Msb used later on
        
        //
        // Translate riscv CSR address to midgetv address 
        // for those few CSR registers this code defines.
        // We want:
        // CSR adr  midgetv adr
	// 0x301    0xc4 
	// 0x305    0xa4 
	// 0x340    0xc0 
	// 0x341    0xb4 
	// 0x342    0xb8 
	// 0x343    0xbc 
        // other    detect this case
        //
        li      rtmp,4
        addi    rCSRadr,rCSRadr,-0x301
        beqz    rCSRadr,Lmisa
        li      rtmp,5
        addi    rCSRadr,rCSRadr,0x301-0x305
        beqz    rCSRadr,Lmtvec  
        addi    rtmp,rCSRadr,0x305-0x340
        li      rrd,3
        bgtu    rtmp,rrd,UnsupportedCSR
        // Here rtmp is an index from 0 to 5 inclusive
Lmisa:
Lmtvec: 
        //lbu     rCSRadr,%lo(mCSRADRTBL)(rtmp)   // Compiles to wrong result: "lbu x1,412(x0) # 19c <mCSRADRTBL>"
        // The code below is longer, but seems to work correctly
        la      rCSRadr,mCSRADRTBL
kluge1: add     rtmp,rtmp,rCSRadr
        lbu     rCSRadr,0(rtmp)
        
        //
        // Find rs1 and rd operand locations from the CSR instruction
        //
        lw      rrs1,%lo(CSRretadr)(x0) // Address of the CSR instruction

        //        lw      rrs1,0(rrs1)            // Read the instruction It may be unaligned when RVC is implemented
        lhu     rtmp,0(rrs1)
        lhu     rrs1,2(rrs1)
        slli    rrs1,rrs1,16
        or      rrs1,rrs1,rtmp
        
        srli    rrs1,rrs1,5             //
        andi    rrd,rrs1,(31<<2)        // rrd: rd as a memory adr. x1-x5 will be restored 
        li      rtmp,(5<<2)             // Constant also used later on
        bgtu    rrd,rtmp,1f             // from the stack when exiting this code.

//        addi    rrd,rrd,%lo(_ex_dup_x0) //  Does not work
dbgtag2:addi    rrd,rrd,DIRTY_ADR_ex_dup_x0

1:        
        srli    rrs1,rrs1,10            // Get the rs1 field - this is either
        andi    rrs1,rrs1,31            // a 5-bit constant or a register number.

        //
        // Instructions CSRRWI/CSRRSI/CSRRCI use
        // a constant, not a register.
        //
        bgez    rCSRty,2f

        slli    rrs1,rrs1,2             // From register number to register memory address
        bgtu    rrs1,rtmp,1f            // Contents if registers x1-x5 was stored at entry of this code, 

        //wanted:  addi    rrs1,rrs1,%lo(_ex_dup_x0)//and must be fetched from the stack
        // The above line does not work with   riscv32-unknown-elf-gcc (GCC) 10.1.0
        addi    rrs1,rrs1,DIRTY_ADR_ex_dup_x0
        
        sw      x0,%lo(_ex_dup_x0)(x0)  // A previous CSR instruction may have used _ex_dup_x0
1:      lw      rrs1,0(rrs1)            // The value to write to CSR
        
2:
        lw      rtmp,0(rCSRadr)         // Get the old value of the CSR.

        // CSRRW   0bx001xxxx   0xffffffb0   0x0000010  
        // CSRRS   0bx010xxxx   0xffffffe0   0x0000020
        // CSRRC   0bx011xxxx   0xfffffff0   0x0000030
        // CSRRWI  0bx101xxxx   0x00000010   0x0000010
        // CSRRSI  0bx110xxxx   0x00000020   0x0000020
        // CSRRCI  0bx111xxxx   0x00000030   0x0000030

        andi    rCSRty,rCSRty,0x30
        addi    rCSRty,rCSRty,-0x20
        beqz    rCSRty,DoCSRS
        bltz    rCSRty,DoCSRRW
        
        // -------------------------------------------------------
        // CSRRC or CSRRCI
        // If rrs1 is zero, we should in principle not write the
        // CSR, but because all 6 CSR registers I implement are
        // idempotent I can disregard this here.
        //
DoCSRC:
        not     rrs1,rrs1               // 
        and     rrs1,rrs1,rtmp          // New value for CSR = oldCSR & ~rs1 
        //      Fallthrough

        // -------------------------------------------------------
        // CSRRW or CSRRWI
        //
DoCSRRW:        
Join_from_CSRS: 
        sw      rrs1,0(rCSRadr)         // Update the CSR
        sw      rtmp,0(rrd)             // Old CSR value is returned in register rd
        lw      rtmp,%lo(CSRretadr)(x0) // Increment CSR return address
        addi    rtmp,rtmp,4             // (After this rtmp != 0)
        sw      rtmp,%lo(CSRretadr)(x0) 
        //                                      
        // Restore working registers            
        //                                      
RestoreWorkingRegisters:        
        lw      rrd, %lo(_ex_rrd)(x0)
        lw      rrs1,%lo(_ex_rrs1)(x0)          
        lw      rCSRadr,%lo(_ex_rCSRadr)(x0)    
        lw      rCSRty,%lo(_ex_rCSRty)(x0)      
        bnez    rtmp,1f                         
        lw      rtmp,%lo(_ex_rtmp)(x0)          
        ij      0,0x101,0                       // Exit, but will enter trap.
1:      lw      rtmp,%lo(_ex_rtmp)(x0)          // 
        ij      0,0x100,0                       // Exit. pc = CSRretadr, inCSR = 0
        
        // -------------------------------------------------------
        // CSRRS or CSRRSI
        // If rrs1 is zero, we should in principle not write the
        // CSR, but because all 6 CSR registers I implement are
        // idempotent I can disregard this.
        //
DoCSRS:
        or      rrs1,rrs1,rtmp          // New value for CSR = oldCSR | rs1 
        j       Join_from_CSRS          // 

UnsupportedCSR:
        li      rtmp,0                  // 
        j       RestoreWorkingRegisters // 
        
mCSRADRTBL:
        .byte 0xc0,0xb4,0xb8,0xbc       // 
        .byte 0xc4,0xa4,0,0             // 
        nop                             // 
        nop                             // 
        
#if 0
/////////////////////////////////////////////////////////////////////////////
/* Debug routime. Just increment LEDs and hang
*/
        .align 2
         .global FN_ledfatal
FN_ledfatal:
1:
        li      x1,LEDREG
        sw      x3,0(x1)
        addi    x3,x3,1
2:      addi    x1,x1,0x7FF
        bgt     x1,x0,2b
        j       FN_ledfatal

/////////////////////////////////////////////////////////////////////////////
/* Debug routine. Just light Red LED and hang
        */      
        .align 2
FN_redled:
        li      x1,LEDREG
        li      x3,1
        sw      x3,0(x1)
        j       FN_redled
#endif
         
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
FN_asm_putchar: 
        addi    sp,sp,-8
        sw      t0,0(sp)                // Store t0
        sw      t1,4(sp)                // Store t1
        slli    a0,a0,1                 // c <<= 1
        andi    a0,a0,1023              // c |= 0x3ff;
        ori     a0,a0,512               // c |= 0x200;
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
FN_asm_putchar_tail2:                 
        lw      t1,4(sp)                // Restore t1
FN_asm_putchar_tail1:         
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
FN_asm_puts:         
        addi    sp,sp,-8                // Make space to store registers used
        sw      t0,0(sp)                // Store t0
        sw      ra,4(sp)                // Store return adrress
        mv      t0,a0                   // char *p = s;  
        j       2f                      // do {
1:      jal     ra,FN_asm_putchar       //     bn_asm_putchar(c);
        addi    t0,t0,1                 //     s++;
2:      lbu     a0,0(t0)                //     c = *s;
        bne     a0,x0,1b                // } while ( c );
        lw      ra,4(sp)                // Restore return address
        lw      t0,0(sp)                // Restore t0
        addi    sp,sp,8                 // Restore sp
        jalr    x0,0(ra)                // Return

FN_asm_getchar:
        // Know I am here
        // t0,t1,t2,t3,t4
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
        jump    FN_asm_putchar_tail2,t0
//        lw      t1,4(sp)
//        lw      t0,0(sp)
//        addi    sp,sp,20
//        ret

/*
*/
// In:   a0 value to write
//       ra Return address        
FN_asm_WriteA0:
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
        jal     ra,FN_asm_putchar
        addi    t1,t1,-4
        bge     t1,x0,1b
        lw      ra,8(sp)
        lw      t1,4(sp)
        lw      t0,0(sp)
        addi    sp,sp,12
        ret

        

/*
 * Debugging functions affects a minimum of registers.
 * We require a local small stack. Due to my klumsy
 * linker script, I got into trouble with alignment.
 */
//        .align 2  This does not work! Why?
        ret // This works, for rv32i code it expands to 32 bits, for rv32imc code it expands to 16 bits, and compensates for the misalignment I have.
        
LOCAL_IO_SP_STORAGE:
        .word 0
LOCAL_STACK:
        .word   0,0,0,0,0,0
_IO_STACK_ENTRYPT:
        .word   0,0xbeefbabe

        //
        // All code and data above goes to EBR
        // The reset goes to sram

.section .text
        

/*
 * Execution of the test program is synchronized from the PC,
 * because the PC must have time to start execution of the program        
 * that stores the signature (and debugging)
 */
FN_WaitForGo:
        mv      x31,ra
        call    FN_asm_getchar
        mv      ra,x31
        ret

/////////////////////////////////////////////////////////////////////////////
/* Write signature to UART. Each signature word is prefixed with "sig" so that
 * the receiver program can be used to trace debug macros aswell.        
 * Write DONE so the PC program can know the entire signature is returend
 * Reinitialize beginning of EBR so that midgetv can accept another program,
 * 
 * The state of the processor is not well known here, in particular, the
 * stack pointer may be anywhere. Reinitialize.        
 */        
FN_compliance_halt:
        li      x2,0xfffffffc
        la      t0,begin_signature 
        la      t1,end_signature
1:      la      a0,str_sig
        call    FN_asm_puts
        lw      a0,0(t0)
        call    FN_asm_WriteA0
        la      a0,crlf
        call    FN_asm_puts
        addi    t0,t0,4
        bne     t0,t1,1b
        la      a0,strDone
        call    FN_asm_puts

        /* TODO: Turn off interrupts 
        */
        
        /* The midget blast code lives in this part of memory:
         * 0x04 to 0x80    Blast code starts at overlay of register x1 to x31 included
         * 0xb4 to 0x17c   Blast code continues in this region
         *
         */
        la      x1,mb_src 
        li      x2,0x10
1:      lw      x3,0(x1)
        sw      x3,0(x2)
2:      addi    x1,x1,4
        addi    x2,x2,4
        li      x3,0x80
        blt     x2,x3,1b        // load code into x4 to x31 (memory region 0x10 to 0x7f)
        li      x3,0xb4
        blt     x2,x3,2b        // skip memory region 0x80 to 0xb3)
        li      x3,0x180
        blt     x2,x3,1b        // load memory region 0xb4 to 0x17c
        li      x1,4*2
        li      x3,0
        jump    mb_start,x2     // x2 is don't care at start of midget blast


crlf:
        .string "\r\n"
str_sig:
        .string "sig"
strDone:
        .string "Done\r\n"
        .align 2
        // When a test has completed, midgetv must be primed to
        // perform a new test. So the bootloader program must be
        // written back to start of EBR memory, using only
        // registers x1,x2 and x3.
        // This section is placed in the start of sram, direct
        // comparison on the data with respect to the midgetblaster
        // source code listing is easier this way
        .section .mb_restore
.word  0x00000000, 0x00000008, 0xdeadbabe, 0x00000000   // 0000        
mb_src:
.word  0x00000010, 0x00000000, 0x00000000, 0x80000003   // 0010
.word  0x00000004, 0x60000000, 0x00000010, 0x00800093   // 0020
.word  0x01000213, 0x0084a403, 0xfe041ee3, 0x08002623   // 0030
.word  0x00108093, 0x00155393, 0x00a383b3, 0x00836333   // 0040
.word  0x00135313, 0x08c02403, 0xfe746ee3, 0x0084a403   // 0050
.word  0xfe53e4e3, 0xfe608fa3, 0xfc4096e3, 0xfc3200e3   // 0060
.word  0x00010093, 0x00018213, 0xfa011ee3, 0x00018067   // 0070
.word  0x00000000, 0x00000000, 0x00000108, 0x00000000   // 0080
.word  0x000000c8, 0xffffff7f, 0x000000ff, 0x0000ffff   // 0090
.word  0xffff7fff, 0x000000c8, 0x00000000, 0xffffffff   // 00a0
.word  0x00000000, 0x00000000, 0x00000000, 0x00000000   // 00b0
.word  0x00000000, 0x40800100, 0x00118193, 0x600000b7   // 00c0
.word  0x0030a223, 0x7ff08093, 0xfe104ee3, 0xfedff06f   // 00d0
.word  0x00000000, 0x00000000, 0x00000000, 0x00000000   // 00e0
.word  0x00000000, 0x00000000, 0xffffffff, 0xffffffff   // 00f0
.word  0x00000000, 0x0b60000b, 0xfc1ff06f, 0x0074a423   // 0100
.word  0x0074a223, 0x0084a303, 0xfe031ee3, 0x0084a303   // 0110
.word  0xfe030ee3, 0x08c02283, 0x40550533, 0x0084a303   // 0120
.word  0xfe031ee3, 0xfff40413, 0x00040c63, 0x0084a303   // 0130
.word  0xfe030ee3, 0x08c02283, 0x00550533, 0xfc9ff06f   // 0140
.word  0x0084a303, 0xfe030ee3, 0x08c02283, 0x00048223   // 0150
.word  0x00550533, 0x00555513, 0xffa50513, 0x00351293   // 0160
.word  0x00a282b3, 0x0ea02423, 0xebdff06f               // 0170
        
        .option pop

#endif // _COMPLIANCE_TEST_H
