/*
 * A small library for binary vectors
 */
#include "bnvector.h"

/////////////////////////////////////////////////////////////////////////////
void VECTOR_BITSET(uint32_t f[], int bitnr, int v ) {
        //printf( "{%d:%d", bitnr, v );
        v &= 1;
        f[bitnr>>5] &= ~(1u << (bitnr&31));
        f[bitnr>>5] |=   (v << (bitnr&31));
        //printf( " %x }", f[0]);
}

/////////////////////////////////////////////////////////////////////////////
int VECTOR_BITGET(const uint32_t f[], int bitnr ) {
        return (f[bitnr>>5] >> (bitnr&31)) & 1;
}

/////////////////////////////////////////////////////////////////////////////
void VECTORSHLR(uint32_t f[], uint32_t b[], int nrbitstoshift, int vectorleninbits ) {
        uint8_t *ff = (uint8_t *)f;
        uint8_t *bb = (uint8_t *)b;
        uint32_t t,t2;
        int i;
        
        // Result is 0 at the msb. Easiest is to clear all bits
        memset( ff, 0, 4*((vectorleninbits+31)/32) );
                        
        // Shift integral number of bytes
        memmove( ff, bb + nrbitstoshift/8, (vectorleninbits-nrbitstoshift+7)/8 );
        
        if ( (nrbitstoshift & 7) == 0 )
                return;
        // Shift 1 to 7 bits
        t2 = 0;
        for ( i = (vectorleninbits+31)/32 - 1; i >= 0; i-- ) {
                t = f[i];
                f[i] >>= (nrbitstoshift & 31);
                f[i] |= t2;
                t2 = t << (32 - (nrbitstoshift & 31));
        }
                
}
/////////////////////////////////////////////////////////////////////////////
void FVECTORPRI(FILE *fo, const uint32_t a[], const int vectorleninbits ) {
        int i;

        for ( i = vectorleninbits-1; i >= 0; i-- )
                fprintf( fo, "%d", a[i>>5] & (1u << (i & 31)) ? 1 : 0 );
}
/////////////////////////////////////////////////////////////////////////////
void VECTORPRI(const uint32_t a[], const int vectorleninbits ) {
        FVECTORPRI( stdout, a, vectorleninbits );
}


/////////////////////////////////////////////////////////////////////////////
// v<bit> is bit value, only valid when u<bit> == 1
void VECTOR3PRI(const uint32_t v[], const uint32_t u[], const int vectorleninbits ) {
        int i;

        for ( i = vectorleninbits-1; i >= 0; i-- ) 
                printf( "%c", u[i>>5] & (1u << (i & 31)) ? 
                        (v[i>>5] & (1u << (i & 31)) ? 1 : 0 )+'0' :
                        'x' );;
}

/////////////////////////////////////////////////////////////////////////////
void VECTORXOR(uint32_t f[], uint32_t b[], int vectorleninbits ) {
        int i;
        for ( i = 0; i < (vectorleninbits+31)/32; i++ )
                f[i] ^= b[i];
}

/////////////////////////////////////////////////////////////////////////////
void VECTORIOR(uint32_t f[], uint32_t b[], int vectorleninbits ) {
        int i;
        for ( i = 0; i < (vectorleninbits+31)/32; i++ )
                f[i] |= b[i];
}

/////////////////////////////////////////////////////////////////////////////
void VECTORAND(uint32_t f[], const uint32_t b[], int vectorleninbits ) {
        int i;
        for ( i = 0; i < (vectorleninbits+31)/32; i++ )
                f[i] &= b[i];
}

/////////////////////////////////////////////////////////////////////////////
void VECTORINV(uint32_t f[], uint32_t b[], int vectorleninbits ) {
        int i;
        for ( i = 0; i < (vectorleninbits+31)/32; i++ )
                f[i] = ~b[i];
}

/////////////////////////////////////////////////////////////////////////////
int VECTOR_NEZ( uint32_t a[], int vectorleninbits ) {
        int i;
        for ( i = 0; i < (vectorleninbits+31)/32; i++ )
                if ( a[i] )
                        return 1;
        return 0;
}

/////////////////////////////////////////////////////////////////////////////
int VECTOREQ(uint32_t a[], uint32_t b[], int vectorleninbits ) {
        int i;
        for ( i = 0; i < (vectorleninbits+31)/32; i++ )
                if ( a[i] ^ b[i] )
                        return 0;
        return 1;
}

