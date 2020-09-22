#include <unistd.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

static int expressible_in_lut4(const uint32_t f) {
        if ( f < 0x10000 )
                return 5;
        if ( ((( f >> (1<<4))^f) & 0x0000FFFF) == 0 )
                return 4;
        if ( ((( f >> (1<<3))^f) & 0x00FF00FF) == 0 )
                return 3;
        if ( ((( f >> (1<<2))^f) & 0x0F0F0F0F) == 0 )
                return 2;
        if ( ((( f >> (1<<1))^f) & 0x33333333) == 0 )
                return 1;
        if ( ((( f >> (1<<0))^f) & 0x55555555) == 0 )
                return 0;
        return -1;
}
                        
///*
//   ___                        
//b -|  |           __             
//c -|  |-----g----|  |           
//d -|  |     a ---|  |-- h
//e -|__|     b ---|  |
//            c ---|__|
//
//Can be seen as a 7 input function with restrictions. Assume a 5-input NAND
//abcde        bcde g abc h
//00000 1      0000 1 000 1
//00001 0      0001 0 000 0
//00010 0      0010 0 000 0
//00011 0      0011 0 000 0
//00100 0      0100 x 001 0
//00101 0      0101          
//             0001 0 000 0
//             0010 0 000 0
//             0011 0 000 0
//00001 0      0000 l 001 0
//             0001 o 001 0
//             0010 o 001 0
//             0011 o 001 0
//00010 0      
//...
//11111 0
//
//
//Given a 5 input function f(a,b,c,d,e).
//We try to represent it as h(g(b,c,d,e),a,b,c)
//
//*/

/////////////////////////////////////////////////////////////////////////////
//#define PRINTF(...) printf(__VA_ARGS__)
#define PRINTF(...) 

/////////////////////////////////////////////////////////////////////////////
int perm_success( uint32_t f ) {
        uint32_t j;
        uint32_t used = 0,v,h,g,w,chkeq;

        g = 0;
        for ( j = 0; j < 8; j++ ) {
                if ( (j & 1) == 0 )
                        used = 0; // For f(x,x,M,N,0) LUT1 can not yet have been used
                v = (f & (1u<<j)) ? 1 : 0;
                for ( h = 8; h < 32; h += 8 ) 
                        if ( v != ((f & (1u << (h+j))) ? 1 : 0) )
                                break;
                /* If f(x,x,M,N,U) does not depend on x the chained function
                   only uses spec in LUT2, ok
                */
                if ( h == 32 )
                        continue;
                /* If (j & 1) == 0, I know LUT1 is not used for combination M,N (the shared terms) yet.
                 * If (j & 1) == 1, the combination may still be unused 
                 */
                if ( (j & 1) == 0 ) {
                        used = 1;
                        for ( h = 0; h < 32; h += 8 ) {
                                v = (f & (1u << (h+j))) ? 1 : 0;
                                g |= (v << (1u << (h+j))); // Save a shift operation, does not use lsb of g
                        }
                        continue;
                }
                if ( ! used )
                        continue; // Do not bother to calculate LUT1 for existence of solution
                
                /* LUT1 used for this combination of shared terms when input U only to LUT2 is 0
                 * It must also be used when the input U is 1. 
                 * But then it must either match directly or inverted
                 */
                for ( h = 0; h < 32; h += 8 ) {
                        v = (f & (1u << (h+j))) ? 1 : 0;
                        w = (g & (1u << (h+j))) ? 1 : 0;
                        if ( h == 0 ) 
                                chkeq = v == w ? 1 : 0;
                        if ( (v ^ w ^ chkeq) == 0 ) {
                                /* Busted */
                                PRINTF( "Busted\n" );
                                return 0;
                        }
                }
        }
        PRINTF( "Success\n" );
        return 1;       
}

/////////////////////////////////////////////////////////////////////////////
int check2chained( uint32_t f ) {

        PRINTF( "Check fcn f=0x%x\n", f );

        /* The inputs for f can be rearranged. Naively There are  5*4*3*2 = 120 permutations.
           But by symmery I can restrict the inputs destined to the second lut to have an order
         */
        int i0,i1,i2,i3,i4;
        int permnr = 0;
        /* The input going only to the second LUT is selected freely */
        for ( i0 = 0; i0 < 5; i0++ ) {
                
                /* First shared input is selected freely, but there must be space
                 * for the second shared input, so we start at index 1*/
                for ( i1 = 1; i1 < 5; i1++ ) {
                        if ( i1 == i0 )
                                continue;
                        /* The second shared input must have a lower index than the first shared input */
                        for ( i2 = 0; i2 < i1; i2++ ) {
                                if ( i2 == i0 )
                                        continue;
                                
                                //printf( "%2d: %c%c%c\n", permnr, i0+'a', i1+'a', i2+'a' );
                                //permnr++;

                                /* The first input going only to the first LUT is selected freely, but
                                   there must be room for the second input only for the first LUT, so
                                   start at index 1
                                */
                                for ( i3 = 1; i3 < 5; i3++ ) {
                                        if ( i3 == i2 || i3 == i1 || i3 == i0 )
                                                continue;
                                        for ( i4 = 0; i4 < i3; i4++ ) {
                                                if ( i4 == i3 || i4 == i2 || i4 == i1 || i4 == i0 )
                                                        continue;
                                                PRINTF( "Permutation %2d: %c%c%c %c%c ", permnr, i0+'a', i1+'a', i2+'a', i3+'a', i4+'a' );
                                                permnr++;
                                                uint32_t k,pi,pf = 0;
                                                for ( k = 0; k < 32; k++ ) {
                                                        if ( f & (1u << k ) ) {
                                                                pi  = (((k & (1<<0)) ? 1 : 0) << i0);
                                                                pi |= (((k & (1<<1)) ? 1 : 0) << i1);
                                                                pi |= (((k & (1<<2)) ? 1 : 0) << i2);
                                                                pi |= (((k & (1<<3)) ? 1 : 0) << i3);
                                                                pi |= (((k & (1<<4)) ? 1 : 0) << i4);
                                                                pf |= (1u << pi);
                                                        }
                                                }
                                                int result = perm_success( pf );
                                                PRINTF( "%8.8x %s\n", pf, result ? "Ok" : "No go\n" );
                                                if ( result )
                                                        return 1;
                                        }
                                }
                        }
                }
        }
        return 0;
}

/////////////////////////////////////////////////////////////////////////////
uint32_t pot2(int i,...) {
        va_list ap;
        uint32_t r = 0;
        
        va_start( ap, i);        
        do {
                r |= (1u << i);
                i = va_arg(ap,int);
        } while ( i != -1);
        va_end( ap );
        return r;
}

/////////////////////////////////////////////////////////////////////////////
int main( int argc, char *argv[] ) {
        int opt,n;
        uint32_t m =  0;
        char *headerstring = NULL;
        
        while ((opt = getopt(argc, argv, "h:s:")) != -1) {
                switch (opt) {
                case 'h' : fprintf(stderr,"Use the source, Luke!\n" );
                        exit(1);
                case 's' :
                        headerstring = strdup(optarg);
                }
        }
        if ( optind >= argc ) {
                fprintf( stderr, "List of minterms expected\n" );
                exit(4);
        }
        for ( ; optind < argc; optind++ ) {
                //printf( "[%s]", argv[optind] );
                n = strtoul( argv[optind], NULL, 0 );
                //printf( "%d ", n );
                m |= (1u << n);
        }
        
        
        //Contribution of c[7] in e15 :
        //m = pot2(2 ,4 ,6 ,8 ,12 ,14 ,15 ,16 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31,-1);

        if ( headerstring ) 
                printf( "%s", headerstring );
        if ( expressible_in_lut4(m) != -1 ) {
                printf( "Expressible in lut4.\n");
        } else if ( check2chained(m) ) {
                printf( "Expressible as two chained luts\n" );
        } else {
                printf( "Need a true 5-input structure\n" );
        }
        return 0;
}

                        
