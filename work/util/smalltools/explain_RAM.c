/* The SB_RAM40_4K is not easy to understand.
 * In particular, it is difficult to see how to initiate 
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define ferr(...) exit(fprintf(stderr,__VA_ARGS__))

typedef struct {
        uint32_t m[16];
} MEMLINE;

MEMLINE memory[256];


void initialize_ram( int mode ) {
        int bit, adr;
        int linearbitnr = 0;

        for ( adr = 0; adr < 256; adr++ ) 
                for ( bit = 0; bit < 16; bit++ ) 
                        memory[adr].m[bit] = 0;
        
        /* We do not only have 4096 bits, but 4096 uint32_t's for tracability
         */
        switch ( mode ) {
        case 0 :
                for ( adr = 0; adr < 256; adr++ ) {
                        for ( bit = 0; bit < 16; bit++ ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                }
                break;
        case 1 :
//                for ( adr = 0; adr < 1; adr++ ) {
//                        for ( bit = 0; bit < 16; bit++ ) {
//                                memory[adr].m[bit] = linearbitnr;
//                                linearbitnr++;
//                        }
//                }
//                memory[0].m[ 0] = 0;
//                memory[0].m[ 1] = 8;
//                memory[0].m[ 2] = 1;
//                memory[0].m[ 3] = 9;
//                memory[0].m[ 4] = 2;
//                memory[0].m[ 5] = 10;
//                memory[0].m[ 6] = 3;
//                memory[0].m[ 7] = 11;
//
//                memory[0].m[ 8] = 4;
//                memory[0].m[ 9] = 12;
//                memory[0].m[10] = 5;
//                memory[0].m[11] = 13;
//                memory[0].m[12] = 6;
//                memory[0].m[13] = 14;
//                memory[0].m[14] = 7;
//                memory[0].m[15] = 15;
                for ( adr = 0; adr < 256; adr++ ) {
                        for ( bit = 0; bit < 16; bit += 2 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 1; bit < 16; bit += 2 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                }
                break;
        case 2 :
//                for ( adr = 0; adr < 1; adr++ ) {
//                        for ( bit = 0; bit < 16; bit++ ) {
//                                memory[adr].m[bit] = linearbitnr;
//                                linearbitnr++;
//                        }
//                }
                
//                memory[0].m[ 0] = 0;
//                memory[0].m[ 1] = 4;
//                memory[0].m[ 2] = 8;
//                memory[0].m[ 3] = 12;
//                memory[0].m[ 4] = 1;
//                memory[0].m[ 5] = 5;
//                memory[0].m[ 6] = 9;
//                memory[0].m[ 7] = 13;
//                memory[0].m[ 8] = 2;
//                memory[0].m[ 9] = 6;
//                memory[0].m[10] = 10;
//                memory[0].m[11] = 14;
//                memory[0].m[12] = 3;
//                memory[0].m[13] = 7;
//                memory[0].m[14] = 11;
//                memory[0].m[15] = 15;
//000 RAM4[000] = {_000,_004,_008,_00c}
//001 RAM4[100] = {_001,_005,_009,_00d}
//002 RAM4[200] = {_002,_006,_00a,_00e}
//003 RAM4[300] = {_003,_007,_00b,_00f}
              
                for ( adr = 0; adr < 256; adr++ ) {
                        for ( bit = 0; bit < 16; bit += 4 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 1; bit < 16; bit += 4 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 2; bit < 16; bit += 4 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 3; bit < 16; bit += 4 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                }

               
                break;
        case 3 :
//                for ( adr = 0; adr < 1; adr++ ) {
//                        for ( bit = 0; bit < 16; bit++ ) {
//                                memory[adr].m[bit] = linearbitnr;
//                                linearbitnr++;
//                        }
//                }
//000 RAM2[000] = {_000,_008}
//001 RAM2[100] = {_001,_009}
//002 RAM2[200] = {_002,_00a}
//003 RAM2[300] = {_003,_00b}
//004 RAM2[400] = {_004,_00c}
//005 RAM2[500] = {_005,_00d}
//006 RAM2[600] = {_006,_00e}
//007 RAM2[700] = {_007,_00f}
//                memory[0].m[ 0] = 0
//                memory[0].m[ 1] = 2
//                memory[0].m[ 2] = 4
//                memory[0].m[ 3] = 6
//                memory[0].m[ 4] = 8
//                memory[0].m[ 5] = 10
//                memory[0].m[ 6] = 12
//                memory[0].m[ 7] = 14
//                memory[0].m[ 8] = 1
//                memory[0].m[ 9] = 3
//                memory[0].m[10] = 5
//                memory[0].m[11] = 7
//                memory[0].m[12] = 9
//                memory[0].m[13] = 11
//                memory[0].m[14] = 13
//                memory[0].m[15] = 15

                for ( adr = 0; adr < 256; adr++ ) {
                        for ( bit = 0; bit < 16; bit += 8 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 1; bit < 16; bit += 8 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 2; bit < 16; bit += 8 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 3; bit < 16; bit += 8 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 4; bit < 16; bit += 8 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 5; bit < 16; bit += 8 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 6; bit < 16; bit += 8 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                        for ( bit = 7; bit < 16; bit += 8 ) {
                                memory[adr].m[bit] = linearbitnr;
                                linearbitnr++;
                        }
                }
                break;
        default : ferr( "OOps\n" );
        }                
}

/////////////////////////////////////////////////////////////////////////////
void readram( int readmode, MEMLINE *rdata, uint32_t adr ) {
        uint32_t rmask_i;
        MEMLINE rdata_i;
        int i,ii;
        
        switch ( readmode ) {
        case 0 :
                assert( adr < 256 );
                rmask_i = 0;
                break;
        case 1 :
                assert( adr < 512 );
                switch ( adr & 0x100 ) {
                case 0x000 : rmask_i = 0xaaaa; break;
                case 0x100 : rmask_i = 0x5555; break;
                }
                break;
        case 2 :
                assert( adr < 1024 );
                switch ( adr & 0x300 ) {
                case 0x000 : rmask_i = 0xeeee; break;
                case 0x100 : rmask_i = 0xdddd; break;
                case 0x200 : rmask_i = 0xbbbb; break;
                case 0x300 : rmask_i = 0x7777; break;
                }
                break;
        case 3 :
                assert( adr < 2048 );
                switch ( adr & 0x700 ) {
                case 0x000 : rmask_i = 0xfefe; break;
                case 0x100 : rmask_i = 0xfdfd; break;
                case 0x200 : rmask_i = 0xfbfb; break;
                case 0x300 : rmask_i = 0xf7f7; break;
                case 0x400 : rmask_i = 0xefef; break;
                case 0x500 : rmask_i = 0xdfdf; break;
                case 0x600 : rmask_i = 0xbfbf; break;
                case 0x700 : rmask_i = 0x7f7f; break;
                }
                break;                
        default :
                ferr( "Que1?\n" );
        }
        
        rdata_i = memory[adr & 0xff]; 
        for ( i = 0; i < 16; i++ ) {
                if ( ((rmask_i >> i) & 1) == 0 ) {
                        // Valid to read
                        ;
                } else {
                        rdata_i.m[i] = 0u;
                }
        }
        
        switch ( readmode ) {
        case 0 :
                *rdata = rdata_i;
                break;
        case 1 :
                for ( i = 0; i < 16; i++ ) {
                        if ( i & 1 ) {
                                rdata->m[i] = 0;
                        } else {
                                rdata->m[i] = rdata_i.m[i] | rdata_i.m[i+1];
                        }
                }
                break;
        case 2 :
                for ( i = 0; i < 16; i++ ) {
                        switch ( i ) {
                        case 13 :
                        case 9 :
                        case 5 :
                        case 1 :
                                rdata->m[i] = rdata_i.m[i-1] | rdata_i.m[i] | rdata_i.m[i+1] | rdata_i.m[i+2];
                                break;
                        default : rdata->m[i] = 0;
                        }
                } 
               break;
        case 3 :
                for ( i = 0; i < 16; i++ ) {
                        switch ( i ) {
                        case 11 :
                        case 3 :
                                rdata->m[i] = 0;
                                for ( ii = -3; ii < 5; ii++ )
                                        rdata->m[i] |= rdata_i.m[i+ii];
                                break;
                        default : rdata->m[i] = 0;
                        }
                }
                break;
        default : ferr( "Que2\n" );
        }
}

/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        int i,j;
        MEMLINE retbits;
        int mi;

        int prevbit, thisbit;
                
        initialize_ram(0);
        prevbit = -1;
        printf( "Display bitorder: 0,1,2,3,...15\n");
        for ( i = 0; i < 256; i++ ) {
                printf( "RAM16[%2.2x] = {", i );
                readram( 0, &retbits, i );
//                for ( j = 15; j >= 0; j-- ) {
                for ( j = 0; j < 16; j++ ) {
                        thisbit = retbits.m[j];
                        if ( thisbit <= prevbit )
                                ferr( "ERROR1\n" );
                        prevbit = thisbit;
                        printf( "_%3.3x%c", thisbit, j != 15 ? ',' : '}' );
                }
                printf( "\n" );
        }
        initialize_ram(1);
        prevbit = -1;
        printf( "Display bitorder: 0,1,2,3,...7\n");
        for ( i = 0; i < 512; i++ ) {
                mi = ((i>>1) | (i<<8)) & 0x1ff;
                printf( "%3.3x RAM8[%3.3x] = {", i, mi );
                readram( 1, &retbits, mi );
//                for ( j = 14; j >= 0; j -= 2 ) 
                for ( j = 0; j < 16; j += 2 )  {
                        thisbit = retbits.m[j];
                        if ( thisbit <= prevbit )
                                ferr( "ERROR2\n" );
                        prevbit = thisbit;
                        printf( "_%3.3x%c", thisbit, j != 14 ? ',' : '}' );
                }
                printf( "\n" );
        }
        initialize_ram(2);
        prevbit = -1;
        printf( "Display bitorder: 0,1,2,3\n");
        for ( i = 0; i < 1024; i++ ) {
                mi = ((i>>2) | (i<<8)) & 0x3ff;
                printf( "%3.3x RAM4[%3.3x] = {", i, mi );
                readram( 2, &retbits, mi );
                for ( j = 1; j < 16; j += 4 ) {
                        thisbit = retbits.m[j];
                        if ( thisbit <= prevbit )
                                ferr( "ERROR3\n" );
                        prevbit = thisbit;
                        printf( "_%3.3x%c", thisbit, j != 13 ? ',' : '}' );
                }
                printf( "\n" );
        }
        initialize_ram(3);
        prevbit = -1;
        printf( "Display bitorder: 0,1\n");
        for ( i = 0; i < 2048; i++ ) {
                mi = ((i>>3) | (i<<8)) & 0x7ff;
                printf( "%3.3x RAM2[%3.3x] = {", i, mi );
                readram( 3, &retbits, mi );
                for ( j = 3; j < 16; j += 8 ) {
                        thisbit = retbits.m[j];
                        if ( thisbit <= prevbit )
                                ferr( "ERROR4\n" );
                        prevbit = thisbit;
                        printf( "_%3.3x%c", thisbit, j != 11 ? ',' : '}' );
                }
                printf( "\n" );
        }
        return 0;
}
