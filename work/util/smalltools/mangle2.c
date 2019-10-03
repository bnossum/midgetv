/* Small utility to generate some parameter mapping in m_ebr.
 * This is for 2-bit wide EBR.
 */
#include <stdio.h>

int main( void) {
        int i;
        int mangle2[16] = { 0, 2, 4, 6, 8, 10, 12, 14, 1, 3, 5, 7, 9, 11, 13, 15 };
        
        for ( i = (1<<12)-1; i >= 0; i-- ) { //  4 kbit
                if ( (i & 0xff) == 0xff )
                        printf( "       .INIT_%X({", i >> 8 );

                printf( "prg0[%4d]", (i & 0xff0) + mangle2[i&15]);

                if ( (i & 0xff) != 0 ) {
                        printf( "," );
                        if ( (i & 0x7) == 0 )
                                printf( "\n                " );
                } else {
                        printf( "}),\n" );
                }
        }

        return 0;
}


