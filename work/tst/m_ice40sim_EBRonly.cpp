/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Cycle-true simulation of midgetv where all program/data is stored in EBR-ram
 * This file needs a cleanup.
 */

#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <inttypes.h>

#define _main
#include "common.h"
INFOCHUNK g_info = {
        ~0u ^ (INFO_skip_first64 | INFO_get_inexplcable | INFO_Dsram | INFO_I_fields ),
        DEFAULT_UCODETEXTLEN,
};


/////////////////////////////////////////////////////////////////////////////
#define    EBRADRWIDTH  9 // Is a parameter to m_midgetv. MUST match def in m_ice40sim_EBRonly.v

#include "Vm_ice40sim_EBRonly__Syms.h"
#include "verilated.h"


/////////////////////////////////////////////////////////////////////////////
#define regPC    0x88
#define regttime 0x8c

uint32_t getebr( void *vtb, uint32_t byteadr ) {
        uint32_t d;
        uint32_t wa = byteadr/4;
        if ( byteadr & 3 )
                ferr( "Que?\n" );
        Vm_ice40sim_EBRonly *tb = (Vm_ice40sim_EBRonly *) vtb;
#if EBRADRWIDTH == 8
        d =  (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk1__DOT__mem->get_as_16(wa) <<  0);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk1__DOT__mem->get_as_16(wa) << 16);

#elif EBRADRWIDTH == 9
        uint32_t mwa = ((wa>>1) | (wa<<8)) & 0x1ff;
        d =  (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk1__DOT__mem->get_as_8(mwa) <<  0);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk1__DOT__mem->get_as_8(mwa) <<  8);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk1__DOT__mem->get_as_8(mwa) << 16);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk1__DOT__mem->get_as_8(mwa) << 24);

#elif EBRADRWIDTH == 10
        uint32_t mwa = ((wa>>2) | (wa<<8)) & 0x3ff;
        d =  (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk1__DOT__mem->get_as_4(mwa) <<  0);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk1__DOT__mem->get_as_4(mwa) <<  4);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk1__DOT__mem->get_as_4(mwa) <<  8);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk1__DOT__mem->get_as_4(mwa) << 12);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk1__DOT__mem->get_as_4(mwa) << 16);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk1__DOT__mem->get_as_4(mwa) << 20);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk1__DOT__mem->get_as_4(mwa) << 24);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk1__DOT__mem->get_as_4(mwa) << 28);

#elif EBRADRWIDTH == 11 
        uint32_t mwa = ((wa>>3) | (wa<<8)) & 0x7ff;
        d =  (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrb->mem->get_as_2(mwa) <<  0);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrh->mem->get_as_2(mwa) <<  2);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrb->mem->get_as_2(mwa) <<  4);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrh->mem->get_as_2(mwa) <<  6);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrb->mem->get_as_2(mwa) <<  8);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrh->mem->get_as_2(mwa) << 10);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrb->mem->get_as_2(mwa) << 12);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrh->mem->get_as_2(mwa) << 14);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrb->mem->get_as_2(mwa) << 16);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrh->mem->get_as_2(mwa) << 18);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrb->mem->get_as_2(mwa) << 20);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrh->mem->get_as_2(mwa) << 22);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrb->mem->get_as_2(mwa) << 24);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrh->mem->get_as_2(mwa) << 26);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrb->mem->get_as_2(mwa) << 28);
        d |= (tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrh->mem->get_as_2(mwa) << 30);
#else
#error Unsupported EBR address width
#endif
        return d;
}

/////////////////////////////////////////////////////////////////////////////
void readout_ebr(const char *hdr, int hexdumpit, void *tb ) {
        int i;
        uint32_t d;

        if ( hdr )
                printf( "%s", hdr );
        for ( i = 0; i < (1<<EBRADRWIDTH)*4; i += 4 ) {
                d = getebr(tb, i );
                if ( ! hexdumpit ) {
                        printf("%4.4x %8.8x\n", i, d);
                } else {
                        if ( (i & (15*4)) == 0 )
                                printf( "%4.4x ", i );
                        printf( "%8.8x ", d );
                        if ( (i & (15*4)) == (15*4) )
                                printf( "\n" );
                }
        }
}

/////////////////////////////////////////////////////////////////////////////
void initialize_ebr( void *vtb, FILE *fi, char *finame ) {
        int i,j,c;
        const int MAXEBR =  (16 * (4*1024)); // 16 EBR blocks give this number of bits
        uint8_t ebr[MAXEBR/8];
        Vm_ice40sim_EBRonly *tb = (Vm_ice40sim_EBRonly *)vtb;
        
        for ( i = 0; i < MAXEBR/8+1; i++ ) {
                if ( (c=getc(fi)) == EOF )
                        break;
                if ( i == MAXEBR/8 )
                        ferr( "Initial program larger than %d bytes can't reside in EBR alone\n", MAXEBR/8 );
                ebr[i] = c;
        }        
        PR( "To simulate: A %d = 0x%x bytes image from %s\n", i, i, finame );
//        if ( i & 3 )
//                ferr( "Program length %d not integral number of words, not neccessarely an error. Amend me\n", i );
        while ( i & 3 ) {
                ebr[i] = 0;
                i++;
        }
        
#if EBRADRWIDTH == 8
        for ( j = 0; j < i; j += 4 ) {
                uint32_t hb,hh;
                hb = (ebr[j+1]<<8) | ebr[j+0];
                hh = (ebr[j+3]<<8) | ebr[j+2];
                //tb->v->inst_midgetv_core->inst_ebr->b0__BRA__0__KET____DOT__genblk5__DOT__ebr->set_as_16(j>>2,hb);
                //tb->v->inst_midgetv_core->inst_ebr->b0__BRA__1__KET____DOT__genblk5__DOT__ebr->set_as_16(j>>2,hh);
                tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk1__DOT__mem->set_as_16(j>>2,hb);
                tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk1__DOT__mem->set_as_16(j>>2,hh);
        }
#elif EBRADRWIDTH == 9
        for ( j = 0; j < i; j += 4 ) {
                uint32_t jj = j>>2;
                uint32_t mjj = ((jj>>1) | (jj<<8)) & 0x1ff;

                tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk1__DOT__mem->set_as_8(mjj,ebr[j+0]);
                tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk1__DOT__mem->set_as_8(mjj,ebr[j+1]);
                tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk1__DOT__mem->set_as_8(mjj,ebr[j+2]);
                tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk1__DOT__mem->set_as_8(mjj,ebr[j+3]);
        }
#elif EBRADRWIDTH == 10
        for ( j = 0; j < i; j += 4 ) {
                uint32_t jj = j>>2;
                uint32_t mjj = ((jj>>2) | (jj<<8)) & 0x3ff;
		tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk1__DOT__mem->set_as_4(mjj,(ebr[j+0] >> 0) & 15);
		tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk1__DOT__mem->set_as_4(mjj,(ebr[j+0] >> 4) & 15);
		tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk1__DOT__mem->set_as_4(mjj,(ebr[j+1] >> 0) & 15);
		tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk1__DOT__mem->set_as_4(mjj,(ebr[j+1] >> 4) & 15);
		tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk1__DOT__mem->set_as_4(mjj,(ebr[j+2] >> 0) & 15);
		tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk1__DOT__mem->set_as_4(mjj,(ebr[j+2] >> 4) & 15);
		tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk1__DOT__mem->set_as_4(mjj,(ebr[j+3] >> 0) & 15);
		tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk1__DOT__mem->set_as_4(mjj,(ebr[j+3] >> 4) & 15);
        }
#elif EBRADRWIDTH == 11
        for ( j = 0; j < i; j += 4 ) {
                uint32_t jj = j>>2;
                uint32_t mjj = ((jj>>3) | (jj<<8)) & 0x7ff;
        	tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrb->mem->set_as_2(mjj,(ebr[j+0] >> 0) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrh->mem->set_as_2(mjj,(ebr[j+0] >> 2) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrb->mem->set_as_2(mjj,(ebr[j+0] >> 4) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrh->mem->set_as_2(mjj,(ebr[j+0] >> 6) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrb->mem->set_as_2(mjj,(ebr[j+1] >> 0) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrh->mem->set_as_2(mjj,(ebr[j+1] >> 2) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrb->mem->set_as_2(mjj,(ebr[j+1] >> 4) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrh->mem->set_as_2(mjj,(ebr[j+1] >> 6) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrb->mem->set_as_2(mjj,(ebr[j+2] >> 0) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrb->genblk2__DOT__ebrh->mem->set_as_2(mjj,(ebr[j+2] >> 2) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrb->mem->set_as_2(mjj,(ebr[j+2] >> 4) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrh->genblk2__DOT__ebrh->mem->set_as_2(mjj,(ebr[j+2] >> 6) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrb->mem->set_as_2(mjj,(ebr[j+3] >> 0) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrb->genblk2__DOT__ebrh->mem->set_as_2(mjj,(ebr[j+3] >> 2) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrb->mem->set_as_2(mjj,(ebr[j+3] >> 4) & 3);
        	tb->v->inst_midgetv_core->inst_ebr->ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrh->genblk2__DOT__ebrh->mem->set_as_2(mjj,(ebr[j+3] >> 6) & 3);
        }
#else
#error Unsupported EBR address width
#endif
//        readout_ebr( "Just a test\n", 1, tb );

}




/////////////////////////////////////////////////////////////////////////////
/* SLTU x0,rs1,rs2 is used to give simulation hints
 * 0000000 rs2   rs1   011 00000 0110011  SLTU x0,rs1,rs2
 * 1111111 00000 00000 111 11111 1111111  mask
 */
enum {
        ST_HINT_INACTIVE,
        ST_HINT_SILENCE,
        ST_HINT_SIMEXIT,
        ST_HINT_SIMERROR
};

int check_for_simulationhint( FILE *lfo, char *imagetosimnamep, void *vtb, int silent) {
        Vm_ice40sim_EBRonly *tb = (Vm_ice40sim_EBRonly *)vtb;
        static uint32_t prevI = 0;
        static int st;
        uint32_t I = tb->v->inst_midgetv_core->get_I();
        uint32_t a;
        int use_dinx = tb->v->inst_midgetv_core->get_use_dinx();
        int accesserror = tb->v->inst_midgetv_core->get_accesserror();
        if ( accesserror ) {
                printf( "ACCESS ERROR\n" );
                g_accesserror = 1;
        }
                
        if ( use_dinx )
                g_nrinstr++;
        
        switch ( st ) {
        case ST_HINT_SILENCE :
                if ( prevI == I ) break; // No change
                st = ST_HINT_INACTIVE;
                // One hint may be followed by another so fallthrough
        case ST_HINT_INACTIVE :
                if ( prevI == I ) break;             // No change
                if ( (I & 0xfe007fff) != 0x3033 ) break; // No hint
                if ( I == 0x0020b033) break; // Kluge, se comment below.
                if ( I == 0x010fb033) break; // Kluge, se comment below.
                
                /* When running the compliance suite, "sltu x0, x1,
                 * x2" is encountered in programs I-RF_x0-01.S and
                 * I-SLTU-01.S. I take the chanse that these are the
                 * only places it is tested, and simply make a command
                 * line parameter that allow me to ignore my hints for
                 * a number of encounters
                 */
                if ( g_ignorehint ) {
                        g_ignorehint--;
                        break;
                }
                a = (I>>15) & 0x3ff;
                if ( a < 0x300 ) {
                        if ( a != 0 ) {
                                printf( "Simulation ended with error code 0x%x\n", a );
                                if ( silent < 2 ) {
                                        fprintf( lfo, "%40s: Simulation ended with error code 0x%x\n", imagetosimnamep, a );
                                }
                        }
                        return a == 0 ? ST_HINT_SIMEXIT : ST_HINT_SIMERROR;
                } else if ( a < 0x320 ) {
                        //ferr( "SFSG\n" );
//                        fprintf( stderr, "a=%d [%x]", a, getebr(vtb, (a-0x300)*4 ) & 0xff);
                        printf( "%c", getebr(vtb, (a-0x300)*4 ) & 0xff);
                        st = ST_HINT_SILENCE;
                } else if ( a == 0x3ff ) {
                        if ( ! silent )
                                readout_ebr( "EBR dump as requested by hint\n", 1, tb );
                        st = ST_HINT_SILENCE; // Kill output of rest of instruction
                } else {
                        // Free for now
                }
                break;
        case ST_HINT_SIMEXIT :
                ferr( "Sim exit hint was not honoured previous cycle?\n" );
        default :
                ferr( "Unknown simulationhintstate\n" );
        }
        prevI = I;
        return st;
}


                
//  /////////////////////////////////////////////////////////////////////////////
//  void external_io_sim( void *vtb ) {
//          Vm_ice40sim_EBRonly *tb = (Vm_ice40sim_EBRonly *)vtb;
//          static uint32_t ioreadlatency;
//  //        static uint32_t iowritelatency;
//          static uint32_t a_slow_register = 0xdeadbeef;
//          
//  //#define CTRL_MSTATUS         0x80000000
//  //#define CTRL_MIP             0x80000004
//  //#define CTRL_MIE             0x80000008
//  //#define CTRL_MTIPBIT         0x8000000c
//  #define SLOWREGADR           0xa0000004
//  //#define USART_COMPLIANCE_ADR 0xa0000008
//  //#define EXTERNALINT_TEST     0xa0002000
//                  
//  #define IOREADLATENCY 4
//  #define IOWRITELATENCY 10
//                  
//  //          if ( writeIO == 0 ) {
//  //                  *IOwriteack = 0;
//  //                  iowritelatency = 0;
//  //          } else {
//  //                  iowritelatency = (iowritelatency<<1) | 1;
//  //          }
//  //  
//  //          if ( iowritelatency & (1<<IOWRITELATENCY) ) {
//  //                  iowritelatency = 0;
//  //                  *IOwriteack = 1;
//  //                  switch ( Q ) {
//  //                  case SLOWREGADR:
//  //                          a_slow_register = Dii;
//  //                          break;
//  //  //                case USART_COMPLIANCE_ADR:
//  //  //                        // Accept write to 0xa0000000, used for USART in compliance tests
//  //  //                        printf( "%c", Dii & 255 );
//  //  //                        break;
//  //  //                case EXTERNALINT_TEST:
//  //  //                        // Accept write 0x 0xa0002000, used for external int test
//  //  //                        *externalint = 1;
//  //  //                        break;
//  //  //                case CTRL_MSTATUS: // Accept writes 
//  //  //                case CTRL_MIP:     // Accept writes 
//  //  //                case CTRL_MIE:     // Accept writes                        
//  //  //                case CTRL_MTIPBIT: // Accept writes 
//  //  //                        break;
//  //                  default :
//  //                          ferr( "HALT:Spurious I/O write to %8.8x\n", Q );
//  //                  } 
//  //          }
//  
//  //         int nextreadIO = tb->v->inst_midgetv_core->get_nextreadIO();
//  //         printf( "[%d]", nextreadIO );
//  //         if ( nextreadIO == 0 ) {
//  //                 tb->v->set_IO_rack( 0 ); // *IOreadack = 0;
//  //                 tb->v->set_DIN( 0x1234567 ); // *DINA = 0x01234567;
//  //                 ioreadlatency = 0;
//  //         } else {
//  //                 ioreadlatency = (ioreadlatency<<1) | 1;
//  //         }
//  // 
//  //         uint32_t Q = tb->v->inst_midgetv_core->get_IOA();
//  //         
//  //         if ( ioreadlatency & (1<<IOREADLATENCY) ) {
//  //                 ioreadlatency = 0;
//  //                 tb->v->set_IO_rack( 1 ); // *IOreadack = 1;
//  //                 
//  //                 switch ( Q ) {
//  //                 case SLOWREGADR:
//  //                         tb->v->set_DIN( a_slow_register ); //*DINA = a_slow_register;                        
//  //                         //if ( Q == SLOWREGADR ) ferr( "SFSG\n" );
//  //                         break;
//  //   //              case CTRL_MIP :
//  //   //                      /* Bit 11 is mip.meip
//  //   //                       * Bit  3 is mip.msip
//  //   //                       */                        
//  //   //                      break;     // Accep read from MIP
//  //   //              case CTRL_MSTATUS: // Accept read from MSTATUS
//  //   //                      break;
//  //                 default :
//  // //                        ferr( "HALT:Spurious I/O read from %8.8x\n", Q );
//  //                         printf( "HALT:Spurious I/O read from %8.8x\n", Q );
//  //                 }
//  //         }
//                  
//          
//  }
        
        
/////////////////////////////////////////////////////////////////////////////
void simprintf( uint32_t cy, Vm_ice40sim_EBRonly *tb ) {
#define STARTOFHIER tb->v->inst_midgetv_core        
        g_info.minx           = STARTOFHIER->get_minx();
        g_info.a              = STARTOFHIER->get_progress_ucode_etc();
        g_info.progress_ucode = (g_info.a>>3) & 1;
        g_info.pc             = getebr(tb, regPC);
        g_info.I              = STARTOFHIER->get_I();
        g_info.ucode          = (uint32_t)(STARTOFHIER->inst_ucode->get_sa() & 0xFFFFffff);
        g_info.usedinx        = STARTOFHIER->inst_ucodepc->get_usedinx();
        g_info.dinx           = STARTOFHIER->inst_ucodepc->get_dinx();
        g_info.ucodepcinfo    = STARTOFHIER->inst_ucodepc->get_ucodepcinfo();
        g_info.rai            = STARTOFHIER->get_Rai();
        g_info.ADR_O          = STARTOFHIER->get_ADR_O();
        g_info.B              = STARTOFHIER->get_B();
        g_info.dbg_stb_ack    = STARTOFHIER->inst_progressctrl->get_dbg_stb_ack();
        g_info.stb_ack        = STARTOFHIER->get_stb_ack();
//        g_info.inexplicable   = STARTOFHIER->inst_inputmux->get_inexpliccableerror();
        g_info.interruptinfo  = STARTOFHIER->get_interruptinfo();
        g_info.sel_O          = STARTOFHIER->get_SEL_O();
        g_info.enaQ           = STARTOFHIER->get_enaQ();
        g_info.nclearQ        = STARTOFHIER->get_nclearQ();
        g_info.wai            = STARTOFHIER->get_Wai();
        g_info.iwe            = STARTOFHIER->get_iwe();
//        g_info.theio          = STARTOFHIER->get_theio(); Does no longer exist 
        g_info.rDee           = STARTOFHIER->get_rDee();
        g_info.DAT_O          = STARTOFHIER->get_DAT_O();
        g_info.Di             = STARTOFHIER->get_Di();
        g_info.aluop          = STARTOFHIER->get_ALUOP();
        g_info.corerunning    = STARTOFHIER->get_corerunning();
        g_info.shiftcount     = STARTOFHIER->get_shiftcnt();
        g_info.M              = STARTOFHIER->get_M();
        g_info.raluF          = STARTOFHIER->get_raluF();
        g_info.pc1            = STARTOFHIER->get_pc1();
        g_info.was_rvc_instr  = STARTOFHIER->inst_progressctrl->get_was_rvc_instr();
        g_info.luh            = STARTOFHIER->get_luh();
        common_simprintf( &g_info, cy );
}



/////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
        FILE *lfo = stdout;
        FILE *imagetosim = NULL;
        char *imagetosimname = NULL;
	Vm_ice40sim_EBRonly *tb = new Vm_ice40sim_EBRonly;
        int cyclelimit = 300;
        int simhintstate;
        int silent = 0;
        
        parse_arguments( &g_verbose, &cyclelimit, &silent, &lfo, &imagetosim, &imagetosimname, argc,argv);
        PR( "Simulation of image %s\n", imagetosimname );
	// Initialize Verilators variables
        Verilated::commandArgs(argc, argv);

        //readout_ebr( "Virgin\n", 1, tb );
        tb->eval(); // Do the 'initial' of verilog
        //readout_ebr( "After tb->eval()\n", 1, tb );
        
        initialize_ebr( tb, imagetosim, imagetosimname );
        //readout_ebr( "After custom init with program to simulate\n", 1, tb );
        //exit(0);
        
        int cy;
        for ( cy = 0; cy < cyclelimit; cy++ ) {

                tb->CLK_I = 0;
                tb->RST_I = 0;
                tb->eval();
//                external_io_sim( tb );
//                tb->eval();

                // This is where all simulator output happens
                simhintstate = check_for_simulationhint( lfo, imagetosimname, tb, silent);

                if ( simhintstate == ST_HINT_SIMEXIT ||
                     simhintstate == ST_HINT_SIMERROR ) {
                        break;
                } else if ( simhintstate != ST_HINT_SILENCE ) {
                        if ( ! silent )
                                simprintf(cy,tb);
                }

                
                tb->CLK_I = 1;
                tb->eval();
        }
        if ( cy >= cyclelimit ) {
                printf( "Not finished after %d cycles\n", cyclelimit );
                fprintf( lfo, "%-40s Not finished after %d cycles\n", imagetosimname, cyclelimit );
        } else if ( simhintstate == ST_HINT_SIMEXIT ) {
                if ( silent < 2 ) {
                        if ( g_accesserror ) {
                                fprintf( lfo, "%-40s EBR read/write access error\n", imagetosimname );
                        } else {
                                fprintf( lfo, "%-40s success %5d instructions in %6d cycles, cpi = %5.2lf\n",
                                         imagetosimname, g_nrinstr, cy, (cy-64)/1.0/g_nrinstr );
                        }
                }
        }
        exit(EXIT_SUCCESS);
}
