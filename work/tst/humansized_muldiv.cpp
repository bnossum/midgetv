#include <stdlib.h>
#include "Vhumansized_muldiv.h"
#include "verilated.h"

#define W 4     // *Must* match definition in humansized_muldiv.v W==12 -> 30min execution time
//#define STEP 1  // Set higher if W big (>12)

#define ferr(...) exit(fprintf(stdout,"%s:%d:",__FILE__,__LINE__)+fprintf(stdout,__VA_ARGS__))
//#define PRI(...) 
//#define PRI2(...) 
#define PRI(...) printf( __VA_ARGS__ )
#define PRI2(...) printf( __VA_ARGS__ )

// How to display results for tiny case W = 4
int g_dbg_decimal = 1;
int g_tables = 0;

#define WMASK ((1<<(W))-1)


#define sext(n,v) ((((uint32_t)v)^(1u<<(n-1)))-(1u<<(n-1)))
//#define QMMASK ((1u << (2*W))-1)
#define QMMASKd2 ((1u << (2*W-1))-1)
#define QMMASK (2*QMMASKd2+1)

#define theabs(v) (( v & (1<<(W-1)) ) ? (((v^WMASK)+1)&WMASK) : v)

enum {
        OP_MULHU,  
        OP_MULHSU, 
        OP_MULH,   
        OP_DIVU,   
        OP_DIV     
};


/////////////////////////////////////////////////////////////////////////////
const char *opstr[5] =
{
        "MULHU  ",
        "MULHSU ",
        "MULH   ",
        "DIVU   ",
        "DIV    ",
};



/////////////////////////////////////////////////////////////////////////////
void toggleclock( Vhumansized_muldiv *tb ) {
        tb->clk = 0;
        tb->eval();
        tb->clk = 1;
        tb->eval();
}

/////////////////////////////////////////////////////////////////////////////
void initregs( Vhumansized_muldiv *tb, int a) {
        tb->use_dinx = 1;
        tb->sa14  = 0;
        tb->ceM   = 1;
        tb->clrM  = 0;
        tb->DAT_O = a;
        tb->s_alu_carryin = 0;
        toggleclock(tb);
}

/////////////////////////////////////////////////////////////////////////////
void muladdcycle( Vhumansized_muldiv *tb, int b, int ci, uint32_t INSTR) {

        tb->use_dinx = 0;
        tb->sa14  = 1;
        tb->ceM   = 0;
        tb->clrM  = 0;
        tb->sa00mod = 1;
        tb->s_alu = 0b100; // ADD, may be changed to PASSQ
        tb->DAT_O = b;
        tb->s_alu_carryin = ci ? 0b11 : 0b00;
        tb->INSTR = INSTR;
        toggleclock(tb);
        //PRI2( "isadd=%d cmb_rF = %d cmb_rF2 = %d ", tb->isadd, tb->cmb_rF, tb->cmb_rF2 );
}

/////////////////////////////////////////////////////////////////////////////
void mulshiftcycle( Vhumansized_muldiv *tb, uint32_t INSTR) {
        tb->use_dinx = 0;
        tb->sa14  = 1;
        tb->ceM   = 1;
        tb->clrM  = 0;
        tb->s_alu = 0b001; // PASSD
        tb->s_alu_carryin = 0;
        tb->sa00mod = 0;
        tb->DAT_O = 0;
        tb->INSTR = INSTR;
        toggleclock(tb);
}

/////////////////////////////////////////////////////////////////////////////
void divaddcycle( Vhumansized_muldiv *tb, int b) {

        tb->INSTR = 0x02004033; // Dont distinguish between DIV/DIVU/REM/REMU
        tb->use_dinx = 0;
        tb->sa14  = 1;
        tb->ceM   = 0;
        tb->clrM  = 1; // Flag unsigned subtraction
        tb->sa00mod = 1;
        tb->s_alu = 0b100; // ADD
        tb->DAT_O = b;
        tb->s_alu_carryin = 0b11;
        tb->eval(); // Can remove
        //PRI2( "(in:%x+%x+%x  %d^%d^%d isadd=%d cmb_rF=%d cmb_rF2=%d conden=%d B=0x%x) ", tb->DAT_O, tb->Q, tb->acy & 1,tb->Dmsb, tb->Pmsb, (tb->acy>>W)&1, tb->isadd, tb->cmb_rF, tb->cmb_rF2, tb->conden, tb->B );
        toggleclock(tb);
        //PRI2( "isadd=%d cmb_rF = %d cmb_rF2 = %d conden = %d ", tb->isadd, tb->cmb_rF, tb->cmb_rF2, tb->conden );
        //PRI2( "(out:%x+%x+%x  %d^%d^%d) ", tb->DAT_O, tb->Q, tb->acy & 1,tb->Dmsb, tb->Pmsb, (tb->acy>>W)&1 );
        PRI2( "divdbg = %x ", tb->divdbg );

}

/////////////////////////////////////////////////////////////////////////////
void divshiftcycle( Vhumansized_muldiv *tb) {

        tb->INSTR = 0x02004044; // Dont distinguish between DIV/DIVU/REM/REMU
        tb->use_dinx = 0;
        tb->sa14  = 1;
        tb->ceM   = 1;
        tb->clrM  = 0;
        tb->s_alu = 0b101; // SHLQ
        tb->s_alu_carryin = 0b10; // Shift M[msb] into Q[0]
        tb->sa00mod = 1;
        tb->DAT_O = WMASK;
        toggleclock(tb);
        PRI2( "divdbg = %x ", tb->divdbg );
}

//
///////////////////////////////////////////////////////////////////////////////
void test_div( Vhumansized_muldiv *tb, int operation, const char *msg ) {
        int32_t a,b;
        int i,facitA = 0;
        int32_t aa,bb;
        int facit_MOD = 0;
        
        for ( aa = 0; aa <= WMASK; aa++ ) {
                for ( bb = 0; bb <= WMASK; bb++ ) {

                        //
                        // Setting up
                        //
                        a = ( operation == OP_DIVU ) ? aa : theabs(aa);
                        b = ( operation == OP_DIVU ) ? bb : theabs(bb);
                        uint32_t invb = b^WMASK;                        
                        initregs( tb, a );

                        //
                        // Main routine
                        //
                        PRI( "LD  a=%3d b=%3d: rF,QM=%d,0x%4.4x %s\n", a, b, tb->rF, tb->QM, operation == OP_DIVU ? "DIVU" : "DIV" );
                        for ( i = 0; i < W; i++ ) {
                                PRI( "i=%d a=%3d b=%3d: ", i, a, b );
                                divshiftcycle(tb);
                                PRI( "  sll:%d,0x%4.4x ", tb->rF, tb->QM );
                                divaddcycle(tb,invb);
                                PRI( "add:%d,0x%4.4x\n", tb->rF, tb->QM );
                        }
                        // End adjustments
                        int calcA = tb->QM & WMASK;
                        int calcM = tb->QM >> W;
                        if ( operation == OP_DIV ) {
                                if ( ((aa ^ bb) & (1<<(W-1))) != 0 && bb != 0 ) {
                                        calcA = ((calcA^WMASK)+1) & WMASK;
                                }
                                if ( aa & (1<<(W-1))) {
                                        calcM = ((calcM^WMASK)+1) & WMASK;
                                }
                                PRI( "calcM=0x%x calcA=0x%x\n", calcM, calcA );

                        }

                        //
                        // Checking invariant
                        //
                        switch ( operation ) {
                        case OP_DIV   :
                                if ( (int)sext(W,bb) == -1 && (aa == (1<<(W-1))) )
                                        break; // Special case. Division overflow
                                if ( (int)sext(W,bb)*(int)sext(W,calcA) + (int)sext(W,calcM) != (int)sext(W,aa) ) {
                                        printf( "Invariant failed. bb=%x=%d calcA=%x=%d calcM=%x=%d aa=%x=%d\n",
                                                bb,(int)sext(W,bb),
                                                calcA,(int)sext(W,calcA),
                                                calcM,(int)sext(W,calcM),
                                                aa,(int)sext(W,aa)
                                                );
                                        exit(4);
                                }
                                break;
                        case OP_DIVU  :
                                if ( bb*calcA + calcM != aa ) {
                                        printf( "Invariant failed\n" );
                                        exit(4);
                                }
                        }
                                
                        //
                        // Checking
                        //
                        switch ( operation ) {
                        case OP_DIVU  :
                                // Facit to check against.
                                if ( bb == 0 ) {
                                        // Division by zero. Spec say: n/0 = largest unsigned number, remainder = n
                                        facitA = WMASK;
                                        facit_MOD = aa;
                                } else {                                        
                                        facitA = aa/bb;
                                        facit_MOD = aa - bb * facitA;
                                }
                                break;
                        case OP_DIV :
                                // Facit to check against.
                                if ( bb == 0 ) {
                                        // Division by zero. Spec say: n/0 = -1 remainder = n
                                        facitA = WMASK;
                                        facit_MOD = aa;
                                        facitA &= WMASK;
                                } else if ( bb == WMASK && aa == (1<<(W-1)) ) {
                                        // Special case, division overflow. Spec say minint/-1 = minint, remainder = 0
                                        facitA = (1<<(W-1));
                                        facit_MOD = 0;
                                        facitA &= WMASK;
                                } else {                                        
                                        facitA = (int)sext(W,aa)/(int)sext(W,bb);
//?                                        facit_MOD = (aa - bb * facitA) & WMASK;
                                        facit_MOD = ((int)sext(W,aa) - ((int)(sext(W,bb) * facitA))) & WMASK;
                                        facitA &= WMASK;
                                }
                                break;
                        }
                        
                        if ( calcA != facitA ) {
                                PRI( "DIV error. facitA = 0x%x = %d  calcA = 0x%x = %d\n", facitA, facitA, calcA, calcA );
                                PRI( "aa=0x%x=%d bb=0x%x=%d\n", aa, aa, bb, bb );
                                PRI( "a=%d b=%3d  QM=%3d facit=%3d\n", a, b, tb->QM, facitA );
                                PRI( "a=0x%x b=0x%x  QM=0x%x facit=0x%x\n", a, b, tb->QM, facitA );
                                ferr( "Error\n" );
                        }
                        if ( calcM != facit_MOD ) {
                                PRI( "MOD error. aa=0x%x=%d bb=0x%x=%d\n", aa, aa, bb, bb );
                                PRI( "facitA = 0x%x\n", facitA );
                                ferr( "calcM = 0x%d, facit_MOD=0x%x\n", calcM, facit_MOD );                                
                        }


                        // Display for the smallest good case:
                        if ( W == 4 && g_tables ) {
                                int j;
                                if ( a == 0 && b == 0 ) {
                                        printf( "%s", opstr[operation] );
                                        for ( j = 0; j < 16; j++ ) {
                                                if ( g_dbg_decimal ) {
                                                        if ( operation == OP_DIVU ) {
                                                                printf( "  %3d ", j );
                                                        } else {
                                                                printf( "  %3d ", (int)sext(4,j) );
                                                        }
                                                } else {
                                                        printf( " 0x%x  ", j );
                                                }
                                        }                                        
                                        printf( "\n------" );
                                        for ( j = 0; j < 16; j++ ) 
                                                printf( "------" );
                                        printf( "\n" );
                                }
                                if ( b == 0 ) {
                                        if ( g_dbg_decimal ) {
                                                if ( operation == OP_DIVU ) {
                                                        printf( " %3d | ", (int) aa );
                                                } else {
                                                        printf( " %3d | ", (int)sext(4,aa) );
                                                }
                                        } else {
                                                printf( "0x%x | ", (int) aa );
                                        }
                                }
                                if ( g_dbg_decimal ) {
                                        if ( operation == OP_DIVU ) {
                                                printf( "%2d.%2d ", (int) facitA, (int) facit_MOD);
                                        } else {
                                                printf( "%2d.%2d ", (int)sext(4,facitA), (int)sext(4,facit_MOD) );
                                        }
                                } else {
                                        printf( "  %1.1x.%1.1x ", (int) facitA, (int) facit_MOD);
                                }
                                if ( bb == 15 )
                                        printf( "\n" );
                        }

                        //if ( a == 0 && b == 0 ) exit(4); // fitte  
                }
        }
        printf( "%s", msg );
}



/////////////////////////////////////////////////////////////////////////////
void test_mul( Vhumansized_muldiv *tb, int operation, const char *msg ) {
        int32_t a,b,i,facit;
        uint32_t INSTR;
//      3322 2222 2222 1111 1111 11   
//      1098 7654 3210 9876 5432 1098 7654 3210
//	0000 001. .... .... .011 .... .011 0011  0x02003033   mulhu   
//	0000 001. .... .... .010 .... .011 0011  0x02002033   mulhsu  
//	0000 001. .... .... .001 .... .011 0011  0x02001033   mulh    
//      0000 001. .... .... .100 .... .011 0011  0x02004033   div
//      0000 001. .... .... .101 .... .011 0011  0x02005033   divu
//      0000 001. .... .... .110 .... .011 0011  0x02006033   rem
//      0000 001. .... .... .111 .... .011 0011  0x02007033   remu
//
//
//

//#define _MULHU_0  MULHU_0, "MULHU  Store rs1 to Ryy. Next read rs2. Q=0",           isr_none     | A_passd   | Wyy   | RS2       | Qz   | srDec | u_cont         | n(MULHU_1)
//#define _MULHU_1  MULHU_1, "       rM<=RS2,  Rjj<=Q=0. next read RS1. shcnt--",     isr_none|MLD | A_passq   | Wjj   | RS1       | Qz   | sr_h  | u_cont         | n(MULHU_2)
//#define _MULHU_2  MULHU_2, "       Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar",        isr_none|MMA | A_addDQ   | Wnn   | r00000000 | Qu   | srDec | u_cont | psa00 | n(MULHU_3) // Must be even ucode adr
//#define _MULHU_3  MULHU_3, "       Shift Q and rM. Prepare read rs1",               isr_none|MSL | A_passd   | Wnn   | RS1       | Qu   | sr_h  | u_cont         | n(MULHU_2)
//#define _MULHU_4  MULHU_4, "       Prepare read Ryy.",                              isr_none     | A_xx      | Wnn   | Ryy       | Qhld | sr_h  | u_cont         | n(MULHU_5) // Must follow MULHU_2
//#define _MULHU_5  MULHU_5, "       Q <= rM[0] ? Q+Ryy : Q. Prepare read Rjj",       isr_none|MMA | A_addDQ   | Wnn   | Rjj       | Qu   | sr_h  | u_cont         | n(MULHU_6)
//#define _MULHU_6  MULHU_6, "       Q <= rM[0] ? Q+Rjj : Q. Prepare last shift",     isr_none|MMA | A_addDQ   | Wnn   | r00000000 | Qu   | sr_h  | u_cont | psa00 | n(MULHU_7)
//#define _MULHU_7  MULHU_7, "       Shift Q and rM, this is the multiply result.",   isr_none|MSL | A_passd   | WTRG  | Rpc       | Qz   | sr_h  | u_cont         | n(StdIncPc)
        
        switch ( operation ) {
        case OP_MULHU :  INSTR = 0x02003033; break;
        case OP_MULHSU : INSTR = 0x02002033; break;
        case OP_MULH   : INSTR = 0x02001033; break;
        default : ferr( "QQ?\n" );
        }

        for ( a = 0; a <= WMASK; a++ ) {
                for ( b = 0; b <= WMASK; b++ ) {

                        //
                        // Set up
                        //
                        uint32_t invb = b ^ WMASK;                        
                        initregs( tb, a );
                        PRI( "LD  a=%3d b=%3d:  rF,QM=%d,0x%4.4x\n", a, b, tb->rF, tb->QM );

                        //
                        // Main routine
                        //
                        int willadd __attribute__((unused));
                        for ( i = 0; i < W-1; i++ ) {
                                PRI( "i=%d a=%3d b=%3d: ", i, a, b );
                                willadd = tb->QM & 1;
                                muladdcycle(tb,b,0,INSTR);
                                PRI( "  %s:%d,0x%4.4x ", willadd ? "add " : "pass", tb->rF, tb->QM );
                                mulshiftcycle(tb,INSTR);
                                PRI( "shift:%d,0x%4.4x \n", tb->rF, tb->QM );
                        }
                        switch ( operation ) {
                        case OP_MULHU :
                        case OP_MULHSU :
                                PRI( "i=%d a=%3d b=%3d: ", i, a, b );
                                willadd = tb->QM & 1;
                                muladdcycle(tb,0,0,INSTR);
                                muladdcycle(tb,b,0,INSTR);
                                PRI( "  %s:%d,0x%4.4x ", willadd ? "add " : "pass", tb->rF, tb->QM );
                                mulshiftcycle(tb,INSTR);
                                PRI( "shift:%d,0x%4.4x\n", tb->rF, tb->QM );
                                break;
                        case OP_MULH :
                                PRI( "i=%d a=%3d b=%3d::", i, a, b );
                                willadd = tb->QM & 1;
                                muladdcycle(tb,invb,0,INSTR);
                                muladdcycle(tb,   1,0,INSTR);
                                PRI( "  %s:%d,0x%4.4x ", willadd ? "add " : "pass", tb->rF, tb->QM );
                                mulshiftcycle(tb,INSTR);
                                PRI( "shift:%d,0x%4.4x\n", tb->rF, tb->QM );
                                break;
                        default : ferr( "Que?\n" );
                        }
                        
                        //
                        // Checking
                        //
                        uint32_t rawfacit;
                        switch ( operation ) {
                        case OP_MULHU  :
                                facit = a * b;
                                break;
                        case OP_MULHSU :
                                rawfacit = (a * sext(W,b));
                                facit = rawfacit & QMMASK;
                                break;
                        case OP_MULH :
                                facit = sext(W,a) * sext(W,b);
                                facit &= QMMASK;
                                break;
                        }
                        
                        if ( tb->QM != (uint32_t) facit ) {
                                PRI( "a=%d b=%3d  QM=%3d facit=%3d\n", a, b, tb->QM, facit );
                                PRI( "a=0x%x b=0x%x  QM=0x%x facit=0x%x\n", a, b, tb->QM, facit );
                                ferr( "Error\n" );
                        }

                        // Display for the smallest good test case:
                        if ( W == 4 && g_tables ) {
                                int j;
                                if ( a == 0 && b == 0 ) {
                                        printf( "%s", opstr[operation] );
                                        for ( j = 0; j < 16; j++ ) {
                                                if ( g_dbg_decimal ) {
                                                        if ( operation == OP_MULHU ) {
                                                                printf( "  %3d ", j );
                                                        } else {
                                                                printf( "  %3d ", (int)sext(4,j) );
                                                        }
                                                } else {
                                                        printf( " 0x%x  ", j );
                                                }
                                        }                                        
                                        printf( "\n------" );
                                        for ( j = 0; j < 16; j++ ) 
                                                printf( "------" );
                                        printf( "\n" );
                                }
                                if ( b == 0 ) {
                                        if ( g_dbg_decimal ) {
                                                if ( operation != OP_MULH ) {
                                                        printf( " %3d | ", (int) a );
                                                } else {
                                                        printf( " %3d | ", (int)sext(4,a) );
                                                }
                                        } else {
                                                printf( "0x%x | ", (int) a );
                                        }
                                }
                                if ( g_dbg_decimal ) {
                                        if ( operation == OP_MULHU ) {
                                                printf( " %4d ", (int) facit);
                                        } else {
                                                printf( " %4d ", (int)sext(8,facit));
                                        }
                                } else {
                                        printf( " 0x%2.2x ", (int) facit);
                                }
                                if ( b == 15 )
                                        printf( "\n" );
                        }
                        //exit(4);
                }
        }
        printf( "%s", msg );
}


/////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);
	Vhumansized_muldiv *tb = new Vhumansized_muldiv;	

        printf( "Calculate for W = %d\n", W );
        test_mul(tb, OP_MULHU,  "MUL u * u OK\n" );
        test_mul(tb, OP_MULHSU, "MULHSU u * s OK\n" );
        test_mul(tb, OP_MULH,   "MULH s * s OK\n" );
        test_div(tb, OP_DIVU,   "DIVU u/u and REM u/u OK\n" );
        test_div(tb, OP_DIV,    "DIV s/s and REM s/s OK\n" );
        
        exit(EXIT_SUCCESS);
}
