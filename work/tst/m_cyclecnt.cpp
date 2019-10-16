#include <stdlib.h>
#include "Vm_cyclecnt.h"
#include "verilated.h"

#define NO_CYCLECNT 0 // *Must* match definition in m_cyclecnt.v


/////////////////////////////////////////////////////////////////////////////
void sim_with_no_cyclecnt( void ) {
	Vm_cyclecnt *tb = new Vm_cyclecnt;	
        int i;
        uint32_t ADR_O;
        int sa16,sa17;
        
        // As long as start is low:
        // QQ[] is don't care.
        // buserror == 0 always when we have no cyclecounter
        // corerunning should remain low
        tb->start = 0;
        for ( i = 0; i < 8; i++ ) {
                tb->clk = i & 1;
                tb->eval();
                assert( tb->corerunning == 0 );
                assert( tb->buserror == 0 );
        }

        // Just to hammer it home - the core is only running after 
        // a clock transition low high after tb->start is high
        tb->start = 1;
        tb->eval();
        assert( tb->corerunning == 0 );
        tb->clk = 0;
        tb->eval();
        assert( tb->corerunning == 0 );
        
        for ( sa17 = 0; sa17 < 2; sa17++ ) {
                tb->sa17 = sa17;
                for ( sa16 = 0; sa16 < 2; sa16++ ) {
                        tb->sa16 = sa16;
                        for ( ADR_O = 0; ADR_O < 0x40; ADR_O++ ) {
                                tb->ADR_O = ADR_O;
                                for ( i = 0; i < 2; i++ ) {
                                        tb->clk = i & 1;
                                        tb->eval();
                                }
                                assert( tb->corerunning == 1 );
                                assert( tb->buserror == 0 );
                                switch ( sa17*2+sa16 ) {
                                case 0b00 : assert( tb->QQ == (ADR_O | 3) ); break;
                                case 0b01 :
                                case 0b11 : assert( tb->QQ == (ADR_O | 1) ); break;
                                case 0b10 :
                                        if ( ( tb->QQ == ADR_O ) == 0 ) {
                                                printf( "Can't believe I can miss out here: "
                                                        "tb-QQ=%d ADR_O=%d\n", tb->QQ, ADR_O );
                                        }
                                        assert( tb->QQ == ADR_O );
                                        break;
                                }
                        }

                }
        }
        
}
        
        
/////////////////////////////////////////////////////////////////////////////
void toggleclockandeval( Vm_cyclecnt *tb ) {
        tb->clk = 0;
        tb->eval();
        tb->clk = 1;
        tb->eval();
}

/////////////////////////////////////////////////////////////////////////////
void sim_with_cyclecnt( void ) {
	Vm_cyclecnt *tb = new Vm_cyclecnt;	
        int i,k;
        uint32_t ADR_O;

        tb->STB_O = 0;
        // Start must be high for 128 consequtive cycles to release the core.
        for ( k = 0; k < 65+64; k++ ) {
                //fprintf( stderr, "\nk=%2.2x:", k );
                for ( i = 0; i < k; i++ ) {
                        if ( i == 0 ) {
                                tb->start = 0;
                        } else {
                                tb->start = 1;
                        }
                        toggleclockandeval(tb);
                        //fprintf( stderr, "%d", tb->corerunning );
                        if ( i < 64+64 ) {
                                if ( tb->corerunning != 0 ) {
                                        fprintf( stderr, "k=%d i=%d running?\n", k, i );
                                        exit(3);
                                }
                                assert( tb->corerunning == 0 );
                        }  else {
                                assert( tb->corerunning == 1 );
                        }
                }
        }

        // From now the state of start does not matter for tb->corerunning
        for ( i = 0; i < 300; i++ ) {
                tb->start = random() & 1;
                toggleclockandeval(tb);
                assert( tb->corerunning == 1 );
        }
        // But the state of start matter for the counting value.
        tb->start = 1;

        tb->STB_O = 1;
        /* Setting sa16 should lead to rccnt == 1
         * When counting we should periodically see buserror when STB_O is set
         */
        for ( k = 0; k < 600; k++ ) {
                tb->sa16 = 1;
                toggleclockandeval(tb);
                assert( tb->corerunning == 1 );
                if ( ! (tb->dbg_rccnt == 1) ) {
                        printf( "tb->dbg_rccnt = %d\n", tb->dbg_rccnt );
                }
                assert( tb->dbg_rccnt == 1 );
                tb->sa16 = 0;
                for ( i = 0; i < k; i++ ) {

                        /* I do not model the IO read/write logic here,
                         * so simply assume we are in an IO read/write that is aborted
                         * after 63 cycles
                         */
                        tb->STB_O = tb->dbg_rccnt > 62 ? 0 : 1;
                        
                        toggleclockandeval(tb);
                        assert( tb->corerunning == 1 );
                        assert( tb->dbg_rccnt == ((i + 2) & 127) );
                        //fprintf( stderr, "i=%#x, dbg_rccnt=%#x buserror=%d\n", i, tb->dbg_rccnt, tb->buserror );
                        if ( ((i+2) & 127) == 48 ) {
                                assert( tb->buserror == 1 );
                        } else {
                                assert( tb->buserror == 0 );
                        }
                }
        }
        /* Same loop as above, but here I check muxing of 
         * output value.
         */
        for ( ADR_O = 0; ADR_O < 400; ADR_O++ ) {
                tb->ADR_O = ADR_O;
                for ( k = 0; k < 600; k++ ) {
                        tb->sa17 = 0;
                        tb->sa16 = 1;
                        toggleclockandeval(tb);
                        assert( (tb->QQ & 63) == tb->dbg_rccnt );
                        tb->sa17 = 1;
                        tb->eval();
                        assert( (tb->QQ & 63) == tb->dbg_rccnt );
                        tb->sa16 = 0;
                        for ( i = 0; i < k; i++ ) {
                                tb->sa17 = 0;
                                toggleclockandeval(tb);
                                assert( tb->QQ == (ADR_O | 3) );
                                tb->sa17 = 1;
                                tb->eval();
                                assert( tb->QQ == ADR_O );
                        }
                }
        }
}

        
        
        
/////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);

        if ( NO_CYCLECNT ) {
                sim_with_no_cyclecnt();
        } else {
                sim_with_cyclecnt();
        }
#if 0        
        int sa16,sa17;
        unsigned int ADR_O;
        int facit_cyclecnt = 0;
        int idle_some_cycles;
        
        for ( ADR_O = 0; ADR_O < 256; ADR_O++ ) {
                for ( sa16 = 0; sa16 < 2; sa16++ ) {
                        for ( sa17 = 0; sa17 < 2; sa17++ ) {
                                for ( idle_some_cycles = 0; idle_some_cycles < 4; idle_some_cycles++ ) {
                                        tb->ADR_O = ADR_O;
                                        tb->sa16 = sa16;
                                        tb->sa17 = sa17;
                                        
                                        // Ensure combinatorical before rising clock has settled
                                        tb->clk = 0;
                                        tb->eval();
                                        
                                        

                                        switch ( sa17*2 + sa16 ) {
                                        case 0b00 : assert( tb->QQ == (ADR_O | 3) ); break;
                                        case 0b01 :
                                        case 0b11 :
                                                if ( idle_some_cycles == 0 ) {
                                                        //printf( "facit=%x QQ=%x\n", (ADR_O & 0xc0)  | facit_cyclecnt, tb->QQ );
                                                        assert( tb->QQ == ( (ADR_O & 0xc0) | facit_cyclecnt) ); break;
                                                }
                                                break;
                                        case 0b10 : assert( tb->QQ == ADR_O ); break;
                                        }
                                        
                                        if ( sa16 )
                                                facit_cyclecnt = 0;

                                        // Rising clock, evaluate
                                        tb->clk = 1;
                                        tb->eval();
                                        facit_cyclecnt++;
                                        //  // Probably not needed, combinatorics after clock low
                                        //  tb->clk = 0;                                
                                        //  tb->eval();
                                        
                                }
                        }
                }
        }
#endif
        exit(EXIT_SUCCESS);
}
