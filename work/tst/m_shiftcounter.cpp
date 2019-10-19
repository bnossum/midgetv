#include <stdlib.h>
#include "Vm_shiftcounter.h"
#include "verilated.h"

int main(int argc, char **argv) {
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);

	// Create an instance of our module under test
	Vm_shiftcounter *tb = new Vm_shiftcounter;

        int sa18, sa19, B;
        int i;
        int facit_rshcnt = 0,cmbsh = 0;
        int facit_lastshift;
        int k,klim;
        
        for ( i = 0; i < 4; i++ ) {
                sa18 = (i>>1) & 1;
                sa19 = (i>>0) & 1;
                tb->sa18 = sa18;
                tb->sa19 = sa19; 

                for ( B = 0; B < 32; B++ ) {
                        tb->B = B;

                        klim = (i==3) ? 32 : 1;
                        for ( k = 0; k < klim; k++ ) {
                                
                                switch ( i & 3 ) {
                                case 0 : cmbsh = B; break;
                                case 1 : cmbsh = ((B & 3)<<3); break;
                                case 2 : cmbsh = (facit_rshcnt + 0x1f) & 63; break;
                                case 3 : break;
                                }
                                facit_lastshift = sa18 & ((cmbsh & 0x20)==0);
                                facit_rshcnt = cmbsh & 31; // After clkflank
                                
                                //printf( "sa18=%d sa19=%d B=%2x facit_lastshift=%d tb->lastshift=%d ",sa18, sa19, B, facit_lastshift, tb->lastshift );
                                
                                tb->clk = 0; // Combinatorics before flank
                                tb->eval();
                                assert( tb->lastshift == facit_lastshift );
                                
                                tb->clk = 1;  // Clock flank
                                tb->eval();
                                //printf( "facit_rshcnt = %2.2x dbg_rshcnt = %2.2x\n", facit_rshcnt, tb->dbg_rshcnt );
                                
                                assert( tb->rlastshift == facit_lastshift );
                                assert( tb->dbg_rshcnt == facit_rshcnt );
                        }
                }
        }
        exit(EXIT_SUCCESS);
}

