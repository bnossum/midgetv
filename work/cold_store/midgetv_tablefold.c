/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This is an utility to reduce the number of columns needed in ucode.h
 *
 * Given the microcode specification in ucode.h.
 * This is a table of 256 lines, with 42 columns.
 * To represent 42 columns 3 EBRs can be used, but EBR is a scarse resource.
 * This program tries to find out if a column c can be described as a 
 * combination of other columns.
 * Output from the program is the file ucode2.h, of a form similar to ucode,h.
 * 
 * Please bear over with the quick and dirty programming, this file was 
 * originally used in another and much smaller problem, where the recursing
 * was feasible.
 * 
 */
#include <stdint.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

typedef struct {
        int replacednr;
        int nrvars_to_use;
        int nrtoreplace;       
        uint64_t replace;
} SPECPACKET;

#define p(x) (1ull<<(x))

// Use to get 5 equations with 2 inputs.
// Level 5:
     // s33 = fcn2'0x4'(s32,s14)              s33 dependent on s14 s32 
     // s30 = fcn2'0x4'(s25,s2)               s30 dependent on s2 s25 
     // s27 = fcn2'0x4'(s25,s1)               s27 dependent on s1 s25 
     // s22 = fcn2'0x4'(s24,s23)              s22 dependent on s23 s24 
     // s07 = fcn2'0x8'(s27,s8)               s7 dependent on s1 s8 s25 
//5544444444433333333333333333333322222222222222222222222222222222222222222222211111111111111111111111111111111111111111111110
// Use to get 7 equations with 3 inputs.
// s33 = fcn3'0x44'(s42,s32,s14)         s33 dependent on s14 s32 s42 
// s30 = fcn3'0x44'(s42,s25,s2)          s30 dependent on s2 s25 s42 
// s29 = fcn3'0x92'(s28,s9,s8)           s29 dependent on s8 s9 s28 
// s27 = fcn3'0x44'(s42,s25,s1)          s27 dependent on s1 s25 s42 
// s22 = fcn3'0x04'(s42,s24,s23)         s22 dependent on s23 s24 s42 
// s10 = fcn3'0x08'(s36,s19,s14)         s10 dependent on s14 s19 s36 
// s7 = fcn3'0x88'(s42,s27,s8)           s7 dependent on s1 s8 s25 s42 

// Level 10:
          // s33 = fcn4'0x0444'(s42,s41,s32,s14)   s33 dependent on s14 s32 s41 s42 
          // s31 = fcn4'0x000d'(s21,s20,s9,s8)     s31 dependent on s8 s9 s20 s21 
          // s30 = fcn4'0x4040'(s42,s41,s25,s2)    s30 dependent on s2 s25 s41 s42 
          // s29 = fcn4'0x8082'(s40,s28,s21,s19)   s29 dependent on s19 s21 s28 s40 
          // s27 = fcn4'0x4044'(s42,s41,s25,s1)    s27 dependent on s1 s25 s41 s42 
          // s24 = fcn4'0x4448'(s42,s40,s23,s20)   s24 dependent on s20 s23 s40 s42 
          // s22 = fcn4'0x0008'(s42,s41,s21,s2)    s22 dependent on s2 s21 s41 s42 
          // s10 = fcn4'0x0002'(s42,s41,s39,s19)   s10 dependent on s19 s39 s41 s42 
          // s7 = fcn4'0x8080'(s42,s41,s36,s27)    s7 dependent on s1 s25 s36 s41 s42 
          // s0 = fcn4'0x4001'(s27,s14,s13,s8)     s0 dependent on s1 s8 s13 s14 s25 s41 s42 


////SPECPACKET spec[20] = {  
////        {0,,3,10, ~0ll}, 
////        {0,0,0,0}};
////        {0,4,3, ~0ll ^ (got3 | p(41) | p(40) |p(39) |p(38) |p(37) |p(36) |p(35) |p(34)) }, 
//#define got3 (p(33)|p(30)|p(29)|p(27)|p(22)|p(10)|p(7))
//SPECPACKET spec[20] = { 
//        {0,3,7, got3 },
//        {0,0,0,0}};

//
//////#define got4 ( p(33) | p(31) | p(30) | p(29) | p(27) | p(24) | p(22) | p(10) | p(7 ) | p(0 ) )
////#define got4 ( p(33) | p(31) | p(30) | p(29) | p(27) | p(24) | p(22) | p(10) | p(7 ) )
//SPECPACKET spec[20] = { 
//        {0,4,10, ~0LL ^ 1 },
//        {0,0,0,0}};

// s33 = fcn4'0x0444'(s42,s41,s32,s14)   s33 dependent on s14 s32 s41 s42 
// s31 = fcn4'0x000d'(s21,s20,s09,s08)   s31 dependent on s08 s09 s20 s21 
// s30 = fcn4'0x4040'(s42,s41,s25,s02)   s30 dependent on s02 s25 s41 s42 
// s29 = fcn4'0x8082'(s40,s28,s21,s19)   s29 dependent on s19 s21 s28 s40 
// s27 = fcn4'0x4044'(s42,s41,s25,s01)   s27 dependent on s01 s25 s41 s42 
// s24 = fcn4'0x2a80'(s42,s40,s31,s23)   s24 dependent on s08 s09 s20 s21 s23 s40 s42 
// s22 = fcn4'0x0008'(s42,s41,s21,s02)   s22 dependent on s02 s21 s41 s42 
// s10 = fcn4'0x0002'(s42,s41,s39,s19)   s10 dependent on s19 s39 s41 s42 
// s07 = fcn4'0x8080'(s42,s41,s36,s27)   s07 dependent on s01 s25 s36 s41 s42 

//SPECPACKET spec[20] = {
//        { 0, 3, 7, (p(33)|p(30)|p(29)|p(27)|p(22)|p(10)|p(7)) },
//        {0,4,3, ~0LL ^  0xffe00000001ull },
//        {0,0,0,0}};

SPECPACKET spec[20] = {
        {0,3,4, (p(33)|p(29)|p(22)|p(10)) },
        {0,3,6, ~0LL },
        {0,0,0,0}};

#undef p
#define ferr(...) exit(fprintf(stderr,"%s:%d:", __FILE__, __LINE__)+ fprintf(stderr, __VA_ARGS__))

// Defeat quoting system of some shells
#define STRX(x) # x
#define STR(x) STRX(x)
#define fname STR(nakedfname)


typedef enum {
#define X(label,txt,def,reachability,mask,instr,nrhit) label,
#include fname
        _LEND
} LABELS;

#define colmodmask ~0ull

uint64_t g_ctrl0[256] = {
#define x 0b0
#define X(label,txt,def,reachability,mask,instr,nrhit) def,
#include fname
};

uint64_t g_ctrl1[256] = {
#define x 0b1
#define X(label,txt,def,reachability,mask,instr,nrhit) def,
#include fname
};

char *g_ctrlstr[256] = {
#define X(label,txt,def,reachability,mask,instr,nrhit) txt,
#include fname
};


//  // 00 value 0
//  // 01 value 1
//  // 10 unavailable U
//  // 11 don't care  X

typedef struct _FO {
        uint64_t b0[256];          // 
        uint64_t b1[256];          // 
        uint64_t dep[64];          // Dependency of a column on other columns
        uint64_t allreadyreplaced; // 
        uint32_t fcn; // Defined function
        uint32_t tc;  // Column that is defined
        uint32_t nrv; // How many variables for the function
        uint32_t cc[4]; // Variables used in the function
} FO;

void common_code(uint32_t level, int32_t tc);


FO tt[64]; // The data structure. We will at most replace 16 equations.
#define NREQATIONS (MIDGETV_UCODE_NREQ+8)
int g_speclevel;   // No reason to transfer this on stack
int g_verbose = 1; // For debugging

#define isV_X(c) (((tt[level].b1[k]>>(c)) & 1) ? ( (tt[level].b0[k]>>(c)) & 1) : 0)
#define V_V(c) ((tt[level].b0[k]>>(c)) & 1)
#define extV_V(c)       ((((tt[level].b1[k]>>c) & 1)<<1) | ((tt[level].b0[k]>>c) & 1))
// Never sets to don't care
#define setV(c,v)  do {                                                 \
                tt[level].b1[k] &= ~(1uL<<(c));                         \
                tt[level].b0[k] &= ~(1uL<<(c));                         \
                tt[level].b0[k] |= (((v)&1uL)<<(c));                    \
        } while (0)
#define fcn1(a)       (((f)>>(                  (a)))&1)
#define fcn2(a,b)     (((f)>>(            2*(a)+(b)))&1)
#define fcn3(a,b,c)   (((f)>>(      4*(a)+2*(b)+(c)))&1)
#define fcn4(a,b,c,d) (((f)>>(8*(a)+4*(b)+2*(c)+(d)))&1)

#define SETLIM(col,low,high) do { if ( isV_X(col) ) { low = 0; high = 1;} else { low = V_V(col); high = low; }} while (0)



/////////////////////////////////////////////////////////////////////////////
void print_as_bin( int nrbits, uint64_t p, uint64_t n ) {
        int k,a,b;
        
        for ( k = nrbits-1; k >= 0; k-- ) {
                a = (p >> k) & 1;
                b = (n >> k) & 1;
                if ( b ) {
                        printf( "x" );
                } else {
                        printf( "%c", a+'0');
                }
        }
}

/////////////////////////////////////////////////////////////////////////////
void print_ctrltbl( int level, char *title ) {
        int k,ii,i;
        uint64_t a,b;

        printf( "#if 0\n" );
        printf( " %s", title );
        printf( "  " );
        for ( i = NREQATIONS-1; i >= 0; i-- ) {
                if ( i >= 10 ) {
                        printf( "%d", i/10 );
                }
        }
        printf( "\n" );
        printf( "  " );
        for ( i = NREQATIONS-1; i >= 0; i-- )
                printf( "%d", i % 10 );
        printf( "\n" );
        for ( ii = 0; ii < 256; ii++ ) {
                k = ii;
                a = tt[level].b0[k];
                b = tt[level].b1[k];
                printf( "  " );
                print_as_bin(NREQATIONS,a,b);
                printf( " %-100s*/", g_ctrlstr[k] );
                printf( ",\n" );
        }
        printf( "#endif\n" );
}



/////////////////////////////////////////////////////////////////////////////
void prepare_data( void ) {
        int64_t i,j;
        
        for ( i = 0; i < 256; i++ ) {
                for ( j = 0; j < NREQATIONS; j++ ) {
                        if ( ((g_ctrl0[i]^g_ctrl1[i])>>j) & 1 ) {
                                tt[0].b1[i] |= (1uL<<j); // Unknown
                                tt[0].b0[i] |= (1uL<<j);
                        } else {
                                tt[0].b0[i] |= (g_ctrl0[i] & (1uL << j)); // Value
                        }
                }
                tt[0].b0[i] |= ( i << NREQATIONS ); // Counter value
        }
        for ( i = 0; i < 64; i++ ) 
                tt[0].dep[i] |= (1uL << i);
        tt[0].allreadyreplaced = 0; // Eliminated
}

/////////////////////////////////////////////////////////////////////////////
int tryrepresent1( int level, uint32_t tc, uint32_t cca, uint32_t f ) {
        int k,a,alow,ahigh,match;
        uint32_t v;

        // For all lines in the table
        for ( k = 0; k < 256; k++ ) {
                
                if ( isV_X(tc) ) 
                        continue; // Target column not in use in line k, so matches candidate column
                
                v = V_V(tc);

                SETLIM(cca,alow,ahigh);
                                
                match = 0;
                for ( a = alow; a <= ahigh; a++ ) {
                        if ( fcn1(a) == v ) {
                                match = 1;
                                goto OutOfLoop;
                        }
                }
        OutOfLoop:
                if ( match )
                        continue; // Candidate column fits requirement for line k.
                
                // Can't represent column tc by cc using function f
                return 0;
        }
        return 1;
}
/////////////////////////////////////////////////////////////////////////////
int tryrepresent2( int level, uint32_t tc, uint32_t cca, uint32_t ccb, uint32_t f ) {
        int k,a,alow,ahigh,b,blow,bhigh,match;
        uint32_t v;

        for ( k = 0; k < 256; k++ ) {
                if ( isV_X(tc) ) 
                        continue; 
                v = V_V(tc);
                SETLIM(cca,alow,ahigh);
                SETLIM(ccb,blow,bhigh);
                match = 0;
                for ( a = alow; a <= ahigh; a++ ) {
                        for ( b = blow; b <= bhigh; b++ ) {
                                if ( fcn2(a,b) == v ) {
                                        match = 1;
                                        goto OutOfLoop;
                                }
                        }
                }
        OutOfLoop:
                if ( match )
                        continue; 
                return 0;
        }
        return 1;
}

/////////////////////////////////////////////////////////////////////////////
int tryrepresent3( int level, uint32_t tc, uint32_t cca, uint32_t ccb, uint32_t ccc, uint32_t f ) {
        int k,a,alow,ahigh,b,blow,bhigh,c,clow,chigh,match;
        uint32_t v;

        // For all lines in the table
        for ( k = 0; k < 256; k++ ) {

                if ( isV_X(tc) ) 
                        continue; // Target column not in use in line k, so matches candidate column
                
                v = V_V(tc);

                SETLIM(cca,alow,ahigh);
                SETLIM(ccb,blow,bhigh);
                SETLIM(ccc,clow,chigh);

                match = 0;
                for ( a = alow; a <= ahigh; a++ ) {
                        for ( b = blow; b <= bhigh; b++ ) {
                                for ( c = clow; c <= chigh; c++ ) {
                                        if ( fcn3(a,b,c) == v ) {
                                                match = 1;
                                                goto OutOfLoop;
                                        }
                                }
                        }
                }
        OutOfLoop:
                if ( match )
                        continue; // Candidate column fits requirement for line k.
                
                // Can't represent column tc by cc using function f
                return 0;
        }
        return 1;
}
/////////////////////////////////////////////////////////////////////////////
int tryrepresent4( int level, uint32_t tc, uint32_t cca, uint32_t ccb, uint32_t ccc, uint32_t ccd, uint32_t f ) {
        int k,a,alow,ahigh,b,blow,bhigh,c,clow,chigh,match,dlow,dhigh,d;
        uint32_t v;

        // For all lines in the table
        for ( k = 0; k < 256; k++ ) {

                if ( isV_X(tc) ) 
                        continue; // Target column not in use in line k, so matches candidate column
                
                v = V_V(tc);

                SETLIM(cca,alow,ahigh);
                SETLIM(ccb,blow,bhigh);
                SETLIM(ccc,clow,chigh);
                SETLIM(ccd,dlow,dhigh);
                
                match = 0;
                for ( a = alow; a <= ahigh; a++ ) {
                        for ( b = blow; b <= bhigh; b++ ) {
                                for ( c = clow; c <= chigh; c++ ) {
                                        for ( d = dlow; d <= dhigh; d++ ) {
                                                if ( fcn4(a,b,c,d) == v ) {
                                                        match = 1;
                                                        goto OutOfLoop;
                                                }
                                        }
                                }
                        }
                }
        OutOfLoop:
                if ( match )
                        continue; // Candidate column fits requirement for line k.
                
                // Can't represent column tc by cc using function f
                return 0;
        }
        return 1;
}




/////////////////////////////////////////////////////////////////////////////
/*
  Original 0 must still be 0
  Original 1 must still be 1

  Revise this code in case of problems
 */
void paranoia( uint32_t level ) {
        uint32_t k,a,m,n,i,valcca,v,valtc,valccb,valccc,valccd;
#define MM 0xffffffffffful
        
        //fprintf( stderr, "Paranoia\n" );
        for ( k = 0; k < 256; k++ ) {
                m = tt[0].b1[k] & MM; // Original don't care
                n = m ^ MM; // Every bit position set in n, we have an original 0 or 1.

                a = tt[level].b1[k] & MM;
                if ( n & a)
                        ferr( "A fixed 0 or 1 has been transformed to X or U\n");


                a = tt[level].b0[k];    // Now values
                a = a ^ tt[0].b0[k];    // XOR original values
                a &= MM;

                if ( a & n )
                        ferr( "A fixed 0 or 1 has been toggled in line %d=0x%x\nold=%8.8x\nnew=%8.8x\n",
                              k, k, (uint32_t)(tt[0].b0[k] & n), (uint32_t)(tt[level].b0[k] & n));
#if 1
                // And then check the functions
                for ( i = 1; i <= level; i++ ) {
                        switch ( tt[i].nrv ) {
                        case 1 :
                                if ( (tt[0].b1[k] >> tt[i].tc) & 1) // Original don't care is the relevant
                                        break; // Don't care tc
                                valcca = (tt[i].b0[k] >> tt[i].cc[0]) & 1;
                                v = ((tt[i].fcn>>valcca) & 1);
                                valtc = (tt[i].b0[k] >> tt[i].tc) & 1;
                                if ( valtc != v )
                                        ferr( "Internal error\n"
                                              "k=%d=0x%x level = %d f=0x%x cca = %d valcca=%d f(%d) = %d, "
                                              "tc=%d valttc=%d\n",
                                              k, k, level, tt[i].fcn, tt[i].cc[0], valcca, valcca, v,
                                              tt[i].tc, valtc );
                                break;
                        case 2 :
                                if ( (tt[0].b1[k] >> tt[i].tc) & 1) // Original don't care is the relevant
                                        break; // Don't care tc
                                valccb = (tt[i].b0[k] >> tt[i].cc[0]) & 1;
                                valcca = (tt[i].b0[k] >> tt[i].cc[1]) & 1;
                                v = ((tt[i].fcn>>(valcca*2+valccb)) & 1);
                                valtc = (tt[i].b0[k] >> tt[i].tc) & 1;
                                if ( valtc != v )
                                        fprintf( stderr, "xInternal error\n"
                                              "k=%d=0x%x level = %d f=0x%x cca = %d ccb = %d "
                                              " valcca=%d valccb=%d f(%d,%d) = %d, "
                                              "tc=%d valttc=%d\n",
                                              k, k, i, tt[i].fcn, tt[i].cc[1], tt[i].cc[0],
                                              valcca, valccb, valcca, valccb, v,
                                              tt[i].tc, valtc );
                                break;
                        case 3 :
                                if ( (tt[0].b1[k] >> tt[i].tc) & 1) // Original don't care is the relevant
                                        break; // Don't care tc
                                valccc = (tt[i].b0[k] >> tt[i].cc[0]) & 1;
                                valccb = (tt[i].b0[k] >> tt[i].cc[1]) & 1;
                                valcca = (tt[i].b0[k] >> tt[i].cc[2]) & 1;
                                v = ((tt[i].fcn>>(valcca*4+valccb*2+valccc)) & 1);
                                valtc = (tt[i].b0[k] >> tt[i].tc) & 1;
                                if ( valtc != v )
                                        fprintf( stderr, "xInternal error\n"
                                              "k=%d=0x%x level = %d f=0x%x cca = %d ccb = %d "
                                              " valcca=%d valccb=%d f(%d,%d) = %d, "
                                              "tc=%d valttc=%d\n",
                                              k, k, i, tt[i].fcn, tt[i].cc[1], tt[i].cc[0],
                                              valcca, valccb, valcca, valccb, v,
                                              tt[i].tc, valtc );
                                break;
                        case 4 :
                                if ( (tt[0].b1[k] >> tt[i].tc) & 1) // Original don't care is the relevant
                                        break; // Don't care tc
                                valccd = (tt[i].b0[k] >> tt[i].cc[0]) & 1;
                                valccc = (tt[i].b0[k] >> tt[i].cc[1]) & 1;
                                valccb = (tt[i].b0[k] >> tt[i].cc[2]) & 1;
                                valcca = (tt[i].b0[k] >> tt[i].cc[3]) & 1;
                                v = ((tt[i].fcn>>(valcca*8+valccb*4+valccc*2+valccd)) & 1);
                                valtc = (tt[i].b0[k] >> tt[i].tc) & 1;
                                if ( valtc != v )
                                        ferr("ddxInternal error\n"
                                              "k=%d=0x%x level = %d f=0x%x cca = %d ccb = %d "
                                              " valcca=%d valccb=%d f(%d,%d) = %d, "
                                              "tc=%d valttc=%d\n",
                                              k, k, i, tt[i].fcn, tt[i].cc[1], tt[i].cc[0],
                                              valcca, valccb, valcca, valccb, v,
                                              tt[i].tc, valtc );
                                break;
                                
                        default : ferr( "Internal\n" );
                        }
                }
#endif
        }

}
                        
/////////////////////////////////////////////////////////////////////////////
uint64_t statusnow( int dbg, int level ) {
        int i,j,n,tc;
        uint64_t replacedcolumns = 0;
        FILE *fo = stdout;
        FILE *sink = NULL;
        
        if ( dbg == 0 ) {
                if ( (sink=fopen("/dev/null","w")) == NULL)
                        ferr( "Que?\n" );
                fo = sink;
        }
                
        fprintf( fo, "// Level %d.%d:\n", g_speclevel, level );
        for ( i = 1; i <= level; i++ ) {
                fprintf( fo, "%*s", level, " " );
                tc = tt[i].tc;
                replacedcolumns |= (1ull<<tc);
                switch ( tt[i].nrv ) {
                case 1 :
                        n = fprintf( fo, "// s%2.2d = fcn1'0x%x'(s%2.2d)",
                                     tc, tt[i].fcn, tt[i].cc[0] );
                        //..tt[level].dep[tc] |= tt[level].dep[cca];
                        break;
                case 2 :
                        n = fprintf( fo, "// s%2.2d = fcn2'0x%x'(s%2.2d,s%2.2d)",
                                     tt[i].tc, tt[i].fcn, tt[i].cc[1], tt[i].cc[0] );
                        break;
                case 3 :
                        n = fprintf( fo, "// s%2.2d = fcn3'0x%2.2x'(s%2.2d,s%2.2d,s%2.2d)",
                                     tt[i].tc, tt[i].fcn, tt[i].cc[2], tt[i].cc[1], tt[i].cc[0] );
                        break;
                case 4 : 
                        n = fprintf( fo, "// s%2.2d = fcn4'0x%4.4x'(s%2.2d,s%2.2d,s%2.2d,s%2.2d)",
                                     tt[i].tc, tt[i].fcn, tt[i].cc[3], tt[i].cc[2], tt[i].cc[1], tt[i].cc[0] );
                        break;
                default :
                        ferr( "Internal\n" );
                }
                fprintf( fo, "%*s s%2.2d dependent on ", 40-n, " " , tc);
                for ( j = 0; j < 45; j++ ) 
                        if ( (tt[level].dep[tc] >> j) & 1 )
                                fprintf( fo, "s%2.2d ", j );
                fprintf( fo, "\n" );
        }
        fflush(fo);
        if ( sink != NULL )
                fclose( sink );
        return replacedcolumns;
}

/////////////////////////////////////////////////////////////////////////////
void result_ctrltbl( int level, char *title, uint64_t replacedcolumns ) {
        int ii,j;
        uint64_t a,b;

        printf( "// %s", title );

        printf( "//        " );
        for ( j = NREQATIONS-1; j >= 0; j-- ) 
                if ( ((replacedcolumns >> j) & 1)  == 0 )
                        printf( "%c ", j/10 != 0 ? j/10 + '0' : ' ' );
        printf( "  Original \n//        " );
        for ( j = NREQATIONS-1; j >= 0; j-- ) 
                if ( ((replacedcolumns >> j) & 1)  == 0 )
                        printf( "%d ", j % 10 );
        printf( "  Columns\n" );
        

        int jj = 0;
        for ( j = NREQATIONS-1; j >= 0; j-- )
                if ( ((replacedcolumns >> j) & 1) )
                        jj++;
        printf( "//        ");
        for ( j = NREQATIONS-jj-1; j >= 0; j-- )
                printf( "%c ", j/10 != 0 ? j/10+'0' : ' ' );
        printf( "\n" );
        printf( "//        ");
        for ( j = NREQATIONS-jj-1; j >= 0; j-- )
                printf( "%d ", j%10 );
        printf( "\n" );
        
        for ( ii = 0; ii < 256; ii++ ) {
                a = tt[level].b0[ii];
                b = tt[level].b1[ii];
                printf( "/* %2.2x */ (", ii );
                for ( j = NREQATIONS-1; j >= 0; j-- ) 
                        if ( ((replacedcolumns >>j) & 1) == 0 ) {
                                if ( (b >>j) & 1 ) {
                                        printf( "x" );
                                } else {
                                        printf( "%d", (int)((a>>j)&1) );
                                }                                
                                if ( j != 0 )
                                        printf( "," );
                        }
                printf( "), \"%s\"\n", g_ctrlstr[ii] );
        }
}

/////////////////////////////////////////////////////////////////////////////
void findandwritelutdef( int level, int i, int j ) {
        int l,tc;
        
        for ( l = 1; l <= level; l++ ) {
                tc = tt[l].tc;
                if ( tc == i ) {
                        switch( tt[l].nrv ) {
                        case 1 :
                                if ( tt[l].fcn != 2 )
                                        ferr( "Absolutly no rationale to replace variable with constant or inverse\n" );
                                printf( "#define OPT_S%d() ", i );
                                printf( "int s%d = s%d\n", i, tt[l].cc[0] );
                                printf( "Work1\n" );
                                break;
                        case 2 :
                                printf( "#define OPT_S%d() ", i );
                                printf( "L2( _c_(%x), s%d, V2(s%d,s%d))\n", tt[l].fcn, i, tt[l].cc[1], tt[l].cc[0] );
                                break;
                        case 3 :
                                printf( "#define OPT_S%d() ", i );
                                printf( "L3( _c_(%2.2x), s%d, V3(s%d,s%d,s%d))\n", tt[l].fcn, i, tt[l].cc[2], tt[l].cc[1], tt[l].cc[0] );
                                break;
                        case 4 :
                                printf( "#define OPT_S%d() ", i );
                                printf( "L4( _c_(%4.4x), s%d, V4(s%d,s%d,s%d,s%d))\n", tt[l].fcn, i, tt[l].cc[3], tt[l].cc[2], tt[l].cc[1], tt[l].cc[0] );
                                break;
                        default :
                                ferr( "internal\n" );
                        }
                        return;                                
                }
        }
        ferr( "internal. level=%d j=%d\n", level, j );
}

/////////////////////////////////////////////////////////////////////////////
void generate_fragile_code( int level ) {
        uint64_t replacedcolumns = statusnow(0,level);
        int i,j;

        
        result_ctrltbl(level," Optimized complete tables\n//\n", replacedcolumns );
        printf( "#define REPLACEDCOLUMNS 0x%" PRIx64 "ull\n", replacedcolumns );
                
        j = 0;
        for ( i = 0; i < NREQATIONS; i++ ) {
                if ( ((replacedcolumns >>i) & 1) == 0 ) {
                        printf( "#define OPT_S%.2d() int s%-2d = (ctrldata>> %d) & 1\n",
                                i,i,j );
                        j++;
                } else {
                        findandwritelutdef( level, i, j );
                }
        }
}

/////////////////////////////////////////////////////////////////////////////
void propagate_dependency( uint64_t seendep, int level, int tc, uint64_t tcdep, int dbg ) {                
        int ii;

        //fprintf( stderr, "propagate_dependency: level=%d tc=%d, tcdep=%lx\n", level, tc, tcdep );
        for( ii = 0; ii < NREQATIONS; ii++ ) {
                if ( (seendep >> ii) & 1 )
                        continue;
                if ( (tt[level].dep[ii] >> tc) & 1 ) {
                        if ( dbg )
                                fprintf( stderr, "s%d is dependent on s%d so dependency goes from 0x%lx ",
                                         ii, tc, tt[level].dep[ii]  );                        
                        tt[level].dep[ii] |= tcdep;
                        if ( dbg ) {
                                fprintf( stderr, "Depenency for s%d is 0x%lx. Recurse\n",ii, tt[level].dep[ii] );
                        }
                        propagate_dependency( seendep | (1uL<<ii), level, ii, tcdep, dbg );
                }
        }
}


/////////////////////////////////////////////////////////////////////////////
void makerepresentation1( int level, uint32_t tc, uint32_t cca, uint32_t f ) {
        int k,a,alow,ahigh;
        int tcisX;
        uint32_t tcv;
        
        //fprintf( stderr, "\nmakerepresentation1: level=%d tc=%d cca=%d ccb=%d f=%d: ", level, tc, cca,ccb,f );
        
        // Modifications are all made in the new level
        memcpy(&tt[level+1],&tt[level],sizeof(FO) );
        level++;

        
        // For all lines in the table
        for ( k = 0; k < 256; k++ ) {

                tcisX = isV_X(tc);
                tcv = V_V(tc);

                SETLIM(cca,alow,ahigh);
                
                // Fill in tc using the selected function
                for ( a = alow; a <= ahigh; a++ ) {
                        if (  tcisX  ) {
                                setV(tc,fcn1(a));
                                setV(cca,a);
                                goto Out;
                        } else if ( fcn1(a) == tcv ) {
                                setV(cca,a);
                                goto Out;
                        }
                }
        Out:;
        }

        /* We must remember the function now defined */
        tt[level].fcn = f;
        tt[level].tc = tc;
        tt[level].cc[1] = cca;
        tt[level].nrv = 1;

        /* We have represented tc = fcn1(cca). 
         */
        tt[level].dep[tc] = tt[level].dep[cca];
        propagate_dependency( (1<<tc), level, tc, tt[level].dep[tc], 0 ); // fitte
        tt[level].allreadyreplaced |= (1uL << tc);
        common_code(level,tc); // Recurse
}

/////////////////////////////////////////////////////////////////////////////
void makerepresentation2( int level, uint32_t tc, uint32_t cca, uint32_t ccb, uint32_t f ) {
        int k,a,alow,ahigh,b,blow,bhigh;
        int tcisX;
        uint32_t tcv;
        
        //fprintf( stderr, "\nmakerepresentation2: level=%d tc=%d cca=%d ccb=%d f=%d: ", level, tc, cca,ccb,f );
        // Modifications are all made in the new level
        memcpy(&tt[level+1],&tt[level],sizeof(FO) );
        level++;

        // For all lines in the table
        for ( k = 0; k < 256; k++ ) {

                tcisX = isV_X(tc);
                tcv = V_V(tc);

                SETLIM(cca,alow,ahigh);
                SETLIM(ccb,blow,bhigh);
                
                // Fill in tc using the selected function
                for ( a = alow; a <= ahigh; a++ ) {
                        for ( b = blow; b <= bhigh; b++ ) {
                                if (  tcisX  ) {
                                        setV(tc,fcn2(a,b));
                                        setV(cca,a);
                                        setV(ccb,b);
                                        goto Out;
                                } else if ( fcn2(a,b) == tcv ) {
                                        setV(cca,a);
                                        setV(ccb,b);
                                        goto Out;
                                }
                        }
                }
        Out:;
        }
        
        /* We must remember the function now defined */
        tt[level].fcn = f;
        tt[level].tc = tc;
        tt[level].cc[1] = cca;
        tt[level].cc[0] = ccb;
        tt[level].nrv = 2;

        /* We have represented tc = fcn2(cca,ccb).  */
        tt[level].dep[tc] = tt[level].dep[cca] | tt[level].dep[ccb];        
        propagate_dependency( (1<<tc), level, tc, tt[level].dep[tc], 0 ); // ? is this right
        tt[level].allreadyreplaced |= (1uL << tc);
        common_code(level,tc);
}

/////////////////////////////////////////////////////////////////////////////
void makerepresentation3( int level, uint32_t tc, uint32_t cca, uint32_t ccb, uint32_t ccc, uint32_t f ) {
        int k,a,alow,ahigh,b,blow,bhigh,c,clow,chigh;
        int tcisX;
        uint32_t tcv;
                
        // Modifications are all made in the new level
        memcpy(&tt[level+1],&tt[level],sizeof(FO) );
        level++;        
        
        // For all lines in the table
        for ( k = 0; k < 256; k++ ) {
                
                tcisX = isV_X(tc);
                tcv = V_V(tc);
                
                SETLIM(cca,alow,ahigh);
                SETLIM(ccb,blow,bhigh);
                SETLIM(ccc,clow,chigh);
                
                // Fill in tc using the selected function
                for ( a = alow; a <= ahigh; a++ ) {
                        for ( b = blow; b <= bhigh; b++ ) {
                                for ( c = clow; c <= chigh; c++ ) {
                                        if (  tcisX  ) {
                                                setV(tc,fcn3(a,b,c));
                                                setV(cca,a);
                                                setV(ccb,b);
                                                setV(ccc,c);
                                                goto Out;
                                        } else {
                                                if ( fcn3(a,b,c) == tcv ) {
                                                        setV(cca,a);
                                                        setV(ccb,b);
                                                        setV(ccc,c);
                                                        goto Out;
                                                }
                                        }
                                }
                        }
                }
        Out:;
        }
        
        /* We must remember the function now defined */
        tt[level].fcn = f;
        tt[level].tc = tc;
        tt[level].cc[2] = cca;
        tt[level].cc[1] = ccb;
        tt[level].cc[0] = ccc;
        tt[level].nrv = 3;
        
        /* We have represented tc = fcn3(cca,ccb,ccc). 
         */
        tt[level].dep[tc] = tt[level].dep[cca] | tt[level].dep[ccb] | tt[level].dep[ccc];        
        propagate_dependency( 0, level, tc, tt[level].dep[tc], 0 );
        tt[level].allreadyreplaced |= (1uL << tc);
        
        common_code(level,tc);
}

/////////////////////////////////////////////////////////////////////////////
void makerepresentation4( int level, uint32_t tc, uint32_t cca, uint32_t ccb, uint32_t ccc, uint32_t ccd, uint32_t f ) {
        int k,a,alow,ahigh,b,blow,bhigh,c,clow,chigh,dlow,dhigh,d;
        int tcisX;
        uint32_t tcv;
        
        // Modifications are all made in the new level
        memcpy(&tt[level+1],&tt[level],sizeof(FO) );
        level++;        
        
        // For all lines in the table
        for ( k = 0; k < 256; k++ ) {

                tcisX = isV_X(tc);
                tcv = V_V(tc);

                SETLIM(cca,alow,ahigh);
                SETLIM(ccb,blow,bhigh);
                SETLIM(ccc,clow,chigh);
                SETLIM(ccd,dlow,dhigh);

                // Fill in tc using the selected function
                for ( a = alow; a <= ahigh; a++ ) {
                        for ( b = blow; b <= bhigh; b++ ) {
                                for ( c = clow; c <= chigh; c++ ) {
                                        for ( d = dlow; d <= dhigh; d++ ) {
                                                if (  tcisX  ) {
                                                        setV(tc,fcn3(a,b,c));
                                                        setV(cca,a);
                                                        setV(ccb,b);
                                                        setV(ccc,c);
                                                        setV(ccd,d);
                                                        goto Out;
                                                } else {
                                                        if ( fcn4(a,b,c,d) == tcv ) {
                                                                setV(cca,a);
                                                                setV(ccb,b);
                                                                setV(ccc,c);
                                                                setV(ccd,d);
                                                                goto Out;
                                                        }
                                                }
                                        }
                                }
                        }
                }
        Out:;
        }
        
        /* We must remember the function now defined */
        tt[level].fcn = f;
        tt[level].tc = tc;
        tt[level].cc[3] = cca;
        tt[level].cc[2] = ccb;
        tt[level].cc[1] = ccc;
        tt[level].cc[0] = ccd;
        tt[level].nrv = 4;
        
        /* We have represented tc = fcn4(cca,ccb,ccc,ccd). 
         */
        tt[level].dep[tc] = tt[level].dep[cca] | tt[level].dep[ccb] | tt[level].dep[ccc] | tt[level].dep[ccd];        
        propagate_dependency( 0, level, tc, tt[level].dep[tc], 0 );
        tt[level].allreadyreplaced |= (1uL << tc);

        common_code(level,tc);
}


/////////////////////////////////////////////////////////////////////////////
// Perhaps columns are infact equal?
void mkcomb1(int level, int tcstart ) {
        int32_t tc,f;
        int32_t cca;
        
        // Target column to replace
        for ( tc = tcstart; tc >= 0; tc-- ) {
                
                // I am only interested in some specific columns                
                if ( ((spec[g_speclevel].replace >> tc) & 1 ) == 0 )
                        continue;
                
                // May have processed the column already
                if ( (tt[level].allreadyreplaced >> tc) & 1 )
                        continue;
                
                // Candidate column cca to use
                for ( cca = NREQATIONS; cca >= 0; cca-- ) {
                                                
                        // Can't replace a target column by itself
                        if ( (tt[level].dep[cca] >> tc) & 1 )
                                continue;
                        
                        // Function to try. There are 1^2^1 = 4
                        // 1-input functions. It could be argued that this
                        // program should not be needed for functions that are
                        // constant 0 or 1, but what the heck.
                        for ( f = 0; f < 0x4; f++ ) {
                                if ( tryrepresent1( level, tc, cca, f ) ) {
                                        makerepresentation1( level, tc, cca, f);
                                }
                        }
                }
        }
}

/////////////////////////////////////////////////////////////////////////////
void mkcomb2(int level, int tcstart ) {
        int32_t tc,f;
        int32_t cca,ccb;
        
        for ( tc = tcstart; tc >= 0; tc-- ) {
                if ( ((spec[g_speclevel].replace >> tc) & 1 ) == 0 )
                        continue;
                if ( (tt[level].allreadyreplaced >> tc) & 1 )
                        continue;
                for ( cca = NREQATIONS; cca >= 0; cca-- ) {
                        if ( ( tt[level].dep[cca] >> tc) & 1 ) 
                                continue;
                        for ( ccb = cca-1; ccb >= 0; ccb-- ) {
                                if ( (tt[level].dep[ccb] >> tc) & 1 )
                                        continue;
                                // 1^2^2 functions
                                for ( f = 0; f < 0x10; f++ ) {
                                        if ( tryrepresent2( level, tc, cca, ccb, f ) ) {
                                                makerepresentation2( level, tc, cca, ccb, f);
                                        }
                                }                                
                        }
                }
        }
}



/////////////////////////////////////////////////////////////////////////////
void mkcomb3(int level, int tcstart ) {
        int32_t tc,f;
        int32_t cca,ccb,ccc;

        // Target column to replace
        for ( tc = tcstart; tc >= 0; tc-- ) {
                //fprintf( stderr, "{%d} ", tc );
                
                // I am only interested in some specific columns                
                if ( ((spec[g_speclevel].replace >> tc) & 1 ) == 0 )
                        continue;
                
                // May have processed the column already
                if ( (tt[level].allreadyreplaced >> tc) & 1 ) 
                        continue;
                
                // Candidate column cca to use
                for ( cca = NREQATIONS; cca >= 0; cca-- ) {
                        
                        // Can't replace a target column by itself
                        if ( (tt[level].dep[cca] >> tc) & 1)
                                continue;
                        
                        // Candidate column ccb
                        for ( ccb = cca-1; ccb >= 0; ccb-- ) {
                                if ( (tt[level].dep[ccb] >> tc) & 1 )
                                        continue;
                                
                                for ( ccc = ccb-1; ccc >= 0; ccc-- ) {
                                        if ( (tt[level].dep[ccc] >> tc) & 1 )
                                                continue;
                                        
                                        // Function to try. With 3 variables this is one of 2^2^3= 0x100 functions.
                                        for ( f = 0; f < 0x100; f++ ) {
                                                if ( tryrepresent3( level, tc, cca, ccb, ccc, f ) ) {
                                                        makerepresentation3( level, tc, cca, ccb,ccc,f);
                                                }
                                        }
                                }                                
                        }
                }
        }
}

/////////////////////////////////////////////////////////////////////////////
// For runtime reasons this is untenable, except perhaps as a last step.
void mkcomb4(int level, int tcstart ) {
        int32_t tc,f;
        int32_t cca,ccb,ccc,ccd;

        // Target column to replace
        for ( tc = tcstart; tc >= 0; tc-- ) {
                fprintf( stderr, "{%d} ", tc );
                
                // I am only interested in some specific columns                
                if ( ((spec[g_speclevel].replace >> tc) & 1 ) == 0 )
                        continue;
                
                // May have processed the column already
                if ( (tt[level].allreadyreplaced >> tc) & 1)
                        continue;

                //printf( "//%d. ", tc );fflush(stdout);
                
                // Candidate column cca to use
                for ( cca = NREQATIONS; cca >= 0; cca-- ) {
                        
                        // Can't replace a target column by itself
                        if ( (tt[level].dep[cca] >> tc) & 1 )
                                continue;
                        
                        // Candidate column ccb
                        for ( ccb = cca-1; ccb >= 0; ccb-- ) {
                                if ( ( tt[level].dep[ccb] >> tc) & 1 ) 
                                        continue;
                                
                                for ( ccc = ccb-1; ccc >= 0; ccc-- ) {
                                        if ( (tt[level].dep[ccc] >> tc) & 1)
                                                continue;
                                        
                                        for ( ccd = ccc-1; ccd >= 0; ccd-- ) {
                                                if ( (tt[level].dep[ccd] >> tc) & 1)
                                                        continue;
                                                // Function to try. With 4 variables this is one of 2^2^4= 0x1000 functions.
                                                for ( f = 0; f < 0x10000; f++ ) {
                                                        if ( tryrepresent4( level, tc, cca, ccb, ccc, ccd, f ) ) {
                                                                makerepresentation4( level, tc, cca, ccb,ccc,ccd,f);
                                                        }
                                                }
                                        }
                                }                                
                        }
                }
        }
}

/////////////////////////////////////////////////////////////////////////////
void common_code(uint32_t level, int32_t tc) {
        static uint32_t maxlevel = 0;
        static uint32_t backlevel = 100;
        static int in_backlevel_reporting;

        if ( level > maxlevel ) {
                paranoia(level); // Check that the new tables are compatible with the tables at level 0
                maxlevel = level;
                if ( in_backlevel_reporting ) {
                        in_backlevel_reporting = 0;
                        printf( "\n" );
                }
                statusnow(g_verbose,level);
                backlevel = level;
        }
        
        ++spec[g_speclevel].replacednr;        
        if ( spec[g_speclevel].replacednr >= spec[g_speclevel].nrtoreplace ) {
        
                g_speclevel++;
                switch ( spec[g_speclevel].nrvars_to_use ) {
                case 0 :
                        paranoia(level); // Check that the new tables are compatible with the tables at level 0
                        printf( "// LEVEL = %d\n", level );
                        generate_fragile_code(level);
                        exit(0);
                        break;
                case 1 : mkcomb1(level,NREQATIONS-1); break;
                case 2 : mkcomb2(level,NREQATIONS-1); break;
                case 3 : mkcomb3(level,NREQATIONS-1); break;
                case 4 : mkcomb4(level,NREQATIONS-1); break;
                default : ferr( "Internal\n" );
                }
                g_speclevel--;
        } else {
                switch ( spec[g_speclevel].nrvars_to_use ) {
                case 1 : mkcomb1(level,tc-1);  break;
                case 2 : mkcomb2(level,tc-1);  break;
                case 3 : mkcomb3(level,tc-1);  break;
                case 4 : mkcomb4(level,tc-1);  break;
                default : ferr( "Internal\n" );
                }
        }
        --spec[g_speclevel].replacednr;

        // This program is so lengthy that it is nice to see if it is alive.
        if ( level <= backlevel ) {
                if ( ! in_backlevel_reporting ) {
                        in_backlevel_reporting = 1;
                        printf( "//" );
                }

                backlevel = level;
                printf("%x", level );
                fflush(stdout);
        }
}




/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        
        prepare_data();
        print_ctrltbl(0,"Initial data from reference\n\n");
        fflush(stdout);
        spec[0].replacednr--;
        common_code(0, NREQATIONS);
        printf( "\nNo solutions\n" );
        return 0;
}
