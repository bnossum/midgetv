        // =============================================================================
        // Part of midgetv
        // 2019. Copyright B. Nossum.
        // For licence, see LICENCE
        // =============================================================================
        //
        // Loadable regions:
        // -----------------
        // 0x0000001f - 0x00000008      x2,x3,x3,x4
        // 0x00000093 - 0x00000090      __rNMI_IIV
        // 0x000000a7 - 0x000000a4      __mtvec
        // (top adr)  - 0x000000e8      Remaining memory.
        //
        // In the smallest midgetv, 1 KiB EBR, we can load more than 3/4 of memory.
        //
        // =============================================================================
        
#define LEDOFS  4
#define UARTOFS 8

#define regA x5
#define regB x6
#define regC x7
#define regN x8
#define regP x9
#define regT x10
#define regU x11
#define regW x12
#define regL x13
#define regY x14
        
        .org    0  
        .word   0                       // x0   Never touch
        .word   0                       // x1   
        .word   0x00002000              // x2
        .word   0                       // x3
        .word   0                       // x4
	.word	16+32*-4		// x5   regA : Bitrate                               
        .word   0x60000000              // x6   regB : IO offset                             
	.word	1			// x7   regC : Loop control/Store index              
	.word	0			// x8   regN : Loop-variable                         
	.word	0			// x9   regP : Character sampled                     
        .word   4                       // x10  regT : Link register/Loop variable                         
	.word	0			// x11  regU : Scratch                               
	.word	0			// x12  regW : Limit for bit sampling                
	.word	0			// x13  regL : Length of block (found here)          
	.word	0			// x14  regY : Block limit
        
getchar:
1:      lw      regU,UARTOFS(regB)      // x15   while ( UART->D == 0 ) // previous transaction 
        beq     regU,x0,1b              // x16        ;                                         
1:      lw      regU,UARTOFS(regB)      // x17   while ( UART->D == 1 ) // not startbit         
        bne     regU,x0,1b              // x18        ;                                         
        sw      x0,%lo(__mcycle)(x0)    // x19   SYSEBR->mcycle = 0                             
        srli    regW,regA,1             // x20   w = g_bitrate/2        
        li      regN,8                  // x21
2:      add     regW,regW,regA          // x22  w += g_bitrate
1:      lw      regU,%lo(__mcycle)(x0)  // x23  while ( SYSEBR->mcycle < w )              
        bltu    regU,regW,1b            // x24          ;
        lw      regU,UARTOFS(regB)      // x25	regU = UART->D;
        beq     regU,x0,1f      	// x26
        ori     regP,regP,0x100      	// x27
1:      slli    regP,regP,1     	// x28  regP = (regP>>1) | (rcvbit<<7);
        addi    regN,regN,-1    	// x29  Done byte?
        bne     regN,x0,2b           	// x30  No, next bit
        jalr    x0,0(regT)      	// x31  Done

        
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

        // regA : bitrate
        // regB : 0x60000000        
        // regC : Loop control/Store index
        // regT : Link register
        // regP : Result from getchar
        // regL : Length of block (found here)
        // RegY : Block limit
LoadBlockHead:                          //      while (1) {
        li      regC,-8                 // 0xb4
LoadBlockLoop:  
        jal     regT,getchar            // 0xb8 	for ( i = 0; i < 8; i++ )     
        sb      regP,0x3c(regC)         // 0xbc 	        *p++ = near_getchar();
        addi    regC,regC,1             // 0xc0 	
        bne     regC,x0,LoadBlockLoop   // 0xc4 	
        bne     regL,x0,DataLoadLoop    // 0xc8 	if ( end == 0 )
        jalr    x0,0(regY)              // 0xcc 	        go();
DataLoadLoop:                           //      	do {
        jal     regT,getchar            // 0xd0 	        a = getchar();
        sb      regP,0(regL)            // 0xd4 	        *p++ == a;
        sw      regP,LEDOFS(regB)       // 0xd8 	        LED = a;
        addi    regL,regL,1             // 0xdc 
        bltu    regL,regY,DataLoadLoop  // 0xe0 	} while ( p < end )
        j       LoadBlockHead           // 0xe4 }

        // -----------------------------------------------------------------------------
        // Startup can be overwritten
        .org    0xe8
_start: sw      regC,UARTOFS(regB)      //      UART->D = 1;                            
        sw      regC,LEDOFS(regB)       //      LED = 1;
autobaudLoop:
1:      lw      regU,UARTOFS(regB)      // while ( UART->D )
        bne     regU,x0,1b              //      ;
1:      lw      regU,UARTOFS(regB)      // while ( UART->D == 0)
        beq     regU,x0,1b              //      ;
        lw	regL,%lo(__mcycle)(x0)  // atstart = SYSEBR->mcycle;
        sub     regA,regA,regL          // 
1:      lw      regU,UARTOFS(regB)      // while ( UART->D )
        bne     regU,x0,1b              //      ;
1:      lw      regU,UARTOFS(regB)      // while ( UART->D == 0)
        beq     regU,x0,1b              //      ;
        lw      regL,%lo(__mcycle)(x0)  // atend  = SYSEBR->mcycle;
        add     regA,regA,regL          // ab = ab + (atend - atstart)
        addi    regT,regT,-1            // 4 times
        bne     regT,x0,autobaudLoop    //     
        srli    regA,regA,5             // regA = (4*autobaud+16)/32 + FUDGEFACTOR
        j       LoadBlockHead           //      = (4*autobaud+CTE)/32















                        


