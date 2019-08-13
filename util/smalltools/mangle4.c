/* Small utility to generate some parameter mapping in m_ebr.
 * This is for a 4-bit wide memory
 */
#include <stdio.h>

int main( void) {
        int i;
        int mangle4[16] = { 0, 4, 8, 12, 1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15 };
        
        for ( i = (1<<12)-1; i >= 0; i-- ) { //  4 kbit
                if ( (i & 0xff) == 0xff )
                        printf( "             .INIT_%X({", i >> 8 );

//              printf( "prg0[%4x]", (i & 0xff0) + mangle4[i&15]);
                printf( "prg0[%4d]", (i & 0xff0) + mangle4[i&15]);

                if ( (i & 0xff) != 0 ) {
                        printf( "," );
                        if ( (i & 0x7) == 0 )
                                printf( "\n                      " );
                } else {
                        printf( "}),\n" );
                }
        }

        return 0;
}


