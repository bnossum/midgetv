/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This file needs a cleanup.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <inttypes.h>
#include "common.h"

void parse_arguments(int *verbosep, int *cyclelimitp, int *silentp, FILE **lfop, FILE **imagetosimp,
                     char **imagetosimnamep, int argc, char **argv) {
        char *logfilename = NULL;
        int opt;
        
        while ((opt = getopt(argc, argv, "hc:i:l:svH:")) != -1) {
                switch (opt) {
                case 'c' :
                        *cyclelimitp = strtol(optarg,NULL,0);
                        break;
                case 'l' :
                        logfilename = strdup(optarg);                        
                        break;
                case 'i' :
                        *imagetosimnamep = strdup(optarg);
                        break;
                case 's' :
                        ++*silentp;
                        break;
                case 'v' :
                        ++*verbosep;
                        break;
                case 'H' :
                        g_ignorehint = strtol(optarg,NULL,0);
                        break;
                case 'h':
                default: /* '?' */
                       userguide();
                }
        }
        if ( logfilename != NULL )
                if ( (*lfop = fopen(logfilename,"w")) == NULL )
                        ferr( "Can't open %s for writing\n", logfilename );
        
        if ( *imagetosimnamep == NULL )
                ferr( "Missing name of program to simulate\n" );
        if ( (*imagetosimp = fopen(*imagetosimnamep,"r")) == NULL )
                ferr( "Can't open %s for reading\n", *imagetosimnamep );
        if ( logfilename )
                free( logfilename );
}

/////////////////////////////////////////////////////////////////////////////
void userguide( void ) {
        ferr( "Will be help?\n" );
}



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
        case 'a' : printf( "x%d,%d(x%d)", rd(I), immL11_0J(I), rs1(I) ); break; // LW
        default : ferr( "Que?\n" );
        }
        return inx;
}

/////////////////////////////////////////////////////////////////////////////
int printfdecodeinstr( uint32_t I ) {
        int n;
        switch ( I & 127 ) {
        case 0x63 :
                n = printf( "   x%-2d x%-2d %d     %2.2x ",
                        //(I >> 25) & 127, // FUNCT7
                        (I >> 20) & 31, //  rs2
                        (I >> 15) & 31, //  rs1
                        (I >> 12) & 7, //   FUNCT3
                        //(I >>  7) & 31, //  rd
                        (I >>  0) & 127 //  OPCODE
                        );
                break;
        default :
                n = printf( "%2.2x x%-2d x%-2d %d x%-2d %2.2x ",
                        (I >> 25) & 127, // FUNCT7
                        (I >> 20) & 31, //  rs2
                        (I >> 15) & 31, //  rs1
                        (I >> 12) & 7, //   FUNCT3
                        (I >>  7) & 31, //  rd
                        (I >>  0) & 127 //  OPCODE
                        );
        }
        return n;
}
                
                
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
int  p_cy( int lnr, int cy, int corerunning ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :
                case 1 : n = printf( "     " ); break;
                case 2 : if ( ! corerunning ) {
                                n = printf( "start" );
                        } else {
                                n = printf( "     " );
                        }
                        break;
                case 3 : if ( ! corerunning ) {
                                n = printf( "  cy|" );
                        } else {
                                n = printf( "  cy " );
                        }
                        break;
                }
        } else {
                n = printf("%4.4x%c", cy, corerunning ? ' ' : '-' );
        }
        return n;
}
                
/////////////////////////////////////////////////////////////////////////////
int p_minx_ucode( int lnr, uint8_t minx, uint32_t ucode ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "            " ); break;
                case 1 :n = printf( "minx        " ); break;
                case 2 :n = printf( "|| ucode    " ); break;
                case 3 :n = printf( "|| |||||||| " ); break;
                }
        } else {
                n = printf( "%2.2x %8.8x ", minx, ucode);
        }
        return n;
#if 0
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "U " ); break;
                case 1 :n = printf( "U " ); break;
                case 2 :n = printf( "U " ); break;
                case 3 :n = printf( "| " ); break;
                }
        } else {
                n = printf( "%1.1x ", (ucode >> 18) & 15 );
        }
        return n;
#endif
}

/////////////////////////////////////////////////////////////////////////////
int p_ucodepcdbg( int lnr, int dinx, int ucodepcinfo ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "buser/dinx" ); break;
                case 1 :n = printf( "||qint/ill" ); break;
                case 2 :n = printf( "||||may   " ); break;
                case 3 :n = printf( "|||||take " ); break;
                }
        } else {                
                n = printf( "%d%d%d%d%d%d %2.2x ", (ucodepcinfo>>5) & 1,
                            (ucodepcinfo>>4) & 1,(ucodepcinfo>>3) & 1,
                            (ucodepcinfo>>2) & 1,(ucodepcinfo>>1) & 1,(ucodepcinfo>>0) & 1, dinx );                
        }
        return n;                        
}
        
/////////////////////////////////////////////////////////////////////////////
int p_I( int lnr, uint32_t I ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "         " ); break;
                case 1 :n = printf( "         " ); break;
                case 2 :n = printf( "         " ); break;
                case 3 :n = printf( "I[31:0]  " ); break;
                }
        } else {
                n = printf( "%8.8x ", I);
        }
        return n;                        
}

/////////////////////////////////////////////////////////////////////////////
int p_I_fields( int lnr, uint32_t I ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "                    " ); break;
                case 1 :n = printf( "                    " ); break;
                case 2 :n = printf( "FUNC7  FUNC3 OPCODE " ); break;
                case 3 :n = printf( "|| rs2 rs1 | Rd  || " ); break;
                }
        } else {
                n = printfdecodeinstr( I );
        }
        return n;                        
}

/////////////////////////////////////////////////////////////////////////////
int p_pc( int lnr, uint32_t pc ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "         " ); break;
                case 1 :n = printf( "         " ); break;
                case 2 :n = printf( "         " ); break;
                case 3 :n = printf( "pc[31:0] " ); break;
                }
        } else {
                n = printf( "%8.8x ", pc );
        }
        return n;                        
}

/////////////////////////////////////////////////////////////////////////////
int p_rai( int lnr, int rai ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "     " ); break;
                case 1 :n = printf( "     " ); break;
                case 2 :n = printf( "     " ); break;
                case 3 :n = printf( "rai  " ); break;
                }
        } else {
                n = printf( "%4.4x ", rai*4 );
        }
        return n;
}

/////////////////////////////////////////////////////////////////////////////
int p_wai( int lnr, int wai, int iwe ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "     " ); break;
                case 1 :n = printf( "     " ); break;
                case 2 :n = printf( "     " ); break;
                case 3 :n = printf( "wai  " ); break;
                }
        } else {
                if ( iwe ) {
                        n = printf( "%4.4x ", wai*4 );
                } else {
                        n = printf( "     " );
                }
        }
        return n;
}

/////////////////////////////////////////////////////////////////////////////
int p_sel( int lnr, int sel ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "     " ); break;
                case 1 :n = printf( "     " ); break;
                case 2 :n = printf( "SEL  " ); break;
                case 3 :n = printf( "3210 " ); break;
                }
        } else {
                n = printf( "%d%d%d%d ", (sel>>3) & 1,(sel>>2) & 1,(sel>>1) & 1,(sel>>0) & 1);
        }
        return n;
}

/////////////////////////////////////////////////////////////////////////////
int p_raluF( int lnr, int raluF ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "  " ); break;
                case 1 :n = printf( "Cy" ); break;
                case 2 :n = printf( "| " ); break;
                case 3 :n = printf( "| " ); break;
                }
        } else {
                n = printf( "%d ", raluF & 1);
        }
        return n;
}
        
/////////////////////////////////////////////////////////////////////////////
int p_ioa( int lnr, uint32_t ioa, int enaQ, int nclearQ ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "           " ); break;
                case 1 :n = printf( "           " ); break;
                case 2 :n = printf( "           " ); break;
                case 3 :n = printf( "ADR_O___   " ); break;
                }
        } else {
//                static int prev_enaQ;
//                static int prev_clearQ;
//                
//                if ( !prev_enaQ ) {
//                        n = printf( "%8.8xh ", ioa );
//                } else {
//                        if ( prev_clearQ ) {
//                                //if ( ioa != 0 )
//                                //        printf( "Internal\n");
//                                // Alas, above test fails when main loop of simulation say ST_HINT_SILENCE
//                                // So be it.
//                                n = printf( "=0 (clr)  " );
//                        } else {
//                                n = printf( "%8.8x  ", ioa );
//                        }
//                }
//                prev_enaQ = enaQ;    
//                prev_clearQ = clearQ;
                n = printf( "%8.8x %c ", ioa, enaQ ? (nclearQ ? 'u' : 'z') : 'h' );
        }
        return n;                        
}


/////////////////////////////////////////////////////////////////////////////
int p_Bxx( int lnr, uint32_t B ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "         " ); break;
                case 1 :n = printf( "         " ); break;
                case 2 :n = printf( "         " ); break;
                case 3 :n = printf( "B[31:0]_ " ); break;
                }
        } else {
                n = printf( "%8.8x ", B );
        }
        return n;                        
}
/////////////////////////////////////////////////////////////////////////////
int p_generic32u( int lnr, char const * const hdr, uint32_t v ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "         " ); break;
                case 1 :n = printf( "         " ); break;
                case 2 :n = printf( "         " ); break;
                case 3 :n = printf( "%s", hdr); break;
                }
        } else {
                n = printf( "%8.8x ", v );
        }
        return n;                        
}

/////////////////////////////////////////////////////////////////////////////
int p_dbg_stb_ack( int lnr, int v  ) {
        int n;
        
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "progress " ); break;
                case 1 :n = printf( "|enaQ    " ); break;
                case 2 :n = printf( "||WE     " ); break;
                case 3 :n = printf( "|||      " ); break;
                }
        } else {
                n = printf( "%c%c%c%c %c%c%c ",
                            ((v >> 6) & 1) ? '1' : '.',
                            ((v >> 5) & 1) ? '1' : '.',
                            ((v >> 4) & 1) ? '1' : '.',
                            ((v >> 3) & 1) ? '1' : '.',
                            ((v >> 2) & 1) ? '1' : '.',
                            ((v >> 1) & 1) ? '1' : '.',
                            ((v >> 0) & 1) ? '1' : '.'                            
                        );
        }
        return n;
}

/////////////////////////////////////////////////////////////////////////////
int p_stb_ack( int lnr, int stb_ack ) {
        int n = 0;
        static int alternateheading;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( alternateheading ) {
                case 0 :
                        switch ( lnr & 3 )  {
                        case 0 :n = printf( " (RAM) " ); break;
                        case 1 :n = printf( "   ACK " ); break;
                        case 2 :n = printf( "  STB| " ); break;
                        case 3 :n = printf( "||| || " ); break;
                        }                    
                        break;               
                case 1 :                     
                        switch ( lnr & 3 )  {     
                        case 0 :n = printf( "STB(IO)" ); break;
                        case 1 :n = printf( "|sysack" ); break;
                        case 2 :n = printf( "||ACK  " ); break;
                        case 3 :n = printf( "||| || " ); break;
                        }
                        break;
                }
                if ((lnr & 3) == 3 && ++alternateheading >= 2 )
                        alternateheading = 0;
                
        } else {
                n = printf( "%c%c%c %c%c ",
                            ((stb_ack >> 4) & 1) ? '1' : '.',
                            ((stb_ack >> 3) & 1) ? '1' : '.',
                            ((stb_ack >> 2) & 1) ? '1' : '.',
                            ((stb_ack >> 1) & 1) ? '1' : '.',
                            ((stb_ack >> 0) & 1) ? '1' : '.'                            
                        );
        }
        return n;                        
}

/////////////////////////////////////////////////////////////////////////////
int p_shiftcount( int lnr, int cnt ) {
        int n;

        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "shi" ); break;
                case 1 :n = printf( "ft " ); break;
                case 2 :n = printf( "|| " ); break;
                case 3 :n = printf( "|| " ); break;
                        break;
                }
        } else {
                n = printf( "%2.2x ", cnt );
        }
        return n;                        
}


/////////////////////////////////////////////////////////////////////////////
int p_inexplicable( int lnr, int inexplicable ) {
        int n;

        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( " Why   " ); break;
                case 1 :n = printf( " this  " ); break;
                case 2 :n = printf( " error " ); break;
                case 3 :n = printf( "|||||| " ); break;
                        break;
                }
        } else {
                n = printf( "%d%d%d%d%d%d ",
                            ((inexplicable >> 5) & 1),
                            ((inexplicable >> 4) & 1),
                            ((inexplicable >> 3) & 1),
                            ((inexplicable >> 2) & 1),
                            ((inexplicable >> 1) & 1),
                            ((inexplicable >> 0) & 1)                            
                        );
        }
        return n;                        
}

/////////////////////////////////////////////////////////////////////////////
int p_aluop( int lnr, int v ) {
        int n = 0;
        
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "        " ); break;
                case 1 :n = printf( "        " ); break;
                case 2 :n = printf( "        " ); break;
                case 3 :n = printf( "ALUOP__ " ); break;
                }                    
        } else {
                switch ( v ) {
                case 0b000 : n = printf( "nearXOR " ); break;
                case 0b001 : n = printf( "passD   " ); break;
                case 0b010 : n = printf( "INVQ    " ); break;
                case 0b011 : n = printf( "nearAND " ); break;
                case 0b100 : n = printf( "ADD     " ); break;
                case 0b101 : n = printf( "SHLQ    " ); break;
                case 0b110 : n = printf( "passQ   " ); break;
                case 0b111 : n = printf( "nearIOR " ); break;
                }
        }
        return n;                        
}


/////////////////////////////////////////////////////////////////////////////
int p_interruptinfo( int lnr, int interruptinfo ) {
        int n;

        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "Int_info_ mpie " ); break;
                case 1 :n = printf( "S T E t r |mie " ); break;
                case 2 :n = printf( "epepepepep\\\\csr" ); break;
                case 3 :n = printf( "|||||||||| ||| " ); break;
                        break;
                }
        } else {
                n = printf( "%d%d%d%d%d%d%d%d%d%d %d%d%d ",
                            ((interruptinfo >>12) & 1),
                            ((interruptinfo >>11) & 1),
                            ((interruptinfo >>10) & 1),
                            ((interruptinfo >> 9) & 1),
                            ((interruptinfo >> 8) & 1),
                            ((interruptinfo >> 7) & 1),
                            ((interruptinfo >> 6) & 1),                            
                            ((interruptinfo >> 5) & 1),
                            ((interruptinfo >> 4) & 1),
                            ((interruptinfo >> 3) & 1),
                            ((interruptinfo >> 2) & 1),
                            ((interruptinfo >> 1) & 1),
                            ((interruptinfo >> 0) & 1)                            
                        );
        }
        return n;                        
}

/////////////////////////////////////////////////////////////////////////////
int p_pc1( int lnr, int pc1 ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "  " ); break;
                case 1 :n = printf( "p " ); break;
                case 2 :n = printf( "c " ); break;
                case 3 :n = printf( "1 " ); break;
                }
        } else {
                n = printf( "%d ", pc1 & 1);
        }
        return n;
}
/////////////////////////////////////////////////////////////////////////////
int p_was_rvc_instr( int lnr, int onebit ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "  " ); break;
                case 1 :n = printf( "r " ); break;
                case 2 :n = printf( "v " ); break;
                case 3 :n = printf( "c " ); break;
                }
        } else {
                n = printf( "%d ", onebit & 1);
        }
        return n;
}
        
/////////////////////////////////////////////////////////////////////////////
int p_luh( int lnr, int onebit ) {
        int n;
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 :n = printf( "  " ); break;
                case 1 :n = printf( "l " ); break;
                case 2 :n = printf( "u " ); break;
                case 3 :n = printf( "h " ); break;
                }
        } else {
                n = printf( "%d ", onebit & 1);
        }
        return n;
}
        



/////////////////////////////////////////////////////////////////////////////
void common_simprintf( INFOCHUNK * const p, uint32_t cy) {
        static int lnr;        
        const char *ucodetxt[256] = {
#define X(label,text,ty,pos,value,reachability,mask,instr,nrhit) text,
#include "../code/ucode.h"
        };
        const char *ucodelabeltxt[256] = {
#define X(label,text,ty,pos,value,reachability,mask,instr,nrhit) STR(label),
#include "../code/ucode.h"
        };
                
        if ( p->CONF & INFO_skip_first64 ) 
                if ( cy < 64 )
                        return;
        
TOP:
        if ( p->CONF & INFO_cy             ) p_cy( lnr, cy, p->corerunning  );
        if ( p->CONF & INFO_minx_ucode     ) p_minx_ucode( lnr, p->minx, p->ucode );                
        if ( p->CONF & INFO_ucodedbg       ) p_ucodepcdbg( lnr, p->dinx, p->ucodepcinfo );                
        if ( p->CONF & INFO_I              ) p_I( lnr, p->I );
        if ( p->CONF & INFO_I_fields       ) p_I_fields( lnr, p->I );
        if ( p->CONF & INFO_pc1            ) p_pc1( lnr, p->pc1 );
        if ( p->CONF & INFO_was_rvc_instr  ) p_was_rvc_instr( lnr, p->was_rvc_instr );
        if ( p->CONF & INFO_luh            ) p_luh( lnr, p->luh );
        if ( p->CONF & INFO_pc             ) p_pc( lnr, p->pc );
        if ( p->CONF & INFO_rai            ) p_rai( lnr, p->rai );
        if ( p->CONF & INFO_wai            ) p_wai( lnr, p->wai, p->iwe );
        if ( p->CONF & INFO_theio          ) p_generic32u( lnr, "in[31:0] ", p->theio );
        if ( p->CONF & INFO_Dsram          ) p_generic32u( lnr, "Dsram___ ", p->Dsram );
        if ( p->CONF & INFO_rDee           ) p_generic32u( lnr, "rDee____ ", p->rDee );
        if ( p->CONF & INFO_DAT_O          ) p_generic32u( lnr, "DAT_O___ ", p->DAT_O );
        if ( p->CONF & INFO_Di             ) p_generic32u( lnr, "Di[31:0] ", p->Di );
        if ( p->CONF & INFO_ADR_O          ) p_ioa( lnr, p->ADR_O, p->enaQ, p->nclearQ );
        if ( p->CONF & INFO_M              ) p_generic32u( lnr, "M[31:0]_ ", p->M );
        if ( p->CONF & INFO_ALUOP          ) p_aluop( lnr, p->aluop );
        if ( p->CONF & INFO_RALUF          ) p_raluF( lnr, p->raluF );
        if ( p->CONF & INFO_B              ) p_generic32u( lnr, "B[31:0]_ ", p->B );
        if ( p->CONF & INFO_dbg_stb_ack    ) p_dbg_stb_ack( lnr, p->dbg_stb_ack );
        if ( p->CONF & INFO_stb_ack        ) p_stb_ack( lnr, p->stb_ack );
        if ( p->CONF & INFO_sel            ) p_sel( lnr, p->sel_O );
        if ( p->CONF & INFO_get_inexplcable) p_inexplicable( lnr, p->inexplicable );
        if ( p->CONF & INFO_interruptinfo  ) p_interruptinfo( lnr, p->interruptinfo );

        if ( p->CONF & INFO_shiftcount     ) p_shiftcount( lnr, p->shiftcount );
        static int klugeminx;
//        if ( p->progress_ucpde )
                klugeminx = p->minx;


        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 : printf( "        " ); break;
                case 1 : printf( "Micro   " ); break;
                case 2 : printf( "code    " ); break;
                case 3 : printf( "label__ " ); break;
                }
        } else {
                printf( "%-8s", ucodelabeltxt[klugeminx] );
        }
        
        // I assume we always want the text of the ucode.
        if ( (lnr & 0x1c) == 0 ) {
                switch ( lnr & 3 )  {
                case 0 : printf( "%.*s", p->ucodetextlen, "                                                       " ); break;
                case 1 : printf( "%.*s", p->ucodetextlen, "                                                       " ); break;
                case 2 : printf( "%.*s", p->ucodetextlen, "                                                       " ); break;                                 
                case 3 : printf( "%.*s", p->ucodetextlen, "Microcode_instruction_text____________________________ " ); break;
                }
        } else {
                printf( "%-*.*s", p->ucodetextlen, p->ucodetextlen, ucodetxt[klugeminx] );
        }

        if ( p->CONF & INFO_dissassembly ) {
                if ( (lnr & 0x1c) == 0 ) {
                        switch ( lnr & 3 )  {
                        case 0 : printf( "               " ); break;
                        case 1 : printf( "               " ); break;
                        case 2 : printf( "               " ); break;
                        case 3 : printf( "Assembler_instr" ); break;
                        }
                } else {
                        if ( p->usedinx )
                                pocketdissass( 0, p->pc, p->I );
                }
        }

        
        printf( "\n" );
        if ( (lnr & 0x1c) == 0 ) {
                // printed header info.
                lnr++;
                goto TOP;
        } else {
                lnr++;
        }
}
