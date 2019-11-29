/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * To exercise module m_alu.
 * This is not a full simulation
 */

#include <stdlib.h>
#include <stdint.h>
#include <Vm_alu__Syms.h>
#include "verilated.h"

#define ferr(...) exit(fprintf(stderr,"%s:%d:", __FILE__, __LINE__ )+fprintf(stderr,__VA_ARGS__))

/////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
        uint32_t ctrl, cin, aluop, ADR_O, Di, Di_start, QQ;
        uint32_t tmpB,facit_co;
        uint8_t facit_B;

	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);

	// Create an instance of our module under test
	Vm_alu *tb = new Vm_alu;


        for ( ctrl = 0; ctrl < (1<<4); ctrl++ ) {
                /* Want to check all combinations of carry-in and
                 * ALU operations. I do not check mtime and 
                 * minstretofl constructions */
                tb->s_alu = ctrl & 7;
                cin      = ( ctrl >>  3) & 1;
                aluop    = tb->s_alu;
                tb->sa24 = 0; 
                tb->sa25 = 0; 
                tb->sa26 = 0; 
                tb->sa27 = 0; 
                
                cin = ( aluop == 7 ) ? 0 : cin;
                tb->alu_carryin = cin;
                
                for ( ADR_O = 0; ADR_O < 256; ADR_O++ ) {
                        
                        Di_start = ( aluop == 5 ) ? 255 : 0;
                        for ( Di = Di_start; Di < 256; Di++ ) {
                                QQ = ADR_O;
                                
                                tb->Di = Di;
                                tb->ADR_O = ADR_O;
                                tb->QQ = QQ;
                                
                                switch ( aluop ) {
                                case 0 : tmpB = Di^(~ADR_O); break;
                                case 1 : tmpB = Di; break;
                                case 2 : tmpB = ~ADR_O; break;
                                case 3 : tmpB = Di & (~ADR_O); break;
                                case 4 : tmpB = Di + ADR_O + cin; break;
                                case 5 : tmpB = ADR_O + ADR_O + cin; break; 
                                case 6 : tmpB = ADR_O + cin; break;
                                case 7 : tmpB = ~Di | ADR_O; break;
                                default : ferr( "Que?\n" );
                                }
                                facit_co = (tmpB >> 8) & 1;
                                facit_B  = tmpB;

                                tb->eval(); // The works.

                                if ( tb->B != facit_B )
                                        ferr( "Error. ctrl=%x aluop=%d Di=%x ADR_O=%d facit_B = %x tb->B = %x\n",
                                              ctrl, aluop, Di, ADR_O, facit_B, tb->B );

                                if ( aluop == 4 ) {
                                        if ( tb->alu_carryout != facit_co ) {
                                                ferr( "Carry out error when ctrl = 0x%x. "
                                                      "Di=%x, ADR_O=%d, cin=%d\n"
                                                      "facti_co=%d while tb->alu_carryout=%d\n",
                                                      ctrl, Di, ADR_O, cin,
                                                      facit_co, tb->alu_carryout
                                                        );
                                        }
                                }

                        }
                }
        }
        exit(EXIT_SUCCESS);
}
