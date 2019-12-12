/* The conventional way to negate a two's complement is -a = ~a + 1
 * One can equally well do -a = ~(a-1)
 * In 8 bits, this can be coded -1 = 0xFF^(a+FF)
 * and this form may be an alternative for me in midgetv microcode.
 */
#include <stdint.h>
#include <stdio.h>
int main( void ) {
        uint8_t a,b,c;
        
        a = 0;
        do {
                b = (0xff^a);
                b = b + 1;

                // Surprisingly difficult to get around explicit casting in C
                if ( a == 0 ) {
                        if ( b != 0 ) {
                                printf( "Que\n" );
                                return 0;
                        }
                } else  if ( a + b != 0x100 ) {
                        printf( "What? a=%d b=%d\n",a,b );
                }

                c = a + 0xFF;
                c = (0xff^c);

                if ( b != c ) {
                        printf( "WHY\n" );
                        return 1;
                }

                
                a++;
        } while ( a != 0 );
}
        
