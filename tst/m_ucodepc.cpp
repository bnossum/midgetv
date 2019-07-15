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
           32 bits, testing from 0x00000000 to 0xffffffff. This is what I do.
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


