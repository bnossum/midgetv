        // =============================================================================
        // Part of midgetv
        // 2019. Copyright B. Nossum.
        // For licence, see LICENCE
        // =============================================================================
        // For midgetv implemented on hardware where a bitbang UART is possible. 
        //
        // Loadable regions:
        // -----------------
        // 0x00000093 - 0x00000090      __rNMI_IIV
        // 0x000000a7 - 0x000000a4      __mtvec
        // (top adr)  - 0x000000cc      Most part of memory.
        //
        // Note - by convention dynamic loading of midgetv happens from address 0x100.
        //
        // The strategy to let the loader live in memory usually reserved for registers 
        // is inspired by the fact that riscv does not specify any startup value for 
        // registers, so all programs must assume the registers are unknown.
        //
        // Program tested with a clock frequency of 12 MHz nominally, upload at 115200
        // =============================================================================
#define IOREGION 0x60000000
#define LEDOFS  4
#define UARTOFS 8


#define regT            x1   // 8
#define regL            x2   // 0 at GO 
#define regY            x3   // ep=Entrypint at GO
#define regE            x4   // 16
#define regIO           x5   // 0x60000000
#define regP            x6   // (uint8_t) ep | 0x100
#define regW            x7   // 9*rBitrate + rBitrate/2 - 14
#define regB            x8   // 0x100
#define r9bit           x9   // 9*Bitrate
#define rBitrate       x10   // Bitrate                              

        .globl _start
        .org 0  //                      // reg  Name            When go()
        .word 0         		//  x0  x0              0
        .word 4*2 			//  x1  regT     	8                                    
        .word 0xdeadbabe		//  x2  regL     	0 
        .word 0         		//  x3  regY     	ep=Entrypoint
        .word 4*4 			//  x4  regE     	16                                   
        .word 0x60000000		//  x5  regIO    	0x60000000                           
        .word 0 			//  x6  regP     	(uint8_t) ep | 0x100                 
        .word 0x80000003		//  x7  regW     	9*rBitrate + rBitrate/2 - 14         
        .word 4 			//  x8  regB     	0x100                                
        .word 0 			//  x9  r9bit    	9*Bitrate                            
        .word 16 			// x10  rBitrate 	Bitrate                               
Header:
        li      regT,4*2                // x11    //         Header is written into regL 
        li      regE,4*4                // x12    //         and regY
getblk: lw      regB,UARTOFS(regIO)     // x13    //   |     
        bne     regB,x0,getblk          // x14    //   |     Wait for startbit
        sw      x0,%lo(__mcycle)(x0)    // x15    //   |     Timebase when to sample
        addi    regT,regT,1             // x16    //   |     Increment store index here allready, to save time at [a]
        lw      regW,%lo(__rNMI_IIV)(x0)// x17    //   |     w = g_bitrate/2 - 14 (compensate 14, to late clear of __mcycle)
2:      add     regW,regW,rBitrate      // x18    //   | |   Next sample time
        or      regP,regP,regB          // x19    //   | |   Into shift register
        srli    regP,regP,1             // x20    //   | |   Shiftreg shifted
1:      lw      regB,%lo(__mcycle)(x0)  // x21    //   | |   
        bltu    regB,regW,1b            // x22    //   | |   Wait until time to sample
        lw      regB,UARTOFS(regIO)     // x23    //   | |   Get bit (read into regB.8)
        bltu    regW,r9bit,2b           // x24    //   | |   Byte sampled?
        sb      regP,-1(regT)           // x25    //   |     Store byte. The index is incremented allready. [a]
        bne     regT,regE,getblk        // x26    //   |     Get next byte in block
        beq     regE,regY,Header        // x27    //         if regE == regY, Header is next.                
        beq     regL,x0,__mtvec         // x28    //         Data block or execute is next. Go?
        mv      regT,regL               // x29    //         Read data block.
        mv      regE,regY               // x30    //
        j       getblk                  // x31    //
        .org    0x80                       
__jj:           .word 0          //     // 0x080     ucode register
__rinst:        .word 0          //     // 0x084     32-lsb of instret counter
__pc:           .word _start-4   // x   // 0x088     Program counter
__mcycle:       .word 0          //     // 0x08c     32-lsb of cycle counter
__rNMI_IIV:     .word 0xdeadbabe //     // 0x090     Must point to handlers for NMI/Internal interrupts. Used in this loader
cteffffff7f:    .word 0xffffff7f // x   // 0x094     For sign extension in "lb"
cte000000ff:    .word 0x000000ff // x   // 0x098     Mask in "lb", "lbu", also for entrypoint CSR
cte0000ffff:    .word 0x0000ffff // x   // 0x09c     Mask in "lh" and "lhu"
cteffff7fff:    .word 0xffff7fff // x   // 0x0a0     For sign extension in "lh"
__mtvec:jalr    x0,0(regY)       //     // 0x0a4     Should point to exception handler. Used in this loader
cte00000000:    .word 0x00000000 // x   // 0x0a8     ucode constant. 
cteffffffff:    .word 0xffffffff // x   // 0x0ac     ucode constant.
__yy:           .word 0                 // 0x0b0     ucode register.
        //
        //  Anything from here can be overwritten by the loading process
        //
        .org    0xb4

        //
        // First calculate bitrate with autobaud,
        // then branch to loader routine in getblk
        //
_start:                                 
        sw      regW,UARTOFS(regIO)     // 0x0b4     UART->D = 1
        sw      regW,LEDOFS(regIO)      // 0x0b8     Light green and red led, source for blue led is ~uartrx.
ABL:    lw      regP,UARTOFS(regIO)     // 0x0bc     while ( UART->D )
        bne     regP,x0,ABL             // 0x0c0          ;
1:      lw      regP,UARTOFS(regIO)     // 0x0c4     while ( UART->D == 0)
        beq     regP,x0,1b              // 0x0c8          ;
        lw	r9bit,%lo(__mcycle)(x0) // 0x0cc     atstart = SYSEBR->mcycle;
        sub     rBitrate,rBitrate,r9bit // 0x0d0     
1:      lw      regP,UARTOFS(regIO)     // 0x0d4     while ( UART->D )
        bne     regP,x0,1b              // 0x0d8          ;
1:      lw      regP,UARTOFS(regIO)     // 0x0dc     while ( UART->D == 0)
        beq     regP,x0,1b              // 0x0e0          ;
        lw      r9bit,%lo(__mcycle)(x0) // 0x0e4     atend  = SYSEBR->mcycle;
        add     rBitrate,rBitrate,r9bit // 0x0e8     ab = ab + (atend - atstart)
        addi    regB,regB,-1            // 0x0ec     4 times
        bne     regB,x0,ABL             // 0x0f0         
        srli    rBitrate,rBitrate,5     // 0x0f4     rBitrate = (4*autobaud+16)/32 - 4  [b]
        addi    rBitrate,rBitrate,-5    // 0x0f8
        srli    regB,rBitrate,1         // 0x0fc
        addi    regB,regB,-14           // 0x100     
        sw      regB,%lo(__rNMI_IIV)(x0)// 0x104     g_bitrate/2 - 14
        slli    r9bit,rBitrate,3        // 0x108
        add     r9bit,r9bit,rBitrate    // 0x10c
        sb      x0,LEDOFS(regIO)        // 0x114     Turn of green and red led. Source for blue led is still ~uartrx
        j       getblk                  // 0x118

        /* At 12 MHz, bitrate 115200, this routine is marginal.
         * The fudgefactor at [b] is really needed - I don't know why
         *
         * Short investigation:
         * FUDGE
         *     0  Failed 3/3
         *    -2  Failed 3/3
         *    -3  Works 3/3
         *    -4  Works. Tested many > 50 times
         *    -6  Works 3/3
         *    -8  Works 3/3
         *    -9  Failed 3/6
         *   -10  Failed 3/3
         *   -12  Failed 3/3
         *   -16  Failed 3/3
         *
         * Hence I select the fudge factor -5.
         */
