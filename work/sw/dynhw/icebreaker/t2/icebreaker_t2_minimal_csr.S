/* =============================================================================
 * A prototyping assembler file when working towards compliance for icebreaker.
 * Fragile program, search for AvoidBug
 */
#include "csrcompliance_io.h"        

        .macro ij rdnr=0,ofs=0,rs1nr=0
        .word (((\ofs) & 0xfff)<<20) + (((\rs1nr) & 31)<<15) + (((\rdnr) & 31)<<7) + 0b0001011
        .endm

#define __jj 0x80
#define __yy 0xb0        

        .section .magicconstants, "a"

//        
//        .org 0xb4
//      Origin of segment is now determined in the linker script DYNSRAMlink.ld
//
AvoidBug: 
__mepc:         .word 0xdeadbabe        // 0xb4 10110100  0x2d For exception handling
__mcause:       .word 0                 // 0xb8 10111000  0x2e For exception handling
__mtval:        .word 0                 // 0xbc 10111100  0x2f For exception handling
__mscratch:     .word 0                 // 0xc0 Used by CSR code
__misa:         .word 0x40800100        // 0xc4 Used by CSR code. RV32I base ISA, nonstd. ext. present, XLEN = 32.
#define DIRTY_ADR_ex_dup_x0 0xc8
_ex_dup_x0:     .word 0 		// 0xc8 | Used by CSR emulation. These        
_ex_rCSRadr:    .word 1 		// 0xcc | locations must be consequtive
_ex_rCSRty:     .word 2 		// 0xd0 | 
_ex_rrs1:       .word 3 		// 0xd4 | 
_ex_rrd:        .word 4 		// 0xd8 | 
_ex_rtmp:       .word 5 		// 0xdc | 
_mtime:         .word 0 		// 0xe0 Read/write from user code. Updated by internal interrupt
_mtimeh:        .word 0 		// 0xe4 Read/write from user code. Updated by internal interrupt
__freefornow_e8:.word 0                 // 0xe8 By convention used to store bitrate
__minstreth:    .word 0 		// 0xec Read/write from user code. Updated by internal interrupt
__mcycleh:      .word 0 		// 0xf0 Read/write from user code. Updated by internal interrupt
__freefornow_f4:.word 0                 // 0xf4 By convention used by compliance test code
__mtimecmp:     .word 0xffffffff	// 0xf8 Read/write from user code. 
__mtimecmph:    .word 0xffffffff	// 0xfc Read/write from user code. 
//        .org 0x100      		//
CSRretadr:      .word 0			//0x100 Microcode writes PC to CSRretadr when a CSR instruction is seen.
Entry_xRET:     ij      0,0xb6,0        //0x104 Microcode branches to here when MRET/SRET/URET is seen
EntryCSR:                               //0x108 Microcode branches to here when a CSR instruction is seen

#define changeme_mtime 0xe0
#define changeme_mtimeh 0xe4        
        
        // =============================================================================
        // Midgetv can be used without any SRAM.
        // For these very constrained implementations it should be considered to
        // remove system support for CSR instructions, and simplify or eliminate
        // interrupts.
        //
        // Memory map:
        // ===========
        // Coarse regions:                         ADR_O[31:27]
        // 0x3fffffff-0x00000000 EBR               00xxx
        // 0x5fffffff-0x40000000 reserved          010xx
        // 0x67ffffff-0x60000000 IO                01100
        // 0x7fffffff-0x68000000 System registers  011yy   with yy != 2'b00
        // 0xffffffff-0x80000000 SRAM              1xxxx
        //
        // Memory map of the start of EBR
        // ==============================
        //
        // 0x07f-0x000 Registers/code/data. Writing anything other than 0 (with
        //             SW/SH/SB) to location 0x0 is a grave error. 
        // 0x0b3-0x080 Dedicated registers and magical constants. It is a grave
        //             fault to change magical constants. Usable locations are 
        //             probably restricted to: 
        //             __rinst      Can be written directly. Incremented each 
        //                          instruction by code executing from SRAM.
        //             __mcycle     Can be written directly. Updated each instruction.
        //             __rNMI_IIV   Vector to the internal interrupt service
        //                          routine that is called when an interrupt
        //                          occurs. Please ensure the low 2 bits are
        //                          clear.
        //             __mtvec      Vector to interrupt/trap handling. Please ensure
        //                          the low 2 bits are clear. (DIRECT mode traps).
        // 0x0bf-0x0b4 Written by microcode when exceptions/interrupts occurs.
        //             __mepc       Used by exceptions/interrupts
        //             __mcause     Used by exceptions/interrupts
        //             __mtval      Used by exceptions/interrupts
        // 0x0df-0x0c0 This range is used by the minimal CSR implementation and also
        //             the internal interrupt routine.
        // 0x0ff-0x0e0 This range is used by the internal interrupt routine.
        // 0x103-0x100 Microcode writes the PC of the CSR instruction here
        // 0x107-0x104 URET/SRET/MRET emulation code entry point. Branched to by
        //             microcode when URET/SRET/MRET is seen
        // 0x10b-0x108 CSR emulation code entry point. Branched to by microcode
        // 
        // Hence, for a midgetv program with no CSR instructions, and with no
        // interrupts, it is conceivable to start the real program at address 0xb4.
        // I suspect most programs will include a minimal CSR, and a minimal 
        // interrupt routine. Preliminary testing indicate the real program will
        // start at around 0x300. And this leads to the obvious choice to let two
        // EBR rams hold system code (csr emulation, mret emulation, and internal
        // interrupt), and leave the SRAM for user code. But other configurations
        // exists.
        // 
        // =============================================================================
        // Interrupt/counter support. Most of the locations defined here require a
        // minimal internal ISR to work well.

        // The following locations are used to trigger side-effects when used as write address.
#define __write_mtime       0x200020e0 // Clears mtimeincip
#define __write_minstreth   0x200040ec // Clears minstrethincip
#define __write_mtimecmp    0x200800f8 // Clears mtip
#define __write_mtimecmph   0x200800fc // Also clears mtip

#define __write_bit_mtip    0x20008080 // Sets mtip. Should only be used in internalISR

//        // The following is mapped to EBR instead of IO
//        // I see no need to change it
#define __write_mstatus     0x20010080  
#define __write_mie         0x20020080 
#define __write_mip         0x20040080
        

        
        // Reading these registers just as normal IO read.
        // The only difference is that the muxing is implemented in m_inputmux
        // instead of being externally visible
                                         // 31        18 17           16          15 12 11   10 8 7    6 4 3    2 0          
#define __read_mip          0x68000000   // 000000000000 mrinstretip  mtimeincip  0000  meip 000  mtip 000 msip 000  MIP     
#define __read_mie          0x70000000   // 000000000000 mrinstrettie mtimeincie  0000  meie 000  mtie 000 msie 000  MIE     
#define __read_mstatus      0x78000000   // 000000000000 0            0           0001  1    000  mpie 000 mie  000  MSTATUS 

        // minstreth lives in software, in EBR ram.
#define __read_minstreth    0x000000ec

        // =============================================================================
        // During simulation some registers are at defined addresses
        // 
#define NOSUCHREG_ADR  0x60000000
#define LEDREG         0x60000004
#define UARTREG        0x60000008
#define DYNWISHREG     0x60000010

#define IOREGION       0x60000000
#define WISHREGOFS           0x04
#define DYNWISHREGOFS        0x10
        
/* =============================================================================
 * The smallest midgetv implementations do not in general support CSR
 * instructions. But this is up to the user. Here I present emulation of
 * just enough CSR registers to pass the compliance tests. In general, CSR
 * registers have fields that are read-only, constraints on legal values to 
 * write, etc. This is gallantly disregarderd here.
 *
 * Short guide to write CSR instruction emulation code
 * ---------------------------------------------------
 * The code must not give exceptions. 
 * The code automatically disable interrupts, so will not be interrupted
 * The code must not use any CSR instructions (it is not reentrant)
 * When exiting the code, an instruction "ij 0,0x100,0" or similar should
 * be used.
 *
 * Memory map (see also midgetv.inc):
 * 0x0000007f-0x00000000  Registers/code/data
 * 0x000000af-0x00000080  Dedicated registers and magical constants
 * 0x000000bf-0x000000b4  Dedicated registers and CSR emulation
 *  TopEbrAdr 0x000000c0  Code/data
 *                        NrEBR   TopEbradr
 *                        2       0x000003ff
 *                        4       0x000007ff
 *                        8       0x00000fff
 *                        16      0x00001fff
 * 0x000020ff-0x00002000  Writing to this range clear the mtimeinc state ff.
 *                        We use partiall addressing decode, and should only
 *                        use write to _mtime at 0x000020b4.
 * 
 */        
// =============================================================================
        .section .magicconstants, "a"
        //     Defined SCR 
        //     registers         mapped to (see midgetv.inc)
#define csradr_misa     0x301 // 0xc4 __misa      
#define csradr_mtvec    0x305 // 0xa4 __mtvect    
#define csradr_mscratch 0x340 // 0xc0 __mscratch   
#define csradr_mepc     0x341 // 0xb4 __mepc
#define csradr_mcause   0x342 // 0xb8 __mcause
#define csradr_mtval    0x343 // 0xbc __mtval

        
#define rCSRadr x1
#define rCSRty  x2        
#define rrs1    x3
#define rrd     x4
#define rtmp    x5

        // -------------------------------------------------------
        // Microcode dictates that a few location have special meaning:
        // 0x100  Here the address of the CSR instruction is stored
        // 0x104  We chose to decode (U/S/M)RET in such a way that an emulation
        //        stub is present. Conceivably this may help if midgetv is
        //        enlarged to cover more than Machine mode
        // 0x108  This is the entry points of the 6 CSR instructions.
//        .org 0x108
        // We have already decoded the CSR address and type in
        // registers __yy and __jj. These registers are used by
        // many microcode instructions, but not "sw" or "lw".
        sw      rCSRadr,%lo(_ex_rCSRadr)(x0)    //
        sw      rCSRty,%lo(_ex_rCSRty)(x0)      // 
        sw      rrs1,%lo(_ex_rrs1)(x0)          //
        sw      rrd, %lo(_ex_rrd)(x0)           //
        sw      rtmp,%lo(_ex_rtmp)(x0)          //
        lw      rCSRty,%lo(__yy)(x0)            // Get CSR type from the volatile __yy register
        lw      rCSRadr,%lo(__jj)(x0)           // Get CSR address from the volatile __jj register
        //
        // Translate riscv CSR address to midgetv address 
        // for those few CSR registers this code defines.
        // We want:
        // CSR adr  midgetv adr
	// 0x301    0xc4 
	// 0x305    0xa4 
	// 0x340    0xc0 
	// 0x341    0xb4 
	// 0x342    0xb8 
	// 0x343    0xbc 
        // other    detect this case
        //
        li      rtmp,4
        addi    rCSRadr,rCSRadr,-0x301
        beqz    rCSRadr,Lmisa
        li      rtmp,5
        addi    rCSRadr,rCSRadr,0x301-0x305
        beqz    rCSRadr,Lmtvec  
        addi    rtmp,rCSRadr,0x305-0x340
        li      rrd,3
        bltu    rrd,rtmp,UnsupportedCSR
        
Lmtvec: 
Lmisa:
        
        //lbu     rCSRadr,%lo(mCSRADRTBL)(rtmp)   // Compiles to wrong result: "lbu x1,412(x0) # 19c <mCSRADRTBL>"
        // The code below is longer, but seems to work correctly
        la      rCSRadr,mCSRADRTBL
fitte1: add     rtmp,rtmp,rCSRadr
        lbu     rCSRadr,0(rtmp)

        //
        // Find rs1 and rd operand locations from the CSR instruction
        //
        lw      rrs1,%lo(CSRretadr)(x0) // Address of the CSR instruction
        lw      rrs1,0(rrs1)            // Read the instruction
        srli    rrs1,rrs1,5             //
        andi    rrd,rrs1,(31<<2)        // rrd: rd as a memory adr. x1-x5 will be restored 
        li      rtmp,(5<<2)             // Constant also used later on
        bgtu    rrd,rtmp,1f             // from the stack when exiting this code.

//        addi    rrd,rrd,%lo(_ex_dup_x0) //  Does not work
fitte2: addi    rrd,rrd,DIRTY_ADR_ex_dup_x0

1:        
        srli    rrs1,rrs1,10            // Get the rs1 field - this is either
        andi    rrs1,rrs1,31            // a 5-bit constant or a register number.
        //
        // Instructions CSRRWI/CSRRSI/CSRRCI use
        // a constant, not a register.
        //
        bltz    rCSRty,2f
        slli    rrs1,rrs1,2             // From register number to register memory address
        bgtu    rrs1,rtmp,1f            // Contents if registers x1-x5 was stored at entry of this code, 

        //fitte:  addi    rrs1,rrs1,%lo(_ex_dup_x0)//and must be fetched from the stack
        // The above line does not work with   riscv32-unknown-elf-gcc (GCC) 10.1.0
fitte3: addi    rrs1,rrs1,DIRTY_ADR_ex_dup_x0
        
        sw      x0,%lo(_ex_dup_x0)(x0)  // A previous CSR instruction may have used _ex_dup_x0
1:      lw      rrs1,0(rrs1)            // The value to write to CSR

        //   rCSRty 
        //   ||       CSR instruction
        // 0x00000100 CSRRW
        // 0x00000102 CSRRS
        // 0x00000103 CSRRC
        // 0xffffff80 CSRRWI
        // 0xffffff82 CSRRSI
        // 0xffffff83 CSRRCI
        //
2:
        lw      rtmp,0(rCSRadr)         // Get the old value of the CSR.

        andi    rCSRty,rCSRty,3
        beqz    rCSRty,DoCSRRW
        andi    rCSRty,rCSRty,1
        beqz    rCSRty,DoCSRS
        
        // -------------------------------------------------------
        // CSRRC or CSRRCI
        // If rrs1 is zero, we should in principle not write the
        // CSR, but because all 6 CSR registers I implement are
        // idempotent I can disregard this here.
        //
DoCSRC:
        not     rrs1,rrs1               // 
        and     rrs1,rrs1,rtmp          // New value for CSR = oldCSR & ~rs1 
        //      Fallthrough

        // -------------------------------------------------------
        // CSRRW or CSRRWI
        //
DoCSRRW:
//        csrLOCAL_IO_PUSH
//        csrLOCAL_IO_WRITE_STR("adr=")
//        csrLOCAL_IO_ARGRESTORE
//        csrLOCAL_IO_WRITE_GPR(rCSRadr)
//        csrLOCAL_IO_WRITE_STR(" set to ")
//        csrLOCAL_IO_ARGRESTORE
//        csrLOCAL_IO_WRITE_GPR(rrs1)
//        csrLOCAL_IO_ARGRESTORE
//        csrLOCAL_IO_WRITE_STR(" (was ")
//        csrLOCAL_IO_ARGRESTORE
//        csrLOCAL_IO_WRITE_GPR(rtmp)
//        csrLOCAL_IO_ARGRESTORE
//        csrLOCAL_IO_WRITE_STR(")\n")
//        csrLOCAL_IO_POP
Join_from_CSRS: 
        sw      rrs1,0(rCSRadr)         // Update the CSR
        sw      rtmp,0(rrd)             // Old CSR value is returned in register rd
        lw      rtmp,%lo(CSRretadr)(x0) // Increment CSR return address
        addi    rtmp,rtmp,4             // (After this rtmp != 0)
        sw      rtmp,%lo(CSRretadr)(x0) 
        //                                      
        // Restore working registers            
        //                                      
RestoreWorkingRegisters:        
        lw      rrd, %lo(_ex_rrd)(x0)
        lw      rrs1,%lo(_ex_rrs1)(x0)          
        lw      rCSRadr,%lo(_ex_rCSRadr)(x0)    
        lw      rCSRty,%lo(_ex_rCSRty)(x0)      
        bnez    rtmp,1f                         
        lw      rtmp,%lo(_ex_rtmp)(x0)          
        ij      0,0x101,0                       // Exit, but will enter trap.
1:      lw      rtmp,%lo(_ex_rtmp)(x0)          // 
        ij      0,0x100,0                       // Exit. pc = CSRretadr, inCSR = 0
        
        // -------------------------------------------------------
        // CSRRS or CSRRSI
        // If rrs1 is zero, we should in principle not write the
        // CSR, but because all 6 CSR registers I implement are
        // idempotent I can disregard this.
        //
DoCSRS:
        or      rrs1,rrs1,rtmp          // New value for CSR = oldCSR | rs1 
        j       Join_from_CSRS          // 

UnsupportedCSR:
        li      rtmp,0                  // 
        j       RestoreWorkingRegisters // 



        // Here rtmp is an index from 0 to 5 inclusive
mCSRADRTBL:
        .byte 0xc0,0xb4,0xb8,0xbc       // 
        .byte 0xc4,0xa4,0,0             // 
        nop                             // 
        nop                             // 
        

//dbg///////////////////////////////////////////////////////////////////////////////        
//dbg//csrblinkforever:
//dbg//        lui     t1,0x60000
//dbg//        sw      x0,4(t1)        // LEDs OFF
//dbg//        li      t2,0x100000
//dbg//1:      addi    t2,t2,-1
//dbg//        bne     t2,zero,1b
//dbg//        li      t2,1
//dbg//        sw      t2,4(t1)        // LED ON
//dbg//        li      t2,0x100000
//dbg//1:      addi    t2,t2,-1
//dbg//        bne     t2,zero,1b
//dbg//        j       csrblinkforever
//dbg//        
//dbg//
//dbg//        // At entry:
//dbg//        // ra   Return address
//dbg//        // a0   Points to string to output
//dbg//        // At exit:
//dbg//        // a0   corrupted
//dbg//csrFN_asm_puts:
//dbg//        addi    x31,x31,-8                // Make space to store registers used
//dbg//        sw      s0,0(x31)                // Store s0
//dbg//        sw      ra,4(x31)                // Store return adrress
//dbg//        mv      s0,a0                   // char *p = s;  
//dbg//        j       2f                      // do {
//dbg//1:      jal     ra,csrFN_asm_putchar       //     bn_asm_putchar(c);
//dbg//        addi    s0,s0,1                 //     s++;
//dbg//2:      lbu     a0,0(s0)                //     c = *s;
//dbg//        bne     a0,x0,1b                // } while ( c );
//dbg//        lw      s0,0(x31)                // Restore s0
//dbg//        lw      ra,4(x31)                // Restore return address
//dbg//        addi    x31,x31,8                 // Restore x31
//dbg//        jalr    x0,0(ra)                // Return
//dbg//
//dbg//        // At entry:
//dbg//        // ra   Return address
//dbg//        // a0   character to output
//dbg//        // At exit:
//dbg//        // a0   corrupted
//dbg//        // Other used variables are stored on the stack
//dbg//        // As a convenience, a '\n' is output as '\r\n'
//dbg//csrFN_asm_putchar: 
//dbg//        addi    x31,x31,-8
//dbg//        sw      s1,0(x31)                // Store s1
//dbg//        sw      s0,4(x31)                // Store s0
//dbg//        slli    a0,a0,1                 // c <<= 1
//dbg//        andi    a0,a0,1023              // c |= 0x3ff;
//dbg//        ori     a0,a0,512               // c |= 0x200;
//dbg//        li      s1,512 + 20             // Outputs '\n' ?
//dbg//        bne     s1,a0,1f                // No
//dbg//
//dbg//        li      a0,13                   // '\r'
//dbg//        mv      s1,ra                   // save
//dbg//        jal     ra,csrFN_asm_putchar       // Recurse
//dbg//        mv      ra,s1                   // restore
//dbg//        li      a0,512 + 20             // restore
//dbg//        
//dbg//1:      
//dbg//        lw      s0,0xe8(x0)             // __freefornow_e8(x0) is bitrate
//dbg//        slli    s0,s0,4                 // t = bitrate*16;
//dbg//        lw      s1,0x8c(x0)             // n = mcycle
//dbg//        add     s0,s0,s1                // t = bitrate*16 + n;
//dbg//        bgeu    s0,s1,2f                // if ( t >= n ) goto L2;
//dbg//        addi    s0,x0,100               // t = 100;                                        
//dbg//1:      //                                 L1:;
//dbg//        lw      s1,0x8c(x0)             // n = mcycle;
//dbg//        bltu    s0,s1,1b                // if ( 100 < mcycle ) goto L1;
//dbg//2:      //                                 L2:;
//dbg//        lui     s0,0x60000              //
//dbg//        sw      a0,8(s0)                // UART->D = c;
//dbg//        srai    a0,a0,1                 // c >>= 1;
//dbg//        lw      s0,0xe8(x0)             // __freefornow_e8(x0) // 
//dbg//        add     s1,s1,s0                // n += bitrate;
//dbg//3:      //                                 L4:;
//dbg//        lw      s0,0x8c(x0)             // tt = mcycle;;
//dbg//        bltu    s0,s1,3b                // if ( mcycle < b ) goto L3;
//dbg//        bne     a0,x0,2b                // if ( c ) goto L2;
//dbg//        lw      s0,4(x31)                // Restore s0
//dbg//        lw      s1,0(x31)                // Restore s1
//dbg//        addi    x31,x31,8                 // Restore X31
//dbg//        jalr    x0,0(ra)                // Return
//dbg//
//dbg//
//dbg//// In:   a0 value to write
//dbg////       ra Return address        
//dbg//csrFN_WriteA0:
//dbg//        addi    x31,x31,-12
//dbg//        sw      ra,0(x31)
//dbg//        sw      t0,4(x31)
//dbg//        sw      s0,8(x31)
//dbg//        mv      t0,a0
//dbg//        li      s0,28
//dbg//1:      srl     a0,t0,s0
//dbg//        andi    a0,a0,0xf        
//dbg//        li      ra,10
//dbg//        blt     a0,ra,2f
//dbg//        addi    a0,a0,'a'-'0'-10
//dbg//2:      addi    a0,a0,'0'
//dbg//        jal     ra,csrFN_asm_putchar
//dbg//        addi    s0,s0,-4
//dbg//        bge     s0,x0,1b
//dbg//        lw      s0,8(x31)
//dbg//        lw      t0,4(x31)
//dbg//        lw      ra,0(x31)
//dbg//        addi    x31,x31,12
//dbg//        jalr    x0,0(ra)
//dbg//        
//dbg//
//dbg//        // Debugging routines use a minimum stack.
//dbg//_csrIO_STACK_BEGIN:        
//dbg//        .word   0,0,0,0,0,0
//dbg//_csrIO_STACK_ENTRYPT:      
//dbg//        .word   0,0
//dbg//_csrIO_STACK_END:  
//dbg//
