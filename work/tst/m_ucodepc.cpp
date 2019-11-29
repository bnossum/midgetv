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

        uint32_t INSTR;

        /* The crudest way to check the OpCodes would be to iterate over
           32 bits, testing from 0x00000000 to 0xffffffff. This is nearly what I do.
           I skip testing of any number ending in 0b00, 0b01 and 0b10. 
        */
        fprintf( stderr, "Runtime around 80 seconds on a Lenovo x230.\n" );
        fprintf( stderr, "Note: If midgetv is compiled without support for MULDIV, the following 9 error messages are expected:\n"
                 "\"0x0d should be hit 0x8000 times, but is hit 0x0 times\"\n" 
                 "\"0x2d should be hit 0x8000 times, but is hit 0x0 times\"\n" 
                 "\"0x4d should be hit 0x8000 times, but is hit 0x0 times\"\n" 
                 "\"0x6d should be hit 0x8000 times, but is hit 0x0 times\"\n" 
                 "\"0x8d should be hit 0x8000 times, but is hit 0x0 times\"\n" 
                 "\"0xad should be hit 0x8000 times, but is hit 0x0 times\"\n" 
                 "\"0xcd should be hit 0x8000 times, but is hit 0x0 times\"\n" 
                 "\"0xed should be hit 0x8000 times, but is hit 0x0 times\"\n"
                 "\"0xfe: 2af96000 hits ( 2af56000 expected)\"\n"
                );
        
        int dbg = 0;
        int nmi_messageseen = 0;
        INSTR = 3;        
        do {
                tb->INSTR = INSTR;
                tb->eval();
                int minx = tb->minx;
                
                hit[minx]++;
                
                if ( reachability[minx] == 0 ) {
                        if ( pocketdissass( 1, 0, INSTR ) != -1 ) {
                                if ( dbg ) {
                                        printf( " Pocket dissasembly say: " );
                                        pocketdissass( 0, 0, INSTR );
                                        printf( "Reached index 0x%x should be inaccessible, but is reached with an instruction that should be decoded\n", minx );
                                        if ( dbg > 1 )
                                                ferr( "Aborts\n" );
                                }
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
                               (U/S/M)RET
                               WFI
                               other unsupported in same minor encoding
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
                } else if ( reachability[minx] == 3 ) {
                        if ( nmi_messageseen == 0 )
                                printf( "Hit location reserved for int/nmi\n" );
                        nmi_messageseen = 1;
                } else {
                        ferr( "Que? reachability[%d]=%d \n", minx, reachability[minx] );
                }
                INSTR += 4;
        } while ( INSTR != 3);
        

        
        int i;
        for ( i = 0; i < 256; i++ ) {
                switch ( reachability[i] ) {
                case 0 :
                        /* This entry in the table is used for microcode, and is
                         * not an entry point.
                         */
                        if ( hit[i] ) {
                                printf( "0x%.2x should be unreachable from decode, but is hit 0x%x times\n", i, hit[i] );
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
                         * table. Here it goes to the sequence that deals with 
                         * illegal instructions.
                         */
                        if ( hit[i] == 0 ) {
                                printf( "0x%.2x reserved for illegal OpCode, but is infact never hit\n", i );
                        } if ( hit[i] != mask[i] ) {
                                printf( "0x%.2x: %x hits ( %x expected)\n", i, hit[i], mask[i] );
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

/*
0x0c should be hit 0x8000 times, but is hit 0x100000 times
0x0d should be hit 0x8000 times, but is hit 0x100000 times
0x0e should be hit 0x8000 times, but is hit 0x100000 times
0x0f should be hit 0x1000000 times, but is hit 0x1100000 times
0x1c should be hit 0x1000 times, but is hit 0x400000 times
0x24 should be hit 0x8000 times, but is hit 0x400000 times
0x2c should be hit 0x8000 times, but is hit 0x100000 times
0x2d should be hit 0x8000 times, but is hit 0x100000 times
0x2e should be unreachable from decode, but is hit 1048576 times
0x2f should be hit 0x1000000 times, but is hit 0x1100000 times
0x4c should be hit 0x8000 times, but is hit 0x100000 times
0x4d should be hit 0x8000 times, but is hit 0x100000 times
0x4e should be unreachable from decode, but is hit 1048576 times
0x4f should be unreachable from decode, but is hit 1048576 times
0x6c should be hit 0x8000 times, but is hit 0x100000 times
0x6d should be hit 0x8000 times, but is hit 0x100000 times
0x6e should be unreachable from decode, but is hit 1048576 times
0x6f should be unreachable from decode, but is hit 1048576 times
0x8c should be hit 0x8000 times, but is hit 0x100000 times
0x8d should be hit 0x8000 times, but is hit 0x100000 times
0x8e should be unreachable from decode, but is hit 1048576 times
0x8f should be unreachable from decode, but is hit 1048576 times
0xa4 should be hit 0x10000 times, but is hit 0x400000 times
0xac should be hit 0x8000 times, but is hit 0x100000 times
0xad should be hit 0x8000 times, but is hit 0x100000 times
0xae should be hit 0x8000 times, but is hit 0x100000 times
0xaf should be unreachable from decode, but is hit 1048576 times
0xcc should be hit 0x8000 times, but is hit 0x100000 times
0xcd should be hit 0x8000 times, but is hit 0x100000 times
0xce should be unreachable from decode, but is hit 1048576 times
0xcf should be unreachable from decode, but is hit 1048576 times
0xec should be hit 0x8000 times, but is hit 0x100000 times
0xed should be hit 0x8000 times, but is hit 0x100000 times
0xee should be unreachable from decode, but is hit 1048576 times
0xef should be unreachable from decode, but is hit 1048576 times
*/
