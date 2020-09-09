/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Check decompressing compressed instructions.
 */

#include <stdlib.h>
#include "Vm_decompress.h"
#include "verilated.h"

#define ferr(...) exit(fprintf(stdout,"%s:%d:", __FILE__, __LINE__ )+fprintf(stdout,__VA_ARGS__))

/////////////////////////////////////////////////////////////////////////////
#define STRX(x) # x
#define STR(x) STRX(x)
#define CATX(a,b) a ## b
#define CAT(a,b) CATX(a,b)
#define NRINSTR (51+8+1)
const char *instrtxt[NRINSTR+1] = {
#define V(ty,funct7,rs2,rs1,funct3,rd,opcode,txt) STR(txt),
#define R(ty,funct7,rs2,rs1,funct3,rd,opcode,txt) STR(txt),
#define r(ty,a,b,c,rs1,funct3,rd,opcode,txt)      STR(txt),
#define I(ty,imm,rs1,func3,rd,opcode,txt)         STR(txt),
#define S(ty,immh,rs2,rs1,funct3,imml,opcode,txt) STR(txt),
#define B(ty,immh,rs2,rs1,funct3,imml,opcode,txt) STR(txt),
#define U(ty,imm,rd,opcode,txt)                   STR(txt),
#define J(ty,imm,rd,opcode,txt)                   STR(txt),
#include "instructiondecodebase.h"
        "unknown"
};
const uint8_t instrty[NRINSTR+1] = {
#define V(ty,funct7,rs2,rs1,funct3,rd,opcode,txt) ty,
#define R(ty,funct7,rs2,rs1,funct3,rd,opcode,txt) ty,
#define r(ty,a,b,c,rs1,funct3,rd,opcode,txt)      ty,
#define I(ty,imm,rs1,func3,rd,opcode,txt)         ty,
#define S(ty,immh,rs2,rs1,funct3,imml,opcode,txt) ty,
#define B(ty,immh,rs2,rs1,funct3,imml,opcode,txt) ty,
#define U(ty,imm,rd,opcode,txt)                   ty,
#define J(ty,imm,rd,opcode,txt)                   ty,
#include "instructiondecodebase.h"
        0xff
};
typedef enum {
#define V(ty,funct7,rs2,rs1,funct3,rd,opcode,txt) e_ ## txt,
#define R(ty,funct7,rs2,rs1,funct3,rd,opcode,txt) e_ ## txt,
#define r(ty,a,b,c,rs1,funct3,rd,opcode,txt)      e_ ## txt,
#define I(ty,imm,rs1,func3,rd,opcode,txt)         e_ ## txt,
#define S(ty,immh,rs2,rs1,funct3,imml,opcode,txt) e_ ## txt,
#define B(ty,immh,rs2,rs1,funct3,imml,opcode,txt) e_ ## txt,
#define U(ty,imm,rd,opcode,txt)                   e_ ## txt,
#define J(ty,imm,rd,opcode,txt)                   e_ ## txt,
#include "instructiondecodebase.h"
} eINSTR;

/////////////////////////////////////////////////////////////////////////////
int pocketdissass( int silent, uint32_t pc, uint32_t I ) {
        int bit30   = (I >> 30) & 1;
        int bit2928 = (I >> 28) & 3;
        int bit25   = (I >> 25) & 1;
        int f7      = (I >> 25) & 127;
        int bit2220 = (I >> 20) & 7;
        int f3      = (I >> 12) & 7;
        int opcode  = (I >>  0) & 127;
        int inx = -1;
        int sloppy = 0;
        
        switch ( opcode ) {
        case 0b0000000 : inx = e_defILLEGAL; break;
        case 0b0110111 : inx = e_lui;   break;
        case 0b0010111 : inx = e_auipc; break;
        case 0b1101111 : inx = e_jal;   break;
        case 0b1100111 : inx = e_jalr;  break;
        case 0b1100011 : 
                switch( f3 ) {
                case 0b000 : inx = e_beq;  break;
                case 0b001 : inx = e_bne;  break;
                case 0b100 : inx = e_blt;  break;
                case 0b101 : inx = e_bge;  break;
                case 0b110 : inx = e_bltu; break;
                case 0b111 : inx = e_bgeu; break;
                }
                break;
        case 0b0000011 : 
                switch( f3 ) {
                case 0b000 : inx = e_lb;  break;
                case 0b001 : inx = e_lh;  break;
                case 0b010 : inx = e_lw;  break;
                case 0b100 : inx = e_lbu; break;       
                case 0b101 : inx = e_lhu; break;
                }
                break;
        case 0b0100011 : 
                switch( f3 ) {
                case 0b000 : inx = e_sb; break;
                case 0b001 : inx = e_sh; break;
                case 0b010 : inx = e_sw; break;
                }
                break;
        case 0b0010011 : 
                switch( f3 ) {
                case 0b000 : inx = e_addi;  break;
                case 0b001 :
                        inx = e_slli;
                        sloppy = ( f7 != 0 );
                        break; 
                case 0b010 : inx = e_slti;  break;
                case 0b011 : inx = e_sltiu; break;
                case 0b100 : inx = e_xori;  break;
                case 0b101 :
                        inx = bit30 ? e_srai : e_srli;
                        sloppy = ( f7 != 0 && f7 != 64 );
                        break; 
                case 0b110 : inx = e_ori;   break;
                case 0b111 : inx = e_andi;  break;
                }
                break;
        case 0b0110011 :
                if ( bit25 ) {
                        sloppy = ( f7 != 1 );
                        switch( f3 ) {
                        case 0b000 : inx = e_mul;    break;
                        case 0b001 : inx = e_mulh;   break;
                        case 0b010 : inx = e_mulhsu; break;
                        case 0b011 : inx = e_mulhu;  break;
                        case 0b100 : inx = e_div;    break;
                        case 0b101 : inx = e_divu;   break;
                        case 0b110 : inx = e_rem;    break;
                        case 0b111 : inx = e_remu;   break;                                
                        }
                } else {
                        switch( f3 ) { 
                        case 0b000 :
                                inx = bit30 ? e_sub : e_add;
                                sloppy = ( f7 != 0 && f7 != 64 );
                                break; 
                        case 0b001 :
                                inx = e_sll;
                                sloppy = ( f7 != 0 );
                                break; 
                        case 0b010 :
                                inx = e_slt;
                                sloppy = ( f7 != 0 );
                                break; 
                        case 0b011 :
                                inx = e_sltu;
                                sloppy = ( f7 != 0 );
                                break; 
                        case 0b100 :
                                inx = e_xor;
                                sloppy = ( f7 != 0 );
                                break; 
                        case 0b101 :
                                inx = bit30 ? e_sra : e_srl;
                                sloppy = ( f7 != 0 && f7 != 64 );
                                break; 
                        case 0b110 :
                                inx = e_or;
                                sloppy = ( f7 != 0 );
                                break; 
                        case 0b111 :
                                inx = e_and;
                                sloppy = ( f7 != 0 );
                                break; 
                        }
                }
                break;        
        case 0b0001111 : 
                switch( f3 ) {
                case 0b000 : inx = e_fence;   break; 
                case 0b001 : inx = e_fence_i; break; 
                }
                break;
        case 0b1110011 : 
                switch( f3 ) {
                case 0b000 :
                        switch ( bit2220 ) {
                        case 0b000 :
                                inx = e_ecall;
                                sloppy = I != 0x00000073;
                                break; 
                        case 0b001 :
                                inx = e_ebreak;
                                sloppy = I != 0x00100073;
                                break; 
                        case 0b010 : 
                                switch ( bit2928 ) {
                                case 0b00 :
                                        inx = e_uret;
                                        sloppy = I != 0x00200073;
                                        break; 
                                case 0b01 :
                                        inx = e_sret;
                                        sloppy = I != 0x10200073;
                                        break; 
                                case 0b11 :
                                        inx = e_mret;
                                        sloppy = I != 0x30200073;
                                        break; 
                                }
                                break;
                        case 0b101 :
                                inx = e_wfi;
                                sloppy = I != 0x10500073;
                                break; 
                        }
                        break;
                case 0b001 : inx = e_csrrw;  break;
                case 0b010 : inx = e_csrrs;  break;
                case 0b011 : inx = e_csrrc;  break;
                case 0b101 : inx = e_csrrwi; break;
                case 0b110 : inx = e_csrrsi; break;
                case 0b111 : inx = e_csrrci; break;
                }                        
                break;
        }
        if ( inx == -1 ) {
                if ( !silent )
                        printf( "Unsupported " );
                return inx;
        }
        
#define rd(x)  ((x >>  7) & 31)
#define rs1(x) ((x >> 15) & 31)
#define rs2(x) ((x >> 20) & 31)
#define signext(n,x) (((x & ((1<<n)-1)) ^ (1<<(n-1))) - (1<<(n-1)))
#define immL31_12J(x) ((x>>12)&0xfffff)
#define immL11_0J(x)  signext(12,(x>>20))
#define immL11_5_4_0J(x) signext(12,( ((x>>25)<<5) | ((x>>7) & 31) ))
#define _immB(x) (((x>>31)<<12) | (((x>>7)&1)<<11) | (((x>>25) & 63)<<5) | (((x>>8) & 15)<<1))
//#define _immJ(x) (((x>>31)<<20) | (((x>>12)&255)<<12) | (((x>>21)&1023)<<1))
// The above line is faulty.
        // Pos 31,30:21,20,19:12
        //nBit 20,10:1, 11,19:12
#define _immJ(x) ((((x>>31)&1)<<20) | (((x>>21)&1023)<<1) | (((x>>20)&1)<<11) | (((x>>12)&255)<<12))
#define immB(x) signext(13,_immB(x))
#define immJ(x) signext(21,_immJ(x))        
        if ( sloppy ) {
                int n = printf( "\"%s", instrtxt[inx] );
                n += printf( "\"");
                while ( n < 9 ) {
                        printf( " " );
                        n++;
                }
        } else {
                printf( "%-8s ", instrtxt[inx] );
        }
        //printf( "[%c]", instrty[inx] );
        switch( instrty[inx] ) {
        case 'U' : printf( "x%d,0x%x", rd(I), immL31_12J(I)); break;
        case 'J' : printf( "x%d,%x", rd(I), pc + immJ(I) ); break;
        case 'j' : printf( "x%d,%d(x%d)", rd(I), immL11_0J(I), rs1(I)); break;
        case 'I' : printf( "x%d,x%d,%d", rd(I), rs1(I), immL11_0J(I)); break;
        case 'B' : printf( "x%d,x%d,%x", rs1(I), rs2(I), pc + immB(I)); break;
        case 'S' : printf( "x%d,%d(x%d)", rs2(I), immL11_5_4_0J(I), rs1(I)); break;
        case 'R' : printf( "x%d,x%d,x%d", rd(I),rs1(I),rs2(I)); break;
        case 'h' : printf( "x%d,x%d,%d", rd(I),rs1(I),rs2(I)); break;
        case 'Q' : break;
        case 'E' : break;
        case 'C' : break;
        case 'V' : break;
        case 'a' : printf( "x%d,%d(x%d)", rd(I), immL11_0J(I), rs1(I) ); break; // LW
        default : ferr( "Que?\n" );
        }
        return inx;
}

/////////////////////////////////////////////////////////////////////////////
// Extract an immediate of c. p denotes bitposition of lsb encoded (for scaling).
// Ends when va_arg get -1 (signed) or -2 (unsigned).
int immfind( int c, int p, ... ) {
        int imm = 0;
        va_list ap;
        int n;
        va_start( ap, p );
        while ( (n = va_arg( ap, int )) >= 0 ) {
                imm |= (((c>>n)&1)<<p);
                p++;
        }
        p--;
        return n == -1 ? (imm^(1<<p))-(1<<p) : imm;                
}

/////////////////////////////////////////////////////////////////////////////
int extractreg( int c, int n) {
        return 8 + ((c>>n)&7);
}

/////////////////////////////////////////////////////////////////////////////
/* Find the expanded compressed instruction.
 * Returns a flag:
 * 0  instruction need not be matched (it is reserved)
 * 1  instruction must be matched
 * -1 instruction must be such that it triggers an unknown instruction when executed (for unsupported instructions such as C.FLD)
 * by the implementation
 */
int facit( uint32_t *e, int c ) {
        int imm,rs2,rs1,rd;
        int rv32imm,a;
#define RS1MASK 0b111110000000

        //printf( "[%x]", c);
        if ( c == 0 ) {
                *e = 0x00010411; // Special case mapping for the defined unsuported instruction
                return 1;
        }
        switch ( c & 3 ) {
        case 0b00 :                
                //
                // Quadrant 0
                //
                switch ( (c >> 13) & 7 ) {
                case 0b000 :
                        // C.ADDI4SPN expands to addi rd ′ , x2, nzuimm[9:2].
                        imm = immfind(c, 2, 6,5,11,12,7,8,9,10,-2);
                        rd = extractreg(c,2);
                        *e = (imm << 20) | (2<<15) | (0b000<<12) | (rd<<7) | 0b0010011;
                        return imm == 0 ? 0 : 1; // nzuimm == 0 is reserved and for this immediate the instruction need not be valid
                case 0b001 :
                        // C.FLD not implemented in midgetv. Must expand to an instruction with 2 lsb != 2'b11
                        return -1;
                case 0b010 :
                        // C.LW expands into lw rd', offset[6:2](rs1').
                        imm = immfind(c, 2, 6,10,11,12,5,-2);
                        rd = extractreg(c,2);
                        rs1 = extractreg(c,7);
                        *e = (imm << 20) | (rs1<<15) | (0b010<<12) | (rd<<7) | 0b0000011;
                        return 1;
                case 0b011 :
                        // C.FLW not implemented in midget.
                        return -1;
                case 0b100 :
                        // Reserved
                        return 0;
                case 0b101 :
                        // C.FSD not implemented in midget
                        return -1;
                case 0b110 :
                        // C.SW expands to sw rs2',offset[6:2](rs1')
                        imm = immfind(c, 2, 6,10,11,12,5,-2);
                        rs2 = extractreg(c,2);  // src
                        rs1 = extractreg(c,7); // base
                        *e = ((imm & 0xfe0)<<20) | (rs2<<20) | (rs1<<15) | (0b010<<12) | ((imm & 0x1f)<<7) | 0b0100011;
                        return 1;                        
                case 0b111 :
                        // C.FSW not implemented
                        return -1;
                }
                ferr( "Should never be here\n" );
        case 0b01 :
                //
                // Quadrant 1
                //
                switch ( (c >> 13) & 7 ) {
                case 0b000 :
                        // C.NOP and C.ADDI encoded the same way
                        // C.ADDI expands into addi rd, rd, nzimm[5:0]
                        imm = immfind(c, 0, 2,3,4,5,6,12,-1);
                        rs1 = (c >> 7) & 0b11111;
                        *e = (imm << 20) | (rs1<<15) | (0b000<<12) | (rs1<<7) | 0b0010011;
                        return 1;
                case 0b001 :
                        // C.JAL expands to jal x1, offset[11:1].
                        imm = immfind(c, 1, 3,4,5,11,2,7,6,9,10,8,12,-1);
                        //bitpos in C.JAL 12 11 10 9 8  7 6 5 4 3 2 
                        //imm in C.JAL    11 4  9  8 10 6 7 3 2 1 5
                        
// imm[20|10:1|11|19:12]
// 19 18 17 16 15 14 13 12 11 10 9 8  7  6  5  4  3  2  1  0 
// 20 10  9  8  7  6  5  4  3  2 1 11 19 18 17 16 15 14 13 12                        
                        rv32imm = (((imm>>20) & 1)<<19)
                                | (((imm>>1)&0x3ff)<<9)
                                | (((imm>>11)&1)<<8)
                                | (((imm>>12)&0xff)<<0);
                        *e = (rv32imm<<12) | (1<<7) | 0b1101111;
                        return 1;
                case 0b010 :
                        // C.LI expands into addi rd, x0, imm[5:0]
                        imm = immfind(c, 0, 2,3,4,5,6,12,-1);
                        rd = (c>>7) & 0x1f;
                        *e = (imm<<20) | (0<<15) | (0b000<<12) | (rd<<7) | 0b0010011;
                        return 1;
                case 0b011 :
                        rd = (c>>7) & 0x1f;
                        if ( rd == 2 ) {
                                // C.ADDI16SP expands into  addi x2,x2,nzimm[9:4]
                                imm = immfind(c, 4, 6,2,5,3,4,12,-1);
                                *e = (imm<<20) | (2<<15) | (0b000<<12) | (2<<7) | 0b0010011;
                        } else {                                
                                // C.LUI expands into lui rd, nzimm[17:12]
                                imm = immfind(c, 0, 2,3,4,5,6,12,-1);
                                *e = (imm<<12) | (rd<<7) | 0b0110111;
                        }
                        return 1;
                case 0b100 :
                        a = (((c>>12)&1)<<4) | (((c>>10)&3)<<2) | ((c>>5)&3);
                        switch (a) {                                
                        case 0b00000 : case 0b00001 : case 0b00010 : case 0b00011 : 
                        case 0b10000 : case 0b10001 : case 0b10010 : case 0b10011 : 
                                // C.SRLI expands into srli rd',rd',shamt[5:0]
                                imm = immfind(c, 0, 2,3,4,5,6,12,-2);
                                rd = extractreg(c, 7);
                                *e = (imm<<20) | (rd<<15) | (0b101<<12) | (rd<<7) | 0b0010011;
                                return (imm & 0b100000) ? 0 : 1;
                        case 0b00100 : case 0b00101 : case 0b00110 : case 0b00111 :
                        case 0b10100 : case 0b10101 : case 0b10110 : case 0b10111 : 
                                // C.SRAI expands into srai rd',rd',shamt[5:0]
                                imm = immfind(c, 0, 2,3,4,5,6,12,-2);
                                rd = extractreg(c, 7);
                                *e = (1<<30) | (imm<<20) | (rd<<15) | (0b101<<12) | (rd<<7) | 0b0010011;
                                return (imm & 0b100000) ? 0 : 1;                                
                        case 0b01000 : case 0b01001 : case 0b01010 : case 0b01011 : 
                        case 0b11000 : case 0b11001 : case 0b11010 : case 0b11011 : 
                                // C.ANDI expands to andi rd',rd',imm[5:0]
                                imm = immfind(c, 0, 2,3,4,5,6,12,-1);
                                rd = extractreg(c, 7);
                                *e = (imm<<20) | (rd<<15) | (0b111<<12) | (rd<<7) | 0b0010011;
                                return (imm & 0b100000) ? 0 : 1;                                
                                
                        case 0b01100 :
                                // C.SUB expands into sub rd',rd',rs2'
                                rd = extractreg(c, 7);
                                rs2 = extractreg(c, 2);
                                *e = (1<<30) | (rs2<<20) | (rd<<15) | (0b000<<12) | (rd<<7) | 0b0110011;
                                return 1;
                        case 0b01101 :
                                // C.XOR expands into xor rd',rd',rs2'
                                rd = extractreg(c, 7);
                                rs2 = extractreg(c, 2);
                                *e = (rs2<<20) | (rd<<15) | (0b100<<12) | (rd<<7) | 0b0110011;
                                return 1;
                        case 0b01110 :
                                // C.OR expands into or rd',rd;,rs2'
                                rd = extractreg(c, 7);
                                rs2 = extractreg(c, 2);
                                *e = (rs2<<20) | (rd<<15) | (0b110<<12) | (rd<<7) | 0b0110011;
                                return 1;                                
                        case 0b01111 : 
                                // C.AND expands into and rd',rd',rs2'
                                rd = extractreg(c, 7);
                                rs2 = extractreg(c, 2);
                                *e = (rs2<<20) | (rd<<15) | (0b111<<12) | (rd<<7) | 0b0110011;
                                return 1;                                                                
                        case 0b11100 : case 0b11101 : case 0b11110 : case 0b11111 : 
                                // Reserved
                                return 0;
                        }
                        ferr( "Que?\n" );
                case 0b101 :
                        // C.J expands to jal x0,offset[11:1]
                        imm = immfind(c, 1, 3,4,5,11,2,7,6,9,10,8,12,-1);
                        rv32imm = (((imm>>20) & 1)<<19)
                                | (((imm>>1)&0x3ff)<<9)
                                | (((imm>>11)&1)<<8)
                                | (((imm>>12)&0xff)<<0);
                        *e = (rv32imm<<12) | (0<<7) | 0b1101111;
                        return 1;
                case 0b110 :
                        // C.BEQZ expands to beq rs1',x0,offset[8:1]
                        imm = immfind(c, 1, 3,4,10,11,2,5,6,12,-1);
                        rs1 = extractreg(c,7);
                        *e = (((imm>>12)&1)<<31)
                                | (((imm>>5)&63)<<25)
                                | (0<<20)
                                | (rs1<<15)
                                | (0b000<<12)
                                | (((imm>>1)&15)<<8)
                                | (((imm>>11)&1)<<7)
                                | 0b1100011;
                        return 1;
                case 0b111 :
                        // C.BNEZ expands to bne rs1',x0,offset[8:1]
                        imm = immfind(c, 1, 3,4,10,11,2,5,6,12,-1);
                        rs1 = extractreg(c,7);
                        *e = (((imm>>12)&1)<<31)
                                | (((imm>>5)&63)<<25)
                                | (0<<20)
                                | (rs1<<15)
                                | (0b001<<12)
                                | (((imm>>1)&15)<<8)
                                | (((imm>>11)&1)<<7)
                                | 0b1100011;
                        return 1;                        
                }
                ferr( "Should never be here\n" );
        case 0b10 :
                //
                // Quadrant 2
                //
                switch ( (c >> 13) & 7 ) {
                case 0b000 :
                        // C.SLLI expands into slli rd, rd, shamt[5:0]
                        imm = immfind(c, 0, 2,3,4,5,6,12,-2);
                        rs1 = (c >> 7) & 0b11111;
                        *e = (imm << 20) | (rs1<<15) | (0b001<<12) | (rs1<<7) | 0b0010011;
                        return imm > 31 ? 0 : 1; // shamt[5] set is custom extensions
                case 0b001 :
                        // C.FLDSP not implemented in midgetv.
                        return -1;
                case 0b010 :
                        // C.LWSP expands to lw rd, offset[7:2](x2). C.LWSP.
                        imm = immfind(c, 2, 4,5,6,12,2,3, -2);
                        rd = (c>>7) & 0b11111;
                        *e = (imm<<20) | (2<<15) | (0b010<<12) | (rd<<7) | 0b0000011;
                        return 1;
                case 0b011 :
                        // C.FLWSP
                        return -1;
                case 0b100 :
                        if ( c & (1<<12)) {
                                if ( c == 0x9002 ) {
                                        *e = 0x00100073; // EBREAK
                                        return 1;
                                } else if ( c & (31<<2) ) {
                                        // C.ADD expands into add rd, rd, rs2
                                        rd = (c >> 7) & 0b11111;
                                        rs2 = (c >> 2) & 0b11111;
                                        *e = (rs2<<20) | (rd<<15) | (rd<<7) | 0b0110011;
                                        return 1;
                                } else {
                                        // C.JALR expands to jalr x1,0(rs1)
                                        rs1 = (c >> 7) & 0b11111;
                                        *e = (rs1<<15) | (1<<7) | 0b1100111;
                                        return 1;
                                }
                        } else {
                                if (c & (0b11111<<2)) {
                                        // C.MV expands into add rd, x0, rs2.
                                        rd = (c >> 7) & 0b11111;
                                        rs2 = (c >> 2) & 0b11111;
                                        *e = (rs2<<20) | (rd<<7) | 0b0110011;
                                        return 1;
                                } else {
                                        // C.JR expands to jalr x0,0(rs1)
                                        rs1 = (c >> 7) & 0b11111;
                                        *e = (rs1<<15) | 0b1100111;
                                        return rs1 == 0 ? 0 : 1;
                                }
                        }
                        ferr( "Que?\n" );
                case 0b101 :
                        // C.FSDSP
                        return -1;
                case 0b110 :
                        // C.SWSP expands to sw rs2,offset[7:2](x2)
                        imm = immfind(c, 2, 9,10,11,12,7,8,-2);
                        rs2 = (c >>2) & 0b11111;
                        *e = ((imm & 0xfe0)<<20) | (rs2<<20) | (2<<15) | (0b010<<12) | ((imm & 0x1f)<<7) | 0b0100011;
                        return 1;                        
                case 0b111 :
                        // C.FSWSP
                        return -1;
                }
                ferr( "Should never be here\n" );
                
        case 0b11 : ferr( "c=0x%4.4x Que?\n", c );
        }
        return 1;
}

/////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);

	// Create an instance of our module under test
	Vm_decompress *tb = new Vm_decompress;

	// Check each and every compressed instruction
        int c;
        uint32_t e,f;
        int mustmatch;

//        for ( c = 0; c < 0x10000; c++ ) {
        for ( c = 0x9106; c < 0x10000; c++ ) {
                if ( (c & 3) == 3 )
                        continue;

                mustmatch = facit(&f,c);
                //printf( "{%x}", f);
                tb->c = c;
                tb->eval();
                e = tb->e;
                if ( mustmatch == -1 ) {
                        if ( (e & 3) == 3 )
                                ferr( "Something is wrong, an compressed instruction that is unsupported does not map"
                                      " to an instruction that will lead to an unknown instruction exception\n" );
                } else if ( mustmatch == 1 && e != f ) {
                        printf( "Compressed=%4.4x ", c );
                        //printf( "%8.8x  ", tb->q0e );
                        printf( "Facit=%8.8x ", f );
                        pocketdissass( 0, 0, f );
                        printf( "   Verilog gave: %8.8x  ", e );
                        pocketdissass( 0, 0, e );
                        printf( "\n" );
                        exit(4);
                }
        }
        exit(0);
}

