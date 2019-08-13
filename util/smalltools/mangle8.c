/* Small utility to generate some parameter mapping in m_ebr.
 * This is for a 8-bit wide memory, with 16-bit wide input spec.
 */
#include <stdio.h>

int main( void) {
        int i;
        int mangle8[16] = { 0, 8, 1, 9, 2, 10, 3, 11, 4, 12, 5, 13, 6, 14, 7, 15 };
        
        for ( i = (1<<12)-1; i >= 0; i-- ) { //  4 kbit
                if ( (i & 0xff) == 0xff )
                        printf( "             .INIT_%X({", i >> 8 );

//              printf( "prg0[%4x]", (i & 0xff0) + mangle8[i&15]);
                printf( "prg0[%4d]", (i & 0xff0) + mangle8[i&15]);

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


