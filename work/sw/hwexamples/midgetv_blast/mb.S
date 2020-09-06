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
        // (top adr)  - 0x000000b4      Most parts of memory.
        //
        // The strategy to let the loader live in memory usually reserved for registers 
        // is inspired by the fact that riscv does not specify any startup value for 
        // registers, so all programs should (must!) assume registers are unknown.
        //
        // It seems to be fairy common to use a 12 MHz clock in the boards I have seen.
        // For a 12 MHz clock, this loader will just barely work at 115200 bps.
        // It is recommended to have above 150 clock cycles per bit, so the highest
        // recommended bitrate with a 12 MHz clock is 57600. (12000000/57600 ~= 208).
        // =============================================================================
#define IOREGION 0x60000000
#define LEDOFS  4
#define UARTOFS 8


#define regT            x1   // Loop control/Store index
#define regL            x2   // Load address
#define regY            x3   // Block index
#define regE            x4   // Block limit
#define r9bit           x5   // Number of cycles in 9 bits.
#define regP            x6   // Shift register for received byte
#define regW            x7   // Tmp register
#define regB            x8   // Tmp register
#define regIO           x9   // IO-region
#define rBitrate       x10   // Number of cycles per bit

        .globl _start
        .org 0  //                      // reg  Name            When go()
        .word 0         		//  x0  x0              0
        .word 4*2 			//  x1  regT     	0                                    
        .word 0xdeadbabe		//  x2  regL     	0 
        .word 0         		//  x3  regY     	ep=Entrypoint
        .word 4*4 			//  x4  regE     	ep
        .word 0 			//  x5  r9bit    	9*Bitrate                            
        .word 0 			//  x6  regP     	(uint8_t) ep | 0x100                 
        .word 0x80000003		//  x7  regW     	9*rBitrate + rBitrate/2 - 14. Initval used at _start:         
        .word 4 			//  x8  regB     	0x100                         Initval used for loop at _start
        .word IOREGION  		//  x9  regIO    	0x60000000
        .word 16 			// x10  rBitrate 	Bitrate                       Initval used for rounding
Header:
        li      regT,4*2                // x11    //         Header is written into mem[8] to mem[15]
        li      regE,4*4                // x12    //         This is regL and regY
getblk: lw      regB,UARTOFS(regIO)     // x13    //   |
        bne     regB,x0,getblk          // x14    //   |     Wait for startbit
        sw      x0,%lo(__mcycle)(x0)    // x15    //   |     Timebase when to sample
        addi    regT,regT,1             // x16    //   |     Increment store index here to save time at [a]
        srli    regW,rBitrate,1         // x17    //   |     w = g_bitrate/2
2:      add     regW,regW,rBitrate      // x18    //   | |   Next sample time
        or      regP,regP,regB          // x19    //   | |   Previous read bit into shift register
        srli    regP,regP,1             // x20    //   | |   Shiftreg shifted
1:      lw      regB,%lo(__mcycle)(x0)  // x21    //   | |   
        bltu    regB,regW,1b            // x22    //   | |   Wait until time to sample
        lw      regB,UARTOFS(regIO)     // x23    //   | |   Get bit (read into regB.8)
        bltu    regW,r9bit,2b           // x24    //   | |   Byte sampled?
        sb      regP,-1(regT)           // x25    //   |     Store byte. The index is already incremented. [a]
        bne     regT,regE,getblk        // x26    //   |     Block fully read? If not, get next byte in block
        beq     regE,regY,Header        // x27    //         We read data chunk? if regE == regY we did, get a Header next.                
        mv      regT,regL               // x28    //         Prepare variables for
        mv      regE,regY               // x29    //         data chunk read.
        bne     regL,x0,getblk          // x30    //         We want a data chunk? If we do, get a data block next
        jalr    x0,0(regY)              // x31    //         Do not want data chunk so this must be a Go(). Release program.

        // ======================================================= //
        //                                                         //
        //  Magic constants. most of these must not be touched     //
        //                                                         //
        // ======================================================= //
        .org    0x80        
                                 // never write locations marked with 'x'
__jj:           .word 0          // |   // 0x080     ucode register
__rinst:        .word 0          // |   // 0x084     32-lsb of instret counter
__pc:           .word _start-4   // x   // 0x088     Program counter
__mcycle:       .word 0          // |   // 0x08c     32-lsb of cycle counter
__rNMI_IIV:     .word ExceptH    // |   // 0x090     Must point to handlers for NMI/Internal interrupts. //__rNMI_IIV:   .word 0xdeadbabe //     // 0x090     Must point to handlers for NMI/Internal interrupts. Used in this loader
cteffffff7f:    .word 0xffffff7f // x   // 0x094     For sign extension in "lb"
cte000000ff:    .word 0x000000ff // x   // 0x098     Mask in "lb", "lbu", also for entrypoint CSR
cte0000ffff:    .word 0x0000ffff // x   // 0x09c     Mask in "lh" and "lhu"
cteffff7fff:    .word 0xffff7fff // x   // 0x0a0     For sign extension in "lh"
__mtvec:        .word ExceptH    // |   // 0x0a4     Should point to exception handler.
cte00000000:    .word 0x00000000 // x   // 0x0a8     ucode constant. 
cteffffffff:    .word 0xffffffff // x   // 0x0ac     ucode constant.
__yy:           .word 0                 // 0x0b0     ucode register.

        // ======================================================= //
        //                                                         //
        //  Anything from here can be overwritten during loading.  //
        //                                                         //
        // ======================================================= //
        .org    0xb4
        
__mepc:         .word 0                 // 0x0b4 For exception handling
__mcause:       .word 0                 // 0x0b8 For exception handling
__mtval:        .word 0                 // 0x0bc For exception handling
__mscratch:     .word 0                 // 0x0c0 Used by CSR code
__misa:         .word 0x40800100        // 0x0c4 Used by CSR code. RV32I base ISA, nonstd. ext. present, XLEN = 32

        //
        //  In case the user did not remember/bother to make an exception
        //  handler, and the loaded program leaves these locations untouched:
        //
ExceptH:
1:
        addi    x3,x3,1                 // 0x0c8
        li      x1,IOREGION             // 0x0cc
        sw      x3,LEDOFS(x1)           // 0x0d0 
2:      addi    x1,x1,0x7FF             // 0x0d4 
        bgt     x1,x0,2b                // 0x0d8
        j       1b                      // 0x0dc                                     

        //
        // Defensive coding.
        // In case the use did not remember/bother to write CSR emulation code,
        // and the loader program leaves these locations untouched, I arrange
        // for a default exception handle to kick in.
        //
        .macro ij rdnr=0,ofs=0,rs1nr=0
        .word (((\ofs) & 0xfff)<<20) + (((\rs1nr) & 31)<<15) + (((\rdnr) & 31)<<7) + 0b0001011
        .endm

_mtime:         .word 0 		// 0x0e0 Read/write from user code. Updated by internal interrupt
_mtimeh:        .word 0 		// 0x0e4 Read/write from user code. Updated by internal interrupt
__bitrate:      .word 0                 // 0x0e8 For use by loaded program.
__minstreth:    .word 0 		// 0x0ec Read/write from user code. Updated by internal interrupt
__mcycleh:      .word 0 		// 0x0f0 Read/write from user code. Updated by internal interrupt
__freefornow_f4:.word 0                 // 0x0f4
__mtimecmp:     .word 0xffffffff        // 0x0f8 Read/write from user code. 
__mtimecmph:    .word 0xffffffff	// 0x0fc Read/write from user code. 
        .org 0x100  			//
CSRretadr:      .word 0			// 0x100 Microcode writes PC to CSRretadr when a CSR instruction is seen.
Entry_xRET:     ij      0,0xb6,0        // 0x104 Microcode branches to here when MRET/SRET/URET is seen
EntryCSR:       j       ExceptH         // 0x108 Microcode branches to here when a CSR instruction is seen
                
        //
        // Here is the start of the loader.
        // First calculate bitrate with autobaud,
        // then branch to loader routine in getblk
        //
_start:
        sw      regW,UARTOFS(regIO)     // UART->D = 1. Light green and red led, source for blue led is ~uartrx.
        sw      regW,LEDOFS(regIO)      // for ( i = 0; i < 4; i++ ) {
ABL:    lw      regP,UARTOFS(regIO)     //         while ( UART->D )
        bne     regP,x0,ABL             //              ;
1:      lw      regP,UARTOFS(regIO)     //         while ( UART->D == 0)
        beq     regP,x0,1b              //              ;
        lw	r9bit,%lo(__mcycle)(x0) //         atstart = SYSEBR->mcycle;
        sub     rBitrate,rBitrate,r9bit //         
1:      lw      regP,UARTOFS(regIO)     //         while ( UART->D )
        bne     regP,x0,1b              //              ;
                                        //
        addi    regB,regB,-1            //         Is this the last round?
        beq     regB,x0,LastLoop        //         Yes, break    
        
1:      lw      regP,UARTOFS(regIO)     //         while ( UART->D == 0)
        beq     regP,x0,1b              //              ;
        lw      r9bit,%lo(__mcycle)(x0) //         atend  = SYSEBR->mcycle;
        add     rBitrate,rBitrate,r9bit //         ab = ab + (atend - atstart)
        j       ABL                     // }
LastLoop:
        lw      regP,UARTOFS(regIO)     // while ( UART->D == 0)
        beq     regP,x0,LastLoop        //      ;
        lw      r9bit,%lo(__mcycle)(x0) // atend  = SYSEBR->mcycle;
        sb      x0,LEDOFS(regIO)        // Turn of green and red led. Source for blue led is still ~uartrx
        add     rBitrate,rBitrate,r9bit // ab = ab + (atend - atstart)
        srli    rBitrate,rBitrate,5     // rBitrate = (4*autobaud+16)/32 
        addi    rBitrate,rBitrate,-6    // Fudge [b], see below.
        slli    r9bit,rBitrate,3        //
        add     r9bit,r9bit,rBitrate    //
        sw      rBitrate,%lo(__bitrate)(x0)
        j       getblk                         

        /*
         * At 12 MHz, bitrate 115200, loading is really MARGINAL.
         * We shorten the bit time with a fudgefactor. See [b]. For lower bitrates,
         * this adjustment is of no consequence.
         * 
         * FUDGE  Successes/Trails Result
         * -3     0/3              Fails
         * -4     3/3              ?      Subsequent program does not seem to be loaded correctly
         * -5     3/3              Ok
         * -6     3/3              Ok
         * -10    3/3              Ok
         * -11    1/3              Fails
         * -12    0/3              Fails
         * -15    0/1              Fails
         * Nominally, a bit time is 12000000/115200 = 104 = 0x68 clock cycles.
         * This translates into very few instructions in this implementation.
         * 
         */
