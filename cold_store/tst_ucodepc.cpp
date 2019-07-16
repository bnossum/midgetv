/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * To check that the lowlevel and highlevel implementation give the same results.
 */

#include <stdlib.h>
#include <stdint.h>
#include <Vtst_ucodepc__Syms.h>
#include "verilated.h"
#define _main
#include "common.h"

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
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);

	// Create an instance of our module under test
	Vtst_ucodepc *tb = new Vtst_ucodepc;

        fprintf( stderr, "Runtime around 7 minutes on a Lenovo x230.\n" );
        uint32_t INSTR;
        
        /* Unintelligently check consistency of high vs low-level implementation
           when imposing diverse input
        */
        uint32_t j,jj;

        for ( j = 0; j < (1<<23); j++ ) {
                tb->corerunning = (j >>  0) & 1;
                tb->RST_I       = (j >>  1) & 1;
                tb->buserror    = (j >>  2) & 1;
                tb->qualint     = (j >>  4) & 1;
                tb->is_brcond   = (j >>  5) & 1;
                tb->sa28        = (j >>  6) & 1;
                tb->sa29        = (j >>  7) & 1;
                tb->sa30        = (j >>  8) & 1;
                tb->sa37        = (j >>  9) & 1;
                tb->sa32        = (j >> 10) & 1;
                tb->sa15        = (j >> 11) & 1;
                tb->B           = ((j >> 12) & 3) | (((j>>14)&1u)<<31);
                tb->rinx        = (j >> 15) & 255;

                for ( jj = 0; jj < 256; jj++ ) {
                        if ( reachability[jj] == 0 ||
                             reachability[jj] == 3 )
                                continue;
                        if ( reachability[jj] == 2 ) {
                                INSTR = 0x13; // ADDI instead of (unknown) illegal
                        } else {
                                INSTR = instr[jj];
                        }

                        tb->INSTR = INSTR;
                        tb->eval();
                        int minxh = tb->minxhighlevel;
                        int minxl = tb->minxlowlevel;
                        //printf ( "w" );
                        if ( minxl != minxh ) {
                                printf( "Error at j=0x%x, jj=%d, INSTR = 0x%8.8x\n", j, jj, INSTR );
                                printf( "minxh = 0x%2.2x\n", minxh );
                                printf( "minxl = 0x%2.2x\n", minxl );
                                printf( "tb->corerunning : %x\n",       tb->corerunning );
                                printf( "tb->RST_I       : %x\n",       tb->RST_I       );
                                printf( "tb->buserror    : %x\n",       tb->buserror    );
                                printf( "tb->qualint     : %x\n",       tb->qualint     );
                                printf( "tb->is_brcond   : %x\n",       tb->is_brcond   );
                                printf( "tb->sa28        : %x\n",       tb->sa28        );
                                printf( "tb->sa29        : %x\n",       tb->sa29        );
                                printf( "tb->sa30        : %x\n",       tb->sa30        );
                                printf( "tb->sa37        : %x\n",       tb->sa37        );
                                printf( "tb->sa32        : %x\n",       tb->sa32        );
                                printf( "tb->sa15        : %x\n",       tb->sa15        );
                                printf( "tb->B           : 0x%x\n",     tb->B           );
                                printf( "tb->rinx        : 0x%x\n",     tb->rinx        );
                                ferr( "Aborts\n" );
                        }
                }
        }
                        
        /* Largest task to perform, instruction decode
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


        INSTR = 3;
        do {
                tb->INSTR = INSTR;
                tb->eval();
                int minxh = tb->minxhighlevel;
                int minxl = tb->minxlowlevel;

                if ( minxl != minxh ) {
                        int lucodepcinfo = tb->v->inst_l->get_ucodepcinfo();
                        int hucodepcinfo = tb->v->inst_h->get_ucodepcinfo();
                        
                        printf( "Error at j=0x%x, jj=%d, INSTR = 0x%8.8x\n", j, jj, INSTR );
                        printf( "minxh = 0x%2.2x\n", minxh );
                        printf( "minxl = 0x%2.2x\n", minxl );
                        printf( "tb->corerunning : %x\n",       tb->corerunning );
                        printf( "tb->RST_I       : %x\n",       tb->RST_I       );
                        printf( "tb->buserror    : %x\n",       tb->buserror    );
                        printf( "tb->qualint     : %x\n",       tb->qualint     );
                        printf( "tb->is_brcond   : %x\n",       tb->is_brcond   );
                        printf( "tb->sa28        : %x\n",       tb->sa28        );
                        printf( "tb->sa29        : %x\n",       tb->sa29        );
                        printf( "tb->sa30        : %x\n",       tb->sa30        );
                        printf( "tb->sa37        : %x\n",       tb->sa37        );
                        printf( "tb->sa32        : %x\n",       tb->sa32        );
                        printf( "tb->sa15        : %x\n",       tb->sa15        );
                        printf( "tb->B           : 0x%x\n",     tb->B           );
                        printf( "tb->rinx        : 0x%x\n",     tb->rinx        );
                        printf( "High Illegal = %d\n", (hucodepcinfo >> 2) & 1 );
                        printf( "Low  Illegal = %d\n", (lucodepcinfo >> 2) & 1 );
                        ferr( "Aborts2\n" );
                }
                INSTR += 4;
        } while ( INSTR != 3);



        exit(EXIT_SUCCESS);
}


