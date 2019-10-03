/* Small utility to generate some parameter mapping in m_ebr.
 */
#include <stdio.h>

int main( void) {
        int i;

        for ( i = (1<<16)-32; i >= 0; i -= 32 ) { // 64 kbit maximum size
//      for ( i = (1<<13)-32; i >= 0; i -= 32 ) { //  8 kbit minimum size
                if ( (i & 0x1fe0) == 0x1fe0 )
                        printf( "   localparam [4095:0]\n     pb%X = {", i >> 13 );

//              printf( "prg0%X[%4x:%4x]", i >> 12, (i+15) & 0xfff, (i+0) & 0xfff );
                printf( "prg0%X[%4d:%4d]", i >> 12, (i+15) & 0xfff, (i+0) & 0xfff );
                
                if ( (i & 0x1fe0) != 0 ) {
                        printf( "," );
                        if ( (i & 0xe0) == 0 )
                                printf( "\n            " );
                } else {
                        printf( "};\n" );
                }
        }

        for ( i = (1<<16)-32; i >= 0; i -= 32 ) { // 64 kbit maximum size
                if ( (i & 0x1fe0) == 0x1fe0 )
                        printf( "   localparam [4095:0]\n     ph%X = {", i >> 13 );

                printf( "prg0%X[%4d:%4d]", i >> 12, (i+31) & 0xfff, (i+16) & 0xfff );
                
                if ( (i & 0x1fe0) != 0 ) {
                        printf( "," );
                        if ( (i & 0xe0) == 0 )
                                printf( "\n            " );
                } else {
                        printf( "};\n" );
                }
        }
        return 0;
}


