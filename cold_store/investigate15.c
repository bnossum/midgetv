/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This is an utility to reduce the number of columns that must reside in an EBR
 * for microcode as defined in ucode.h.
 * In general a column c[i] <= fcn( minx[7:0] ). 
 * But if we have a "nice" column we can perhaps use
 * c[i] <= fcnnice( {minx[5],minx[2:0]} ) or similar instead. Then that column
 * can be removed from the EBR and expressed by:
 *            __
 * minx[5] --|  |                    ____
 * minx[2] --|  |-------------------|D  Q|--c[i]
 * minx[1] --|  |               clk->    |
 * minx[0] --|__|    progress_ucode-|E___|
 *
 * By permutating the lines in ucode.h I hope to get a number of columns that
 * can be expressed in a single SB_LUT4. This is what this program do.
 */

#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <assert.h>

#include "bnvector.h"

/////////////////////////////////////////////////////////////////////////////
// Something wrong with FUNCTIONSIZE 5
#define FUNCTIONSIZE 4 // 4 or 5
#define ferr(...) exit( fprintf( stderr, "%s:%d: ", __FILE__, __LINE__ ) + fprintf(stderr, __VA_ARGS__))
// Defeat quoting system of some shells
#define STRX(x) # x
#define STR(x) STRX(x)
#define fname STR(nakedfname)

// Data input makes use of labels, define them
typedef enum {
#define X(label,txt,def,reachability,mask,instr,nrhit) label,
#include fname
        _LEND
} LABELS;


#define NRCOLUMNS MIDGETV_UCODE_NREQ

/////////////////////////////////////////////////////////////////////////////
typedef struct FUNCPAC_ {
        struct FUNCPAC_ *next;
        uint32_t func;
        int perm;
        int column;
//        uint8_t mapping[256];
} FUNCPAC;


/////////////////////////////////////////////////////////////////////////////
typedef struct {
        uint32_t a[256];      // Value for all columns given an index
        uint32_t v[256];      // Whether a column is valid or not
        uint32_t fixed[8];    // An OUTPUT line is mapped from the same input
        uint32_t paired[8];   // Input line is paired with the next line
        uint32_t dontcare[8]; // Input line is irrelevant
        uint32_t relevantinputlines[8]; // 
        uint32_t pairconstraint;
        uint32_t considered_columns;
        uint32_t inputs_for_column[NRCOLUMNS];
        int nr_zero_in_column[NRCOLUMNS];
        int nr_ones_in_column[NRCOLUMNS];
        FUNCPAC *fp[NRCOLUMNS];
        uint8_t *map[256];
        int possibilities[NRCOLUMNS];
} TBL;


/////////////////////////////////////////////////////////////////////////////
// Definitions to work from
//

// This table is essentially the data to be selected from the 8-bit
// index
uint64_t ucode0[256] = {
#define x 0b0
#define X(label,txt,def,reachability,mask,instr,nrhit) def,
#include fname
};

// Some of the items in the table is don't care
uint64_t ucode1[256] = {
#define x 0b1
#define X(label,txt,def,reachability,mask,instr,nrhit) def,
#include fname
};

// Some input lines must be mapped to the same output line That is,
// the lines are fixed.
uint32_t fixpos[256] = {
#define Y(fixedpos,paired,...) fixedpos,
#include fname
};

// Some lines (none of the fixed lines) must appear on consequtive
// output lines. Such pairs must be placed on output pairs where the
// first line in the pair has an index xxxxxxx0. i, e, imagine a pair
// on input lines 14 and 15. A possible mapping would be to output
// lines 146 147.  155, 156 would be illegal.
uint32_t pairedpos[256] = {
#define Y(fixedpos,paired,...) paired,
#include fname
};

const char *tbltxt[256] = {
#define X(label,txt,def,reachability,mask,instr,nrhit) txt,
#include fname
};


/////////////////////////////////////////////////////////////////////////////
// All 70 permutations of what 4 bits of the 8-bit index to use, or
// all 56 permutations of what 5 bits of the 8-bit index to use.
int g_nrperm;
int select_in_8[70];

int g_leveltarget; // How many columns to simplify

/////////////////////////////////////////////////////////////////////////////
/*                      / 8 \
 * Binomal coefficient  |   |
 *                      \ a /
 */
int nextperm(int a, int x) {
        do {
                x++;
        } while ( __builtin_popcount(x) != a );
        return x;
}

/////////////////////////////////////////////////////////////////////////////
int init_perm_select( int inxnrbits, int a ) {
        int f = 0,i = 0;
        
        while (1) {
                f = nextperm(a,f);
                if ( f >= (1<<inxnrbits))
                        break;
                select_in_8[i++] = f;
        }
        return i;
}

/////////////////////////////////////////////////////////////////////////////
/* Select bits in j. Example
   j = 123 = 01111011
   perm =    01001101
              1  10 1 -> 1101
*/
int extract( int n, int perm, int v ) {
        int i,k=0,r=0,vb;
        
        for ( i = 0; k < n; i++ ) {
                if ( (perm>>i) & 1 ) {
                        vb = (v>>i) & 1;
                        r |= (vb<<k);
                        k++;
                }
        }
        return r;
}


/////////////////////////////////////////////////////////////////////////////
/* Calculation of functions for a given column is more practical
 * when the column information is condensed.
 */
void isolate_column_information( TBL *tblp, int column, uint32_t value[], uint32_t valid[] ) {
        int i;
        
        for ( i = 0; i < 256; i++ ) {
                        VECTOR_BITSET(valid, i, (tblp->v[i] >> column) & 1);
                        VECTOR_BITSET(value, i, (tblp->a[i] >> column) & 1);
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

//////////////////////////////////////////////////////////////////////////////
void binprint( uint64_t v, int nrbits ) {
        int i;
        for ( i = nrbits; i >= 0; i-- ) 
                printf( "%d", (int)((v>>i) & 1) );
}

//////////////////////////////////////////////////////////////////////////////
int initial_possible_mapping( TBL *tblp, 
                              FUNCPAC *fp, const uint32_t value[8], const uint32_t valid[8] ) {
        int o;
        int f_inp,fv,i;
        uint32_t mapped[8],iused[8];
        int nrmapped = 0;
        
        memset(mapped,0,8*sizeof(uint32_t));
        memset(iused, 0,8*sizeof(uint32_t));


        // First the fixed lines:
        for ( o = 0; o < 256; o++ ) {
                if ( VECTOR_BITGET(tblp->fixed,o) ) {

                        /* The selected function must map input line o to output line p
                         */
                        if ( VECTOR_BITGET(valid,o) == 0 ) {
                                VECTOR_BITSET(mapped,o,1);
                                VECTOR_BITSET(iused, o,1);
                                //fp->mapping[o] = o;
                                nrmapped++;
                                continue; // For this line column c is don't care so mapping is ok
                        }
                        f_inp = extract(FUNCTIONSIZE,fp->perm,o);                        
                        fv = (fp->func >> f_inp) & 1;
                        if ( VECTOR_BITGET(value,o) != fv ) 
                                return 0; // Function does not match in a fixed line position
                        VECTOR_BITSET(mapped,o,1);
                        VECTOR_BITSET(iused, o,1);
                        //fp->mapping[o] = o;
                        nrmapped++;
                }
        }

        //printf( "Function %4.4x fullfills fixed lines requirements\n", fp->func );

        /* Vector iused has a 1 in all positions where an input line has been consumed
         * Vector mapped has a 1 in all positions where an output line has been used
         */
        for ( i = 0; i < 256; i++ ) {
                if ( VECTOR_BITGET(iused,i) )
                        continue; // Fixed input line
                if ( VECTOR_BITGET(valid,i) == 0 )
                        continue; // Can be mapped to any output line
                for ( o = 0; o < 256; o++ ) {
                        if ( VECTOR_BITGET(mapped,o) )
                                continue; // Output position already used
                        // The output line has value fv in column c
                        f_inp = extract(FUNCTIONSIZE,fp->perm,o);                        
                        fv = (fp->func >> f_inp) & 1;
                        if ( fv != VECTOR_BITGET(value,i) )
                                continue; // This output position does not have the value 0 or 1 that is needed
                        VECTOR_BITSET(mapped,o,1);
                        VECTOR_BITSET(iused, i,1);
                        //fp->mapping[o] = i;
                        nrmapped++;
                        break;
                }
                if ( o >= 256 ) {
                        return 0; // Failed to find a space
                }
        }
        return 1;
}
        
//////////////////////////////////////////////////////////////////////////////
int possible_fcns(TBL *tblp,int c) {
        uint32_t value[8],valid[8];
        int i,j,perm,f_inp,fv;
        uint64_t f;
        int totalpossibilities = 0;
        FUNCPAC *fp;

        if ( (fp = calloc(1,sizeof(FUNCPAC))) == NULL )
                ferr( "Mem!\n" );
        
        
        isolate_column_information( tblp, c, value, valid );
        //printf( "\nvalue:" ); VECTOR3PRI( value, valid, 256); printf( "\n" );
        
        for ( i = 0; i < g_nrperm; i++ ) {
                perm = select_in_8[i];

                /* The selected set of variables must include those
                 * used for the column */
                if ( (perm & tblp->inputs_for_column[c]) != tblp->inputs_for_column[c] )
                        continue;
                
                /* Now see what possible functions for the selected
                   input variables can fulfill the column
                */
//                for ( f = 0; f < 0x10000; f++ ) { // All 4-inp functions
                for ( f = 0; f < (1ull<<(1<<FUNCTIONSIZE)); f++ ) { // All 4/5-inp functions
                        int f_nr_zero = 0;
                        int f_nr_ones = 0;
                        for ( j = 0; j < 256; j++ ) { // All lines in table
                                f_inp = extract(FUNCTIONSIZE,perm,j);
                                fv = (f >> f_inp) & 1;
                                if ( fv ) {
                                        f_nr_ones++;
                                } else {
                                        f_nr_zero++;
                                }                                
                        }

                        /* To be usable the function must also have enough spaces for the
                           number of '1' and '0' in the column
                        */
                        if ( f_nr_zero < tblp->nr_zero_in_column[c] ) {
                                //printf( "z" );
                                continue; // Not enough '0's
                        }
                        if ( f_nr_ones < tblp->nr_ones_in_column[c] ) {
                                //printf( "H" );
                                continue; // Not enough '1's
                        }

                        //if ( f == 0 ) {printf( "%d %d %d %d\n", f_nr_zero, f_nr_ones, tblp->nr_zero_in_column[c], tblp->nr_ones_in_column[c] ); }

                        /* Function is candidate
                        */
                        fp->perm = perm;
                        fp->func = f;
                        fp->column = c;
                        if ( initial_possible_mapping( tblp, fp, value ,valid ) == 0 ) {
                                //memset( fp->mapping, 0, 256 );
                        } else {
                                totalpossibilities++;
                                //fprintf( stderr, "." );
                                //printf( "Candidate: c=0x%2.2x perm=%2.2x f=0x%4.4x\n", c,perm, f );
                                fp->next = tblp->fp[c];
                                tblp->fp[c] = fp;

                                if ( (fp = calloc(1,sizeof(FUNCPAC))) == NULL )
                                        ferr( "Mem!\n" );                                
                        }
                        
                }
                //printf( "\n" );
        }
        //ferr( "SFSG %d\n", totalpossibilities );
        free( fp );
        return totalpossibilities;
}


/////////////////////////////////////////////////////////////////////////////
/*   
 */
uint32_t g_valid[NRCOLUMNS][8];
uint32_t g_value[NRCOLUMNS][8];

TBL *initiate( void ) {

        /* I uses many 4 or 5-input functions, where
           the inputs is taken from an 8-bit index.
        */
        g_nrperm = init_perm_select(8,FUNCTIONSIZE);


        TBL *tblp;

        if ( (tblp = calloc(1, sizeof(TBL))) == NULL )
                ferr( "Que?\n" );
        
        // First only enter lines that are in fixed positions
        int nrplaced = 0;
        int nrpaired = 0;
        int nrirrelevant = 0;
        int i;
        for ( i = 0; i < 256; i++ ) {
                if ( fixpos[i] ) {
                        tblp->a[i] = ucode0[i];
                        tblp->v[i] = ucode1[i]^ucode0[i]^~0u;
                        VECTOR_BITSET(tblp->fixed, i, 1);
                        nrplaced++;
                } else {
                        tblp->a[i] = 0;
                        tblp->v[i] = 0;
                        VECTOR_BITSET(tblp->fixed, i, 0);
                }
                if (pairedpos[i]) {
                        VECTOR_BITSET(tblp->paired, i, 1);
                        nrpaired++;
                } else {
                        VECTOR_BITSET(tblp->paired, i, 0);
                }
                if ( strstr( tbltxt[i], "q:") != NULL ) {
                        VECTOR_BITSET(tblp->dontcare, i, 0 );
                        VECTOR_BITSET(tblp->relevantinputlines,i,0);
                        nrirrelevant++;
                } else {
                        VECTOR_BITSET(tblp->dontcare, i, 0 );
                        VECTOR_BITSET(tblp->relevantinputlines,i,1);
                }                
        }

        printf( "%3d lines are in fixed positions\n", nrplaced );
        printf( "%3d lines are irrelevant\n", nrirrelevant );
        printf( "%3d paired lines are to be placed\n", nrpaired );
        printf( "%3d single lines are to be placed\n", 256-nrpaired-nrirrelevant-nrplaced );

        int c;
        uint32_t value[8],valid[8];
        int mandatory_inputs_for_column;
        uint32_t considered_columns = 0;
        for ( c = 0; c < NRCOLUMNS; c++ ) {
                isolate_column_information(tblp, c, value, valid);
                mandatory_inputs_for_column = simplify( value, valid, 0xff, 0 );
                i = __builtin_popcount( mandatory_inputs_for_column );
                tblp->inputs_for_column[c] = mandatory_inputs_for_column;
                if ( i <= FUNCTIONSIZE ) 
                        considered_columns |= (1<<c);
        }
        
        /* How many 1's and 0's the function must give
         */
        int j;
        for ( i = 0; i < NRCOLUMNS; i++ ) {
//                if ( considered_columns & (1u << i ) )  {
                        for ( j = 0; j < 256; j++ ) {
                                if ( ((ucode0[j]^ucode1[j])>>i) & 1 ) 
                                        continue;
                                if ( (ucode0[j]>>i) & 1 ) {
                                        tblp->nr_ones_in_column[i]++;
                                } else {
                                        tblp->nr_zero_in_column[i]++;
                                }
                        }
//                }
                //printf( "Column %2d : %3d ones, %3d zeros\n", i, tblp->nr_ones_in_column[i], tblp->nr_zero_in_column[i] );
        }
        
        for ( c = 0; c < NRCOLUMNS; c++ ) {
                if ( considered_columns & (1u << c ) )  {
                        for ( i = 0; i < 256; i += 2 ) {
                                if ( pairedpos[i] ) {
                                        if ( ((ucode0[i]^ucode1[i])>>c) & 1 )
                                                continue; // Don't care in line i of column c
                                        if ( ((ucode0[i+1]^ucode1[i+1])>>c) & 1 )
                                                continue; // Don't care in line i+1 of column c
                                        if ( (((ucode0[i]^ucode0[i+1])>>c) & 1) == 0 )
                                                continue; // The pair is not different in line i and line i+1 of column c
                                        break; // Pair has constraint
                                }
                        }
                        if ( i < 256 ) {
                                tblp->pairconstraint       |= (1u << c);
                                tblp->inputs_for_column[c] |= 1;
                                if ( __builtin_popcount(tblp->inputs_for_column[c]) > FUNCTIONSIZE )
                                        considered_columns ^= (1u<<c);
                        }
                }
        }
        g_leveltarget = __builtin_popcount(considered_columns);
        
        // Now fill in the entire input table
        for ( i = 0; i < 256; i++ ) {                
                if ( fixpos[i] ) {
                        // Placed allready
                } 
                if ( strstr( tbltxt[i], "q:") != NULL ) {
                        // Don't care lines are don't care in all columns
                        tblp->a[i] = 0;
                        tblp->v[i] = 0;
                } else {
                        tblp->a[i] = ucode0[i];
                        tblp->v[i] = ucode1[i]^ucode0[i]^~0u;
                }                
        }
        
        for ( c = 0; c < NRCOLUMNS; c++ ) {
                //printf( "               " );
                printf( "Obligatory inputs : " );
                binprint( tblp->inputs_for_column[c], 7 );
                printf( ". %3d zeros, %3d ones, %3d don't cares.", tblp->nr_zero_in_column[c], tblp->nr_ones_in_column[c],
                        (considered_columns & (1u<<c) ) ? 256-tblp->nr_zero_in_column[c]-tblp->nr_ones_in_column[c] : 0);
                if ( tblp->pairconstraint & (1u << c) ) {
                        printf( " Pair " );
                } else {
                        printf( "      " );
                }

                printf( "Column %2d has %d obligatory input%c in function. ", c, __builtin_popcount(tblp->inputs_for_column[c]),
                        __builtin_popcount(tblp->inputs_for_column[c]) == 1 ? ' ' : 's' );
                if ( (considered_columns & (1u<<c) ) == 0 ) {
//                        if ( artificially_exclude & (1u<<c) ) {
//                                printf( "Artificially excluded.\n" );
//                        } else {
                                printf( "Excluded.\n" );
//                        }
                        continue;
                }
                if ( (considered_columns & (1u << c)) ) {
                        int t = possible_fcns(tblp,c);
                        tblp->possibilities[c] = t;
                        printf( "%7d total possibilities", t );
                        if ( t == 0 ) {
                                printf( ", so column excluded" );
                                considered_columns ^= (1u << c);
                        }
                }
                printf( "\n" );
                fflush(stdout);
        }
        tblp->considered_columns = considered_columns;


        for ( i = 0; i < NRCOLUMNS; i++ ) 
                isolate_column_information(tblp, i, g_value[i], g_valid[i] );
        return tblp;
}

/////////////////////////////////////////////////////////////////////////////
int possibletwo( FUNCPAC *fpa, const uint32_t valida[8], const uint32_t valuea[8],
                  FUNCPAC *fpb, const uint32_t validb[8], const uint32_t valueb[8]
        ) {
        int i,o,f_inp,fv;
        uint32_t mapped[8], consumed[8];
        int later_fillin_a = 0, later_fillin_b = 0;
        
        memset(mapped,0,8*sizeof(uint32_t));
        memset(consumed,0,8*sizeof(uint32_t));


        // First map pairs
        for ( i = 0; i < 256; i += 2 ) {
                if ( pairedpos[i] == 0 )
                        continue;
                if ( VECTOR_BITGET(valida,i) == 0 &&
                     VECTOR_BITGET(validb,i) == 0 &&
                     VECTOR_BITGET(valida,i+1) == 0 &&
                     VECTOR_BITGET(validb,i+1) == 0
                        ) {
                        VECTOR_BITSET(consumed,i,1);
                        VECTOR_BITSET(consumed,i+1,1);
                        continue; // Pair can be mapped to any output line
                }
                for ( o = 0; o < 256; o += 2 ) {
                        if ( VECTOR_BITGET(mapped,o) )
                                continue; // Output position already used
                        f_inp = extract(FUNCTIONSIZE,fpa->perm,o);
                        fv = (fpa->func >> f_inp ) & 1;
                        if ( fv != VECTOR_BITGET(valuea,i) )
//                                goto possiblyInvertPairs; // This output position does not fit
                                continue; // This output position does not fit
                        f_inp = extract(FUNCTIONSIZE,fpb->perm,o);
                        fv = (fpb->func >> f_inp ) & 1;
                        if ( fv != VECTOR_BITGET(valueb,i) )
                                continue; // This output position does not fit
                        f_inp = extract(FUNCTIONSIZE,fpa->perm,o+1);
                        fv = (fpa->func >> f_inp ) & 1;
                        if ( fv != VECTOR_BITGET(valuea,i+1) )
                                continue; // This output position does not fit
                        f_inp = extract(FUNCTIONSIZE,fpb->perm,o+1);
                        fv = (fpb->func >> f_inp ) & 1;
                        if ( fv != VECTOR_BITGET(valueb,i+1) )
                                continue; // This output position does not fit

                        VECTOR_BITSET(mapped,o,1);
                        VECTOR_BITSET(consumed,i,1);
                        VECTOR_BITSET(mapped,o+1,1);
                        VECTOR_BITSET(consumed,i+1,1);
                        break;

// Can only do this if I remember the flip decission for all columns                        
//                possiblyInvertPairs:
//                        f_inp = extract(FUNCTIONSIZE,fpb->perm,o);
//                        fv = (fpb->func >> f_inp ) & 1;
//                        if ( fv == VECTOR_BITGET(valueb,i) )
//                                continue; // This output position does not fit
//                        f_inp = extract(FUNCTIONSIZE,fpa->perm,o+1);
//                        fv = (fpa->func >> f_inp ) & 1;
//                        if ( fv == VECTOR_BITGET(valuea,i+1) )
//                                continue; // This output position does not fit
//                        f_inp = extract(FUNCTIONSIZE,fpb->perm,o+1);
//                        fv = (fpb->func >> f_inp ) & 1;
//                        if ( fv == VECTOR_BITGET(valueb,i+1) )
//                                continue; // This output position does not fit
//
//                        VECTOR_BITSET(mapped,o,1);
//                        VECTOR_BITSET(consumed,i,1);
//                        VECTOR_BITSET(mapped,o+1,1);
//                        VECTOR_BITSET(consumed,i+1,1);
//                        break;
                        
                }
                if ( o >= 256 ) {
                        // Failed to find space
                        return 0;
                }
        }

        // Single lines                
        for ( i = 0; i < 256; i++ ) {
                if ( VECTOR_BITGET(consumed,i) )
                        continue;
                if ( VECTOR_BITGET(valida,i) == 0 &&
                     VECTOR_BITGET(validb,i) == 0 ) {
                        VECTOR_BITSET(consumed,i,1);
                        continue; // Can be mapped to any output line
                }
                if ( VECTOR_BITGET(valida,i) == 0 ) {
                        later_fillin_b = 1;
                        continue;
                }
                if ( VECTOR_BITGET(validb,i) == 0 ) {
                        later_fillin_a = 1;
                        continue;
                }
                for ( o = 0; o < 256; o++ ) {
                        if ( VECTOR_BITGET(mapped,o) )
                                continue; // Output position already used

                        f_inp = extract(FUNCTIONSIZE,fpa->perm,o);
                        fv = (fpa->func >> f_inp ) & 1;
                        if ( fv != VECTOR_BITGET(valuea,i) )
                                continue; // This output position does not fit
                        f_inp = extract(FUNCTIONSIZE,fpb->perm,o);
                        fv = (fpb->func >> f_inp ) & 1;
                        if ( fv != VECTOR_BITGET(valueb,i) )
                                continue; // This output position does not fit
                        VECTOR_BITSET(mapped,o,1);
                        VECTOR_BITSET(consumed,i,1);
                        break;
                }
                if ( o >= 256 ) {
                        // Failed to find space
                        return 0;
                }
        }
        if ( later_fillin_a == 1 && later_fillin_b == 0) {
                // Straight forward.
                for ( i = 0; i < 256; i++ ) {
                        if ( VECTOR_BITGET(consumed,i) )
                                continue;
                        if ( VECTOR_BITGET(valida,i) ) {
                                for ( o = 0; o < 256; o++ ) {
                                        if ( VECTOR_BITGET(mapped,o) )
                                                continue;
                                        f_inp = extract(FUNCTIONSIZE,fpa->perm,o);
                                        fv = (fpa->func >> f_inp ) & 1;
                                        if ( fv != VECTOR_BITGET(valuea,i) )
                                                continue; // This output position does not fit
                                }
                                VECTOR_BITSET(mapped,o,1);
                                VECTOR_BITSET(consumed,i,1);
                                break;
                        }
                        if ( o >= 256 ) {
                                // Failed to find space
                                return 0;
                        }
                }
        }
        
        if ( later_fillin_a == 0 && later_fillin_b == 1) {
                // Straight forward.
                for ( i = 0; i < 256; i++ ) {
                        if ( VECTOR_BITGET(consumed,i) )
                                continue;
                        if ( VECTOR_BITGET(validb,i) ) {
                                for ( o = 0; o < 256; o++ ) {
                                        if ( VECTOR_BITGET(mapped,o) )
                                                continue;
                                        f_inp = extract(FUNCTIONSIZE,fpb->perm,o);
                                        fv = (fpb->func >> f_inp ) & 1;
                                        if ( fv != VECTOR_BITGET(valueb,i) )
                                                continue; // This output position does not fit
                                }
                                VECTOR_BITSET(mapped,o,1);
                                VECTOR_BITSET(consumed,i,1);
                                break;
                        }
                        if ( o >= 256 ) {
                                // Failed to find space
                                return 0;
                        }
                }
        }

        if ( later_fillin_a == 1 && later_fillin_b == 1 ) {
                ferr( "Work\n" );
        }

        
        return 1;
}

typedef struct AGGREGATE_ {
        struct AGGREGATE_ *next;
        uint8_t   perm[NRCOLUMNS];
        uint32_t  func[NRCOLUMNS];
} AGGREGATE;
AGGREGATE *aggregateheadp = NULL;

/////////////////////////////////////////////////////////////////////////////
int aggregatefit( AGGREGATE const  * const aga, int i, int o ) {
        int c,f_inp,fv;

        for ( c = 0; c < NRCOLUMNS; c++ ) {
                if (aga->perm[c] == 0 )
                        continue;
                f_inp = extract(FUNCTIONSIZE,aga->perm[c],o);
                fv = (aga->func[c] >> f_inp) & 1;
                if ( VECTOR_BITGET(g_valid[c], i) ) {
                        if ( fv != VECTOR_BITGET(g_value[c], i) )
                                return 0;
                }
        }
        return 1;
}

/////////////////////////////////////////////////////////////////////////////
int g_scratchtbl[256];

int possible_many( TBL const * const tblp, FUNCPAC const * const fp, int const inx, AGGREGATE const * const aga ) {
        int i,o,f_inp,fv;
        int later_fillin_b = 0;
        uint32_t mapped[8], consumed[8];

        assert( inx >= 0 );
        assert( inx < NRCOLUMNS );
        
        memset(mapped,0,8*sizeof(uint32_t));
        memset(consumed,0,8*sizeof(uint32_t));

        for ( i = 0; i < 256; i++ ) {
                if ( fixpos[i] ) {
                        VECTOR_BITSET(mapped,i,1);
                        VECTOR_BITSET(consumed,i,1);
                        g_scratchtbl[i] = i;
                } else {
                        g_scratchtbl[i] = -1;
                }
        }
        
        // First map pairs
        for ( i = 0; i < 256; i += 2 ) {
                if ( pairedpos[i] == 0 )
                        continue;
                if ( VECTOR_BITGET(consumed,i) )
                        continue; // Only locations that are both fixed and pair is general illegal at 0xfe, and confirmed interrupt 0xff.
                if ( VECTOR_BITGET(tblp->dontcare,i) &&
                     VECTOR_BITGET(tblp->dontcare,i+1) ) {
                        VECTOR_BITSET(consumed,i,1);
                        VECTOR_BITSET(consumed,i+1,1);
                        continue;
                }
                for ( o = 0; o < 256; o += 2 ) {
                        if ( VECTOR_BITGET(mapped,o) )
                                continue;
                        if ( VECTOR_BITGET(mapped,o+1) )
                                continue;
                        f_inp = extract(FUNCTIONSIZE,fp->perm,o);
                        fv = (fp->func >> f_inp) & 1;
                        if ( fv != VECTOR_BITGET(g_value[inx],i) )
                                continue; // Output position does not fit
                        f_inp = extract(FUNCTIONSIZE,fp->perm,o+1);
                        fv = (fp->func >> f_inp) & 1;
                        if ( fv != VECTOR_BITGET(g_value[inx],i+1) )
                                continue; // Output position does not fit
                        if ( aggregatefit(aga,i,o) == 0 )
                                continue;
                        if ( aggregatefit(aga,i+1,o+1) == 0 )
                                continue;

                        VECTOR_BITSET(mapped,o,1);
                        VECTOR_BITSET(mapped,o+1,1);
                        VECTOR_BITSET(consumed,i,1);
                        VECTOR_BITSET(consumed,i+1,1);
                        if ( g_scratchtbl[o] != -1 )
                                ferr( "Internal\n" );
                        if ( g_scratchtbl[o+1] != -1 )
                                ferr( "Internal\n" );
                        g_scratchtbl[o] = i;
                        g_scratchtbl[o+1] = i+1;
                        break;
                }
                if ( o >= 256 )
                        return 0; // Failed to find space
        }


        // Single lines
        for ( i = 0; i < 256; i++ ) {
                if ( VECTOR_BITGET(consumed,i) )
                        continue;
                if ( VECTOR_BITGET(tblp->dontcare,i) ) {
                        VECTOR_BITSET(consumed,i,1);
                        continue;
                }
                if ( VECTOR_BITGET(g_valid[inx],i) == 0 ) {
                        later_fillin_b = 1;
                        continue;
                }
                for ( o = 0; o < 256; o++ ) {
                        if ( VECTOR_BITGET(mapped,o) )
                                continue;

                        f_inp = extract(FUNCTIONSIZE,fp->perm,o);
                        fv = (fp->func >> f_inp) & 1;
                        if ( fv != VECTOR_BITGET(g_value[inx],i) )
                                continue; // Output position does not fit
                        if ( aggregatefit( aga, i, o) == 0 )
                                continue;

                        VECTOR_BITSET(mapped,o,1);
                        VECTOR_BITSET(consumed,i,1);
                        if ( g_scratchtbl[o] != -1 )
                                ferr( "internal\n" );                                
                        g_scratchtbl[o] = i;
                        break;
                }
                if ( o >= 256 )
                        return 0; // Failed to find space
        }
        if ( later_fillin_b ) {
                for ( i = 0; i < 256; i++ ) {
                        if ( VECTOR_BITGET(consumed,i) )
                                continue;
                        for ( o = 0; o < 256; o++ ) {
                                if ( VECTOR_BITGET(mapped,o) )
                                        continue;
                                if ( aggregatefit( aga, i, o) == 0 )
                                        continue;
                                VECTOR_BITSET(mapped,o,1);
                                VECTOR_BITSET(consumed,i,1);
                                if ( g_scratchtbl[o] != -1 )
                                        ferr( "internal\n" );
                                g_scratchtbl[o] = i;
                                break;
                        }
                        if ( o >= 256 )
                                return 0; // Failed to find space
                }
        }
        return 1;                       
}
        
/////////////////////////////////////////////////////////////////////////////
int evaluatetwo( TBL *tblp, int inxa, int inxb ) {
        FUNCPAC *fpa = tblp->fp[inxa];
        FUNCPAC *fpb;
        uint32_t valida[8];
        uint32_t valuea[8];
        uint32_t validb[8];
        uint32_t valueb[8];
        int possibilities = 0;

        //printf( "Evaluate columns %d and %d\n", inxa, inxb );
        isolate_column_information(tblp, inxa, valuea, valida);
        isolate_column_information(tblp, inxb, valueb, validb);
        //printf( "column %2d:", inxa ); VECTOR3PRI(valuea,valida,256); printf( "\n" );
        //printf( "column %2d:", inxb ); VECTOR3PRI(valueb,validb,256); printf( "\n" );
        while ( fpa ) {
                fpb = tblp->fp[inxb];
                while ( fpb ) {
                        if ( possibletwo(fpa,valida,valuea,fpb,validb,valueb) ) {
                                AGGREGATE *aggregatep;
                                if ( (aggregatep = calloc(1, sizeof(AGGREGATE))) == NULL )
                                        ferr( "Mem\n" );
                                aggregatep->perm[inxa] = fpa->perm;
                                aggregatep->func[inxa] = fpa->func;
                                aggregatep->perm[inxb] = fpb->perm;
                                aggregatep->func[inxb] = fpb->func;
                                aggregatep->next  = aggregateheadp;
                                aggregateheadp = aggregatep;
                                possibilities++;
                        }
                        fpb = fpb->next;
                }
                fpa = fpa->next;
        }
        //printf( "evaluate2: Possibilities: %d\n", possibilities );
        return possibilities;
}

/////////////////////////////////////////////////////////////////////////////
int evaluate_aggregate( TBL *tblp, int inx, int wantnreq ) {
        int i;
        int tbl[256];

        //printf( "aggregate columns %d and ", inx );
        //for ( i = 0; i < NRCOLUMNS; i++ ) 
        //        if ( aggregateheadp->perm[i] )
        //                printf( "%d ", i );
        //printf( "\n" );

        FUNCPAC *fp = tblp->fp[inx];
        AGGREGATE *aga;
        int possibilities = 0;
        AGGREGATE *aggph = NULL;
        
        while ( fp ) {
                aga = aggregateheadp;
                while ( aga ) {

                        if ( possible_many( tblp, fp , inx, aga ) ) {
                                AGGREGATE *aggp;
                                if ( (aggp = calloc(1, sizeof(AGGREGATE))) == NULL )
                                        ferr( "Mem\n" );
                                *aggp = *aga;
//                                if ( aggp->perm[inx] != 0 )
//                                        ferr( "Internal\n" );
                                aggp->perm[inx] = fp->perm;
                                aggp->func[inx] = fp->func;
                                aggp->next = aggph;
                                aggph = aggp;
                                if ( possibilities == 0 ) {
                                        // Record the first possibility only
                                        for ( i = 0; i < 256; i++ )
                                                tbl[i] = g_scratchtbl[i];
                                }
                                possibilities++;
                        }                        
                        aga = aga->next;                        
                }
                fp = fp->next;
        }
        //printf( "evaluate_aggregate: Possibilities: %d\n", possibilities );
        free( aggregateheadp );
        aggregateheadp = aggph;

                
        if ( possibilities > 0 ) {
                printf( "%d ", possibilities );
                int nreq = 0;
                aga = aggregateheadp;
                for ( i = 0; i < NRCOLUMNS; i++ )
                        if ( aga->perm[i] != 0 )
                                nreq++;
                if ( nreq >= wantnreq ) {                        
                        // Print solution
                        printf( "\n" );
                        for ( i = 0; i < 256; i++ ) {
                                if ( i == tbl[i] ) {
                                        printf( "        0x%3.3x,", i );
                                } else {
                                        printf( "/*%2.2x<-*/0x%3.3x,", i, tbl[i] & 0xfffu);
                                }
//                        if ( (i & 7) == 7 )
                                printf( "\n" );
                        }
                        for ( i = 0; i < NRCOLUMNS; i++ )
                                if ( aga->perm[i] != 0 )
                                        printf( "%d %2d 0x%2.2x 0x%4.4x\n", nreq, i, aga->perm[i], aga->func[i] );
                }
        }
        fflush( stdout );
        return possibilities;
}

/////////////////////////////////////////////////////////////////////////////
typedef struct {
        int inx;
        int sol;
} SS;

/////////////////////////////////////////////////////////////////////////////
int sscompar(const void *va, const void *vb ) {
        SS *ap = (SS *)va;
        SS *bp = (SS *)vb;
        uint32_t a = ap->sol;
        uint32_t b = bp->sol;

        return a - b;
}
          
/////////////////////////////////////////////////////////////////////////////
int findevaluationorder( int evaluationorder[], uint32_t selected, TBL *tblp ) {
        int i;
        int start = -1;
        
        SS ss[NRCOLUMNS];
        
        //memset( evaluationorder, 0, NRCOLUMNS*sizeof(int) );
        for ( i = 0; i < NRCOLUMNS; i++ ) {
                ss[i].inx = i;
                if ( ( selected >> i) & 1 ) {
                        ss[i].sol = tblp->possibilities[i];
                        if ( 0 == ss[i].sol )
                                ferr( "Internal\n" );
                } else {
                        ss[i].sol = 0;
                }
        }
        qsort( ss, NRCOLUMNS, sizeof(SS), sscompar );
        //printf( "[" );
        for ( i = 0; i < NRCOLUMNS; i++ ) {
                evaluationorder[i] = ss[i].inx;
                //printf( "%2d ", evaluationorder[i] );
                if ( start == -1 && ss[i].sol != 0 )
                        start = i;
        }
        //printf( "]\n" );
        return start;
}

/////////////////////////////////////////////////////////////////////////////
uint32_t clumsy_nextperm( uint32_t startat, uint32_t mask, int n) {

        do {
                if ( ++startat == 0 )
                        break;
        } while ( (startat & mask) != startat ||  __builtin_popcount( startat) != n );
        return startat;
}
                
/////////////////////////////////////////////////////////////////////////////
int main(void){

//        signal(SIGINT, intHandler);
        int evaluationorder[NRCOLUMNS];
        TBL *tblp;

        printf( "Using %d-input functions\n", FUNCTIONSIZE );
        fflush( stdout );
        tblp = initiate();

        printf( "With LUT%d, examining %d columns.\n", FUNCTIONSIZE, __builtin_popcount(tblp->considered_columns) );
        fflush( stdout );
        
        // Select SNU columns of those columns that are candidates
        // for replacements. Try them.
        int NrColsToRecode;
        uint64_t selected;
        int nrsol = 0;

        
        for ( NrColsToRecode = __builtin_popcount(tblp->considered_columns); NrColsToRecode > 2; NrColsToRecode-- ) {
                selected = 0;
                while ( (selected = clumsy_nextperm( selected, tblp->considered_columns, NrColsToRecode) ) != 0) {
                        
                        printf( "\n%d LUT%d-solutions with %d simplified columns. Try simplify: ", nrsol, FUNCTIONSIZE, NrColsToRecode);
                        VECTOR3PRI( (uint32_t *)&selected, &(tblp->considered_columns), NRCOLUMNS);
                        printf( " " );
                        fflush( stdout );
        
                        int start = findevaluationorder( evaluationorder, selected, tblp );
                        //fprintf( stderr, "Start at %d : column %d with %d possible functions\n",start, evaluationorder[start], tblp->possibilities[evaluationorder[start]] );
                        
                        if ( evaluatetwo( tblp, evaluationorder[start], evaluationorder[start+1] ) == 0 ) {
                                //fprintf( stderr, "No solutions\n" );
                                continue;
                        }
                        //fprintf( stderr, "Has 2\n" );
                        int i;
                        for ( i = start+2; i < NRCOLUMNS; i++ ) {
                                if ( evaluate_aggregate( tblp, evaluationorder[i],NrColsToRecode) == 0 ) {
                                        //fprintf( stderr, "No solutions\n" );
                                        break;
                                }
                        }
                        if ( i < NRCOLUMNS )
                                continue;
                        nrsol++;
                }
                if ( nrsol )
                        break;
        }
        printf( "Seems we have %d solutions extracting %d columns from EBR and using %d-input LUTs instead\n", nrsol, NrColsToRecode, FUNCTIONSIZE );
        return 0;              
}
// 0 0x59 0x0010
// 1 0x0f 0x004a
// 2 0x0f 0x0042
//10 0x3a 0x2000
//11 0x2b 0xf9ff
//26 0x1d 0x0100
