        // =============================================================================
        // Part of midgetv
        // 2019. Copyright B. Nossum.
        // For licence, see LICENCE
        // =============================================================================
        //
        // Loadable regions:
        // -----------------
        // 0x00000093 - 0x00000090      __rNMI_IIV
        // 0x000000a7 - 0x000000a4      __mtvec
        // (top adr)  - 0x000000c4      Remaining memory.
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
#define rByterate x9
#define regIO     x10

        
        .org 0  //                         adr  
        .word	0                       // 0x000  x0 Never touch 
        .word	0			// 0x004  x1 retreg          Link register
        .word	0			// 0x008  x2 regL            Load address/Sentinel
        .word	0			// 0x00c  x3 regY            Block limit/Entry point
        .word	4			// 0x010  x4 regW            Working register
        .word	0			// 0x014  x5 regP            Result from getchar
        .word   1                       // 0x018  x6 regB            Working register
        .word	0			// 0x01c  x7 regC            Loop/index
        .word	16 + 32*-4		// 0x020  x8 rBitrate        Found by autobaud at start
        .word	0			// 0x024  x9 rBytelim       Found by autobaud at start
        .word	0x60000000		// 0x028 x10 regIO           Constant
getchar:lw      regP,UARTOFS(regIO)     // 0x02c x11
        bne     regP,x0,getchar         // 0x030 x12 Wait for startbit
        sw      x0,%lo(__mcycle)(x0)    // 0x034 x13 Timebase when to sample. regP == 0 here.
        srli    regW,rBitrate,1         // 0x038 x14 w = g_bitrate/2
2:      add     regW,regW,rBitrate      // 0x03c x15 Next sample time
1:      lw      regB,%lo(__mcycle)(x0)  // 0x040 x16 
        bltu    regB,regW,1b            // 0x044 x17 Wait until time to sample
        lw      regB,UARTOFS(regIO)     // 0x048 x18 Get bit (read into regB.9)
        or      regP,regP,regB          // 0x04c x19 Into shift register
        slli    regP,regP,1             // 0x050 x20 Shift
        bltu    regW,rBytelim,2b        // 0x054 x21 Byte and frame bit sampled?
        jalr    x0,0(retreg)            // 0x058 x22 Returns with byte in regP[7:0], regP.8 == 1
LBHead: li      regC,-8                 // 0x05c x23 while (1) {
1:      jal     retreg,getchar          // 0x060 x24      for ( i = -8; i < 0; i++ ) {
        sb      regP,16(regC)           // 0x064 x25              *p++ = getchar // Writes to regL and regY
        addi    regC,regC,1             // 0x068 x26 
        bne     regC,x0,1b              // 0x06c x27      }
        beq     regL,x0,_mtvec          // 0x070 x28    	if ( loadadr == 0 )  go()
DataL:  jal     retreg,getchar          // 0x074 x29    	do {                   
        sb      regP,0(regL)            // 0x078 x30                    regP = getchar()  
        j       LastFew                 // 0x07c x31
        .org    0x80                    //      
__jj:           .word 0          //     // 0x080 10000000  0x20 ucode register
__rinst:        .word 0          //     // 0x084 10000100  0x21 32-lsb of instret counter
__pc:           .word _start-4   // x   // 0x088 10001000  0x22 Program counter
__mcycle:       .word 0          //     // 0x08c 10001100  0x23 32-lsb of cycle counter
__rNMI_IIV:     .word 0          //     // 0x090 10010000  0x24 Must point to handlers for NMI/Internal interrupts
cteffffff7f:    .word 0xffffff7f // x   // 0x094 10010100  0x25 For sign extension in "lb"
cte000000ff:    .word 0x000000ff // x   // 0x098 10011000  0x26 Mask in "lb", "lbu", also for entrypoint CSR
cte0000ffff:    .word 0x0000ffff // x   // 0x09c 10011100  0x27 Mask in "lh" and "lhu"
cteffff7fff:    .word 0xffff7fff // x   // 0x0a0 10100000  0x28 For sign extension in "lh"
__mtvec:        jalr    x0,0(regY)      // 0x0a4 10100100  0x29 Should point to excption handler. Must be patched by crt0.
cte00000000:    .word 0x00000000 // x   // 0x0a8 10101000  0x2a ucode constant. 
cteffffffff:    .word 0xffffffff // x   // 0x0ac 10101100  0x2b ucode constant.
__yy:           .word 0                 // 0x0b0 10110000  0x2c ucode register.
        .org    0xb4

LastFew:
        addi    regL,regL,1             // 0x0b4 	     *loadadr++ = regP; 	
        bltu    regL,regY,DataL         // 0x0b8  	} while ( loadar < end )
        j       LBHead                  // 0x0bc     }

        .org    0xc4                    //       This code can be overwritten
_start:                                 //       by the loading process.
        sw      regW,UARTOFS(regIO)     // 0x0c0 UART-D = 1
        sw      regW,LEDOFS(regIO)      // 0x0c4 Alive
ABL:    lw      regP,UARTOFS(regIO)     // 0x0c8 while ( UART->D )
        bne     regP,x0,1b              // 0x0cc      ;
1:      lw      regP,UARTOFS(regIO)     // 0x0d0 while ( UART->D == 0)
        beq     regP,x0,1b              // 0x0d4      ;
        lw	regC,%lo(__mcycle)(x0)  // 0x0d8 atstart = SYSEBR->mcycle;
        sub     rBitrate,rBitrate,regC  // 0x0dc 
1:      lw      regP,UARTOFS(regIO)     // 0x0e0 while ( UART->D )
        bne     regP,x0,1b              // 0x0e4      ;
1:      lw      regP,UARTOFS(regIO)     // 0x0e8 while ( UART->D == 0)
        beq     regP,x0,1b              // 0x0ec      ;
        lw      regC,%lo(__mcycle)(x0)  // 0x0f0 atend  = SYSEBR->mcycle;
        add     rBitrate,rBitrate,regC  // 0x0f4 ab = ab + (atend - atstart)
        addi    regW,regW,-1            // 0x0f8 4 times
        bne     regW,x0,ABL             // 0x0fc     
        srli    rBitrate,rBitrate,5     // 0x100 rBitrate = (4*autobaud+16)/32 + FUDGEFACTOR
        slli    rBytelim,rBitrate,3     // 0x104           = (4*autobaud+CTE)/32
        add     rBytelim,rBytelim,rBitrate//x108 Bytelim is 9 bit times (frame bit is included)
        j       LBH                     // 0x10c
                                               


                        


