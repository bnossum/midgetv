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
        ~0u ^ (INFO_skip_first64 | INFO_get_inexplcable | INFO_Dsram ), // | INFO_I_fields
        DEFAULT_UCODETEXTLEN,
};


/*
 * A preliminary speed test indicates the simulator corresponds to a
 * target with a 144 kHz clock
 */
/////////////////////////////////////////////////////////////////////////////
//#define  EBRADRWIDTH  8 // Is a parameter to m_midgetv, 
#define    EBRADRWIDTH  11 // Is a parameter to m_midgetv, for m_ice40sim_0_11_32_0_1_0_1_0 it is fixed to 11

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
#if EBRADRWIDTH == 8
#error BITROT
        Vm_ice40 *tb =(Vm_ice40 *)vtb;
        d =  (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__0__KET____DOT__ebr->get_as_16(wa) <<  0);
        d |= (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__1__KET____DOT__ebr->get_as_16(wa) << 16);
#elif EBRADRWIDTH == 9
#error BITROT
        int sliceshift = (wa&1)*8;
        d =  ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__0__KET____DOT__ebr->get_as_16(wa/2) >> sliceshift) & 255 )<<  0);
        d |= ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__1__KET____DOT__ebr->get_as_16(wa/2) >> sliceshift) & 255 )<<  8);
        d |= ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__2__KET____DOT__ebr->get_as_16(wa/2) >> sliceshift) & 255 )<< 16);
        d |= ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__3__KET____DOT__ebr->get_as_16(wa/2) >> sliceshift) & 255 )<< 24);
#elif EBRADRWIDTH == 10
#error BITROT
        int sliceshift = (wa&3)*4;
        d =  ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__0__KET____DOT__ebr->get_as_16(wa/4) >> sliceshift) & 15 )<<  0);
        d |= ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__1__KET____DOT__ebr->get_as_16(wa/4) >> sliceshift) & 15 )<<  4);
        d |= ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__2__KET____DOT__ebr->get_as_16(wa/4) >> sliceshift) & 15 )<<  8);
        d |= ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__3__KET____DOT__ebr->get_as_16(wa/4) >> sliceshift) & 15 )<< 12);
        d |= ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__4__KET____DOT__ebr->get_as_16(wa/4) >> sliceshift) & 15 )<< 16);
        d |= ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__5__KET____DOT__ebr->get_as_16(wa/4) >> sliceshift) & 15 )<< 20);
        d |= ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__6__KET____DOT__ebr->get_as_16(wa/4) >> sliceshift) & 15 )<< 24);
        d |= ( (tb->v->inst_midgetv_core->inst_ebr->b0__BRA__7__KET____DOT__ebr->get_as_16(wa/4) >> sliceshift) & 15 )<< 28);
        
#elif EBRADRWIDTH == 11 
        Vm_ice40sim_EBRonly *tb = (Vm_ice40sim_EBRonly *) vtb;
        int sliceshift = (wa&7)*2;
        d =  (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__0__KET____DOT__ebr->get_as_16(  wa/8) >> sliceshift) & 3) <<  0);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__1__KET____DOT__ebr->get_as_16(  wa/8) >> sliceshift) & 3) <<  2);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__2__KET____DOT__ebr->get_as_16(  wa/8) >> sliceshift) & 3) <<  4);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__3__KET____DOT__ebr->get_as_16(  wa/8) >> sliceshift) & 3) <<  6);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__4__KET____DOT__ebr->get_as_16(  wa/8) >> sliceshift) & 3) <<  8);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__5__KET____DOT__ebr->get_as_16(  wa/8) >> sliceshift) & 3) << 10);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__6__KET____DOT__ebr->get_as_16(  wa/8) >> sliceshift) & 3) << 12);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__7__KET____DOT__ebr->get_as_16(  wa/8) >> sliceshift) & 3) << 14);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__8__KET____DOT__ebr->get_as_16(  wa/8) >> sliceshift) & 3) << 16);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__9__KET____DOT__ebr->get_as_16(  wa/8) >> sliceshift) & 3) << 18);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__10__KET____DOT__ebr->get_as_16( wa/8) >> sliceshift) & 3) << 20);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__11__KET____DOT__ebr->get_as_16( wa/8) >> sliceshift) & 3) << 22);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__12__KET____DOT__ebr->get_as_16( wa/8) >> sliceshift) & 3) << 24);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__13__KET____DOT__ebr->get_as_16( wa/8) >> sliceshift) & 3) << 26);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__14__KET____DOT__ebr->get_as_16( wa/8) >> sliceshift) & 3) << 28);
        d |= (((tb->v->inst_midgetv_core->inst_ebr->b0__BRA__15__KET____DOT__ebr->get_as_16( wa/8) >> sliceshift) & 3) << 30);
#else
#error Not yet
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
#if EBRADRWIDTH == 8
        uint32_t h;
        Vm_ice40 *tb =(Vm_ice40 *)vtb;
#elif EBRADRWIDTH == 11 
        Vm_ice40sim_EBRonly *tb = (Vm_ice40sim_EBRonly *)vtb;
#else
#error Not yet
#endif
        
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
                h = (ebr[j+1]<<8) | ebr[j+0];
                //if ( j == 0xc4 ) printf( "Lowhalf = 0x%4.4x\n", h );
                tb->v->inst_midgetv_core->inst_ebr->b0__BRA__0__KET____DOT__ebr->set_as_16(j>>2,h);
                h = (ebr[j+3]<<8) | ebr[j+2];
                //if ( j == 0xc4 ) printf( "Highhalf= 0x%4.4x\n", h );
                tb->v->inst_midgetv_core->inst_ebr->b0__BRA__1__KET____DOT__ebr->set_as_16(j>>2,h);
        }
#elif EBRADRWIDTH == 11
                
        int k;
        uint16_t ew[16];
        for ( k = 0; k < 16; k++ )
                ew[k] = 0;
        for ( j = 0; j < MAXEBR/8; j += 4 ) {
                uint32_t w;
                uint32_t wa = j/4;

                if ( j < i ) {
                        w =
                                ((uint32_t)ebr[j+0] << 0) |
                                ((uint32_t)ebr[j+1] << 8) |
                                ((uint32_t)ebr[j+2] <<16) |
                                ((uint32_t)ebr[j+3] <<24);
                } else {
                        w = 0;
                }
                
                // Two and two bits of w to each of 16 ebrs, organized as 16 wide.
                
                for ( k = 0; k < 16; k++ ) 
                        ew[k] |= ( ((w >> (k*2)) & 3) << (2*(wa&7)) );
                
                if ( (wa & 7) == 7 ) {
                        for ( k = 0; k < 16; k++ ) {
                                switch ( k ) {
                                case 0x0 : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__0__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x1 : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__1__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x2 : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__2__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x3 : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__3__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x4 : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__4__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x5 : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__5__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x6 : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__6__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x7 : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__7__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x8 : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__8__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0x9 : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__9__KET____DOT__ebr->set_as_16(  wa/8, ew[k] ); break;
                                case 0xa : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__10__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;
                                case 0xb : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__11__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;
                                case 0xc : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__12__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;
                                case 0xd : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__13__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;
                                case 0xe : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__14__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;
                                case 0xf : tb->v->inst_midgetv_core->inst_ebr->b0__BRA__15__KET____DOT__ebr->set_as_16( wa/8, ew[k] ); break;                                        
                                }
                        }
                        for ( k = 0; k < 16; k++ )
                                ew[k] = 0;
                }
        }
                
#else
#error Not yet
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
#if EBRADRWIDTH == 8
        Vm_ice40 *tb = (Vm_ice40 *)vtb;
#elif EBRADRWIDTH == 11
        Vm_ice40sim_EBRonly *tb = (Vm_ice40sim_EBRonly *)vtb;
#endif
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
                //if ( (I & 0x3fff) != 0x3033 ) break; // No hint
                if ( (I & 0xfe007fff) != 0x3033 ) break; // No hint

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
        g_info.interruptinfo  = STARTOFHIER->genblk1__DOT__inst_status_and_interrupts->get_interruptinfo();
        g_info.sel_O          = STARTOFHIER->get_SEL_O();
        g_info.enaQ           = STARTOFHIER->get_enaQ();
        g_info.clearQ         = STARTOFHIER->get_clearQ();
        g_info.wai            = STARTOFHIER->get_Wai();
        g_info.iwe            = STARTOFHIER->get_iwe();
        g_info.theio          = STARTOFHIER->get_theio();
        g_info.rDee           = STARTOFHIER->get_rDee();
        g_info.DAT_O          = STARTOFHIER->get_DAT_O();
        g_info.Di             = STARTOFHIER->get_Di();
        g_info.aluop          = STARTOFHIER->get_ALUOP();
        g_info.corerunning    = STARTOFHIER->get_corerunning();
        common_simprintf( &g_info, cy );
}

#if 0
        
        if ( (cy & 31) == 0 ) {
                printf( "                                                   SRAM_IO_rack,EBR_rack writeSRAM,writeIO                                        dinx[7:0] shct progress_ucode,r_issh0,sa33,lastshift\n" );
                printf( "            minx                                                 sa00 || ||      SRAM_wack,IO_wack                 enaQ             rzcy32%s  || |||| enaQ,lastshift,sa32,sa15,rack\n","\\\\" );
                printf( "     ttime    || ucode             FUNC7  FUNC3 OPCODE     Rai[x:0] | || || mask || Wai[x:0]                       |rQ          alucy_out| || || |||| |||||\n" );
                printf( "  cy |||||||| || [31:0]   I[31:0]  || rs2 rs1 | Rd  || PC[31:0] ||| | || || |||| || ||| DAT_O[..] rDee[..] Di[31:0] || IOA[31:0]B[31:0]  || || || |||| |||||\n" );
        }

        minx = STARTOFHIER->get_minx();
        I = STARTOFHIER->get_I();
        
//        printf( "%4.4x ", cy );
        printf( "%8.8x ", getebr(tb, regttime ) );
//        printf( "%2.2x ", minx );
//        printf( "%8.8" PRIx64 " ", STARTOFHIER->inst_ucode->get_sa() & 0x1FFFffff);
//        printf( "%8.8x ", I  );
//        printfdecodeinstr( I );
        uint32_t pc = getebr(tb, regPC);
        printf( "%8.8x ", pc );
        printf( "%3.3x ", STARTOFHIER->get_Rai() );
        printf( "%d %d%d ",
                (int)(STARTOFHIER->get_sa() & 1),
                STARTOFHIER->get_SRAM_IO_rack(),
                STARTOFHIER->inst_the_rack->get_EBRreadack() );

        printf( "%d%d ",
                STARTOFHIER->get_sram_we(),
                STARTOFHIER->get_writeIO() );

        int e = STARTOFHIER->get_emask();
        printf( "%d%d%d%d ", ((e>>3)&1),((e>>2)&1),((e>>1)&1),((e>>0)&1) );
        
        printf( ".%d ",
//                STARTOFHIER->get_sram_we(),
                STARTOFHIER->get_IO_wack() );

        
        
        if ( STARTOFHIER->get_iwe() ) {
                printf( "%3.3x ", STARTOFHIER->get_Wai() );
        } else {
                printf( "    " );
        }

        
        printf( "%8.8x ", STARTOFHIER->get_DAT_O() );
        printf( "%8.8x ", STARTOFHIER->inst_inputmux->get_rDee() );
        printf( "%8.8x ", STARTOFHIER->get_Di() );

        printf( "%d%d ", STARTOFHIER->get_enaQ(),
                (int)(STARTOFHIER->inst_ucode->get_sa() >> 8) & 1 );
        
        printf( "%8.8x ", STARTOFHIER->get_IOA() );
        printf( "%8.8x ", STARTOFHIER->get_B() );
        printf( "%d",     STARTOFHIER->get_alu_carryout() );
        printf( "%d ",    STARTOFHIER->get_rzcy32() );
        printf( "%2.2x ", STARTOFHIER->inst_ucodepc->get_dinx() );
        //printf( "%x ",    STARTOFHIER->inst_ucodepc->get_branchvariables() );
        printf( "%2.2x ", STARTOFHIER->inst_shiftcounter->get_shiftcnt() );
        int a = STARTOFHIER->get_progress_ucode_etc();
        printf( "%d%d%d%d ", ((a>>3)&1),((a>>2)&1),((a>>1)&1),((a>>0)&1) );
        int progress_ucpde = (a>>3) & 1;
        
//        printf( "%8.8x ", STARTOFHIER->get_QQ() );
//        printf( "%8.8x ", getebr(tb, regttime) );

        uint32_t b = STARTOFHIER->inst_other->get_enaQ_packet();
        printf( "%d%d%d%d%d ", ((b>>4) & 1),((b>>3) & 1),((b>>2) & 1),((b>>1) & 1),((b>>0) & 1) );

//        uint32_t sra_msb = STARTOFHIER->get_sra_msb();
//        uint32_t FUNC7_5 = STARTOFHIER->get_FUNC7_5();
//        printf( "sra_msb=%d FUNC7_5 = %d ", sra_msb, FUNC7_5 );

        
        static int klugeminx;

        if ( progress_ucpde )
                klugeminx = minx;
        printf( "%-55s", ucodetxt[klugeminx] );

        if ( STARTOFHIER->inst_ucodepc->get_usedinx() )
                pocketdissass( pc, I );
        
        printf( "\n" );
}        
#endif                


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

        tb->eval(); // This does do the 'initial' of verilog

//        readout_ebr( "After tb->eval()\n", 1, tb );
        
        initialize_ebr( tb, imagetosim, imagetosimname );

//        readout_ebr( "After custom init with program to simulate\n", 1, tb );
//        exit(0);
//        //readout_ucode( tb );

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
