/*  =============================================================================
    Part of midgetv
    2019. Copyright B. Nossum.
    For licence, see LICENCE
    =============================================================================

    To load and/or start executing of a program in midgetv without
    FPGA recompile. This assumes a midgetv that has a bitbang UART.
    For boards with FDTI chips for loading.
*/
#include <stdint.h>
#include <stdlib.h>
#include "midgetv.h"
/*
 * The program is preceeded by an identificator word: 
 * 0x01071f3f    this is used to set the bitrate of the bitbang UART.
 *
 * Then follows zero or more of these packets:
 * load          Where to write a block. 
 * len != 0      Size of data in bytes
 * [data]        len bytes of payload then follows.
 *
 * Then follows the last block:
 * exec          Where to start execution. (Usually word aligned)
 * len == 0      Flags last packet
 *
 * Most used scenario, a file compiled for SRAM, starting execution at
 * 0x80000000:
 *
 * 0x01071f3f
 * 0x80000000
 * len
 * [data]
 * 0x80000000
 * 0x00000000
 *
 * It is conceivable to make a linker script so that such a file can
 * be written directly.
 *
 * A scenario where there is a system library to load to EBR and a
 * program to load to SRAM:
 *
 * 0x01071f3f
 * 0x00000300    System library start
 * len           System library length
 * [data]        [System library binary code]
 * 0x80000000    Program load address
 * len           Program length
 * [data]        [Program binary code]
 * 0x80000000    Start address
 * 0x00000000    Go
 *
 * There is no error checking during transfer - the assumption is that
 * this program is used during primary development where one quickly
 * will see if the program was loaded or not.
 * 
 * Note in particular that data is stored using byte addresses, and
 * any data block may be any number of bytes. However, when a program
 * is started, the start address must be word-aligned (but perhaps you
 * actually want an unalignment trap at startup).
 */

uint32_t autobaud( void );
int near_getchar( void ); 

#define DBGLED(x) do { LED->D = (x); } while (0)

#if 0
int main( void ) {
/* Our TX line should be high
 * For upduino2 the blue LED show state of UartRX.
 */
        UART->D = 0x80000001; 
        DBGLED(1);
        
        /* Autobaud */
#define FUDGE (-4)
        uint32_t ab = 0;
        for ( int i = 0; i < 4; i++ )
                ab += autobaud();
        //SYSEBR->bitrate = (ab+16)/32 + FUDGE;

        while (1) {
                uint8_t *p = (uint8_t *)0xb4;
                int i;
                for ( i = 0; i < 8; i++ ) 
                        *p++ = near_getchar();
                uint8_t *end = *(uint8_t **)0xb4;
                uint8_t *at  = (uint8_t *)*(uint32_t *)0xb8;

                if ( end == 0 )
                        ((void (*)(void))at)();
                do {
                        uint32_t a = near_getchar();        
                        DBGLED(a);
                        *(uint8_t *)at++ = a;
                } while ( at < end );

        }
}
#endif

int main( void ) {
/* Our TX line should be high
 * For upduino2 the blue LED show state of UartRX.
 */
//        UART->D = 0x80000001; 
//        DBGLED(1);
//        
//        /* Autobaud */
//#define FUDGE (-4)
//        uint32_t ab = 0;
//        for ( int i = 0; i < 4; i++ )
//                ab += autobaud();
//        //SYSEBR->bitrate = (ab+16)/32 + FUDGE;

        while (1) {
                uint8_t *p = (uint8_t *)0xb4;
                uint8_t *ep = (uint8_t *)(0xb4 + 8);
                while ( p < ep )
                        *p++ = near_getchar();
                uint8_t *q = *(uint8_t **)0xb4;
                uint8_t *eq  = (uint8_t *)*(uint32_t *)0xb8;

                if ( q == NULL )
                        ((void (*)(void))eq)();
                while ( q < eq ) 
                        *q = near_getchar();        

        }
}
