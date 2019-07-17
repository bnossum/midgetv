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
                tb->sa04 = ( ctrl >>  0) & 1;
                tb->sa05 = ( ctrl >>  1) & 1;
                tb->sa06 = ( ctrl >>  2) & 1;
                cin      = ( ctrl >>  3) & 1;
                aluop    = ctrl & 7;
                tb->sa24 = 0; //( ctrl >>  4) & 1;
                tb->sa25 = 0; //( ctrl >>  5) & 1;
                tb->sa26 = 0; //( ctrl >>  6) & 1;
                tb->sa27 = 0; //( ctrl >>  7) & 1;
                
                cin = ( aluop == 6 ) ? 0 : cin;
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
                                case 2 : tmpB = Di & (~ADR_O); break;
                                case 3 : tmpB = ~ADR_O; break;
                                case 4 : tmpB = Di + ADR_O + cin; break;
                                case 5 : tmpB = ADR_O + ADR_O + cin; break; 
                                case 6 : tmpB = ~Di | ADR_O; break;
                                case 7 : tmpB = ADR_O + cin; break;
                                default : ferr( "Que?\n" );
                                }
                                facit_co = (tmpB >> 8) & 1;
                                facit_B  = tmpB;

                                tb->eval(); // The works.

                                if ( tb->B != facit_B )
                                        ferr( "Error\n" );

                                if ( aluop == 4 ) {
                                        if ( tb->alu_carryout != facit_co ) {
                                                ferr( "Error\n" );
                                        }
                                }

                        }
                }
        }
        exit(EXIT_SUCCESS);
}
