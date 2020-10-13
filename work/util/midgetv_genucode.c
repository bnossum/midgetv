/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Generate initial values for the microcode of midgetv
 */
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>
#include <string.h>
#include "bnvector.h"

#define ferr(...) exit( fprintf(stderr,"%s:%d:", __FILE__, __LINE__ )+fprintf(stderr, __VA_ARGS__))

// Defeat quoting system of some shells
#define STRX(x) # x
#define STR(x) STRX(x)
#define fname STR(nakedfname)


/* The specification is in ucode.h.
 */
typedef enum {
#define X(label,txt,ty,pos,def,reachability,mask,instr,nrhit) label,
#include fname
        _LEND
} LABELS;

// Number of equations from specification file. 
#define NREQATIONS MIDGETV_UCODE_NREQ


char *labeltext[256] = {
#define X(label,txt,ty,pos,def,reachability,mask,instr,nrhit) STR(label),
#include fname
};

char *ucodestr[256] = {
#define X(label,txt,ty,pos,def,reachability,mask,instr,nrhit) txt,
#include fname
};

uint64_t ucode0[256] = {
#define x 0b0ull
#define X(label,txt,ty,pos,def,reachability,mask,instr,nrhit) def,
#include fname
};

uint64_t ucode1[256] = {
#define x 0b1ull
#define X(label,txt,ty,pos,def,reachability,mask,instr,nrhit) def,
#include fname
};

#ifndef STRIPCOLUMNS
#define STRIPCOLUMNS 0
#endif

int statistics_on_unknown[NREQATIONS];
int statistics_on_high[NREQATIONS];
int statistics_on_low[NREQATIONS];



/////////////////////////////////////////////////////////////////////////////
/* September 2020
   Some specifications that were located explicitly in the Y macros
   are now part of the ucode instruction defines. This routine is
   to check that nothing got lost in that process.
   Eventually, the specifications located in the Y macros will be
   removed.
 */
int tbl_fixedposspec[256] = {
#define Y(fixedpos, paired, ...) fixedpos,
#include fname
};

int tbl_pairedspec[256] = {
#define Y(fixedpos, paired, ...) paired,
#include fname
};

int ucodespeced_fixedeven[256] = {
#define X(label,txt,ty,pos,def,reachability,mask,instr,nrhit) ty,
#include fname
};
        
int ucodespeced_pair_or_pos[256] = {
#define X(label,txt,ty,pos,def,reachability,mask,instr,nrhit) pos,
#include fname
};


/////////////////////////////////////////////////////////////////////////////
void ensure_k_at_illegal_at_entry_location( int k ) {
        switch ( k ) {
        case 0x22 :
        case 0x39 :
        case 0x42 :
        case 0x43 :
        case 0x58 :
        case 0x59 :
        case 0x60 :
        case 0x62 :
        case 0x63 :
        case 0x68 :
        case 0x6a :
        case 0x78 :
        case 0x79 :
        case 0x82 :
        case 0x83 :
        case 0x88 :
        case 0x8a :
        case 0x99 :
        case 0x9c :
        case 0xa2 :
        case 0xa3 :
        case 0xa8 :
        case 0xaa :
        case 0xb9 :
        case 0xc0 :
        case 0xc2 :
        case 0xc3 :
        case 0xc8 :
        case 0xca :
        case 0xd9 :
        case 0xe0 :
        case 0xe2 :
        case 0xe3 :
        case 0xe8 :
        case 0xf9 :                
                break;
        default : ferr( "ucode say it is to be placed at an 'illegal at entry' location, but it is not!. k = 0x%2.2x\n", k );
        }
}

/////////////////////////////////////////////////////////////////////////////
void check_internal_consistency( void ) {
        int k;

        for ( k = 0; k < 256; k++ ) {
                switch ( ucodespeced_fixedeven[k]) {
                case 0 : 
                        if ( tbl_fixedposspec[k] != 0 )
                                ferr( "uinstr say freely pos, but table say not. Mismatch at 0x%2.2x\n", k );
                        break;
                case 1 :
                        if ( tbl_fixedposspec[k] != 1 )
                                ferr( "uinstr say fixed pos, but table say not. Mismatch at 0x%2.2x\n", k );
                case 17 :
                case 31 :
                        if ( ucodespeced_pair_or_pos[k] != k )
                                ferr( "uinstr say fixed pos, but instruction at wrong location 0x%2.2x\n", k );
                        break;
                        
                case 6 : // This item is both to be in a range, and is also the first of a pair
                        ensure_k_at_illegal_at_entry_location(k);
                        // Fallthrough
                case 2 :
                        if ( k & 1 )
                                ferr( "uinstr say at even address, but this is not the case. Error at 0x%2.2x\n", k );
                        if ( ucodespeced_pair_or_pos[k] != -1 && ucodespeced_pair_or_pos[k] != k )
                                ferr( "uinstr say fixed pos, but ucode appears at wrong location 0x%2.2x\n", k );
                        if ( ucodespeced_fixedeven[k+1] != 8 )
                                ferr( "uinstr at even address 0x%2.2x, but next uinstr is not the second item of a pair\n", k );
                        break;
                case 18 :
                        if ( k & 1 )
                                ferr( "uinstr say at even address, but this is not the case. Error at 0x%2.2x\n", k );
                        break;
                case 4 :
                        ensure_k_at_illegal_at_entry_location(k);
                        break;
                case 5 :break;
                case 8 :
                        if ( tbl_pairedspec[k] == 0 )
                                ferr( "ucode instr say paired, but table contradicts at 0x%2.2x\n", k );
                        if ( (k & 1) == 0 )
                                ferr( "The second item in a pair must be at an odd address. Error at 0x%2.2x\n", k );
                        if ( ucodespeced_fixedeven[k-1] != 2 && ucodespeced_fixedeven[k-1] != 6 )
                                ferr( "A second item in a pair is not proceeded by a first item. Error at 0x%2.2x\n", k );
                        break;
                default: ferr( "Que?\n" );
                }
        }
}

/////////////////////////////////////////////////////////////////////////////
int simplify( uint32_t value[], uint32_t valid[], int usedinputs, const int debug ) {
        int nrusedinputs = __builtin_popcount(usedinputs);
        uint32_t value_shr[8];
        uint32_t valid_shr[8];
        if ( nrusedinputs > 8 )
                ferr( "Change me\n" );
        int i,z;
        
        const uint32_t vectormask[8][8] = { { 0x55555555u, 0x55555555u, 0x55555555u, 0x55555555u, 0x55555555u, 0x55555555u, 0x55555555u, 0x55555555u },
                                            { 0x33333333u, 0x33333333u, 0x33333333u, 0x33333333u, 0x33333333u, 0x33333333u, 0x33333333u, 0x33333333u },
                                            { 0x0f0f0f0fu, 0x0f0f0f0fu, 0x0f0f0f0fu, 0x0f0f0f0fu, 0x0f0f0f0fu, 0x0f0f0f0fu, 0x0f0f0f0fu, 0x0f0f0f0fu },
                                            { 0x00ff00ffu, 0x00ff00ffu, 0x00ff00ffu, 0x00ff00ffu, 0x00ff00ffu, 0x00ff00ffu, 0x00ff00ffu, 0x00ff00ffu },
                                            { 0x0000ffffu, 0x0000ffffu, 0x0000ffffu, 0x0000ffffu, 0x0000ffffu, 0x0000ffffu, 0x0000ffffu, 0x0000ffffu },
                                            { 0xffffffffu, 0x00000000u, 0xffffffffu, 0x00000000u, 0xffffffffu, 0x00000000u, 0xffffffffu, 0x00000000u },
                                            { 0xffffffffu, 0xffffffffu, 0x00000000u, 0x00000000u, 0xffffffffu, 0xffffffffu, 0x00000000u, 0x00000000u },
                                            { 0xffffffffu, 0xffffffffu, 0xffffffffu, 0xffffffffu, 0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u }};
        int relevantinputs = 0;
        
        for ( i = 0; i < nrusedinputs; i++ ) {
                if ( debug ) {
                        printf( "Input %d\n", i );
                        printf( "v        = " );
                        VECTOR3PRI( value, valid, 256 );
                        printf( "\n" );
                }
                VECTORSHLR(value_shr,value,(1<<i), (1<<nrusedinputs));     
                VECTORSHLR(valid_shr,valid,(1<<i), (1<<nrusedinputs));
                if ( debug ) {
                        printf( "v>>%3d   = ", (1<<i));
                        VECTOR3PRI( value_shr, valid_shr, 256 );
                        printf( "\n" );
                }
                VECTORXOR( value_shr, value, (1<<nrusedinputs));          // a = v ^ (v >> (1<<i)
                VECTORAND( valid_shr, valid, (1<<nrusedinputs));          // b = u & (u >> (1<<i)
                VECTORAND( value_shr, valid_shr,  (1<<nrusedinputs));     //
                if ( debug ) {
                        printf( "v^(v>>%3d)=", (1<<i));
                        VECTOR3PRI( value_shr, valid_shr, 256 );
                        printf( "\n" );
                        printf( "mask      =" );
                        VECTORPRI( vectormask[i], 256 );
                        printf( "\n" );                        
                }
                VECTORAND( value_shr, vectormask[i], (1<<nrusedinputs));  // c = a & b & mask[i]
                if ( debug ) {
                        printf( "a & b & m =" );
                        VECTORPRI( value_shr, 256 );
                        printf( "\n" );                        
                }
                z = VECTOR_NEZ( value_shr, (1<<nrusedinputs));            // z = c != 0
                if ( debug ) {
                        printf( "Input %d is %srelevant\n", i, z ? "" : "not " );
                }
                relevantinputs |= (z<<i);
        }
        return relevantinputs;
}


/////////////////////////////////////////////////////////////////////////////
int potential_4( int col ) {
        int k,v;
        uint32_t value[8] = {0 };
        uint32_t valid[8] = {0 };

        for ( k = 0; k < 256; k++ ) {
                if ( ucodespeced_fixedeven[k] == 1) {
                        v = (ucode0[k] >> col) & 1;                        
                        VECTOR_BITSET(value,k,v);
                        VECTOR_BITSET(valid,k,1);
                } 
        }
        return simplify( value, valid, 0xff, 0 );
}

/////////////////////////////////////////////////////////////////////////////
int g_permval;
void reset_permutator( void ) {
        g_permval = 0;
}
int select_input_variables(int rangeinbits, int nrbits, int requiredbits) {

        if ( __builtin_popcount(requiredbits) > nrbits )
                ferr( "Internal. Want a permutation with %d bits set, but require use of %d bits\n", nrbits, __builtin_popcount(requiredbits) );
        
        do {
                g_permval++;
                if ( g_permval >= (1<<rangeinbits) )
                        return -1; // Done, no more permutations possible
        } while (  __builtin_popcount( g_permval ) != nrbits || (g_permval & requiredbits) != requiredbits );
        return g_permval;
                
}

///////////////////////////////////////////////////////////////////////////////
int lutinx( int haystack, int mask ) {
        int v = 0;
        int vp = 0;
        int origmask = mask;
        
        while ( mask ) {
                if ( mask & 1) {
                        v |= ( (haystack & 1) << vp );
                        if ( ++vp > 4 )
                                ferr( "Something is wrong. Original mask = 0x%x\n", origmask );
                }
                mask >>= 1;
                haystack >>= 1;
        }                
        return v;               
}

///////////////////////////////////////////////////////////////////////////////
uint64_t new_ucode0[256];
uint64_t new_ucode1[256];
void initiate_new_tables( int newline[256], int processedline[256] ) {
        int k;

        for ( k = 0; k < 256; k++ ) {
                new_ucode0[k] = 0ull;
                new_ucode1[k] = 0xFFFFffffFFFFffffull;
                newline[k] = -1;
                processedline[k] = -1;
        }
}

///////////////////////////////////////////////////////////////////////////////
void check_that_function_works(int calledfromline, int col, int bitstouseasindex, int lutspaceused, int lutval ) {
        int k;
        
        for ( k = 0; k < 256; k++ ) {
                int b_a = (( new_ucode0[k] >> col) & 1);
                int b_b = (( new_ucode1[k] >> col) & 1);
                if ( b_a != b_b )
                        continue;
                int li = lutinx( k, bitstouseasindex );
                if ( ((lutspaceused>>li) & 1) == 0 )
                        ferr( "Consistency error from line %d\n", calledfromline );
                if ( ((lutval>>li) & 1) != b_a )
                        ferr( "Consistency error from line %d\n", calledfromline );
        }
}

///////////////////////////////////////////////////////////////////////////////
/* By construction, this should work,
 * but we go through the motions as a consistency test
 */
int populate_fixed( int newline[256], int processedline[256], int col, int bitstouseasindex, int lutspaceused, int lutval ) {
        int k;
                      
        for ( k = 0; k < 256; k++ ) {
                if ( ucodespeced_fixedeven[k] == 1 ) {
                        new_ucode0[k] = ucode0[k];
                        new_ucode1[k] = ucode1[k];
                        newline[k] = k;
                        processedline[k] = k;
                }
        }
        check_that_function_works(__LINE__,col, bitstouseasindex, lutspaceused, lutval );
        return 0;
}

///////////////////////////////////////////////////////////////////////////////
/* 
 * A number of original lines must be placed at certain new lines.
 * See that this can be done with the presently selected inputs and lut
 */
int populate_ranged( int newline[256], int processedline[256], int col, int bitstouseasindex, int *lutspaceusedp, int *lutvalp ) {
        int k,kk;
        int round;

        // Do this twice, first for strict lines, then for more relaxed lines
        for ( round = 0; round < 2; round++ ) {
                
                for ( k = 0; k < 256; k++ ) {
                        if ( ucodespeced_fixedeven[k] == 4 && processedline[k] == -1) {
                                int b_a = (( ucode0[k] >> col) & 1);
                                int b_b = (( ucode1[k] >> col) & 1);
                                if ( b_a != b_b && round == 0) {
                                        continue; // The ranged line can be placed at any ranged position, we wait until we have placed stricter lines
                                }
                                
                                // The original ranged line k has value b_a in column col. It must be
                                // copied to a ranged line, where the lut give the same value.                        
                                for ( kk = 0; kk < 256; kk++ ) {
                                        if ( ucodespeced_fixedeven[kk] != 4 )
                                                continue;
                                        // The position may be taken already
                                        if ( newline[kk] != -1 )
                                                continue;
                                        // Try to first use space where the lut is specified
                                        int li = lutinx( kk, bitstouseasindex );
                                        if ( (*lutspaceusedp>>li) & 1 ) {
                                                if ( ((*lutvalp>>li) & 1) == b_a ) {
                                                        new_ucode0[kk] = ucode0[k];
                                                        new_ucode1[kk] = ucode1[k];
                                                        newline[kk] = k;
                                                        processedline[k] = kk;
                                                        break; // Success
                                                }
                                        }
                                }        
                                if ( kk != 256 )
                                        continue; // Placement succeeded - go to next
                                
                                // The lut may perhaps be enhanced to allow the ranged line
                                for ( kk = 0; kk < 256; kk++ ) {
                                        if ( ucodespeced_fixedeven[kk] != 4 )
                                                continue;
                                        // The position may be taken already
                                        if ( newline[kk] != -1 )
                                                continue;
                                        int li = lutinx( kk, bitstouseasindex );
                                        if ( ((*lutspaceusedp>>li) & 1) == 0 ) {
                                                *lutvalp         |= (b_a<<li);
                                                *lutspaceusedp |= (1<<li);
                                                new_ucode0[kk] = ucode0[k];
                                                new_ucode1[kk] = ucode1[k];
                                                newline[kk] = k;
                                                processedline[k] = kk;
                                                break; // Success
                                        }
                                }
                                if ( kk != 256 )
                                        continue; // Placement succeeded - go to text
                                // Nowhere to place ranged line k
                                return -1; 
                        }
                }
        }
        check_that_function_works(__LINE__, col, bitstouseasindex, *lutspaceusedp, *lutvalp );
        return 0;
}

///////////////////////////////////////////////////////////////////////////////
/* 
 * A number of original line-pairs must stay as pairs.
 * See that this can be done with the presently selected inputs and lut
 */
int populate_pairs( int newline[256], int processedline[256], int col, int bitstouseasindex, int *lutspaceusedp, int *lutvalp ) {
        int k,kk;
        int round;

        for ( round = 0; round < 2; round++ ) {
                
                for ( k = 0; k < 256; k += 2 ) {

                        check_that_function_works(__LINE__, col, bitstouseasindex, *lutspaceusedp, *lutvalp );

                        if ( ucodespeced_fixedeven[k] == 2  && processedline[k] == -1) { 
                                int b_a = (( ucode0[k] >> col) & 1);
                                int b_b = (( ucode1[k] >> col) & 1);
                                int c_a = (( ucode0[k+1] >> col) & 1);
                                int c_b = (( ucode1[k+1] >> col) & 1);
                                if ( b_a != b_b && c_a != c_b && round == 0) 
                                        continue; // The pair can be placed at any even position, so we wait                        
                        
                                // The original pair at line k,k+1 has values b_a,c_a in column col. It must be
                                // copied to pair, where the lut give the same value.                        
                                // Try to first use space where the lut is specified for both positions
                                for ( kk = 0; kk < 256; kk += 2 ) {
                                        // The position may be taken already
                                        if ( newline[kk]   != -1 ||
                                             newline[kk+1] != -1 )
                                                continue;
                                        
                                        int lia = lutinx( kk, bitstouseasindex );
                                        int lib = lutinx( kk+1, bitstouseasindex );
                                        if ( ((*lutspaceusedp>>lia) & 1) && ((*lutspaceusedp>>lib) & 1) ) {
                                                if ( ( ((*lutvalp>>lia) & 1) == b_a ) &&
                                                     ( ((*lutvalp>>lib) & 1) == c_a ) ) {
                                                        new_ucode0[kk] = ucode0[k];
                                                        new_ucode1[kk] = ucode1[k];
                                                        newline[kk] = k;
                                                        processedline[k] = kk;
                                                        new_ucode0[kk+1] = ucode0[k+1];
                                                        new_ucode1[kk+1] = ucode1[k+1];
                                                        newline[kk+1] = k+1;
                                                        processedline[k+1] = kk+1;
                                                        break; // Success
                                                }
                                        }
                                }
                                if ( kk != 256 )
                                        continue; // Placement succeeded - go to next
                                
                                // Try to use space where the lut is specified for the first position
                                for ( kk = 0; kk < 256; kk += 2 ) {
                                        // The position may be taken already
                                        if ( newline[kk]   != -1 ||
                                             newline[kk+1] != -1 )
                                                continue;
                                        
                                        int lia = lutinx( kk, bitstouseasindex );
                                        int lib = lutinx( kk+1, bitstouseasindex );
                                        if ( lia != lib &&
                                             ((*lutspaceusedp>>lia) & 1) == 1 &&
                                             ((*lutspaceusedp>>lib) & 1) == 0 ) {
                                                if ( ( ((*lutvalp>>lia) & 1) == b_a ) ) {
                                                        new_ucode0[kk] = ucode0[k];
                                                        new_ucode1[kk] = ucode1[k];
                                                        newline[kk] = k;
                                                        processedline[k] = kk;
                                                        *lutvalp |= (c_a<<lib);
                                                        *lutspaceusedp |= (1<<lib);
                                                        new_ucode0[kk+1] = ucode0[k+1];
                                                        new_ucode1[kk+1] = ucode1[k+1];
                                                        newline[kk+1] = k+1;
                                                        processedline[k+1] = kk+1;
                                                        break; // Success
                                                }
                                        }
                                }
                                if ( kk != 256 )
                                        continue; // Placement succeeded - go to next
                                
                                // Try to use space where the lut is specified for the second position
                                for ( kk = 0; kk < 256; kk += 2 ) {
                                        // The position may be taken already
                                        if ( newline[kk]   != -1 ||
                                             newline[kk+1] != -1 )
                                                continue;
                                        
                                        int lia = lutinx( kk, bitstouseasindex );
                                        int lib = lutinx( kk+1, bitstouseasindex );
                                        if ( lia != lib &&
                                             ((*lutspaceusedp>>lia) & 1) == 0 &&
                                             ((*lutspaceusedp>>lib) & 1) == 1 ) {
                                                if ( ( ((*lutvalp>>lib) & 1) == c_a ) ) {
                                                        *lutvalp |= (b_a<<lia);
                                                        *lutspaceusedp |= (1<<lia);
                                                        new_ucode0[kk] = ucode0[k];
                                                        new_ucode1[kk] = ucode1[k];
                                                        newline[kk] = k;
                                                        processedline[k] = kk;
                                                        new_ucode0[kk+1] = ucode0[k+1];
                                                        new_ucode1[kk+1] = ucode1[k+1];
                                                        newline[kk+1] = k+1;
                                                        processedline[k+1] = kk+1;
                                                        break; // Success
                                                }
                                        }
                                }
                                if ( kk != 256 )
                                        continue; // Placement succeeded - go to next
                                
                                
                                // The lut may perhaps be enhanced to allow the pair
                                for ( kk = 0; kk < 256; kk += 2 ) {
                                        // The position may be taken already
                                        if ( newline[kk]   != -1 ||
                                             newline[kk+1] != -1 )
                                                continue;
                                        
                                        int lia = lutinx( kk, bitstouseasindex );
                                        int lib = lutinx( kk+1, bitstouseasindex );
                                        if ( lia != lib &&
                                             ((*lutspaceusedp>>lia) & 1) == 0 &&
                                             ((*lutspaceusedp>>lib) & 1) == 0 ) {
                                                *lutvalp |= (b_a<<lia);
                                                *lutspaceusedp |= (1<<lia);
                                                new_ucode0[kk] = ucode0[k];
                                                new_ucode1[kk] = ucode1[k];
                                                newline[kk] = k;
                                                *lutvalp |= (c_a<<lib);
                                                *lutspaceusedp |= (1<<lib);
                                                new_ucode0[kk+1] = ucode0[k+1];
                                                new_ucode1[kk+1] = ucode1[k+1];
                                                newline[kk+1] = k+1;
                                                break; // Success
                                        }
                                }
                                if ( kk != 256 )
                                        continue; // Placement succeeded - go to next
                                // Nowhere to place pair lines k,k+1
                                return -1; 
                        }
                }
                
        }
        check_that_function_works(__LINE__, col, bitstouseasindex, *lutspaceusedp, *lutvalp );
        return 0;
}


///////////////////////////////////////////////////////////////////////////////
/* 
 */
int populate_rest( int newline[256], int processedline[256], int col, int bitstouseasindex, int *lutspaceusedp, int *lutvalp ) {
        int k,kk;
        int round;
        
        check_that_function_works(__LINE__, col, bitstouseasindex, *lutspaceusedp, *lutvalp );
        // Do this twice, first for strict lines, then for more relaxed lines
        for ( round = 0; round < 2; round++ ) {
                
                for ( k = 0; k < 256; k++ ) {

                        check_that_function_works(__LINE__, col, bitstouseasindex, *lutspaceusedp, *lutvalp );

                        if ( ucodespeced_fixedeven[k] == 0 && processedline[k] == -1) {
                                int b_a = (( ucode0[k] >> col) & 1);
                                int b_b = (( ucode1[k] >> col) & 1);
                                if ( b_a != b_b && round == 0) {
                                        continue; // The line can be placed at any position, we wait until we have placed stricter lines
                                }
                                
                                // The original line k has value b_a in column col. It must be
                                // copied to a line where the lut give the same value.                        
                                for ( kk = 0; kk < 256; kk++ ) {
                                        // The position may be taken already
                                        if ( newline[kk] != -1 )
                                                continue;
                                        // Try to first use space where the lut is specified
                                        int li = lutinx( kk, bitstouseasindex );
                                        if ( (*lutspaceusedp>>li) & 1 ) {
                                                if ( ((*lutvalp>>li) & 1) == b_a ) {
                                                        new_ucode0[kk] = ucode0[k];
                                                        new_ucode1[kk] = ucode1[k];
                                                        newline[kk] = k;
                                                        processedline[k] = kk;
                                                        break; // Success
                                                }
                                        }
                                }        
                                if ( kk != 256 )
                                        continue; // Placement succeeded - go to next
                                
                                // The lut may perhaps be enhanced to allow the ranged line
                                for ( kk = 0; kk < 256; kk++ ) {
                                        // The position may be taken already
                                        if ( newline[kk] != -1 )
                                                continue;
                                        int li = lutinx( kk, bitstouseasindex );
                                        if ( ((*lutspaceusedp>>li) & 1) == 0 ) {
                                                *lutvalp       |= (b_a<<li);
                                                *lutspaceusedp |= (1<<li);
                                                new_ucode0[kk] = ucode0[k];
                                                new_ucode1[kk] = ucode1[k];
                                                newline[kk] = k;
                                                processedline[k] = kk;
                                                break; // Success
                                        }
                                }
                                if ( kk != 256 )
                                        continue; // Placement succeeded - go to text
                                // Nowhere to place line k
                                return -1; 
                        }
                }
        }
        check_that_function_works(__LINE__, col, bitstouseasindex, *lutspaceusedp, *lutvalp );
        return 0;
}

/////////////////////////////////////////////////////////////////////////////
void print_input_as_comment( int modified, char *entrypoint[256], uint32_t sampleinstruction[256], int newline[256], int processedline[256] ) {
        int k;
        printf( " *                             Microcode instruction\n" );
        printf( " * uPC           next uPC      " );
        for ( k = NREQATIONS-1; k >= 10; k-- )
                printf( "%d", k / 10 );
        printf( "\n" );
        printf( " * || label      || next label " );
        for ( k = NREQATIONS-1; k >= 8; k-- )
                printf( "%d", k % 10 );
        printf( " Purpose                                                  Simulated entrypoint\n" );
        printf( " * -- ---------- -- ---------- %.*s --------------"
                "------------------------------------------ -----------\n", NREQATIONS-8, "---------------------------------------" );


        for ( k = 0; k < 256; k++ ) { 
                printf( " * %2.2x ", k );
                int index;


                if ( modified ) {
                        index = newline[k];
                } else {
                        index = k;
                }

                printf( "%-10s ", labeltext[index] );

                // Next is a bit difficult, because the instruction has not been updated
                // This part of the code is untested, because I never get to the point
                // where this simplification is possible
                int next;
                if ( modified == 0 ) {
                        next = ( ucode0[k] & 255);
                } else {
                        next = ( ucode0[k] & 255);
                        /* This is in the original table. so 
                           at line next in the original table we have the
                           right successor. 
                           Find that successor in the new table.
                           
                        */
                        
                        //printf( "orgigtbl next = 0x%2.2x ", next );
                        next = processedline[next]; // This is where the line now is
                }
                if ( next ) {
                        if ( modified == 0 ) {
                                printf( "%2.2x %-10s ", next, labeltext[next] );
                        } else {
                                printf( "%2.2x %-10s ", next, labeltext[next] );
                        }
                } else {
                        printf( "   (use dinx) " );
                }
                
                //printf( "%16.16" PRIx64 " ", ucode[k]);
                for ( int i = NREQATIONS-1; i >= 0; i-- ) {                        
                        int b_a = (( ucode0[index] >>i) & 1);
                        int b_b = (( ucode1[index] >>i) & 1);
                        if ( i >= 8 )
                                printf( "%c", b_a == b_b ? '0'+b_a : 'x' );

                        statistics_on_unknown[i] += (b_a^b_b);
                        statistics_on_high[i]    += (b_a == b_b) ? b_a   : 0;
                        statistics_on_low[i]     += (b_a == b_b) ? b_a^1 : 0;
                }
                printf( " " );
                
                printf( "%-56s " , ucodestr[index] );

                // These informative fields are not affected by any mapping
                printf( "%8.8x ", sampleinstruction[k] );
                printf( "%s\n" , entrypoint[k] ? entrypoint[k] : "");
        }
}


///////////////////////////////////////////////////////////////////////////////
int shoehorn( int col, int relevantinputs, int maxnrhigh, int minnrhigh,
              char *entrypoint[256] __attribute__ ((unused)),
              uint32_t sampleinstruction[256] __attribute__ ((unused)),
              int newline[256] ) {
        int bitstouseasindex;
        int seenanycandidate = 0;
        
        reset_permutator();

        while ( (bitstouseasindex = select_input_variables(8,4,relevantinputs) ) != -1 ) {
                // With this selection of bits as index, how must the function look to be able to represent fixed lines?
                int lutval = 0;
                int lutspaceused = 0;
                for ( int k = 0; k < 256; k++ ) {
                        if ( ucodespeced_fixedeven[k] == 1 ) {
                                int b_a = (( ucode0[k] >> col) & 1);
                                int b_b = (( ucode1[k] >> col) & 1);
                                if ( b_a != b_b )
                                        continue; // At line k, column col, the fixed value is don't care, so no restrictions
                                int li = lutinx( k, bitstouseasindex );
                                if ( (lutspaceused>>li) & 1 ) {
                                        if ( ((lutval>>li) & 1) != b_a ) 
                                                goto TryNext; // Can't use this function
                                }
                                lutspaceused |= (1<<li);
                                lutval |= (b_a<<li);
                        }
                }

                int nrones = 0;
                int nrzeros = 0;
                int play = 0;
                for ( int i = 0; i < 16; i++ ) {
                        if ( (lutspaceused>>i) & 1 ) {
                                if ( (lutval>>i) & 1 ) {
                                        nrones += 16;
                                } else {
                                        nrzeros += 16;
                                }
                        } else {
                                play += 16;
                        }
                }
                if ( nrones > maxnrhigh ||
                     nrones+play < minnrhigh ) {
                        goto TryNext;
                }

                int processedline[256];
                initiate_new_tables(newline,processedline);
                if ( populate_fixed(   newline, processedline, col, bitstouseasindex, lutspaceused, lutval ) == -1 ) goto TryNext;
                if ( populate_ranged(  newline, processedline, col, bitstouseasindex, &lutspaceused, &lutval ) == -1 ) goto TryNext;
                if ( populate_pairs(   newline, processedline, col, bitstouseasindex, &lutspaceused, &lutval ) == -1 ) goto TryNext;
                if ( populate_rest(    newline, processedline, col, bitstouseasindex, &lutspaceused, &lutval ) == -1 ) goto TryNext;
                
                seenanycandidate++;
                //printf( "\n * Candidate function %4.4x, used %4.4x, inputs %2.2x\n", lutval, lutspaceused, bitstouseasindex );
                //print_input_as_comment( 1, entrypoint, sampleinstruction, newline, processedline );
        TryNext:
                ;
        }
        printf( "%2d candidate%c\n", seenanycandidate, seenanycandidate == 1 ? ' ' : 's' );
        return seenanycandidate;
}

/////////////////////////////////////////////////////////////////////////////
int need_index0_due_to_pairs( int col ) {
        int k;
        for ( k = 0; k < 256; k += 2 ) {
                if ( ucodespeced_fixedeven[k] == 2 ) {
                        int b_a = (( ucode0[k] >> col) & 1);
                        int b_b = (( ucode1[k] >> col) & 1);
                        if ( b_a != b_b )
                                continue; // First in pair is don't care, so pair can be represented by function that does not use index 0
                        int c_a = (( ucode0[k+1] >> col) & 1);
                        int c_b = (( ucode1[k+1] >> col) & 1);
                        if ( c_a != c_b )
                                continue; // Second in pair is don't care                        
                        if ( b_a == c_a )
                                continue; // Pair has same value in column col
                        return 1; // Do need index 0 to distinguish pairs
                }
        }
        return 0;
}

/////////////////////////////////////////////////////////////////////////////
void generate_headerfile( const char *progname, char *entrypoint[256], uint32_t sampleinstruction[256] ) {
        int k,kk,j;
        uint16_t rom[4][256];

        printf( 
                "/* -------------------------------------"
                "----------------------------------------\n"
                " * Part of midgetv\n"
                " * 2019. Copyright B. Nossum.\n"
                " * For licence, see LICENCE\n"
                " * -------------------------------------"
                "----------------------------------------\n"
                " * Automaticaly generated by %s (based on %s).\n"
                " * Do not edit.\n", progname, fname );

        print_input_as_comment( 0, entrypoint, sampleinstruction, NULL, NULL ); 
        printf( " */\n" );

#if 1
        // A lot of work for nothing.
        // Formerly I could save by manipulating the location of lines
        // can't any more.
        
        int newline[256];
        // As a help for later optimalization, print statistics and
        // a small analysis
        printf( "/* Col   x   1   0\n" );
        for ( int i = NREQATIONS-1; i >= 0; i-- ) {
                printf( " * %3d %3d %3d %3d ", i,
                        statistics_on_unknown[i],
                        statistics_on_high[i],
                        statistics_on_low[i] );
                int maxnrhigh = statistics_on_high[i] + statistics_on_unknown[i];
                int minnrhigh = statistics_on_high[i];
                // Find smallest multiple of 16 that is >= minnrhigh
                int s;
                if ( (minnrhigh & 15) == 0 ) {
                        s = minnrhigh;
                } else {
                        s = (minnrhigh | 15)+1;
                }
                if ( s > maxnrhigh ) {
                        printf( "Can not simplify, can't possibly represent between %d and %d high values with only 4 bits index\n", minnrhigh, maxnrhigh );
                        continue;
                } 
                /* The numbers of '1' and '0' can be expressed by a 4-input LUT.
                   Lets make a test function that is correct in fixed positions,
                   but don't care otherwise. See if that function can be expressed
                   by a 4-input LUT with 4 bits of the index as select signals
                */
                int relevantinputs = potential_4(i);
                int nrrelevantinputs = __builtin_popcount(relevantinputs);
                if ( nrrelevantinputs > 4 ) {
                        printf( "Can not simplify, can't represent fixed locations with any less than %d bits of the index\n", nrrelevantinputs );
                        continue;
                }

                if ( (relevantinputs & 1) == 0 && need_index0_due_to_pairs(i) ) {
                        if ( nrrelevantinputs > 3 ) {
                                printf( "Can not simplify, can't represent fixed locations and pairs with any less than 5 bits of the index\n" );
                                continue;
                        }
                        relevantinputs |= 1;
                }
                                        
                if ( shoehorn(i,relevantinputs,maxnrhigh,minnrhigh,entrypoint,sampleinstruction,newline) == 0 ) {
                        printf( "Can not simplify, no legal mapping\n" );
                        continue;
                }
                //printf( "Candidate, use inputs " );
                //VECTORPRI( (uint32_t *)&relevantinputs, 8 );
                //printf( "\n" );
        }
        printf( " */\n" );
#endif
        
        // Convert the 256 deep 64 bit wide ucode to
        // 4 256 deep 16 bit wide, this is a simple slicing.
        for ( kk = 0; kk < 4; kk++ ) 
                for ( k = 0; k < 256; k++ ) 
                        rom[kk][k] = (ucode0[k] >> (16*kk)) & 0xffff;

        // Write out each of the ROMs in use with 16 entries in each INIT_x
#define NRROMS 3        
        for ( kk = 0; kk < NRROMS; kk++ ) {
                for ( k = 0; k < 16; k++ ) {
                        printf( "localparam u%d_%X = 256'h", kk, k );
                        for ( j = 15; j >= 0; j-- ) 
                                printf( "%4.4x", rom[kk][k*16+j] );
                        printf( ";\n" );
                }
        }
}        

/////////////////////////////////////////////////////////////////////////////
/*
  This routine is kind of displaced, but it is handy to know entry points
  into the ucode store in this program.
 */
void simulate_decode( char *entrypoint[256], uint32_t sampleinstruction[256] ) {

        int64_t instr = -1;
        const char *txt;
        
#define MULDIV 0
        
        do {
                instr += 4;
                if ( instr & (1<<7) ) 
                        instr += (1<<12) - (1<<7);
                if ( instr & (1<<15) )
                        instr += (1<<25) - (1<<15);
                if ( instr & (1<<26) )
                        instr += (1<<30) - (1<<26);
                        
                /* Is instr one I care about ?
                 */
                switch ( instr & 0x7F ) {
                default : continue;
                case 0b0110111 :
                        txt = "lui     ";
                        break;
                case 0b0010111 :
                        txt = "auipc   ";
                        break;
                case 0b1101111 :
                        txt = "jal     ";
                        break;
                case 0b1100111 :
                        switch ( (instr>>12) & 7) {
                        case 0b000 : txt = "jalr    "; break;
                        default :    txt = "close to jalr"; break;
                        }
                        break;
                case 0b1100011 : 
                        switch ( (instr>>12) & 7) {
                        case 0b000 : txt = "beq     "; break;
                        case 0b001 : txt = "bne     "; break;
                        case 0b100 : txt = "blt     "; break;
                        case 0b101 : txt = "bge     "; break;
                        case 0b110 : txt = "bltu    "; break;
                        case 0b111 : txt = "bgeu    "; break;
                        default :    txt = "close to branch"; break;
                        }
                        break;
                case 0b0000011 :
                        switch ( (instr>>12) & 7) {
                        case 0b000 : txt = "lb      "; break;
                        case 0b001 : txt = "lh      "; break;
                        case 0b010 : txt = "lw      "; break;
                        case 0b100 : txt = "lbu     "; break;
                        case 0b101 : txt = "lhu     "; break;
                        default :    txt = "close to load"; break;
                        }
                        break;
                case 0b0100011 :
                        switch ( (instr>>12) & 7) {
                        case 0b000 : txt = "sb      "; break;
                        case 0b001 : txt = "sh      "; break;
                        case 0b010 : txt = "sw      "; break;
                        default :    txt = "close to store"; break;
                        }
                        break;
                case 0b0010011 :
                        switch ( (instr>>12) & 7) {
                        case 0b000 : txt = "addi    "; break;
                        case 0b001 : txt = "slli    "; break; // slli will also be decoded for instr[30] == 1
                        case 0b010 : txt = "slti    "; break;
                        case 0b011 : txt = "sltiu   "; break;
                        case 0b100 : txt = "xori    "; break;
                        case 0b101 : txt = "sr(l/a)i"; break;
                        case 0b110 : txt = "ori     "; break;
                        case 0b111 : txt = "andi    "; break;                                
                        }
                        break;
                case 0b0110011 :
                        switch ( (instr>>12) & 7) {
                        case 0b000 : txt = ( (instr>>30) & 1 ) ? "sub " : "add "; break;
                        case 0b001 : txt = ( (instr>>30) & 1 ) ? "sloppy sll     " : "sll     "; break;
                        case 0b010 : txt = ( (instr>>30) & 1 ) ? "sloppy slt     " : "slt     "; break;
                        case 0b011 : txt = ( (instr>>30) & 1 ) ? "sloppy sltu    " : "sltu    "; break;
                        case 0b100 : txt = ( (instr>>30) & 1 ) ? "sloppy xor     " : "xor     "; break;
                        case 0b101 : txt = ( (instr>>30) & 1 ) ? "sra"             : "srl     "; break;
                        case 0b110 : txt = ( (instr>>30) & 1 ) ? "sloppy or      " : "or      "; break;
                        case 0b111 : txt = ( (instr>>30) & 1 ) ? "sloppy and     " : "and     "; break;                                
                        }
                        break;
                case 0b0001111 :
                        switch ( (instr>>12) & 7) {
                        case 0b000 : txt = "fence   "; break;
                        case 0b001 : txt = "fence.i "; break;
                        default :    txt = "close to fence"; break;
                        }
                        break;
                case 0b1110011 : 
                        switch ( (instr>>12) & 7) {
                        case 0b000 : txt = "ecall/ebreak/mret/wfi"; break;
                        case 0b001 : txt = "csrrw"; break;
                        case 0b010 : txt = "csrrs"; break;
                        case 0b011 : txt = "csrrc"; break;
                        case 0b100 : txt = "close to csr/system "; break;
                        case 0b101 : txt = "csrrwi"; break;
                        case 0b110 : txt = "csrrsi"; break;
                        case 0b111 : txt = "csrrci"; break;
                        }
                        break;
                case 0b0001011 :
                        switch ( (instr>>12) & 7) {
                        case 0b000 : txt = "ij       "; break;
                        default :    txt = "close to ij"; break;
                        }
                        break;
                        
                }
                
                                
                int dinx;
                int is_lui = ((instr>>4) & 3 ) == 3 && ((instr>>2) == 1);
                
                int dinx0,dinx1,dinx2,dinx3,dinx4,dinx5,dinx6,dinx7;
                
                if ( MULDIV == 0 ) {
                        dinx0 = (instr>>2) & 1;
                } else {
                        ferr( "work" );
                }
                if ( is_lui ) {
                        dinx1 = 1;
                } else {
                        dinx1 = ( ((((instr>>6)&1)^1) & ((instr>>5)&1)) & ((instr>>30)&1) ) |
                                ( (1^((((instr>>6)&1)^1) & ((instr>>5)&1))) & ((instr>>3)&1) );
                }
                dinx2 = (instr>> 4) & 1;
                dinx3 = (instr>> 5) & 1;
                dinx4 = (instr>> 6) & 1;
                dinx5 = (instr>>12) & 1;
                if ( ((instr>>2) & 7) != 0b101 ) {
                        dinx6 = (instr>>13) & 1;
                } else {
                        dinx6 = 0;
                }
                if  ( ((instr>>2) & 7) != 0b101 && ((instr>>2) & 15) != 0b1011 ) {
                        dinx7 = (instr>>14) & 1;
                } else {
                        dinx7 = 0;
                }
                dinx = (dinx7<<7) | (dinx6<<6) | (dinx5<<5) | (dinx4<<4) | (dinx3<<3) | (dinx2<<2) | (dinx1<<1) | (dinx0<<0);


                if ( entrypoint[dinx] == NULL ) {
                        entrypoint[dinx] = strdup(txt);
                        sampleinstruction[dinx] = instr;
                } else {
                        if ( strcmp( entrypoint[dinx], txt ) != 0 &&
                             strncmp(txt,"DUP",3) != 0 &&
                             strncmp(entrypoint[dinx], "DUP",3) != 0 )                                        
                                ferr( "Internal error, instr=0x%8.8x maps to index 0x%2.2x  %s, but also to %s\n", (uint32_t)instr, dinx, entrypoint[dinx], txt );
                }
                
        } while ( instr <= 0xffffffff );
        //int k;
        //for ( k = 0; k < 256; k++ ) 
        //        printf( "%2.2x %s\n", k, entrypoint[k] ? entrypoint[k] : "" );
                
        
}

/////////////////////////////////////////////////////////////////////////////
int main( int argc __attribute__((unused)), char *argv[] ) {

        char *entrypoint[256] = { NULL };
        uint32_t sampleinstruction[256] = { 0 };
        
        simulate_decode(entrypoint,sampleinstruction);
        
        if ( _LEND != 256 )
                ferr( "Wrong number of microcode instructions\n" );

        check_internal_consistency();
        generate_headerfile(argv[0],entrypoint,sampleinstruction);
        
        return 0;
}
