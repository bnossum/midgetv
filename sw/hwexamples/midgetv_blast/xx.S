        // =============================================================================
        // Part of midgetv
        // 2019. Copyright B. Nossum.
        // For licence, see LICENCE
        // =============================================================================
        // Autobaud character: 0x80
        // On the line : S01234567F
        //              -________--
        //
        // Loadable regions:
        // -----------------
        // 0x0000000b - 0x00000008      x2
        // 0x00000033 - 0x00000014      x5,x6,x7,x8,x9,x10
        // 0x00000093 - 0x00000090      __rNMI_IIV
        // 0x000000a7 - 0x000000a4      __mtvec
        // (top adr)  - 0x000000fc      Remaining memory.
        //
        // Even in the smallest midgetv of 1 KiB EBR, we can load 3/4 of memory.
        //
        // =============================================================================
        
#define LEDOFS  4
#define UARTOFS 8

#define regT x1  
#define regB x3  
#define regA x4  
#define regD x8  // Used during autobaud only
#define regN x11
#define regP x12
#define regH x13
#define regW x14
#define regC x15
#define regU x16
#define regL x17
#define regY x18
        
        .org    0  
        .word   0                       // x0           Never touch
        .word   4                       // x1                                           regT
        .word   0x00002000              // x2           Not used
        .word   0                       // x3           Not used
        .word   1                       // x4   bitrate                                 regD 
_start: sw      regA,UARTOFS(regB)      // x5   UART->D = 1;                            regA
        sw      regA,LEDOFS(regB)       // x6   LED = 1;                                regN
Lautobd:lw      regD,UARTOFS(regB)      // x7   for ( i = 0; i < 4; i++ ) {        	regP
        bne     regD,x0,Lautobd         // x8           while ( UART->D ) ;             regH
        sw	x0,%lo(__mcycle)(x0)    // x9           SYSEBR->mcycle = 0              regW
1:      lw      regD,UARTOFS(regB)      // x10          while ( UART->D == 0)           regC
        beq     regD,x0,1b              // x11               ;                          regU
        lw      regD,%lo(__mcycle)(x0)  // x12          autobaud = SYSEBR->mcycle;      regL    
        j       Split                   // x13                                          regY
getchar:
1:      lw      regU,UARTOFS(regB)      // x14   while ( UART->D == 0 ) // previous transaction 
        beq     regU,x0,1b              // x15        ;                                         
1:      lw      regU,UARTOFS(regB)      // x16   while ( UART->D == 1 ) // not startbit         
        bne     regU,x0,1b              // x17        ;                                         
        sw      x0,%lo(__mcycle)(x0)    // x18   SYSEBR->mcycle = 0                             
        li      regP,0                  // x19   d = 0                                          
        li      regN,1                  // x20   n = 1                                          
        srli    regW,regA,1             // x21   w = g_bitrate/2                                
        li      regH,0x100              // x22                                                  
Top:    add     regW,regW,regA          // x23   {    w += g_bitrate                            
1:      lw      regU,%lo(__mcycle)(x0)  // x24        while ( SYSEBR->mcycle < w )              
        bltu    regU,regW,1b            // x25   	     ;                                 
        lw      regU,UARTOFS(regB)      // x26   	if ( UART->D )                         
        beq     regU,x0,1f              // x27   	                                       
        or      regP,regP,regN          // x28  	        d |= n;                        
1:      add     regN,regN,regN          // x29   	n = n + n;                             
        bne     regN,regH,Top           // x30     } while ( n != 0x100 )                         
        jalr    x0,0(regT)              // x31                                                    

        
        .org    0x80                    //
__jj:           .word 0  //             // 0x80 10000000  0x20 ucode register
__rinst:        .word 0  //             // 0x84 10000100  0x21 32-lsb of instret counter
__pc:           .word _start-4   // x   // 0x88 10001000  0x22 Program counter
__mcycle:       .word 0          //     // 0x8c 10001100  0x23 32-lsb of cycle counter
__rNMI_IIV:     .word 0          //     // 0x90 10010000  0x24 Must point to handlers for NMI/Internal interrupts
cteffffff7f:    .word 0xffffff7f // x   // 0x94 10010100  0x25 For sign extension in "lb"
cte000000ff:    .word 0x000000ff // x   // 0x98 10011000  0x26 Mask in "lb", "lbu", also for entrypoint CSR
cte0000ffff:    .word 0x0000ffff // x   // 0x9c 10011100  0x27 Mask in "lh" and "lhu"
cteffff7fff:    .word 0xffff7fff // x   // 0xa0 10100000  0x28 For sign extension in "lh"
__mtvec:        .word 0          //     // 0xa4 10100100  0x29 Should point to excption handler.
cte00000000:    .word 0x00000000 // x   // 0xa8 10101000  0x2a ucode constant. 
cteffffffff:    .word 0xffffffff // x   // 0xac 10101100  0x2b ucode constant.
__yy:           .word 0                 // 0xb0 10110000  0x2c ucode register.
        .org    0xb4

        // Invariant:
        // regA = bitrate
        // regB = 0x60000000        

LoadBlock:                              // 0xb4 while (1) {
        li      regC,-8                 // 0xb8 
        jal     regT,getchar            // 0xbc 	for ( i = 0; i < 8; i++ )     
        sb      regP,0x48(regC)         // 0xc0 	        *p++ = near_getchar();
        addi    regC,regC,1             // 0xc4 	
        bne     regC,x0,LoadBlock       // 0xc8 	
        bne     regL,x0,LoadLoop        // 0xcc 	if ( end == 0 )
        jalr    x0,0(regY)              // 0xd0 	        go();
LoadLoop:                               // 0xd4 	do {
        jal     regT,getchar            // 0xd8 	        a = getchar();
        sb      regP,0(regL)            // 0xdc 	        *p++ == a;
        sw      regP,LEDOFS(regB)       // 0xe0 	        LED = a;
        addi    regL,regL,1             // 0xe4 
        bltu    regL,regY,LoadLoop      // 0xe8 	} while ( p < end )
        j       LoadBlock               // 0xec }
        .org    0xf0

Split:  
        add     regA,regA,regD          //              ab += autobaud                  
        addi    regT,regT,-1            //      }                                       
        bne     regT,x0,Lautobd         // 
        srli    regA,regA,5             //              regA = bitrate                  
        j       LoadBlock




















                        


