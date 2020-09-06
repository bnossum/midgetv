        .globl icebreaker_rv32i
        
// Used when we enter/exit compliance code
BN_REGSTORE:    
        .word   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .word   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

        // Debugging routines use a minimum stack.
_IO_STACK_BEGIN:        
        .word   0,0,0,0,0,0
_IO_STACK_ENTRYPT:      
        .word   0,0
_IO_STACK_END:  

        // At entry:
        // ra   Return address
        // a0   Points to string to output
        // At exit:
        // a0   corrupted
FN_asm_puts:
        addi    sp,sp,-8                // Make space to store registers used
        sw      s0,0(sp)                // Store s0
        sw      ra,4(sp)                // Store return adrress
        mv      s0,a0                   // char *p = s;  
        j       2f                      // do {
1:      jal     ra,FN_asm_putchar       //     bn_asm_putchar(c);
        addi    s0,s0,1                 //     s++;
2:      lbu     a0,0(s0)                //     c = *s;
        bne     a0,x0,1b                // } while ( c );
        lw      s0,0(sp)                // Restore s0
        lw      ra,4(sp)                // Restore return address
        addi    sp,sp,8                 // Restore sp
        jalr    x0,0(ra)                // Return

        // At entry:
        // ra   Return address
        // a0   character to output
        // At exit:
        // a0   corrupted
        // Other used variables are stored on the stack
        // As a convenience, a '\n' is output as '\r\n'
FN_asm_putchar: 
        addi    sp,sp,-8
        sw      s1,0(sp)                // Store s1
        sw      s0,4(sp)                // Store s0
        slli    a0,a0,1                 // c <<= 1
        andi    a0,a0,1023              // c |= 0x3ff;
        ori     a0,a0,512               // c |= 0x200;
        li      s1,512 + 20             // Outputs '\n' ?
        bne     s1,a0,1f                // No

        li      a0,13                   // '\r'
        mv      s1,ra                   // save
        jal     ra,FN_asm_putchar       // Recurse
        mv      ra,s1                   // restore
        li      a0,512 + 20             // restore
        
1:      
        lw      s0,0xe8(x0)             // __freefornow_e8(x0) is bitrate
        slli    s0,s0,4                 // t = bitrate*16;
        lw      s1,0x8c(x0)             // n = mcycle
        add     s0,s0,s1                // t = bitrate*16 + n;
        bgeu    s0,s1,2f                // if ( t >= n ) goto L2;
        addi    s0,x0,100               // t = 100;                                        
1:      //                                 L1:;
        lw      s1,0x8c(x0)             // n = mcycle;
        bltu    s0,s1,1b                // if ( 100 < mcycle ) goto L1;
2:      //                                 L2:;
        lui     s0,0x60000              //
        sw      a0,8(s0)                // UART->D = c;
        srai    a0,a0,1                 // c >>= 1;
        lw      s0,0xe8(x0)             // __freefornow_e8(x0) // 
        add     s1,s1,s0                // n += bitrate;
3:      //                                 L4:;
        lw      s0,0x8c(x0)             // tt = mcycle;;
        bltu    s0,s1,3b                // if ( mcycle < b ) goto L3;
        bne     a0,x0,2b                // if ( c ) goto L2;
        lw      s0,4(sp)                // Restore s0
        lw      s1,0(sp)                // Restore s1
        addi    sp,sp,8                 // Restore SP
        jalr    x0,0(ra)                // Return


        
// In:   a0 value to write
//       ra Return address        
FN_WriteA0:
//        addi    sp,sp,-8                // To be able to tailshare code
//        sw      ra,0(sp)
//        mv      t0,a0
//        li      s0,28
//1:      srl     a0,t0,s0
//        andi    a0,a0,0xf        
//        li      ra,10
//        blt     a0,ra,2f
//        addi    a0,a0,'a'-'0'-10
//2:      addi    a0,a0,'0'
//        jal     ra,bn_asm_putchar
//        addi    s0,s0,-4
//        bge     s0,x0,1b
//        lw      ra,0(sp)
//        j       tailshare
//

        /////////////////////////////////////////////////////////////////////////////////////////////
        .globl blinkforever
blinkforever:
        lui     t1,0x60000
        sw      x0,4(t1)        // LEDs OFF
        li      t2,0x10000
1:      addi    t2,t2,-1
        bne     t2,zero,1b
        li      t2,1
        sw      t2,4(t1)        // LED ON
        li      t2,0x10000
1:      addi    t2,t2,-1
        bne     t2,zero,1b
        j       blinkforever
        


/////////////////////////////////////////////////////////////////////////////////////////////        
icebreaker_rv32i:
        
#include "I-ADD-01.S"
//#include "I-ADDI-01.S"
//#include "I-AND-01.S"
//#include "I-ANDI-01.S"
//#include "I-AUIPC-01.S"
//#include "I-BEQ-01.S"
//#include "I-BGE-01.S"
//#include "I-BGEU-01.S"
//#include "I-BLT-01.S"
//#include "I-BLTU-01.S"
//#include "I-BNE-01.S"
//#include "I-DELAY_SLOTS-01.S"
//#include "I-EBREAK-01.S"
//#include "local_compliance_dbg.S" // A local copy of I-EBREAK-01.S used during testing
//#include "I-ECALL-01.S"
//#include "I-ENDIANESS-01.S"
//#include "I-IO.S"
//#include "I-JAL-01.S"
//#include "I-JALR-01.S"
//#include "I-LB-01.S"
//#include "I-LBU-01.S"
//#include "I-LH-01.S"
//#include "I-LHU-01.S"
//#include "I-LUI-01.S"
//#include "I-LW-01.S"
//#include "I-MISALIGN_JMP-01.S"
//#include "I-MISALIGN_LDST-01.S"
//#include "I-NOP-01.S"
//#include "I-OR-01.S"
//#include "I-ORI-01.S"
//#include "I-RF_size-01.S"
//#include "I-RF_width-01.S"
//#include "I-RF_x0-01.S"
//#include "I-SB-01.S"
//#include "I-SH-01.S"
//#include "I-SLL-01.S"
//#include "I-SLLI-01.S"
//#include "I-SLT-01.S"
//#include "I-SLTI-01.S"
//#include "I-SLTIU-01.S"
//#include "I-SLTU-01.S"
//#include "I-SRA-01.S"
//#include "I-SRAI-01.S"
//#include "I-SRL-01.S"
//#include "I-SRLI-01.S"
//#include "I-SUB-01.S"
//#include "I-SW-01.S"
//#include "I-XOR-01.S"
//#include "I-XORI-01.S"
