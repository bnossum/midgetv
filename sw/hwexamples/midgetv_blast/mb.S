        // =============================================================================
        // Part of midgetv
        // 2019. Copyright B. Nossum.
        // For licence, see LICENCE
        // =============================================================================
        // For midgetv in hardware where a bitbang UART is possible. 
        //
        // Loadable regions:
        // -----------------
        // 0x00000093 - 0x00000090      __rNMI_IIV
        // 0x000000a7 - 0x000000a4      __mtvec
        // (top adr)  - 0x000000c8      Most part of memory.
        //
        // =============================================================================
        
#define LEDOFS  4
#define UARTOFS 8

#define retreg    x1
#define regL      x2
#define regY      x3
#define regW      x4
#define regP      x5
#define regB      x6
#define regC      x7
#define rBitrate  x8
#define rBytelim  x9
#define regIO     x10

        
        .org 0  //                         adr  
        .word	0                       // 0x000  x0 Never touch 
        .word	0			// 0x004  x1 retreg          Link register                       
        .word	0			// 0x008  x2 regC            Loop/index
        .word	0			// 0x00c  x3 regL            Load address/Sentinel
        .word	4			// 0x010  x4 regY            Block limit/Entry point
        .word	0			// 0x014  x5 regP            Result from getchar                 
        .word   1                       // 0x018  x6 regB            Working register                    
        .word	0			// 0x01c  x7 regW            Working register                    
        .word	16 + 32*-4		// 0x020  x8 rBitrate        Found by autobaud at start
        .word	0			// 0x024  x9 rBytelim        Found by autobaud at start
        .word	0x60000000		// 0x028 x10 regIO           Constant                            
getchar:lw      regP,UARTOFS(regIO)     // 0x02c x11
        beq     regP,x0,getchar         // 0x030 x12 Wait for framebit when low bitrates 
        lw      regP,UARTOFS(regIO)     // 0x034 x13
        bne     regP,x0,getchar         // 0x038 x14 Wait for startbit
        sw      x0,%lo(__mcycle)(x0)    // 0x03c x15 Timebase when to sample. regP == 0 here.
        srli    regW,rBitrate,1         // 0x040 x16 w = g_bitrate/2
2:      add     regW,regW,rBitrate      // 0x044 x17 Next sample time
1:      lw      regB,%lo(__mcycle)(x0)  // 0x048 x18 
        bltu    regB,regW,1b            // 0x04c x19 Wait until time to sample
        lw      regB,UARTOFS(regIO)     // 0x050 x20 Get bit (read into regB.9)
        or      regP,regP,regB          // 0x054 x21 Into shift register
        slli    regP,regP,1             // 0x058 x22 Shift
        bltu    regW,rBytelim,2b        // 0x05c x23 Byte sampled?
        jalr    x0,0(retreg)            // 0x060 x24 Returns with byte in regP[7:0]
LBHead: li      regC,-8                 // 0x064 x25 while (1) {
1:      jal     retreg,getchar          // 0x068 x26         for ( i = -8; i < 0; i++ ) {
        sb      regP,20(regC)           // 0x06c x27                 *p++ = getchar // Fills regL and regY
        addi    regC,regC,1             // 0x070 x28 
        bne     regC,x0,1b              // 0x074 x29         }
        bne     regL,x0,DataL           // 0x078 x30   	     if ( loadadr== 0 )
        jalr    x0,0(regY)              // 0x07c x31                 go();
        .org    0x80                    //      
__jj:           .word 0          //     // 0x080 ucode register
__rinst:        .word 0          //     // 0x084 32-lsb of instret counter
__pc:           .word _start-4   // x   // 0x088 Program counter
__mcycle:       .word 0          //     // 0x08c 32-lsb of cycle counter
__rNMI_IIV:     .word 0          //     // 0x090 Must point to handlers for NMI/Internal interrupts
cteffffff7f:    .word 0xffffff7f // x   // 0x094 For sign extension in "lb"
cte000000ff:    .word 0x000000ff // x   // 0x098 Mask in "lb", "lbu", also for entrypoint CSR
cte0000ffff:    .word 0x0000ffff // x   // 0x09c Mask in "lh" and "lhu"
cteffff7fff:    .word 0xffff7fff // x   // 0x0a0 For sign extension in "lh"
__mtvec:        .word 0          //     // 0x0a4 Should point to excption handler.
cte00000000:    .word 0x00000000 // x   // 0x0a8 ucode constant. 
cteffffffff:    .word 0xffffffff // x   // 0x0ac ucode constant.
__yy:           .word 0                 // 0x0b0 ucode register.
        .org    0xb4

DataL:  jal     retreg,getchar          // 0x0b4             do {                   
        sb      regP,0(regL)            // 0x0b8                     regP = getchar()  
        addi    regL,regL,1             // 0x0bc 	             *loadadr++ = regP; 	
        bltu    regL,regY,DataL         // 0x0c0             } while ( loadar < end )
        j       LBHead                  // 0x0c4     }

        .org    0xc8                    //       This code can be overwritten
_start:                                 //       by the loading process.
        sw      regW,UARTOFS(regIO)     // 0x0c8 UART-D = 1
        sw      regW,LEDOFS(regIO)      // 0x0cc Alive
ABL:    lw      regP,UARTOFS(regIO)     // 0x0d0 while ( UART->D )
        bne     regP,x0,1b              // 0x0d4      ;
1:      lw      regP,UARTOFS(regIO)     // 0x0d8 while ( UART->D == 0)
        beq     regP,x0,1b              // 0x0dc      ;
        lw	regC,%lo(__mcycle)(x0)  // 0x0e0 atstart = SYSEBR->mcycle;
        sub     rBitrate,rBitrate,regC  // 0x0e4 
1:      lw      regP,UARTOFS(regIO)     // 0x0e8 while ( UART->D )
        bne     regP,x0,1b              // 0x0ec      ;
1:      lw      regP,UARTOFS(regIO)     // 0x0f0 while ( UART->D == 0)
        beq     regP,x0,1b              // 0x0f4      ;
        lw      regC,%lo(__mcycle)(x0)  // 0x0f8 atend  = SYSEBR->mcycle;
        add     rBitrate,rBitrate,regC  // 0x0fc ab = ab + (atend - atstart)
        addi    regW,regW,-1            // 0x100 4 times
        bne     regW,x0,ABL             // 0x104     
        srli    rBitrate,rBitrate,5     // 0x108 rBitrate = (4*autobaud+16)/32 + FUDGEFACTOR
        slli    rBytelim,rBitrate,3     // 0x10c          = (4*autobaud+16+32*FUDGEFACTOR)/32
        j       LBHead                  // 0x110
