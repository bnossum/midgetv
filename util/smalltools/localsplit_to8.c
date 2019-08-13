/* Small utility to generate some parameter mapping in m_ebr.
 * Splits 16-but spec to 2 8-bit soecs
 */
#include <stdio.h>

int main( void) {
        int i;

        for ( i = (1<<15)-16; i >= 0; i -= 16 ) { // 32 kbit maximum size
//      for ( i = (1<<13)-16; i >= 0; i -= 16 ) { //  8 kbit minimum size
                if ( (i & 0x1ff0) == 0x1ff0 )
                        printf( "         localparam [4095:0]\n           pb%X = {", i >> 13 );

//              printf( "prg%X[%4x:%4x]", i >> 12, (i+7) & 0xfff, (i+0) & 0xfff );
                printf( "prg%X[%4d:%4d]", i >> 12, (i+7) & 0xfff, (i+0) & 0xfff );
                
                if ( (i & 0x1ff0) != 0 ) {
                        printf( "," );
                        if ( (i & 0x70) == 0 )
                                printf( "\n                  " );
                } else {
                        printf( "};\n" );
                }
        }

        for ( i = (1<<15)-16; i >= 0; i -= 16 ) { // 32 kbit maximum size
                if ( (i & 0x1ff0) == 0x1ff0 )
                        printf( "         localparam [4095:0]\n           ph%X = {", i >> 13 );

                printf( "prg%X[%4d:%4d]", i >> 12, (i+15) & 0xfff, (i+8) & 0xfff );
                
                if ( (i & 0x1ff0) != 0 ) {
                        printf( "," );
                        if ( (i & 0x70) == 0 )
                                printf( "\n                  " );
                } else {
                        printf( "};\n" );
                }
        }

        return 0;
}


