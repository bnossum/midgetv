// /////////////////////////////////////////////////////////////////////////////
// // Has the potential advantage of not changing mcycle
// int near_putchar( int c ) {
//         uint8_t cc = c;
//         uint32_t n;
//         c = (c | 0x100) << 1;
//         c &= 0x3ff;
// 
//         // *__mcycle = 0xffffff00u; // Test wraparound
//         
//         n = *__mcycle;
//         while ( c ) {
//                 UART->D = c;
//                 c >>= 1;
//                 n += g_bitrate;
//                 if ( n < g_bitrate ) {
//                         /* Wraparound in limit, so 
//                          * wait for wraparound in mcycle.
//                          */
//                         while ( *__mcycle > 0x3ff ) 
//                                 ;
//                 }
//                 while ( *__mcycle < n )
//                         ;
//         }
//         return cc;
// }

//  // Correct but not fast enough for 115200. Best shot timewise. 
//  /////////////////////////////////////////////////////////////////////////////
//  int near_getchar( void ) {
//          // Wait for falling flank startbit
//          while ( UART->D  )
//                  ;
//          uint32_t w = g_bitrate_div2;
//          int b = 0;
//          int n = 1;
//          w += *mcycle;
//          do {
//                  w += g_bitrate;
//                  if ( w < g_bitrate ) {
//                          /* Wraparound in limit, so 
//                           * wait for wraparound in mcycle.
//                           */
//                          while ( *mcycle > 0x3ff ) 
//                                  ;
//                  }
//                  while ( *mcycle < w )
//                          ;
//                  if ( UART->D ) 
//                          b |= n;
//                  n = n + n;
//          } while ( n != 0x100 );
//          while ( UART->D == 0 )
//                  ; // Wait for framebit
//          return b;
//  }

// Correct but not fast enough at 115200.
// /////////////////////////////////////////////////////////////////////////////
// int near_getchar( void ) {
//         uint32_t w = g_bitrate/2;
//         int b = 0;
//         int n = 8;
// 
//         // Wait for falling flank startbit
//         while ( UART->D  )
//                 ;
//         w += *mcycle;
//         do {
//                 w += g_bitrate;
//                 if ( w < g_bitrate ) {
//                         /* Wraparound in limit, so 
//                          * wait for wraparound in mcycle.
//                          */
//                         while ( *mcycle > 0x3ff ) 
//                                 ;
//                 }
//                 while ( *mcycle < w )
//                         ;
//                 if ( UART->D ) 
//                         b |=  0x100;
//                 b >>= 1;
//         } while ( --n > 0 );
//         
//         while ( UART->D == 0 )
//                 ; // Wait for frame bit. BREAK is a bad idea in this UART.
//         
//         return b;
// }

// Not quick enough for 115200 at 12 MHz clock, but then nothing is
// /////////////////////////////////////////////////////////////////////////////
// int near_getchar( void ) {
//         uint32_t w = g_bitrate/2;
//         int b = 0;
//         int n = 1;
// 
//         // Wait for falling flank startbit
//         while ( UART->D  )
//                 ;
//         w += *mcycle;
//         do {
//                 w += g_bitrate;
//                 if ( w < g_bitrate ) {
//                         /* Wraparound in limit, so 
//                          * wait for wraparound in mcycle.
//                          */
//                         while ( *mcycle > 0x3ff ) 
//                                 ;
//                 }
//                 while ( *mcycle < w )
//                         ;
//                 if ( UART->D ) 
//                         b |=  n;
//                 n <<= 1;
//         } while ( n != 0x100 );
//         
//         while ( UART->D == 0 )
//                 ; // Wait for frame bit. BREAK is a bad idea in this uart.
//         
//         return b;
// }

/////////////////////////////////////////////////////////////////////////////
void simend( void ) {
#if sim
        exit( fprintf(stderr,"Simend\n" ) );
#else
        __asm__("sltu x0,x0,x0");
#endif
}

/////////////////////////////////////////////////////////////////////////////
void simdump( void ) {
#if sim
        ;
#else
        __asm__("sltu x0,x31,x31");
#endif
}

