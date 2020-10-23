#include <stdio.h>

int main( void ) {
        int i,v;

        for ( v = 0; v < 16; v++ ) {
                printf(  "#define v%d_NOREQ -1\n", v );
                for ( i = 0; i < 256; i++ ) {
                        printf( "#define v%d_0x%2.2x 0x%x\n", v, i, v*256+i );
                }
        }
        return 0;
}
