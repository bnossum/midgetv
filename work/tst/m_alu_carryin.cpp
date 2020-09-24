/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * To exercise module m_alu_carryin.
 * Note: TODO: Presently this test is valid for parameter MULDIV == 1. Make a 
 * wrapper verilog file to test the 4 permutations we have of m_alu_carryin.
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

        for ( inputvariables = 0; inputvariables < (1<<9); inputvariables++ ) {
                tb->muldivregmsb  = (inputvariables>>8) & 1;
                tb->mod_s_alu_1   = (inputvariables>>7) & 1;
                tb->s_alu_1       = (inputvariables>>6) & 1;
                tb->lastshift     = (inputvariables>>5) & 1;
                tb->s_alu_carryin = (inputvariables>>3) & 3;
                tb->raluF         = (inputvariables>>2) & 1;
                tb->FUNC7_5       = (inputvariables>>1) & 1;
                tb->ADR_O_31      = (inputvariables>>0) & 1;

                tb->clk = 0;
                tb->eval();
                tb->clk = 1;
                tb->eval();

                int mod_s_alucarryin = (tb->mod_s_alu_1 ^ tb->s_alu_1) ? 0 : tb->s_alu_carryin;
                int mod_raluF = (tb->s_alu_carryin>>1) ? tb->muldivregmsb : tb->raluF;
                
                //printf( "mod_s_alucarryin == 0b%d%d\n", (mod_s_alucarryin>>1) & 1, (mod_s_alucarryin & 1) );
                
                switch ( (tb->ADR_O_31<<2) | mod_s_alucarryin ) {
                case 0b000 :
                case 0b100 : assert( tb->alu_carryin == 0); break;
                case 0b001 :
                case 0b010 :
                        if ( !( tb->alu_carryin == mod_raluF )) {
                                printf( "input = %#x, tb->alu_carryin = %d, mod_raluF = %d\n",
                                        inputvariables, tb->alu_carryin, mod_raluF );
                        }
                        assert( tb->alu_carryin == mod_raluF );
                        break;
                case 0b011 :
                case 0b111 : assert( tb->alu_carryin == 1); break;
                case 0b101 : // Not used
                case 0b110 : // Not used
                        break;
                default: assert( 1 == 0 );
                }

                switch ( (tb->FUNC7_5<<1) | tb->FUNC7_0) {
                case 0b00 : assert( tb->sra_msb == 0 ); break;
                case 0b01 : assert( tb->sra_msb == mod_raluF ); break;
                case 0b10 : 
                case 0b11 : assert( tb->sra_msb == (tb->ADR_O_31) ); break;
                default :
                        assert( 1 == 0 );
                }

                assert( tb->rlastshift == tb->lastshift );
                                
	} 
        exit(EXIT_SUCCESS);
}
