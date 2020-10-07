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
#define X(label,text,ty,pos,value,reachability,mask,instr,nrhit) reachability,
#include fname
};

uint32_t mask[256] = {
#define X(label,text,ty,pos,value,reachability,mask,instr,nrhit) mask,
#include fname
};

uint32_t facit_hit[256] = {
#define X(label,text,ty,pos,value,reachability,mask,instr,nrhit) nrhit,
#include fname
};
        
uint32_t instr[256] = {
#define X(label,text,ty,pos,value,reachability,mask,instr,nrhit) instr,
#include fname
};
        
int main(int argc, char **argv) {
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);
        uint32_t hit[256] = { 0, };
        uint8_t suspend[256] = { 0, };

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
        
        int dbg = 2;
        int nmi_messageseen = 0;
        INSTR = 3;        

        do {
                tb->INSTR = INSTR;
                tb->eval();
                int minx = tb->minx;
                
                hit[minx]++;
                
                if ( reachability[minx] == 0 ) {
                        if ( !suspend[minx] ) {

                                if ( pocketdissass( 1, 0, INSTR ) != -1 ) 
                                        printf( "\nReached index 0x%x should be inaccessible, but is reached with an instruction that should be decoded\n", minx );
                                if ( dbg ) {
                                        printf( "A problem at base instruction 0x%8.8x\n", INSTR );
                                        printf( "Pocked dissasembly say: " );
                                        pocketdissass( 0, 0, INSTR );
                                        printf( "\nminx = 0x%2.2x\n", minx );
                                        
                                        if ( dbg > 2 )
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
                                        //0x02001013
                                        printf( "Problem at base instruction 0x%8.8x\n", INSTR );
                                        printf( "Pocked dissasembly say: " );
                                        pocketdissass( 0, 0, INSTR );
                                        printf( "\nminx = 0x%2.2x\n", minx );
                                        printf( "instr[minx] & mask[minx] = %8.8x & %8.8x = %8.8x\n",
                                                instr[minx], mask[minx], (instr[minx] & mask[minx]) );
                                        printf( "INSTR       & mask[minx] = %8.8x & %8.8x = %8.8x\n",
                                                INSTR     , mask[minx], (INSTR & mask[minx]) );
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
0x00 should be hit 0x400000 times, but is hit 0x40000000 times
0x02 should be hit 0x400000 times, but is hit 0x0 times
0x03 should be hit 0x400000 times, but is hit 0x0 times
0x04 should be hit 0x400000 times, but is hit 0x0 times
0x05 should be hit 0x1000000 times, but is hit 0x0 times
0x08 should be hit 0x200000 times, but is hit 0x0 times
0x0a should be hit 0x200000 times, but is hit 0x0 times
0x0c should be hit 0x8000 times, but is hit 0x0 times
0x0d should be hit 0x8000 times, but is hit 0x0 times
0x0e should be hit 0x8000 times, but is hit 0x0 times
0x0f should be hit 0x1000000 times, but is hit 0x0 times
0x18 should be hit 0x400000 times, but is hit 0x0 times
0x19 should be hit 0x400000 times, but is hit 0x0 times
0x1b should be hit 0x800000 times, but is hit 0x0 times
0x1c should be hit 0x1000 times, but is hit 0x0 times
0x20 should be hit 0x400000 times, but is hit 0x0 times
0x22 reserved for illegal OpCode, but is infact never hit
0x22: 0 hits ( 400000 expected)
0x23 should be hit 0x400000 times, but is hit 0x0 times
0x24 should be hit 0x8000 times, but is hit 0x0 times
0x25 should be hit 0x1000000 times, but is hit 0x0 times
0x28 should be hit 0x200000 times, but is hit 0x0 times
0x2a should be hit 0x200000 times, but is hit 0x0 times
0x2c should be hit 0x8000 times, but is hit 0x0 times
0x2d should be hit 0x8000 times, but is hit 0x0 times
0x2f should be hit 0x1000000 times, but is hit 0x0 times
0x38 should be hit 0x400000 times, but is hit 0x0 times
0x39 reserved for illegal OpCode, but is infact never hit
0x39: 0 hits ( 400000 expected)
0x3b should be hit 0x800000 times, but is hit 0x0 times
0x3c should be hit 0x400000 times, but is hit 0x0 times
0x40 should be hit 0x400000 times, but is hit 0x0 times
0x42 reserved for illegal OpCode, but is infact never hit
0x42: 0 hits ( 400000 expected)
0x43 reserved for illegal OpCode, but is infact never hit
0x43: 0 hits ( 400000 expected)
0x44 should be hit 0x400000 times, but is hit 0x0 times
0x48 should be hit 0x200000 times, but is hit 0x0 times
0x4a should be hit 0x200000 times, but is hit 0x0 times
0x4c should be hit 0x8000 times, but is hit 0x0 times
0x4d should be hit 0x8000 times, but is hit 0x0 times
0x58 reserved for illegal OpCode, but is infact never hit
0x58: 0 hits ( 400000 expected)
0x59 reserved for illegal OpCode, but is infact never hit
0x59: 0 hits ( 400000 expected)
0x5b should be hit 0x800000 times, but is hit 0x0 times
0x5c should be hit 0x400000 times, but is hit 0x0 times
0x60 reserved for illegal OpCode, but is infact never hit
0x60: 0 hits ( 400000 expected)
0x62 reserved for illegal OpCode, but is infact never hit
0x62: 0 hits ( 400000 expected)
0x63 reserved for illegal OpCode, but is infact never hit
0x63: 0 hits ( 400000 expected)
0x64 should be hit 0x400000 times, but is hit 0x0 times
0x68 reserved for illegal OpCode, but is infact never hit
0x68: 0 hits ( 200000 expected)
0x6a reserved for illegal OpCode, but is infact never hit
0x6a: 0 hits ( 200000 expected)
0x6c should be hit 0x8000 times, but is hit 0x0 times
0x6d should be hit 0x8000 times, but is hit 0x0 times
0x78 reserved for illegal OpCode, but is infact never hit
0x78: 0 hits ( 400000 expected)
0x79 reserved for illegal OpCode, but is infact never hit
0x79: 0 hits ( 400000 expected)
0x7b should be hit 0x800000 times, but is hit 0x0 times
0x7c should be hit 0x400000 times, but is hit 0x0 times
0x80 should be hit 0x400000 times, but is hit 0x0 times
0x82 reserved for illegal OpCode, but is infact never hit
0x82: 0 hits ( 400000 expected)
0x83 reserved for illegal OpCode, but is infact never hit
0x83: 0 hits ( 400000 expected)
0x84 should be hit 0x400000 times, but is hit 0x0 times
0x88 reserved for illegal OpCode, but is infact never hit
0x88: 0 hits ( 200000 expected)
0x8a reserved for illegal OpCode, but is infact never hit
0x8a: 0 hits ( 200000 expected)
0x8c should be hit 0x8000 times, but is hit 0x0 times
0x8d should be hit 0x8000 times, but is hit 0x0 times
0x98 should be hit 0x400000 times, but is hit 0x0 times
0x99 reserved for illegal OpCode, but is infact never hit
0x99: 0 hits ( 400000 expected)
0x9c reserved for illegal OpCode, but is infact never hit
0x9c: 0 hits ( 1000 expected)
0xa0 should be hit 0x400000 times, but is hit 0x0 times
0xa2 reserved for illegal OpCode, but is infact never hit
0xa2: 0 hits ( 400000 expected)
0xa3 reserved for illegal OpCode, but is infact never hit
0xa3: 0 hits ( 400000 expected)
0xa4 should be hit 0x10000 times, but is hit 0x0 times
0xa8 reserved for illegal OpCode, but is infact never hit
0xa8: 0 hits ( 200000 expected)
0xaa reserved for illegal OpCode, but is infact never hit
0xaa: 0 hits ( 200000 expected)
0xac should be hit 0x8000 times, but is hit 0x0 times
0xad should be hit 0x8000 times, but is hit 0x0 times
0xae should be hit 0x8000 times, but is hit 0x0 times
0xb8 should be hit 0x400000 times, but is hit 0x0 times
0xb9 reserved for illegal OpCode, but is infact never hit
0xb9: 0 hits ( 400000 expected)
0xbc should be hit 0x400000 times, but is hit 0x0 times
0xc0 reserved for illegal OpCode, but is infact never hit
0xc0: 0 hits ( 400000 expected)
0xc2 reserved for illegal OpCode, but is infact never hit
0xc2: 0 hits ( 400000 expected)
0xc3 reserved for illegal OpCode, but is infact never hit
0xc3: 0 hits ( 400000 expected)
0xc4 should be hit 0x400000 times, but is hit 0x0 times
0xc8 reserved for illegal OpCode, but is infact never hit
0xc8: 0 hits ( 200000 expected)
0xca reserved for illegal OpCode, but is infact never hit
0xca: 0 hits ( 200000 expected)
0xcc should be hit 0x8000 times, but is hit 0x0 times
0xcd should be hit 0x8000 times, but is hit 0x0 times
0xd8 should be hit 0x400000 times, but is hit 0x0 times
0xd9 reserved for illegal OpCode, but is infact never hit
0xd9: 0 hits ( 400000 expected)
0xdc should be hit 0x400000 times, but is hit 0x0 times
0xe0 reserved for illegal OpCode, but is infact never hit
0xe0: 0 hits ( 400000 expected)
0xe2 reserved for illegal OpCode, but is infact never hit
0xe2: 0 hits ( 400000 expected)
0xe3 reserved for illegal OpCode, but is infact never hit
0xe3: 0 hits ( 400000 expected)
0xe4 should be hit 0x400000 times, but is hit 0x0 times
0xe8 reserved for illegal OpCode, but is infact never hit
0xe8: 0 hits ( 200000 expected)
0xea reserved for illegal OpCode, but is infact never hit
0xea: 0 hits ( 200000 expected)
0xec should be hit 0x8000 times, but is hit 0x0 times
0xed should be hit 0x8000 times, but is hit 0x0 times
0xf8 should be hit 0x400000 times, but is hit 0x0 times
0xf9 reserved for illegal OpCode, but is infact never hit
0xf9: 0 hits ( 400000 expected)
0xfc should be hit 0x400000 times, but is hit 0x0 times
0xfe reserved for illegal OpCode, but is infact never hit
0xfe: 0 hits ( 2af56000 expected)
*/
