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

#define nakedfname ../code/ucode.h
        
// Defeat quoting system of some shells
#define STRX(x) # x
#define STR(x) STRX(x)
#define fname STR(nakedfname)

uint8_t reachability[256] = {
#define X(label,txt,def,reachability,mask,instr,hitnr) reachability,
#include fname
};

uint32_t mask[256] = {
#define X(label,txt,def,reachability,mask,instr,hitnr) mask,
#include fname
};

uint32_t facit_hit[256] = {
#define X(label,txt,def,reachability,mask,instr,hitnr) hitnr,
#include fname
};
        
uint32_t instr[256] = {
#define X(label,txt,def,reachability,mask,instr,hitnr) instr,
#include fname
};
        
int main(int argc, char **argv) {
        uint32_t hit[256] = { 0, };
        uint8_t suspend[256] = { 0, };
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);

	// Create an instance of our module under test
	Vm_ucodepc *tb = new Vm_ucodepc;



        /* Largest task to perform, check instruction decode
         */
        tb->corerunning = 1;
        tb->RST_I       = 0;
        tb->nobuserror  = 1;
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

        uint32_t INSTR;

        /* The crudest way to check the OpCodes would be to iterate over
           32 bits, testing from 0x00000000 to 0xffffffff. This is what I do.
        */
        fprintf( stderr, "Runtime around 7 minutes on a Lenovo x230.\n" );
        
        int dbg = 2;
        INSTR = 0;
        do {
                tb->INSTR = INSTR;
                tb->eval();
                int minx = tb->minx;
                
                hit[minx]++;
                
                if ( reachability[minx] == 0 ) {
                        if ( pocketdissass( 1, 0, INSTR ) != -1 ) {
                                ferr( "Reached index should be inaccessible, but is reached with an instruction that should be decoded\n" );
                        }
                        if ( !suspend[minx] ) {
                                if ( dbg ) {
                                        printf( "Reached index that should be inaccessible\n" );
                                        printf( "Problem at base instruction 0x%8.8x\n", INSTR );
                                        printf( "Pocked dissasembly say: " );
                                        pocketdissass( 0, 0, INSTR );
                                        printf( "\nminx = 0x%2.2x\n", minx );
                                        if ( dbg > 1)
                                                ferr( "Aborts\n" );
                                }
                                suspend[minx] = 1;
                        }
                } else if ( reachability[minx] == 2 ) {
                        // Check that INSTR is really to be ignored
                } else if ( reachability[minx] == 1 ) {
                        /* Note.
                           Test is lax for ECALL. ECALL strict decoding must be performed elsewhere
                           We have one common entry point for 
                               ECALL
                               EBREAK  
                               ECALL
                               (U/S/M)RET
                               WFI
                               other unsupported in same minor encoding
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
                                        if ( dbg > 1)
                                                ferr( "Aborts\n" );
                                }
                        }
                        // printf( "%8.8x 0x%.2x\n", INSTR, minx );
                } else {
                        ferr( "Que?\n" );
                }
                INSTR++;
        } while ( INSTR != 0);
        

        
        int i;
        for ( i = 0; i < 256; i++ ) {
                switch ( reachability[i] ) {
                case 0 :
                        /* This entry in the table is used for microcode, and is
                         * not an entry point.
                         */
                        if ( hit[i] ) {
                                printf( "0x%.2x should be unreachable from decode, but is hit %d times\n", i, hit[i] );
                        }
                        break;
                case 1 :
                        /* This entry in the table is the entrypoint of an instruction to run
                         */
                        if ( hit[i] != facit_hit[i] ) {
                                printf( "0x%.2x should be hit 0x%x times, but is hit 0x%x times\n", i, facit_hit[i], hit[i] );
                        }
                        break;
                case 2 :
                        /* A suitable unsupported instruction is not filtered by the
                         * main "illegal instruction" filter, and so makes it into the
                         * table. Here it goes the the sequence that deals with 
                         * illegal instructions.
                         */
                        if ( hit[i] == 0 ) {
                                printf( "0x%.2x reserved for illegal OpCode, but is infact never hit\n", i );
                        }
                        break;
                case 3 :
                        /* There are a few locations that is accessed by other means than 
                         * an instruction sequence or as an entry point for legal or illegal OpCodes.
                         * This is the case for NMI or qualified interrupt. Not part of this test.
                         */
                        break;
                default :
                        ferr( "Que?\n" );
                }                
        }
        //printf( "\n0x%x iterations", nriter );
        exit(EXIT_SUCCESS);
}


