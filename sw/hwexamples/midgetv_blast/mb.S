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
        // (top adr)  - 0x000000cc      Most part of memory.
        //
        // =============================================================================
        
#define LEDOFS  4
#define UARTOFS 8

#define retreg    x1
#define regC      x2
#define regL      x3
#define regY      x4
#define regP      x5
#define regB      x6
#define regW      x7
#define rBitrate  x8
#define rBytelim  x9
#define regIO     x10
        .globl _start
        .org 0  //                         adr
Registers:      
        .word	0                       // 0x000  x0 Never touch 
        .word	0			// 0x004  x1 retreg          Link register                       
        .word	0			// 0x008  x2 regC            Loop/index
        .word	0			// 0x00c  x3 regL            Load address/Sentinel
        .word	0			// 0x010  x4 regY            Block limit/Entry point
        .word	0			// 0x014  x5 regP            Result from getchar                 
        .word   4                       // 0x018  x6 regB            Working register                    
        .word	0x80000001		// 0x01c  x7 regW            Working register                    
        .word	16 + 32*-4		// 0x020  x8 rBitrate        Found by autobaud at start
        .word	0			// 0x024  x9 rBytelim        Found by autobaud at start
        .word	0x60000000		// 0x028 x10 regIO           Constant                            
getchar:lw      regB,UARTOFS(regIO)     // 0x02c x11
        beq     regB,x0,getchar         // 0x030 x12 Wait for framebit when low bitrates 
1:      lw      regB,UARTOFS(regIO)     // 0x034 x13
        bne     regB,x0,1b              // 0x038 x14 Wait for startbit
        sw      x0,%lo(__mcycle)(x0)    // 0x03c x15 Timebase when to sample. regP == 0 here.
        srli    regW,rBitrate,1         // 0x040 x16 w = g_bitrate/2
2:      add     regW,regW,rBitrate      // 0x044 x17 Next sample time
1:      lw      regB,%lo(__mcycle)(x0)  // 0x048 x18 
        bltu    regB,regW,1b            // 0x04c x19 Wait until time to sample
        lw      regB,UARTOFS(regIO)     // 0x050 x20 Get bit (read into regB.7)
        srli    regP,regP,1             // 0x054 x21 Shift
        or      regP,regP,regB          // 0x058 x22 Into shift register
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
__jj:           .word 0          //     // 0x080     ucode register
__rinst:        .word 0          //     // 0x084     32-lsb of instret counter
__pc:           .word _start-4   // x   // 0x088     Program counter
__mcycle:       .word 0          //     // 0x08c     32-lsb of cycle counter
__rNMI_IIV:     .word 0          //     // 0x090     Must point to handlers for NMI/Internal interrupts
cteffffff7f:    .word 0xffffff7f // x   // 0x094     For sign extension in "lb"
cte000000ff:    .word 0x000000ff // x   // 0x098     Mask in "lb", "lbu", also for entrypoint CSR
cte0000ffff:    .word 0x0000ffff // x   // 0x09c     Mask in "lh" and "lhu"
cteffff7fff:    .word 0xffff7fff // x   // 0x0a0     For sign extension in "lh"
__mtvec:        .word 0          //     // 0x0a4     Should point to excption handler.
cte00000000:    .word 0x00000000 // x   // 0x0a8     ucode constant. 
cteffffffff:    .word 0xffffffff // x   // 0x0ac     ucode constant.
__yy:           .word 0                 // 0x0b0     ucode register.
        .org    0xb4                                 
                                                     
DataL:                                               
        jal     retreg,getchar          // 0x0b4                 do {                   
        sb      regP,0(regL)            // 0x0b8                         regP = getchar()
        addi    regL,regL,1             // 0x0bc     	             *loadadr++ = regP; 	
        sb      regP,LEDOFS(regIO)      // 0x0c0                         LEDs = regP;
        bltu    regL,regY,DataL         // 0x0c4                 } while ( loadar < end )
        j       LBHead                  // 0x0c8         }
                                                     
        .org    0xcc                    //           This code can be overwritten
_start:                                 //           by the loading process.
        sw      regW,UARTOFS(regIO)     // 0x0cc     UART-D = 1, source for blue led is uartrx.
        sw      regW,LEDOFS(regIO)      // 0x0d0     Alive
ABL:    lw      regP,UARTOFS(regIO)     // 0x0d4     while ( UART->D )
        bne     regP,x0,ABL             // 0x0d8          ;
1:      lw      regP,UARTOFS(regIO)     // 0x0dc     while ( UART->D == 0)
        beq     regP,x0,1b              // 0x0e0          ;
        lw	regC,%lo(__mcycle)(x0)  // 0x0e4     atstart = SYSEBR->mcycle;
        sub     rBitrate,rBitrate,regC  // 0x0e8     
1:      lw      regP,UARTOFS(regIO)     // 0x0ec     while ( UART->D )
        bne     regP,x0,1b              // 0x0f0          ;
1:      lw      regP,UARTOFS(regIO)     // 0x0f4     while ( UART->D == 0)
        beq     regP,x0,1b              // 0x0f8          ;
        lw      regC,%lo(__mcycle)(x0)  // 0x0fc     atend  = SYSEBR->mcycle;
        add     rBitrate,rBitrate,regC  // 0x100     ab = ab + (atend - atstart)
        addi    regB,regB,-1            // 0x104     4 times
        bne     regB,x0,ABL             // 0x108         
        srli    rBitrate,rBitrate,5     // 0x10c     rBitrate = (4*autobaud+16)/32 + FUDGEFACTOR
        slli    rBytelim,rBitrate,3     // 0x110              = (4*autobaud+16+32*FUDGEFACTOR)/32
        j       LBHead                  // 0x114

#if 0        
//dbg1  mv      x10,rBitrate
//dbg1  j       BINBLINK
        

        /* During debug, see that we have a basic communication.
         *  o The bitrate.
         *    I dechipher the bitrate to be 0x9dcd for 300bps.
         *    This is right according to autobaud.
         *  o Ensured I could receive a character.
         *
         */
#define IOregion 0x60000000

Show_Y: mv      regL,regY
Show_L: mv      regP,regL
GotWhat:mv      x10,regP
        
        // In: x10 is value to output to LEDs
        // Output a 32-bit value by LEDs.
        // Output a 16-bit value by LEDs.
        // red == 1
        // green = 0
        // from msb to lsb
        // Hang.
BINBLINK:
        li      x3,IOregion

        li      x5,16
        slli    x10,x10,16      // 16 lsb to be shown

2:      sw      x0,LEDOFS(x3)
        jal     x1,DLY

//        slt     x6,x0,x10
//        addi    x6,x6,1
        li      x6,0x80000000
        and     x6,x6,x10
        beq     x6,x0,isZero
        li      x6,1
        j       1f
isZero: li      x6,2
1:      
        
        sw      x6,LEDOFS(x3)
        jal     x1,DLY
        slli    x10,x10,1
        addi    x5,x5,-1
        bne     x5,x0,2b
1:      sw      x0,LEDOFS(x3)
        j       1b
        

DLY:    li      x6,0x80000
1:      addi    x6,x6,-1
        bne     x6,x0,1b
        jalr    x0,0(x1)

DBGCNTLEDS:    
        li      x3,IOregion
        sw      x5,LEDOFS(x3)
        addi    x5,x5,1
        jal     x1,DLY
        j       DBGCNTLEDS
        
#endif
