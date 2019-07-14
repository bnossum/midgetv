/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * To exercise module m_ucodepc
 */

#include <stdlib.h>
#include <stdint.h>
#include <Vm_ucodepc__Syms.h>
#include "verilated.h"
#define _main
#include "common.h"

//#define ferr(...) exit( fprintf(stderr, "%s:%d: ", __FILE__, __LINE__) + fprintf(stderr, __VA_ARGS__))

#define nakedfname ../code/ucode.h
        
// Defeat quoting system of some shells
#define STRX(x) # x
#define STR(x) STRX(x)
#define fname STR(nakedfname)

uint8_t reachability[256] = {
#define X(label,txt,def,reachability,mask,instr) reachability,
#include fname
};

uint32_t mask[256] = {
#define X(label,txt,def,reachability,mask,instr) mask,
#include fname
};
        
uint32_t instr[256] = {
#define X(label,txt,def,reachability,mask,instr) instr,
#include fname
};
        
int main(int argc, char **argv) {
        uint32_t hit[256] = { 0, };
        uint8_t suspend[256] = { 0, };
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);

	// Create an instance of our module under test
	Vm_ucodepc *tb = new Vm_ucodepc;



           /* Largest task to perform, and most important, check instruction decode
         */
        tb->corerunning = 1;
        tb->RST_I       = 0;
        tb->buserror    = 0;
        tb->qualint     = 0;
        tb->is_brcond   = 0;
        tb->rinx        = 0;
        
        tb->sa28  = 1; // Usedinx. This is OpCode fetch
        tb->sa29  = 0; // Adr0Mustbe0
        tb->sa30  = 0; // Adr1Mustbe0
        tb->sa37  = 0; // use_brcond
        tb->sa32  = 0; // To trigger OpCode jmp to alternate operand fetch from SRAM
        tb->sa15  = 0; // To trigger OpCode jmp to alternate operand fetch from SRAM
        tb->B     = 0; // B[1:0] to find alignment errors. B[31] to distinguish EBR/SRAM
        tb->ADR_O = 0; // ADR_O[31] used at OpCode fetch to distinguish between EBR and SRAM

        //                   Bits    
        uint32_t INSTR;

        /* The crudest way to check the OpCodes would be to iterate over
           32 bits, testing from 0x00000000 to 0xffffffff, impractical.
           We need to speed it up a bit.

           All OpCodes in RV32I is reachable by iterating over opcode,
           funct3, bit 0 in rs2, and bit 5 in funct7.
           To also hit instructions ECALL/EBREAK/MRET/WFI we also
           iterate on bit 1 in rs2, and bits 3 and 4 in funct7.

           This mean we basically iterate over 2^(7+3+2+3) = 2^15 
           instructions.
           
           funct7  rs2   rs1   funct3 rd opcode
           0xxx000 000xx 00000 xxx 00000 xxxxxxx

           To increase the coverage, I add a "circulation bit" that
           will occur in all bitpositions marked as '0' above. There
           are 17 such occurences, so in total we will iterate over
           (2^15)*(17+1) < 2^20 instructions. Feasible.

           To speed up with a factor 4 I do not consider bits 1 and 0
           in the OpCode, but assume these are always 2'b11. We are
           down to < 2^18 iterations.
           
        */

        int dbg = 0;
        INSTR = 3;
        do {
                tb->INSTR = INSTR;
                tb->eval();
                int minx = tb->v->minx;
                
                hit[minx]++;
                
                if ( reachability[minx] == 0 ) {
                        if ( pocketdissass( 1, 0, INSTR ) != -1 ) {
                                ferr( "Reaced index should be inaccessible, but is reached with an instruction that should be decoded\n" );
                        }
                        if ( !suspend[minx] ) {
                                if ( dbg ) {
                                        printf( "Reached index that should be inaccessible\n" );
                                        printf( "Problem at base instruction 0x%8.8x\n", INSTR );
                                        printf( "Pocked dissasembly say: " );
                                        pocketdissass( 0, 0, INSTR );
                                        printf( "\nminx = 0x%2.2x\n", minx );
                                }
                                suspend[minx] = 1;
                        }
                } else if ( reachability[minx] == 2 ) {
                        // Check that INSTR is really to be ignored
                } else if ( reachability[minx] == 1 ) {
                        /* Note.
                           Test is lax for ECALL. ECALL strict decoding must be performed elsewhere
                        */
                        /* Change to 
                           if ( (instr[minx] & mask[minx]) != (INSTR & localmask) ) {
                        */
                        if ( (instr[minx] & mask[minx]) != (INSTR & mask[minx]) ) {
                                if ( dbg ) {
                                        printf( "Problem at base instruction 0x%8.8x\n", INSTR );
                                        printf( "Pocked dissasembly say: " );
                                        pocketdissass( 0, 0, INSTR );
                                        printf( "\nminx = 0x%2.2x\n", minx );
                                }
                                ferr( "Aborts\n" );
                        }
                        // printf( "%8.8x 0x%.2x\n", INSTR, minx );
                } else {
                        printf( "Que?\n" );
                }
                INSTR += 4;
        } while ( INSTR != 3);
        

        
        int i;
        for ( i = 0; i < 256; i++ ) {
                switch ( reachability[i] ) {
                case 0 :
                        if ( hit[i] ) {
                                printf( "0x%.2x should be unreachable from decode, but is hit %d times\n", i, hit[i] );
                        }
                        break;
                case 1 :
                        if ( hit[i] == 0 ) {
                                printf( "0x%.2x should be hit, but is not\n", i );
                        }
                        break;
                case 2 :
                        if ( hit[i] == 0 ) {
                                printf( "0x%.2x reserved for illegal OpCode, but is infact never hit\n", i );
                        }
                        break;
                case 3 :
                        // Index is reserved for NMI or qualified interrupt. Not part of this test
                        break;
                default :
                        ferr( "Que?\n" );
                }                
        }
        //printf( "\n0x%x iterations", nriter );
        exit(EXIT_SUCCESS);
}


//#if 0        
        int nriter = 0;
        const uint32_t circulatebit[18] =
                { 0,
                  7,8,9,10,11,
                  15,16,17,18,19,
                  22,23,24,
                  25,26,27,31 };
        uint32_t rotinx, rotator;
        uint32_t opcode  ;// [6:0]   
//      uint32_t rd      ;// [11:7]  
        uint32_t funct3  ;// [14:12] 
//      uint32_t rs1     ;// [19:15] 
        uint32_t rs2     ;// [24:20] 
        uint32_t funct7  ;// [31:25] 
//        for ( opcode = 3; opcode < 128; opcode += 4 ) {
//                for ( funct3 = 0; funct3 < 8; funct3++ ) {
//                        for ( rs2 = 0; rs2 < 4; rs2++ ) {
//                                for ( funct7 = 0; funct7 < 64; funct7 += 8 ) {
//                                        for ( rotinx = 0; rotinx < 18; rotinx++ ) {
//                                                
//                                                /* Slight cheating, as opcode[0] == 1,
//                                                   I use (1u<<0) as no rotator bit present
//                                                */
//                                                rotator = (1u<<circulatebit[rotinx]);
//                                                INSTR = (funct7<<25) | (rs2<<20) | (funct3<<12) | opcode;
//                                                INSTR |= rotator;
//                                                nriter++;
//
//                                                tb->INSTR = INSTR;
//                                                tb->eval();
//                                                int minx = tb->v->minx;
//
//                                                hit[minx]++;
//                                                
//                                                if ( reachability[minx] == 0 ) {
//                                                        if ( !suspend[minx] ) {
//                                                                if ( dbg ) {
//                                                                        printf( "Reached index that should be inaccessible\n" );
//                                                                        printf( "Problem at base instruction 0x%8.8x\n", INSTR );
//                                                                        printf( "Pocked dissasembly say: " );
//                                                                        pocketdissass( 0, INSTR );
//                                                                        printf( "\nminx = 0x%2.2x\n", minx );
//                                                                }
//                                                                suspend[minx] = 1;
//                                                        }
//                                                } else if ( reachability[minx] == 2 ) {
//                                                        // Check that INSTR is really to be ignored
//                                                } else if ( reachability[minx] == 1 ) {
//                                                        /* Note.
//                                                           Test is lax for ECALL. ECALL strict decoding must be performed elsewhere
//                                                        */
//                                                        /* Change to 
//                                                           if ( (instr[minx] & mask[minx]) != (INSTR & localmask) ) {
//                                                        */
//                                                        if ( (instr[minx] & mask[minx]) != (INSTR & mask[minx]) ) {
//                                                                if ( dbg ) {
//                                                                        printf( "Problem at base instruction 0x%8.8x\n", INSTR );
//                                                                        printf( "Pocked dissasembly say: " );
//                                                                        pocketdissass( 0, INSTR );
//                                                                        printf( "\nminx = 0x%2.2x\n", minx );
//                                                                }
//                                                                ferr( "Aborts\n" );
//                                                        }
//                                                        // printf( "%8.8x 0x%.2x\n", INSTR, minx );
//                                                } else {
//                                                        printf( "Que?\n" );
//                                                }
//                                        }
//                                }
//                        }
//                }
//        }
//#else
