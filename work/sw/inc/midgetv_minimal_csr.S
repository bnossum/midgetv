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
        .org 0x108
        // We have already decoded the CSR address in register __yy
        // This register is used by many microcode instructions, but 
        // not "sw" or "lw".
        sw      rCSRadr,%lo(_ex_rCSRadr)(x0)    //
        sw      rCSRty,%lo(_ex_rCSRty)(x0)      // 
        sw      rrs1,%lo(_ex_rrs1)(x0)          //
        sw      rrd, %lo(_ex_rrd)(x0)           //
        sw      rtmp,%lo(_ex_rtmp)(x0)          //
        lw      rCSRadr,%lo(__yy)(x0)           // Get CSR address from the volatile __yy register
        lw      rCSRty,%lo(CSRretadr)(x0)
        lbu     rCSRty,1(rCSRty)                // Get bits [15:8] of the CSR instruction
        
        // CSRRW   0bx001xxxx   0xffffffd0  
        // CSRRS   0bx010xxxx   0xffffffe0
        // CSRRC   0bx011xxxx   0xfffffff0
        // CSRRWI  0bx101xxxx   0x00000010
        // CSRRSI  0bx110xxxx   0x00000020
        // CSRRCI  0bx111xxxx   0x00000030
        andi    rCSRty,rCSRty,0x70      // Isolate
        addi    rCSRty,rCSRty,-0x40     // Msb used later on
        
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
        bgtu    rtmp,rrd,UnsupportedCSR
        // Here rtmp is an index from 0 to 5 inclusive
Lmisa:
Lmtvec: 
//        lbu     rCSRadr,%lo(mCSRADRTBL)(rtmp)
//        // Compliance code had trouble with the unsatisfactory line above. Replaces with longer:
        la      rCSRadr,mCSRADRTBL
kluge1: add     rtmp,rtmp,rCSRadr
        lbu     rCSRadr,0(rtmp)
        
        //
        // Find rs1 and rd operand locations from the CSR instruction
        //
        lw      rrs1,%lo(CSRretadr)(x0) // Address of the CSR instruction

        //        lw      rrs1,0(rrs1)            // Read the instruction It may be unaligned when RVC is implemented
        lhu     rtmp,0(rrs1)
        lhu     rrs1,2(rrs1)
        slli    rrs1,rrs1,16
        or      rrs1,rrs1,rtmp
        
        srli    rrs1,rrs1,5             //
        andi    rrd,rrs1,(31<<2)        // rrd: rd as a memory adr. x1-x5 will be restored 
        li      rtmp,(5<<2)             // Constant also used later on
        bgtu    rrd,rtmp,1f             // from the stack when exiting this code.
        addi    rrd,rrd,%lo(_ex_dup_x0) // 
1:        
        srli    rrs1,rrs1,10            // Get the rs1 field - this is either
        andi    rrs1,rrs1,31            // a 5-bit constant or a register number.

        //
        // Instructions CSRRWI/CSRRSI/CSRRCI use
        // a constant, not a register.
        //
        bgez    rCSRty,2f

        // CSRRW,CSRRS/CSRRC
        slli    rrs1,rrs1,2             // From register number to register memory address
        bgtu    rrs1,rtmp,1f            // Contents if registers x1-x5 was stored at entry of this code, 
        addi    rrs1,rrs1,%lo(_ex_dup_x0)//and must be fetched from the stack
        sw      x0,%lo(_ex_dup_x0)(x0)  // A previous CSR instruction may have used _ex_dup_x0. Ensure 'x0' is read as 0
1:      lw      rrs1,0(rrs1)            // The value to write to CSR
        
2:
        lw      rtmp,0(rCSRadr)         // Get the old value of the CSR.

        // CSRRW   0bx001xxxx   0xffffffd0   0x0000010  
        // CSRRS   0bx010xxxx   0xffffffe0   0x0000020
        // CSRRC   0bx011xxxx   0xfffffff0   0x0000030
        // CSRRWI  0bx101xxxx   0x00000010   0x0000010
        // CSRRSI  0bx110xxxx   0x00000020   0x0000020
        // CSRRCI  0bx111xxxx   0x00000030   0x0000030

        andi    rCSRty,rCSRty,0x30
        addi    rCSRty,rCSRty,-0x20
        beqz    rCSRty,DoCSRS
        bltz    rCSRty,DoCSRRW
        
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
        
mCSRADRTBL:
        .byte 0xc0,0xb4,0xb8,0xbc       // 
        .byte 0xc4,0xa4,0,0             // 
        nop                             // 
        nop                             // 
        
        

        
