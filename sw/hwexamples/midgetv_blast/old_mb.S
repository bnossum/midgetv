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
        .word   4                       // x1 regT
        .word   0x2000                  // x2           Unused. Default set to top of EBR
        .word   0x60000000              // x3 regB      Constant IO-region
        .word   1                       // x4 regA      bitrate
        .word   0                       // x5           Unused
        .word   0                       // x6           Unused
        // Invariant:
        // regA = 1
        // regB = 0x60000000
        // regT = 4
_start:  
        sw      regA,UARTOFS(regB)      // x7   UART->D = 1;                             
        sw      regA,LEDOFS(regB)       // x8   LED = 1;                                regD
Lautobd:lw      regD,UARTOFS(regB)      // x9   for ( i = 0; i < 4; i++ ) {        	
        bne     regD,x0,Lautobd         // x10          while ( UART->D ) ;             
        sw	x0,%lo(__mcycle)(x0)    // x11          SYSEBR->mcycle = 0              regN
1:      lw      regD,UARTOFS(regB)      // x12          while ( UART->D == 0)           regP
        beq     regD,x0,1b              // x13               ;                          regH
        lw      regD,%lo(__mcycle)(x0)  // x14          autobaud = SYSEBR->mcycle;      regW    
        add     regA,regA,regD          // x15          ab += autobaud                  regC
        addi    regT,regT,-1            // x16  }                                       regU
        bne     regT,x0,Lautobd         // x17                                          regL
        srli    regA,regA,5             // x18          regA = bitrate                  regY

        // Invariant:
        // regA = bitrate
        // regB = 0x60000000        

LoadBlock:                              //              while (1) {
        li      regC,-8                 // x19
        jal     regT,getchar            // x20          	for ( i = 0; i < 8; i++ )     
        sb      regP,0x48(regC)         // x21          	        *p++ = near_getchar();
        addi    regC,regC,1             // x22          	
        bne     regC,x0,LoadBlock       // x23          	
        bne     regL,x0,LoadLoop        // x24          	if ( end == 0 )
        jalr    x0,0(regY)              // x25          	        go();
LoadLoop:                               //              	do {
        jal     regT,getchar            // x26          	        a = getchar();
        sb      regP,0(regL)            // x27          	        *p++ == a;
        sw      regP,LEDOFS(regB)       // x28          	        LED = a;
        addi    regL,regL,1             // x29
        bltu    regL,regY,LoadLoop      // x30          	} while ( p < end )
        j       LoadBlock               // x31          }
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

        // Link address is in regT
        // Return value in regP
        // Corrupts regN, regU, regW, regH
        // Uses registers regA,regB
getchar:
1:      lw      regU,UARTOFS(regB)      // 0xb4 while ( UART->D == 0 ) // previous transaction   __mepc:         
        beq     regU,x0,1b              // 0xb8      ;                                           __mcause:       
1:      lw      regU,UARTOFS(regB)      // 0xbc while ( UART->D == 1 ) // not startbit           __mtval:        
        bne     regU,x0,1b              // 0xc0      ;                                           __mscratch:     
        sw      x0,%lo(__mcycle)(x0)    // 0xc4 SYSEBR->mcycle = 0                               __misa:         
        li      regP,0                  // 0xc8 d = 0                                            __ex_dup_x0:     
        li      regN,1                  // 0xcc n = 1                                            __ex_rCSRadr:    
        srli    regW,regA,1             // 0xd0 w = g_bitrate/2                                  __ex_rCSRty:     
        li      regH,0x100              // 0xd4                                                  __ex_rrs1:       
Top:    add     regW,regW,regA          // 0xd8 {    w += g_bitrate                              __ex_rrd:        
1:      lw      regU,%lo(__mcycle)(x0)  // 0xdc      while ( SYSEBR->mcycle < w )                __ex_rtmp:       
        bltu    regU,regW,1b            // 0xe0 	     ;                                   __mtime:         
        lw      regU,UARTOFS(regB)      // 0xe4 	if ( UART->D )                           __mtimeh:        
        beq     regU,x0,1f              // 0xe8 	                                         __bitrate      
        or      regP,regP,regN          // 0xec 	        d |= n;                          __minstreth:    
1:      add     regN,regN,regN          // 0xf0 	n = n + n;                               __mcycleh:      
        bne     regN,regH,Top           // 0xf4 } while ( n != 0x100 )                           __freefornow_f4:
        jalr    x0,0(regT)              // 0xf8                                                  __mtimecmp:     
__mtimecmph:    .word 0 		// 0xfc Read/write from user code.                                                     
        .org 0x100  			//                                                                                     
CSRretadr:      .word 0			//0x100 Microcode writes PC to CSRretadr when a CSR instruction is seen.               
.word 0x0b60000b //E_xRET:ij 0,0xb6,0   //0x104 Microcode branches to here when MRET/SRET/URET is seen                         
EntryCSR:                               //0x108 Microcode branches to here when a CSR instruction is seen                      
























                        


