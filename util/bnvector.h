#ifndef _bnvector_h
#define _bnvector_h 1
#include <stdint.h>
#include <string.h>
#include <stdio.h>

int VECTOR_BITGET(const uint32_t f[], int bitnr );
void VECTOR_BITSET(uint32_t f[], int bitnr, int v );
void VECTORSHLR(uint32_t f[], uint32_t b[], int nrbitstoshift, int vectorleninbits );
void FVECTORPRI( FILE *fo, const uint32_t a[], const int vectorleninbits );
void VECTORPRI( const uint32_t a[], const int vectorleninbits );
void VECTOR3PRI(const uint32_t v[], const uint32_t u[], const int vectorleninbits );
void VECTORXOR( uint32_t f[], uint32_t b[], int vectorleninbits );
void VECTORIOR( uint32_t f[], uint32_t b[], int vectorleninbits );
void VECTORAND( uint32_t f[], const uint32_t b[], int vectorleninbits );
void VECTORINV( uint32_t f[], uint32_t b[], int vectorleninbits );
int VECTOR_NEZ( uint32_t a[], int vectorleninbits );
int VECTOREQ(uint32_t a[], uint32_t b[], int vectorleninbits );

#endif
