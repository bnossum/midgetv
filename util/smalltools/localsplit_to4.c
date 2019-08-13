/* Small utility to generate some parameter mapping in m_ebr. Split to nibbles
 */
#include <stdio.h>

int main( void) {
        int i;

        for ( i = (1<<14)-8; i >= 0; i -= 8 ) { // 16 kbit maximum size
                if ( (i & 0x1ff8) == 0x1ff8 )
                        printf( "         localparam [4095:0]\n           pb%X = {", i >> 13 );

//              printf( "prg%X[%4x:%4x]", i >> 12, (i+3) & 0xfff, (i+0) & 0xfff );
                printf( "prg%X[%4d:%4d]", i >> 12, (i+3) & 0xfff, (i+0) & 0xfff );
                
                if ( (i & 0x1ff8) != 0 ) {
                        printf( "," );
                        if ( (i & 0x38) == 0 )
                                printf( "\n                  " );
                } else {
                        printf( "};\n" );
                }
        }

        for ( i = (1<<14)-8; i >= 0; i -= 8 ) { // 16 kbit maximum size
                if ( (i & 0x1ff8) == 0x1ff8 )
                        printf( "         localparam [4095:0]\n           ph%X = {", i >> 13 );

                printf( "prg%X[%4d:%4d]", i >> 12, (i+7) & 0xfff, (i+4) & 0xfff );
                
                if ( (i & 0x1ff8) != 0 ) {
                        printf( "," );
                        if ( (i & 0x38) == 0 )
                                printf( "\n                  " );
                } else {
                        printf( "};\n" );
                }
        }

        return 0;
}


