#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define ferr(...) exit(fprintf(stderr,"%s:%d:", __FILE__, __LINE__)+ fprintf(stderr, __VA_ARGS__))

// Defeat quoting system of some shells
#define STRX(x) # x
#define STR(x) STRX(x)
#define fname STR(nakedfname)


/////////////////////////////////////////////////////////////////////////////
// Definitions to work from
//

// Data input makes use of labels, define them
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
#define X(label,text,value,reachability,mask,instr,nrhit) text,
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

typedef struct {
        int replacednr;
        int nrvars_to_use;
        int nrtoreplace;       
        uint32_t replace;
} SPECPACKET;

void common_code(uint32_t level, int32_t tc);


FO tt[64]; // The data structure. We will at most replace 16 equations.
int g_output_verilog = 0;
#define NREQATIONS 42
int g_nrctrleq = 42;
int g_topcolumntouse = 42;
uint32_t g_maxlevel = 0;
int in_backlevel_reporting;
int g_speclevel;


//SPECPACKET spec[20] = {
//        {-1,4, 4, ( (1<<7) | (1<<22) | (1<<24) | (1<<27) )  },
//        {0, 4,16, (~0^(1<<10)) },
//        {0,0,0,0}};

//
//SPECPACKET spec[20] = {
//        {-1,3,5, ((1<<27 | (1<<24) | (1<<22) | (1<<7) | (1<<0) )) },
//        {0,3,19, (~0^(1<<10)) },
//        {0,0,0,0}};
//
//SPECPACKET spec[20] = {
//        {-1,2,16, (~0^(1<<10)) },
//        {0,0,0,0}};


// Can get up to 4 equations with 2 inputs.
//SPECPACKET spec[20] = {
//        {-1,2,6, ~0},
//        {0, 3,6, ~0},
//        {0,0,0,0}};

SPECPACKET spec[20] = {
        {-1,3,10, ~0},
        {0,0,0,0}};



#define isV_X(c) (((tt[level].b1[k]>>(c)) & 1) ? ( (tt[level].b0[k]>>(c)) & 1) : 0)
//#define isV_U(c) (((tt[level].b1[k]>>(c)) & 1) ? (((tt[level].b0[k]>>c) & 1)^1) : 0)
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
                        //printf( "%c", a ? 'x' : 'u' );
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
        printf( "/* %s", title );
        printf( "  " );
        for ( i = g_nrctrleq-1; i >= 0; i-- ) {
                if ( i >= 10 ) {
                        printf( "%d", i/10 );
                }
        }
        printf( "\n" );
        printf( "  " );
        for ( i = g_nrctrleq-1; i >= 0; i-- )
                printf( "%d", i % 10 );
        printf( " */\n" );
        for ( ii = 0; ii < 256; ii++ ) {
                k = ii;
                a = tt[level].b0[k];
                b = tt[level].b1[k];
                printf( "  " );
                print_as_bin(g_nrctrleq,a,b);
                printf( " %-100s*/", g_ctrlstr[k] );
                printf( ",\n" );
        }
        printf( "#endif\n" );
}



/////////////////////////////////////////////////////////////////////////////
void prepare_data( void ) {
        int64_t i,j;
        
        for ( i = 0; i < 256; i++ ) {
                for ( j = 0; j < g_nrctrleq; j++ ) {
                        if ( ((g_ctrl0[i]^g_ctrl1[i])>>j) & 1 ) {
                                tt[0].b1[i] |= (1uL<<j); // Unknown
                                tt[0].b0[i] |= (1uL<<j);
                        } else {
                                tt[0].b0[i] |= (g_ctrl0[i] & (1uL << j)); // Value
                        }
                }
                tt[0].b0[i] |= ( i << g_nrctrleq ); // Counter value
        }
        for ( i = 0; i < 64; i++ ) 
                tt[0].dep[i] |= (1uL << i);
        tt[0].allreadyreplaced = 0; // Eliminated
}

/////////////////////////////////////////////////////////////////////////////
int tryrepresent2( int level, uint32_t tc, uint32_t cca, uint32_t ccb, uint32_t f ) {
        int k,a,alow,ahigh,b,blow,bhigh,match;
        uint32_t v;

        // For all lines in the table
        for ( k = 0; k < 256; k++ ) {
                
                if ( isV_X(tc) ) 
                        continue; // Target column not in use in line k, so matches candidate column
                
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
                        continue; // Candidate column fits requirement for line k.
                
                // Can't represent column tc by cc using function f
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
 */
void paranoia( uint32_t level ) {
        uint32_t k,a,m,n,i,valcca,v,valtc,valccb,valccc,valccd;
#define MM 0xfffffff
        
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
                // s28 = fcn2'0xa'(sg_topcolumntouse,s15)
//k=35=0x23 level = 7 f=0xb cca = 14 ccb = 13  valcca=1 valccb=1 f(1,1) = 1, tc=28 valttc=0
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
int statusnow( int level ) {
        int i,j,n,tc;
        int replacedcolumns = 0;
        FILE *fo = stdout;

                
        fprintf( fo, "// Level %d:\n", level );
        for ( i = 1; i <= level; i++ ) {
                fprintf( fo, "%*s", level, " " );
                tc = tt[i].tc;
                replacedcolumns |= (1<<tc);
                switch ( tt[i].nrv ) {
                case 1 :
                        n = fprintf( fo, "// s%d = fcn1'0x%x'(s%d)",
                                     tc, tt[i].fcn, tt[i].cc[0] );
                        //..tt[level].dep[tc] |= tt[level].dep[cca];
                        break;
                case 2 :
                        n = fprintf( fo, "// s%d = fcn2'0x%x'(s%d,s%d)",
                                     tt[i].tc, tt[i].fcn, tt[i].cc[1], tt[i].cc[0] );
                        break;
                case 3 :
                        n = fprintf( fo, "// s%d = fcn3'0x%2.2x'(s%d,s%d,s%d)",
                                     tt[i].tc, tt[i].fcn, tt[i].cc[2], tt[i].cc[1], tt[i].cc[0] );
                        break;
                case 4 : 
                        n = fprintf( fo, "// s%d = fcn4'0x%4.4x'(s%d,s%d,s%d,s%d)",
                                     tt[i].tc, tt[i].fcn, tt[i].cc[3], tt[i].cc[2], tt[i].cc[1], tt[i].cc[0] );
                        break;
                default :
                        ferr( "Internal\n" );
                }
                fprintf( fo, "%*s s%d dependent on ", 40-n, " " , tc);
                for ( j = 0; j < 45; j++ ) 
                        if ( (tt[level].dep[tc] >> j) & 1 )
                                fprintf( fo, "s%d ", j );
                fprintf( fo, "\n" );
        }
        fflush(fo);
        return replacedcolumns;
}

/////////////////////////////////////////////////////////////////////////////
void result_ctrltbl( int level, char *title, int replacedcolumns ) {
        int k,ii,j;
        uint64_t a,b;

        printf( "//%s", title );

        printf( "//  " );
        for ( j = g_nrctrleq-1; j >= 0; j-- ) 
                if ( (replacedcolumns & (1<<j)) == 0 )
                        printf( "%c", j/10 != 0 ? j/10 + '0' : ' ' );
        printf( "  Original \n//  " );
        for ( j = g_nrctrleq-1; j >= 0; j-- ) 
                if ( (replacedcolumns & (1<<j)) == 0 )
                        printf( "%d", j % 10 );
        printf( "  Columns\n" );
        

        int jj = 0;
        for ( j = g_nrctrleq-1; j >= 0; j-- )
                if ( ((replacedcolumns >> j) & 1) )
                        jj++;
//        printf( "//  111111          \n" );
//        printf( "//  5432109876543210\n" );
        printf( "//  ");
        for ( j = g_nrctrleq-jj-1; j >= 0; j-- )
                printf( "%c", j/10 != 0 ? j/10+'0' : ' ' );
        printf( "\n" );
        printf( "//  ");
        for ( j = g_nrctrleq-jj-1; j >= 0; j-- )
                printf( "%d", j%10 );
        printf( "\n" );
        
        for ( ii = 0; ii < 256; ii++ ) {
                k = ii;
                a = tt[level].b0[k];
                b = tt[level].b1[k];
                if ( (ii & 7) == 0 ) {
                        printf( "z(" );
                } else {
                        printf( "  " );
                }
                printf( "0b" );
                for ( j = g_nrctrleq-1; j >= 0; j-- ) 
                        if ( ((replacedcolumns >>j) & 1) == 0 )
                                printf( "%d", (int)((a>>j)&1) );
                printf( "  /* %2.2x/%2.2x | ", k, ii );
                print_as_bin(g_nrctrleq,a,b);
                printf( " %-100s*/", g_ctrlstr[k] );
                if ( (ii & 7) == 7 ) {
                        printf( "),\n" );
                } else {
                        printf( ",\n" );
                }                
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

void verilog_result_ctrltbl( int level, int replacedcolumns ) {
        int i,ii,a,b,j;

//        for ( i = 0; i < 16; i++ ) {        
//                printf( "defparam g_ctrl.INIT_%X = `vc_ctrlINIT_%X;\n", i, i );
//        }
        
        for ( i = 0; i < 16; i++ ) {        
                printf( "defparam g_ctrl.INIT_%X = 256???h", i );
                for ( ii = 15; ii >= 0; ii-- ) {                        
                        a = tt[level].b0[i*16+ii];
                        b = 0;
                        for ( j = g_nrctrleq-1; j >= 0; j-- ) {
                                if ( ((replacedcolumns>>j) & 1) == 0 ) {
                                        b <<= 1;
                                        b |= ((a>>j)&1);
                                }
                        }
                        printf( "%4.4x", b );
                }
                printf( ";\n" );
        }
}       

/////////////////////////////////////////////////////////////////////////////
void verilog_findandwritelutdef( int level, int i, int j ) {
        int l,tc;
        
        for ( l = 1; l <= level; l++ ) {
                tc = tt[l].tc;
                if ( tc == i ) {
                        switch( tt[l].nrv ) {
                        case 1 :
                                if ( tt[l].fcn != 2 )
                                        ferr( "Absolutly no rationale to replace variable with constant or inverse\n" );
                                printf( "#define OPT_S%d() wire s%d; assign s%d = s%d\n", i, i, i, tt[l].cc[0] );
                                break;
                        case 2 :
                                printf( "#define OPT_S%d() ", i );
                                printf( "wire s%d; L2( _c_(%x), s%d, V2(s%d,s%d))\n", i, tt[l].fcn, i, tt[l].cc[1], tt[l].cc[0] );
                                break;
                        case 3 :
                                printf( "#define OPT_S%d() ", i );
                                printf( "wire s%d; L3( _c_(%x), s%d, V3(s%d,s%d,s%d))\n", i, tt[l].fcn, i, tt[l].cc[2], tt[l].cc[1], tt[l].cc[0] );
                                break;
                        case 4 :
                                printf( "#define OPT_S%d() ", i );
                                printf( "wire s%d; L4( _c_(%x), s%d, V4(s%d,s%d,s%d,s%d))\n", i, tt[l].fcn, i, tt[l].cc[3], tt[l].cc[2], tt[l].cc[1], tt[l].cc[0] );
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
        int replacedcolumns = statusnow(level);
        int i,j;

        if ( ! g_output_verilog ) {
                printf( "#define REPLACEDCOLUMNS 0x%x\n", replacedcolumns );
                result_ctrltbl(level," Optimized complete tables\n//\n", replacedcolumns );
        
                j = 0;
                for ( i = 0; i < g_nrctrleq; i++ ) {
                        if ( ((replacedcolumns >>i) & 1) == 0 ) {
                                printf( "#define OPT_S%d() int s%d = (ctrldata>> %d) & 1\n",
                                        i,i,j );
                                j++;
                        } else {
                                findandwritelutdef( level, i, j );
                        }
                }
        } else {
                printf( "// Automatically generated by fragile tool tablefold.c\n" );
                printf( "wire [15:0] ctrldata;\n" );
                verilog_result_ctrltbl( level, replacedcolumns );
                j = 0;
                for ( i = 0; i < g_nrctrleq; i++ ) {
                        if ( ((replacedcolumns >>i) & 1) == 0 ) {
                                printf( "#define OPT_S%d() wire s%d; assign s%d = ctrldata[%d]\n", i,i,i,j );
                                j++;
                        } else {
                                verilog_findandwritelutdef( level, i, j );
                        }
                }
                
        }
}

/////////////////////////////////////////////////////////////////////////////
void propagate_dependency( uint64_t seendep, int level, int tc, uint64_t tcdep, int dbg ) {                
        int ii;

        //fprintf( stderr, "propagate_dependency: level=%d tc=%d, tcdep=%lx\n", level, tc, tcdep );
        for( ii = 0; ii < 32; ii++ ) {
                if ( (seendep >> ii) & 1 )
                        continue;
                if ( (tt[level].dep[ii] >> tc)&1 ) {
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

        /* We have represented tc = fcn2(cca,ccb). 
         */
        tt[level].dep[tc] = tt[level].dep[cca] | tt[level].dep[ccb];        
        propagate_dependency( (1<<tc), level, tc, tt[level].dep[tc], 0 ); // fitte
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
void mkcomb2(int level, int tcstart ) {
        int32_t tc,f;
        int32_t cca,ccb;
        
        // Target column to replace
        for ( tc = tcstart; tc >= 0; tc-- ) {
                
                // I am only interrested in some specific columns
                
                if ( ((spec[g_speclevel].replace >> tc) & 1 ) == 0 )
                        continue;
                
                // May have processed the column already
                if ( tt[level].allreadyreplaced & (1uL << tc ) )
                        continue;
                
                // Candidate column cca to use
                for ( cca = g_topcolumntouse; cca >= 0; cca-- ) {
                                                
                        // Can't replace a target column by itself
                        if ( tt[level].dep[cca] & (1uL << tc) )
                                continue;
                        
                        // Candidate column ccb
                        for ( ccb = cca-1; ccb >= 0; ccb-- ) {
                                if ( ccb < 40 && ccb > g_nrctrleq-1 )
                                        continue;
                                if ( tt[level].dep[ccb] & (1uL << tc) )
                                        continue;
                                
                                                
                                // Function to try. With 1 variables this is one of 2^2^2= 0x10 functions.
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
                
                // I am only interrested in some specific columns
                
                if ( ((spec[g_speclevel].replace >> tc) & 1 ) == 0 )
                        continue;
                
                // May have processed the column already
                if ( tt[level].allreadyreplaced & (1uL << tc ) )
                        continue;

                // Candidate column cca to use
                for ( cca = g_topcolumntouse; cca >= 0; cca-- ) {
                        
                        // Can't replace a target column by itself
                        if ( tt[level].dep[cca] & (1uL << tc) )
                                continue;
                        
                        // Candidate column ccb
                        for ( ccb = cca-1; ccb >= 0; ccb-- ) {
                                if ( tt[level].dep[ccb] & (1uL << tc) )
                                        continue;
                                
                                for ( ccc = ccb-1; ccc >= 0; ccc-- ) {
                                        if ( tt[level].dep[ccc] & (1uL << tc) )
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
                
                // I am only interrested in some specific columns
                
                if ( ((spec[g_speclevel].replace >> tc) & 1 ) == 0 )
                        continue;
                
                // May have processed the column already
                if ( tt[level].allreadyreplaced & (1uL << tc ) )
                        continue;

                //printf( "//%d. ", tc );
                fflush(stdout);
                
                // Candidate column cca to use
                for ( cca = g_topcolumntouse; cca >= 0; cca-- ) {
                        
                        // Debug variables not candidates
                        if ( cca < 40 && cca > g_nrctrleq-1 )
                                continue;
                        
                        // Can't replace a target column by itself
                        if ( tt[level].dep[cca] & (1uL << tc) )
                                continue;
                        
                        // Candidate column ccb
                        for ( ccb = cca-1; ccb >= 0; ccb-- ) {
                                if ( ccb < 40 && ccb > g_nrctrleq-1 )
                                        continue;
                                if ( tt[level].dep[ccb] & (1uL << tc) )
                                        continue;
                                
                                for ( ccc = ccb-1; ccc >= 0; ccc-- ) {
                                        if ( ccc < 40 && ccc > g_nrctrleq-1 )
                                                continue;
                                        if ( tt[level].dep[ccc] & (1uL << tc) )
                                                continue;
                                        
                                        for ( ccd = ccc-1; ccd >= 0; ccd-- ) {
                                                if ( ccd < 40 && ccd > g_nrctrleq-1 )
                                                        continue;
                                                if ( tt[level].dep[ccd] & (1uL << tc) )
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
        static uint32_t backlevel = 100;
        int try2 = 1;
        int try3 = 1;

        if ( level > g_maxlevel ) {
                paranoia(level); // Check that the new tables are compatible with the tables at level 0
                g_maxlevel = level;
                if ( in_backlevel_reporting ) {
                        in_backlevel_reporting = 0;
                        printf( "\n" );
                }
                statusnow(level);
                backlevel = level;
        }
        
        ++spec[g_speclevel].replacednr;        
        if ( level > g_maxlevel ) {
                printf( "// At speclevel %d. Have replaced %d out of %d %d-input functions\n",
                        g_speclevel, spec[g_speclevel].replacednr, spec[g_speclevel].nrtoreplace, spec[g_speclevel].nrvars_to_use );
                statusnow(level);
        }
        if ( spec[g_speclevel].replacednr >= spec[g_speclevel].nrtoreplace ) {

        
                g_speclevel++;
                switch ( spec[g_speclevel].nrvars_to_use ) {
                case 0 :
                        paranoia(level); // Check that the new tables are compatible with the tables at level 0
                        generate_fragile_code(level);
                        fprintf( stderr, "Done\n");
                        exit(0);
                        break;
                case 2 :if ( try2 )
                                mkcomb2(level,g_nrctrleq-1);
                        break;
                case 3 :if ( try3 )
                                mkcomb3(level,g_nrctrleq-1);
                        break;
                case 4 : mkcomb4(level,g_nrctrleq-1);
                        break;
                default : ferr( "Internal\n" );
                }
                g_speclevel--;
        } else {
                switch ( spec[g_speclevel].nrvars_to_use ) {
                case 2 :if ( try2 )
                                mkcomb2(level,tc-1);
                        break;
                case 3 :if ( try3 )
                                mkcomb3(level,tc-1);
                        break;
                case 4 : mkcomb4(level,tc-1);
                        break;
                default : ferr( "Internal\n" );
                }
        }
        --spec[g_speclevel].replacednr;
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
int main( int argc, char **argv ) {
        int opt;

        
        while ((opt = getopt(argc, argv, "v")) != -1) {
               switch (opt) {
               case 'v' : g_output_verilog = 1;
                       break;
               default : ferr( "Use the source, Luke\n" );
               }
        }

        
        prepare_data();
        if ( ! g_output_verilog )
                print_ctrltbl(0,"Initial data from reference\n\n");
        fflush(stdout);
        common_code(0, g_nrctrleq);
        
        return 0;
}
