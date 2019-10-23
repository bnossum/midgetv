/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * To exercise module m_alu_carryin.
 */

/* Commands to compile this:
 2093  verilator -Wall -I.. -cc ../m_alu_carryin.v 
 2094  cd obj_dir; make -f Vm_alu_carryin.mk; cd ..
 2095  g++ -I obj_dir -I/usr/share/verilator/include main_m_alu_carryin.cpp obj_dir/Vm_alu_carryin__ALL.a /usr/share/verilator/include/verilated.cpp -o m_alu_carryin
 2096  ./m_alu_carryin 
*/

#include <stdlib.h>
#include "Vm_alu_carryin.h"
#include "verilated.h"

int main(int argc, char **argv) {
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);

	// Create an instance of our module under test
	Vm_alu_carryin *tb = new Vm_alu_carryin;

	// Run through all inputs combinations, then done.
        int inputvariables;

        for ( inputvariables = 0; inputvariables < (1<<6); inputvariables++ ) {
                tb->lastshift     = (inputvariables>>5) & 1;
                tb->s_alu_carryin = (inputvariables>>3) & 3;
                tb->raluF         = (inputvariables>>2) & 1;
                tb->FUNC7_5       = (inputvariables>>1) & 1;
                tb->ADR_O         = (inputvariables>>0) & 1 ? 0x80000000u : 0;

                tb->clk = 0;
                tb->eval();
                tb->clk = 1;
                tb->eval();

                switch ( tb->s_alu_carryin ) {
                case 0b00 : assert( tb->alu_carryin == 0); break;
                case 0b11 : assert( tb->alu_carryin == 1); break;
                default :
                        if ( !( tb->alu_carryin == tb->raluF )) {
                                printf( "input = %#x, tb->alu_carryin = %d, tb->raluF = %d\n",
                                        inputvariables, tb->alu_carryin, tb->raluF );
                        }
                        assert( tb->alu_carryin == tb->raluF );
                        break;
                }
                
                if ( tb->FUNC7_5 == 0 ) {
                        assert( tb->sra_msb == 0 );
                } else {
                        assert( tb->sra_msb == (tb->ADR_O>>31) );
                }

                assert( tb->rlastshift == tb->lastshift );
                                
	} 
        exit(EXIT_SUCCESS);
}
