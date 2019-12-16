/* 
 * MUL and DIV implies that the ALU must change. Before, the top of the ALU was:
 * 
 *                                                ___
 * pre_cmb_aluF ---------------------------------|I0 |                        __
 * Q[31] ------------+---------------------------|I1 |-- wcmb_aluF ----------|  |-- raluF
 *                   | +-------------------------|I2 |                       >__|
 *                   | |                   +-----|I3_|                        
 *                   | |                   |
 *                   | |                   | alu_carryout
 *                   | |                  /y\
 *                   | |                  |||     ___
 *                   | |        isWrinst -(((----|I0 | 
 *                   | |               1 -+((----|I1 |-- alu_minstretofl ...
 *                   | |               0 --(+----|I2 |
 *                   | |                   +-----|I3_|
 *                   | |                   |
 *                   | |                   | alucy[32]          
 *                   | |                  /y\                 
 *              ___  | |                  |||     ___         
 * ADR_O[31] --|I0 | | | A[31] s_alu[2] --(((----|I0 | 
 * s_alu[0]  --|I1 |-(-+------------------+((----|I1 |-- B[31]
 * Di[31]    --|I2 | +---------------------(+----|I2 |        
 * s_alu[1]  --|I3_|                       +-----|I3_|        
 *                                         |                  
 *                                         | alucy[31]
 *                   
 * We need to extend the accumulator to 33 bits. I call the new msb: signP.
 * 
 * Observation 1:
 * cmb_signP need only be correct during MUL/MULHS instructions. alu_carryout is irrelevant during MUL/MULHS instructions.
 * signP must be conserved accross other microcode cycles, it is effectively ADR_O[32].
 * 
 * Observation 2:
 * alu_carryout need only be correct during: MULHU, SLT[[I]U], BEQ/BNE/BLT/BGE/BLTU/BGEU
 * 
 * Observation 3:
 * alu_minstretofl can be performed a later cycle than when rinst is incremented.
 * 
 * Observationm 4:
 * Use of E and R of the FF for signP will conflict with  the FF for raluF.
 * 
 * 
 *                                                  ___     wcmb_aluF = pre_cmb_aluF ? ~alu_carryout : ((~alu_carryout&(A31^QQ[31])) | (A31&QQ[31]))
 * pre_cmb_aluF -----------------------------------|I0 |                        __
 * Q[31] ------------+-----------------------------|I1 |---(wcmb_aluF)---------|  |---------- raluF ( == ~alu_carryout when MULHU)
 *                   | +---------------------------|I2 |                       >  |
 *                   | |                     +-----|I3_|   enaQ ---------------E__|
 *                   | |                     |                        
 *                   | |                     | alu_carryout
 *                   | |                    /y\     ___     
 *                   | |               sp0 -(((----|I0 |                        __
 *                   | |               sp1 -+((----|I1 |-- cmb_signP ----------|  |-- signP
 *                   | |               sp2 --(+----|I0 |                       >  |
 *                   | |                     +-----|I3_|   enaQ ---------------E__|
 *                   | |                     |             
 *                   | |                     | alucy[33] 
 *                   | |                    /y\          
 *                   | |                    |||     ___  
 *                   | |          isWrinst -(((----|I0 | 
 *                   | |                 1 -+((----|I1 |-- alu_minstretofl = isWrinst & alucy[32] 
 *                   | |                 0 --(+----|I2 |
 *                   | |                     +-----|I3_|
 *                   | |                     |
 *                   | |                     | alucy[32]          
 *                   | |                    /y\                 
 *              ___  | |                    |||     ___         
 * ADR_O[31] --|I0 | | | A[31]   s_alu[2] --(((----|I0 | 
 * s_alu[0]  --|I1 |-(-+--------------------+((----|I1 |-- B[31]
 * Di[31]    --|I2 | +-----------------------(+----|I2 |        
 * s_alu[1]  --|I3_|                         +-----|I3_|        
 *                                           |                  
 *                                           | alucy[31]
 *      
 * What I really want:
 * signP <= alucy[33]                                   when we have MULHU. This will simplify sra_msb
 *                                                      also when we do SHLQ. For DIV[U]/REM[U] shift operations.
 * cmb_signP=signP^ alucy[33] ^ (rA[0] ? DAT_O[31] : 0) when we have add ucodecycle in DIV[U]/REM[U]. Combinatoric output determine if
 *                                                      ADR_O is to be updated. This is really the subtraction ((sub)) in routine divu().
 *                                                      rA[0] is always 0 here, so we can use the same equation as for the line below.
 *                                                      To be strictly right, we should have: cmb_signP=signP^alucy[33]^1, the 33-bit 
 *                                                      subtrahend B always have msb set. But the resulting msb is only tested, not stored,
 *                                                      so we may cheat and only do cmb_signP=signP^alucy[33].
 *                                                      This may easily be the critical path of midgetv. 
 * signP <= signP ^ alucy[33] ^ (rA[0] ? DAT_O[31] : 0) when we have add ucodecycle in MULH/MULHSU, Here we add sign extended B and P
 * signP <= signP                                       when we have shift right ucodecycle in MULH/MULHSU. Here we shift P arithmetic.
 * signP <= 0                                           when sa14 (ADR_O cleared). When P is cleared, the msb of P should also be cleared.
 *                                                      This can be done somewhat better - signP can be cleared when rA is loaded: s_shlr[1].
 *                                                      I do not need to conserve alu_carryout for this case.

 * alu_carryout = alucy[33] at least when SLT[[I]U], BEQ/BNE/BLT/BGE/BLTU/BGEU. Because then the proven exiting code will still work.
 * 
 * s_shlr[1]
 * | INSTR[25] 
 * | | INSTR[6:5]       
 * | | || FUNC3[1:0]            alu_carryout must be valid      
 * | | || || s_shlr[0]  Covers                           |   sp[2:1]  sp[0]                           cmb_signP
 * 0 x 00               SLTU/SLTIU                       1   01       x                               x
 * 0 x 01 00            MUL                              x   xx       x                               x
 * 0 x 01 01 0          MULH          add ucodecycle     x   01       signP^(rA[0] ? DAT_O[31] : 0    alucy[33] ^ signP ^ (rA[0] ? DAT_O[31] : 0) 
 * 0 x 01 01 1          MULH          shift ucodecycle   x   10       signP                           signP   
 * 0 x 01 10 0          MULHSU/SLT    add ucodecycle     1   01       signP^(rA[0] ? DAT_O[31] : 0    alucy[33] ^ signP ^ (rA[0] ? DAT_O[31] : 0) 
 * 0 x 01 10 1          MULHSU/SLT    shift ucodecycle   1   10       signP                           signP
 * 0 0 01 11            SLTU                             1   01       x                               x
 * 0 1 01 11            MULHU                            x   11       x                               alucy[33]
 * 0 x 10               x                                x   01       x                               x
 * 0 x 11               BEQ/BNE/BLT/BGE/BLTU/BGEU        1   01       x                               x
 * 1                    Clear signP                      x   00       x                               0
 * 
 * sp[0] = (s_shlr[0] & signP) | (~s_shlr[0] & (signP^(rA[0]&DAT_O[31])))
 * sp[1] = ~s_shlr[1] & ~s_shlr[0];
 * sp[2] = ~s_shlr[1] & (s_shlr[0] | (INSTR[25] & FUNC3[1] & FUNC3[0])   // 5-inp
 * cmb_signP = (~sp[2] &  sp[1] & ( sp[0] ^ alucy[33]) ) |
 *             ( sp[2] & ~sp[1] & sp[0] ) |
 *             ( sp[2] &  sp[1] & alucy[33] ) |
 * 
 * Then, for shift right operand:
 * 
 * is_MULHU
 * |FUNC7[5]
 * ||FUNC7[0]
 * |||     sra_msb
 * x00     0           SRL/SRLI,  logical shift right.
 * 101     signP       MULHU,     shifts carry out into msb
 * x10     ADR_O[31]   SRA/SRAI,  arithmetic shift right, 
 * 001     signP       MULH/MULSU shifts sign of P into msb
 * 
 * Simplifies to:
 * 
 * FUNC7[5]
 * |FUNC7[0]
 * ||     sra_msb
 * 00     0           
 * 01     signP       
 * 10     ADR_O[31]   
 * 11     x
 * 
 * 
 * 
 * AGAIN:
 * ======
 *                                                ___
 * pre_cmb_aluF ---------------------------------|I0 |                        __
 * Q[31] ------------+---------------------------|I1 |-- wcmb_aluF ----------|  |-- raluF
 *                   | +-------------------------|I2 |   enaQ ---------------E  | (enaQ perhaps not needed)
 *                   | |                   +-----|I3_|                       >__|
 *                   | |                   |
 *                   | |                   | alu_carryout
 *                   | |                  /y\
 *                   | |                  |||     ___
 *                   | |           sp[0] -(((----|I0 |                        __
 *                   | |           sp[1] -+((----|I1 |-- cmb_cysignP --------|  |- rcysignP
 *                   | |           sp[2] --(+----|I2 |   enaQ ---------------E  | (enaQ perhaps not needed)
 *                   | |                   +-----|I3_|                       >__|
 *                   | |                   |
 *                   | |                   | alucy[33]
 *                   | |                  /y\
 *                   | |                  |||     ___
 *                   | |        isWrinst -(((----|I0 | 
 *                   | |               1 -+((----|I1 |-- alu_minstretofl ...
 *                   | |               0 --(+----|I2 |
 *                   | |                   +-----|I3_|                           
 *                   | |                   |                                 
 *                   | |                   | alucy[32]                           
 *                   | |                  /y\                 
 *              ___  | |                  |||     ___         
 * ADR_O[31] --|I0 | | | A[31] s_alu[2] --(((----|I0 | 
 * s_alu[0]  --|I1 |-(-+------------------+((----|I1 |-- B[31]
 * Di[31]    --|I2 | +---------------------(+----|I2 |        
 * s_alu[1]  --|I3_|                       +-----|I3_|        
 *                                         |                  
 *                                         | alucy[31]
 *                   
 *                                   rcysignP                                                   ci to adder   
 * a.  When MULHU add cycle          alucy[33]                                                  0             
 *     When MULHU SLR                don't care                                                 rcysignP      
 * b.  When MULH/MULHSU add cycles   alucy[33]^rcysignP^( (A[0] & signB) | ~A[0] )              0             
 * c.  When MULH/MULHSU SAR          rcysignP                                                   rcysignP      
 * d.  When MULH last add cycle      alucy[33]^rcysignP^( (A[0] & signB) | ~A[0] )              1             May be eliminated see note (a)
 * e.  When DIV[U]/REM[U] sub cycle: alucy[33]^rcysignP^1                                       1             for divu_restoring
 * f.  When DIV[u]/REM[U] SLL:       alucy[33]                                                  A[31]         for divu_restoring
 * 
 * (a) When doing MULH, I will first do one shift without looping to get the shift counter from 0x1f to 0x1e.
 *     operand B that resides in register x[rs1] is stored inverted in Rjj. Rjj = ~B
 *     I load the constant 1 into Ryy. Ryy = 1
 *     Then follows 31 loops of add/shifts.
 *     The last add is done in two operations as follows:
 *     rcysignP                                                   ci to adder   
 *     (A[0] & (signB^rcysignP) | (~A[0] & rcysignP))^alucy[33]   0             With Rjj as B (we add in ~B)
 *     (A[0] & (signB^rcysignP) | (~A[0] & rcysignP))^alucy[33]   0             With Ryy as B (we add in 1)
 *     For the cost of 2 to 3 cycles I get a sligtly easier logic in carry in to the adder?
 * 
 * 
 *  sp[0] = (isSAR || DIV/REM subcycle) ? rcysignP^1 : rcysignP^( (A[0] & signB) | ~A[0])
 *  sp[2:1] = 00  cmb_cysignP = alucy[33]            Covers a. and f.         
 *            01  cmb_cysignP = sp[0]^alucy[33]      Covers b. d. and e.
 *            10  cmb_cysignP = sp[0]^1              Covers c.
 *            11  not used
 *
 * Make it simpler.
 *                                                ___
 * pre_cmb_aluF ---------------------------------|I0 |                        __
 * Q[31] ------------+---------------------------|I1 |-- wcmb_aluF ----------|  |-- raluF
 *                   | +-------------------------|I2 |   enaQ ---------------E  | (enaQ perhaps not needed)
 *                   | |                   +-----|I3_|                       >__|
 *                   | |                   |
 *                   | |                   | alu_carryout
 *                   | |                  /y\
 *                   | |                  |||     ___
 *                   | |                 -(((----|I0 | 
 *                   | |               1 -+((----|I1 |-- alutap
 *                   | |               0 --(+----|I2 |
 *                   | |                   +-----|I3_|
 *                   | |                   |
 *                   | |                   | alucy[32]          
 *                   | |                  /y\                 
 *              ___  | |                  |||     ___         
 * ADR_O[31] --|I0 | | | A[31] s_alu[2] --(((----|I0 | 
 * s_alu[0]  --|I1 |-(-+------------------+((----|I1 |-- B[31]
 * Di[31]    --|I2 | +---------------------(+----|I2 |        
 * s_alu[1]  --|I3_|                       +-----|I3_|        
 *                                         |                  
 *                                         | alucy[31]
 *                   
 *   wire isWrinst =           {sa27,sa26,sa25,sa24} == 4'b1001,
 *   Code for write halfword:  {sa27,sa26,sa25,sa24} == 4'b0001, here the input to the ALU is D and Q==0, the carry chain is dead,
 *                             alutap is guaranteed to be 0.
 *   Hence the old construction
 *                         aaa = write_to_minstreth = ctrlreg_we & ADR_O[14]
 *                         bbb = alu_minstretofl = isWrinst & alucy[32] 
 *                              
 *                                                         _               
 *        ___                                ctrlreg_we --|&|    ___      
 * s24 --|I0 |            |||     ___        ADR_O[14] ---|_|--o|   |    _ 
 * s25 --|I1 |- isWrinst -(((----|I0 |                     __   | & |---| |-+
 * s26 --|I2 |         1 -+((----|I1 |-- bbb -------------|or|--|___|   >_| |
 * s27 --|I3_|         0 --(+----|I2 |                  +-|__|              | 
 *                         +-----|I3_|                  |                   |                  
 *                         |                            +-------------------+                  
 *                         | alucy[32]                           
 *       
 *   is replaced by same cost (but more delay):            _                                   
 *                                           ctrlreg_we --|&|    ___                           
 * |||     ___                 ___           ADR_O[14] ---|_|--o|   |    _                     
 * (((----|I0 |- alutap ------|I0 |                        __   | & |---| |-+                           
 * +((----|I1 |  sa24   ------|I1 |-- bbb    -------------|or|--|___|   >_| |                  
 * -(+----|I2 |  sa25   ------|I2 |                     +-|__|              |                  
 *  +-----|I3_|  sa26   ------|I3_|                     |                   |                           
 *  |                                                   +-------------------+                  
 *                      
 * If this becomes the critical path, 1 LUT for isWrinst, add one LUT for write_to_minstret, and:
 * 
 *               write_to_minstret -----------+       
 * |||     ___                      _         |   _    _
 * (((----|I0 |- alutap  ----------|&|    __  +-o|&|--| |-+
 * +((----|I1 |  isWrinst ---------|_|---|or|----|_|  >_| |
 * -(+----|I2 |                        +-|__|             |
 *  +-----|I3_|                        |                  |
 *  |                                  +------------------+
 *                                     
 * We now have a bit more liberty to construct cmb_cysignP.
 *                ___
 *  alutap ------|I0 |                        __
 *  sp[0]  ------|I1 |-- cmb_cysignP --------|  |- rcysignP
 *  sp[1]  ------|I2 |   enaQ ---------------E  | (enaQ perhaps not needed)
 *  sp[2]  ------|I3_|                       >__|
 *                
 * 
 * Or I colud go all the way, and build raluF differently.
 * 
 * 
 * EVEN AGAIN. LETS REQIRE raluF.
 * 
 * I have merged in alu_minstretofl with raluF:   assign alu_minstretofl = ~raluF & r_isWrinst;
 * 
 * 
 *                         MYSTERY                ___
 *                   ----- xxxxxxx --------------|I0 |                     __
 *                   +---- xxxxxxx --------------|I1 |-- cmb_rF ----------|  |-- rF
 *                   | +-- xxxxxxx --------------|I2 |                    |  |
 *                   | |                   +-----|I3_|                    >__|
 *                   | |                   |
 *                   | |                   | acy
 *                   | |                  /y\                 
 *              ___  | |                  |||     ___         
 * ADR_O[31] --|I0 | | | A[31] s_alu[2] --(((----|I0 | 
 * s_alu[0]  --|I1 |-(-+------------------+((----|I1 |-- B[31]
 * Di[31]    --|I2 | +---------------------(+----|I2 |        
 * s_alu[1]  --|I3_| |                     +-----|I3_|        
 *                   |                     |                  
 * Q[31] ------------+                     | alucy[31]
 *                   
 * 
 * Below:
 * acy  is carry out of bit 31 of adder
 * rF   is effectively bit 32 of adder
 * M0   is bit 0 in bidirectional shifter
 * E31 is DAT_O[31]
 * Q31  is ADR_O[31]
 * 
 * 
 * INSTR[25] 
 * | INSTR[6] 
 * | | FUNC3                                              cmb_rF                        is_brcond      
 * | | ||| s_shlr[0]                                      |                             |
 * | | ||| |  OpCode                                      |                             |        Comment
 * x 0 000 x  mul lb addi add sub sb fence                x                             x        We have no interrest in upper 32 bits of the product
 * x 0 001 0  mulh lh sll slli sh fence.i                 acy^rF^(M0&E31)               x        mulh add ucodecycle   
 * x 0 001 1  mulh lh sll slli sh fence.i                 rF                            x        mulh sar ucodecycle
 * 0 0 010 x  slti lw slt sw                              (E31&Q31)|((E31^Q31)&~acy)    x        slt(i) need a compare bit
 * 1 0 010 0  mulhsu                                      acy^rF^(M0&E31)               x        mulhsu add ucodecycle
 * 1 0 010 1  mulhsu                                      rF                            x        mulhsu sar ucodecycle
 * 0 0 011 x  sltiu sltu                                  ~acy                          x        slt(i)u need a compare bit
 * 1 0 011 0  mulhu                                       acy                           x        mulhu add ucodecycle
 * 1 0 011 1  mulhu                                       x                             x        mulhu slr ucodecycle
 * x 0 100 0  div lbu xori xor                            acy^rF^M0                     x        div add ucodecycle
 * x 0 100 1  div lbu xori xor                            acy                           x        div sll ucodecycle
 * x 0 101 0  divu lhu srl sra srli srai                  acy^rF^M0                     x        divu add ucodecycle
 * x 0 101 1  divu lhu srl sra srli srai                  acy                           x        divu sll ucodecycle   
 * x 0 110 0  rem ori or                                  acy^rF^M0                     x        rem add ucodecycle    
 * x 0 110 1  rem ori or                                  acy                           x        rem sll ucodecycle    
 * x 0 111 0  remu andi and                               acy^rF^M0                     x        remu add ucodecycle   
 * x 0 111 1  remu andi and                               acy                           x        remu sll ucodecycle   
 * x 1 000 x  beq ecall ebreak uret sret wfi mret jalr    x                             ~rzcy32
 * x 1 001 x  bne csrrw                                   x                             rzcy32
 * x 1 010    csrrs                                       x                             x
 * x 1 011    csrrc                                       x                             x         
 * x 1 100    blt                                         (E31&Q31)|((E31^Q31)&~acy)    rF
 * x 1 101    bge csrrwi                                  (E31&Q31)|((E31^Q31)&~acy)    ~rF
 * x 1 110    bltu  csrrsi                                ~acy                          rF
 * x 1 111    bgeu  csrrci                                ~acy                          ~rF
 * 
 * 
 * During mulh add, we do either rF <= rF          if M0 == 0 (passd in ALU). Then we also know acy == 0
 *                            or rF <= E31^rF^acy if M0 == 1 (ALU adds).
 * The full equation is rF <= (~M0&rF) | (M0&(E31^rF^acy)  but because acy == 0 when M0 = 0 we can write
 *                      rF <= acy^rF^(M0&E31)
 * 
 * During DIV(U)/REM(U), we do either rF <= rF^acy^0    if M0 == 0 
 *                                 or rF <= rF^acy^1    if M0 == 1
 * Hence we write rF <= rF^acy^M0
 * 
 * Initiation: All DIV(U)/REM(U),  first do shift, so rF gets to a known value
 *             No branches and slt uses rF, so the value is don't care
 *             For MULH and MULHSU  we need that rF == 0 before operation. This should be relatively easy
 *             to ensure in ucode.h
 */
/* 
 * 
  111  //      3322222        22222  11111     11           
6 432  //      1098765        43210  98765     10987        543210
0 000, I( 'I', immL11_0J,            rs1,      rd,          000011, lb      ) 
0 000, I( 'I', immL11_0J,            rs1,      rd,          010011, addi    ) 
0 000, R( 'R', 0000000,       rs2,   rs1,      rd,          110011, add     ) 
0 000, R( 'R', 0000001,       rs2,   rs1,      rd,          110011, mul     )
0 000, R( 'R', 0100000,       rs2,   rs1,      rd,          110011, sub     ) 
0 000, S( 'S', immL11_5J,     rs2,   rs1,      immL4_0J,    100011, sb      ) 
0 000, r( 'Q', 0000, pred, succ,     00000,    00000,       001111, fence   ) 
0 001, I( 'I', immL11_0J,            rs1,      rd,          000011, lh      ) 
0 001, R( 'R', 0000000,       rs2,   rs1,      rd,          110011, sll     ) 
0 001, R( 'R', 0000001,       rs2,   rs1,      rd,          110011, mulh    )
0 001, R( 'h', 0000000,       shamt, rs1,      rd,          010011, slli    ) 
0 001, S( 'S', immL11_5J,     rs2,   rs1,      immL4_0J,    100011, sh      ) 
0 001, r( 'Q', 0000, 0000, 0000,     00000,    00000,       001111, fence_i ) 

0 010, I( 'I', immL11_0J,            rs1,      rd,          010011, slti    ) 
0 010, I( 'a', immL11_0J,            rs1,      rd,          000011, lw      ) 
0 010, R( 'R', 0000000,       rs2,   rs1,      rd,          110011, slt     ) 
0 010, R( 'R', 0000001,       rs2,   rs1,      rd,          110011, mulhsu  )
0 010, S( 'S', immL11_5J,     rs2,   rs1,      immL4_0J,    100011, sw      ) 
 
0 011, I( 'I', immL11_0J,            rs1,      rd,          010011, sltiu   ) 
0 011, R( 'R', 0000000,       rs2,   rs1,      rd,          110011, sltu    ) 
0 011, R( 'R', 0000001,       rs2,   rs1,      rd,          110011, mulhu   )
0 100, I( 'I', immL11_0J,            rs1,      rd,          000011, lbu     ) 
0 100, I( 'I', immL11_0J,            rs1,      rd,          010011, xori    ) 
0 100, R( 'R', 0000000,       rs2,   rs1,      rd,          110011, xor     ) 
0 100, R( 'R', 0000001,       rs2,   rs1,      rd,          110011, div     )
0 101, I( 'I', immL11_0J,            rs1,      rd,          000011, lhu     ) 
0 101, R( 'R', 0000000,       rs2,   rs1,      rd,          110011, srl     ) 
0 101, R( 'R', 0000001,       rs2,   rs1,      rd,          110011, divu    )
0 101, R( 'R', 0100000,       rs2,   rs1,      rd,          110011, sra     ) 
0 101, R( 'h', 0000000,       shamt, rs1,      rd,          010011, srli    ) 
0 101, R( 'h', 0100000,       shamt, rs1,      rd,          010011, srai    ) 
0 110, I( 'I', immL11_0J,            rs1,      rd,          010011, ori     ) 
0 110, R( 'R', 0000000,       rs2,   rs1,      rd,          110011, or      ) 
0 110, R( 'R', 0000001,       rs2,   rs1,      rd,          110011, rem     )
0 111, I( 'I', immL11_0J,            rs1,      rd,          010011, andi    ) 
0 111, R( 'R', 0000000,       rs2,   rs1,      rd,          110011, and     ) 
0 111, R( 'R', 0000001,       rs2,   rs1,      rd,          110011, remu    )
0 xxx  U( 'U', immL31_12J,                     rd,          010111, auipc   ) 
0 xxx  U( 'U', immL31_12J,                     rd,          110111, lui     ) 
1 000, B( 'B', immL12v10_5J,  rs2,   rs1,      immL4_1v11J, 100011, beq     ) 
1 000, E( 'E', 0000000,       00000, 00000,    00000,       110011, ecall   ) 
1 000, E( 'E', 0000000,       00001, 00000,    00000,       110011, ebreak  ) 
1 000, E( 'E', 0000000,       00010, 00000,    00000,       110011, uret    ) 
1 000, E( 'E', 0001000,       00010, 00000,    00000,       110011, sret    ) 
1 000, E( 'E', 0001000,       00101, 00000,    00000,       110011, wfi     ) 
1 000, E( 'E', 0011000,       00010, 00000,    00000,       110011, mret    ) 
1 000, I( 'j', immL11_0J,            rs1,      rd,          100111, jalr    ) 
1 001, B( 'B', immL12v10_5J,  rs2,   rs1,      immL4_1v11J, 100011, bne     ) 
1 001, C( 'C', csr,                  rs1,      rd,          110011, csrrw   ) 
1 010, C( 'C', csr,                  rs1,      rd,          110011, csrrs   ) 
1 011, C( 'C', csr,                  rs1,      rd,          110011, csrrc   ) 
1 100, B( 'B', immL12v10_5J,  rs2,   rs1,      immL4_1v11J, 100011, blt     ) 
1 101, B( 'B', immL12v10_5J,  rs2,   rs1,      immL4_1v11J, 100011, bge     ) 
1 101, C( 'C', csr,                  zimm,     rd,          110011, csrrwi  ) 
1 110, B( 'B', immL12v10_5J,  rs2,   rs1,      immL4_1v11J, 100011, bltu    ) 
1 110, C( 'C', csr,                  zimm,     rd,          110011, csrrsi  ) 
1 111, B( 'B', immL12v10_5J,  rs2,   rs1,      immL4_1v11J, 100011, bgeu    ) 
1 111, C( 'C', csr,                  zimm,     rd,          110011, csrrci  ) 
1 xxx  J( 'J', immL20v10_1v11v19_12J,          rd,          101111, jal     ) 
 */
#include <stdio.h>
#include <stdint.h>


/////////////////////////////////////////////////////////////////////////////
uint16_t divu_restoring( uint8_t A, uint8_t B) {
        uint8_t P = 0;

        uint16_t tmp;       // Accumulator 9 bits in simulation 33 bits on target.
        uint16_t cy;

        // u8: Write rs1 to A
        // u9: invert rs2 (B), write to Rjj. Setup read source Rjj. Clear Q. Next u10a.
        uint8_t invB = B^255; 
        for ( int i = 0; i < 8; i++ ) {                     
                
                // u12b. Shift left. Setup read source Rjj. Next u11.
                cy = (P >>7);
                P = (P<<1) | (A>>7);
                A  = (A<<1);
                
                // u11. ADD_1. Write to Ryy, Setup Read source Ryy. hold Q. Branch to u12a or u12b CAN NOT WORK. raluF not ready before next cycle
                tmp = (cy<<8) | P;                          
                tmp += invB + 0x101;                            
                cy = (tmp >> 8) & 1;

                // u12a. Read Ryy to Q. Set lsb A. Loopbranch to u10a or u10b
                // If positive                              
                if ( cy^1 ) {                          
                        A |= 1;                             
                        P = tmp;                            
                }                                           
        }
        // u10a. Shift. Setup read source Rjj. Next u11. (Duplicate instruction)
        // u10b. Cleanup,
        //       if DIVU: copy A to Wdst
        //       if REMU: copy P to Wdst 
        //       if DIV:  if original B != 0 and signresult == 1, invert A. Write to Wdst
        //       if REM:  if original A negative, invert P. Write to Wdst
        //       
        return ( P<<8) | A;                                 
}

/////////////////////////////////////////////////////////////////////////////
uint16_t works_divu_restoring( uint8_t A, uint8_t B) {
        uint8_t P = 0;

        uint16_t cy,tmp;       // Accumulator 9 bits
        uint16_t invB = B^511; // In 9 bits
        
        for ( int i = 0; i < 8; i++ ) {
                // Shift:
                cy = (P >>7);
                P = (P<<1) | (A>>7);                                
                A <<= 1;
                
                // Subtract  ((sub))
                tmp = (cy<<8) | P;
                tmp += invB + 1;
                tmp &= 511;

                // If positive
                if ( tmp < 256 ) {
                        A |= 1;
                        P = tmp;
                }
        }
        return ( P<<8) | A;
}

/////////////////////////////////////////////////////////////////////////////
uint16_t works_nonrestoring( uint8_t A, uint8_t B) {
        uint16_t tmp;       // Accumulator 9 bits
        int extra;
        uint8_t invB = B^255;

        uint8_t P = 0;
        int    cy = 0;

        for ( int i = 0; i < 8; i++ ) {

                // Shift left, remember sign in extra.
                extra  = cy;                          // 1a:  Shift ucode instruction. Set readsource Rjj, Cond to either 2a or 2b below
                cy    = (P >>7) & 1;
                P     = (P << 1) | (A>>7);                                
                A     = (A << 1);

                // Add or subtract
                tmp = (cy<<8) | P;
                if ( extra ) {                        // 2a. Set readsource B
                        tmp = tmp + B;                // 3.  Do this, then 4
                } else {
                        tmp = tmp + invB + 0x101;     // 2b. Do this, then 4
                }
                P  = tmp;
                cy = (tmp>>8) & 1;

                // Record result
                A |= (cy^1);                          // 4.  Do this, then loop to 1a or 1b
        }                                             
        // Potentially restore remainder.             // 1b. Test cy, go to 5a or 5b
        if ( cy ) 
                P += B;                               // 5a. Do this go to 5b
                                                      // 5b. ??
        return ( P<<8) | A;
}

/////////////////////////////////////////////////////////////////////////////
uint16_t divu_nonrestoring( uint8_t A, uint8_t B) { // THE ONE WE WILL USE.
        uint16_t tmp;       // Accumulator 9 bits
        uint8_t invB = B^255;

        uint8_t P = 0;
        int    cy = 0;
        int    extra = 0;

        for ( int i = 0; i < 8; i++ ) {

                // Shift left, remember sign.       //
                extra = cy;                         // 1a:  Shift ucode instruction. Set readsource Rjj, Cond to either 2a or 2b below
                cy    = (P >>7) & 1;                // 
                P     = (P << 1) | (A>>7);          //                            
                A     = (A << 1) | (extra^1);       //
                                                    //
                                                    // 
                // Add or subtract                  // 
                tmp = (cy<<8) | P;                  //
                if ( extra ) {                      // 2a:  set readsource B.  
                        tmp = tmp + B;              // 3:   Do this, then Loop control to 1a or 1b
                                                    // 
                } else {                            //
                        tmp = tmp + invB + 0x101;   // 2b:  Do this, then Loop control to 1a or 1b
//                      tmp = tmp + invB + 1;       // 2b:  Do this, then Loop control to 1a or 1b
//                      tmp = tmp + 0xff + 1;       //
                }                                   //
                P  = tmp;                           //
                cy = (tmp>>8) & 1;                  //
        }                                           //
        // Record last result                       //
        extra = cy;                                 //1b:   Shift ucode instr. Go to 4a or 4b.
//        cy    = (P >>7) & 1;                        //
//        P     = (P << 1) | (A>>7);                  //            
        A     = (A << 1) | (extra^1);               // 4:   Get last result for A. Cond to either 5a or 5b
//        P = (cy<<7) | (P>>1);                       //

        // Potentially restore remainder.           //
        if ( extra )                                //
                P += B;                             //5a:   Add
                                                    //5b:   ...
        return ( P<<8) | A;                         //

                                                   // 1a:  Shift ucode instruction. Set readsource Rjj, Cond to either 2a or 2b below
                                                   // 1b:  Compensate shift. Cond to 4a or 4b below
                                                   // 2a:  set readsource B. Next 3
                                                   // 2b:  subtract then loop to 1a or 1b
                                                   //
                                                   // 3:   add then loop to 1a or 1b
                                                   //
                                                   // 4:   Last result for A then cond to either 5a or 5b
                                                   //
                                                   // 5a:  Restore remainder
                                                   // 5b:  ... store P to destination register

        /* I will run out of ucode space. The loop above is a minimum of 8 ucode instruction, and I need 4 of them...
         * What to do?

         I have 47 ucode locations.
         I estimate that the 4 MUL instructions use 15 locations. Hence it rests 32 for DIV/REM..
         If I assume I can tailmerge DIV/DIVU and tailmerge REM/REMU, these have 16 ucode instructions each.
         This may just be possible.

         Just now multiply uses 33 locations...

         */
}

/////////////////////////////////////////////////////////////////////////////
int main( void ) {
        int ia,ib,facit;
        int iterations = 0;

        printf( "Multiplication:         Unsigned * Unsigned: ia*ib" );
        for ( ia = 0; ia < 0x100; ia++ ) { // 
                for ( ib = 0; ib < 0x100; ib++ ) {
                        iterations++;

                        // Loading
                        uint16_t tmp;
                        uint8_t P = 0; 
                        uint8_t B = ib;
                        uint8_t A = ia;
                        int cy;

                        // Routine
                        for ( int i = 0; i < 8; i++ ) {
                                tmp = (P + ((A & 1) ? B : 0));
                                cy = (tmp>>8) & 1;
                                P = tmp;
                                A = ((P & 1)<<7) | (A>>1);
                                P = (cy<<7) | (P>>1);
                        }

                        // Testing
                        int32_t calc = ((P & 0xff)<<8) | A;
                        facit = ia * ib;
                        if ( facit != calc ) {
                                printf( "No luck. ia=%d ib=%d facit=%d calc=%d\n",
                                        ia, ib, facit,calc);
                                return 1;
                        }
                }
        }
        printf( "           Ok\n" );

        printf( "Multiplication:         Unsigned * Signed:   ia*sb " ); // The one we will use. 
        for ( ia = 0; ia < 0x100; ia++ ) { 
                for ( ib = 0; ib < 0x100; ib++ ) {
                        iterations++;

                        // Loading
                        uint16_t tmp;
                        uint8_t P = 0;                        
                        uint8_t B = ib; 
                        uint8_t A = ia;
                        int signB = (B >>7) & 1;
                        int cy;

//                        uint8_t lastinch    = 0;
//                        uint8_t modB        = B ? B-1 : 0;
//                        uint8_t modlastinch = B ? 1   : 0;
//                        
//                        // Routine
//                        for ( int i = 0; i < 8; i++ ) {
//
//                                if ( i == 7) {
//                                        B = modB;
//                                        lastinch = modlastinch;
//                                }
//                                
//                                int signP    = (P >> 7) & 1;
//                                tmp = (A & 1) ? P+B+lastinch : P+0;
//                                cy = (tmp >> 8) & 1;
//                                P  = tmp;
//                                int newsignP = (A & 1) ? signB^signP^cy : signP;
//                                A = ((P & 1)<<7) | (A>>1);
//                                P = ( (newsignP<<7) | (P >> 1));
//                        }
                        
                        // Routine. 
                        int signP;
                        int newsignP;
                        uint8_t modB        = B ? B-1 : 0;
                        uint8_t modlastinch = B ? 1   : 0;
                        for ( int i = 1; i < 8; i++ ) {

                                signP= (P >> 7) & 1;
                                tmp = (A & 1) ? P+B : P+0;
                                cy = (tmp >> 8) & 1;
                                newsignP = (A & 1) ? signB^signP^cy : signP;
                                P  = tmp;
                                A = ((P & 1)<<7) | (A>>1);
                                P = ( (newsignP<<7) | (P >> 1));
                        }
                        // This curious last mul cycle is there for merging with s*s
                        signP  = (P >> 7) & 1;
                        tmp = (A & 1) ? P+modB+modlastinch : P+0;
                        cy = (tmp >> 8) & 1;
                        P  = tmp;
                        newsignP = (A & 1) ? signB^signP^cy : signP;
                        A = ((P & 1)<<7) | (A>>1);
                        P = ( (newsignP<<7) | (P >> 1));

                        // Checking
                        int32_t calc = ((P & 0xff)<<8) | A;
                        //facit = ((int8_t)ia) * ((int8_t)ib);
                        int8_t  sb = ib;
                        facit = ia*sb;
                        facit &= 0xffff;
                        if ( facit != calc ) {
                                printf( "No luck. ia=%d ib=%d facit=%d calc=%d\n",
                                        ia, ib, facit,calc);
                                return 1;
                        }
                }
        }
        printf( "variant 1 Ok\n" );

                                 
                                
        printf( "Multiplication:         Unsigned * Signed:   ia*sb " );
        for ( ia = 0; ia < 0x100; ia++ ) { 
                for ( ib = 0; ib < 0x100; ib++ ) {
                        iterations++;

                        // Loading
                        uint16_t P = 0; // P is 9 bits
                        uint16_t B = ((ib&0x80)<<1) | ib; // Sign extend to 9 bits
                        uint8_t A = ia;

                        // Routine
                        for ( int i = 0; i < 8; i++ ) {
                                P = (P + ((A & 1) ? B : 0)) & 0x1ff;
                                A = ((P & 1)<<7) | (A>>1);
                                P = ((P&0x100) | (P >> 1)) & 0x1ff;
                        }

                        // Checking
                        int32_t calc = ((P & 0xff)<<8) | A;
                        int8_t  sb = ib;
                        facit = ia*sb;
                        facit &= 0xffff;
                        if ( facit != calc ) {
                                printf( "No luck. ia=%d ib=%d facit=%d calc=%d\n",
                                        ia, ib, facit,calc);
                                return 1;
                        }
                }
        }
        printf( "variant 2 Ok\n" );

        printf( "Multiplication:         Signed   * Signed:   sa*sb " ); 
        for ( ia = 0; ia < 0x100; ia++ ) {
                for ( ib = 0; ib < 0x100; ib++ ) {
                        iterations++;

                        // Loading
                        uint16_t tmp;
                        uint8_t P = 0;                        
                        uint8_t A = ia;
                        uint8_t B = ib; 
                        int signB;
                        int cy;
                        int newsignP,signP;
                        int lastinch = 0;

                        // ia = -1 = 0xff,
                        // ib = 1
                        // modib = fe
                        // modlastinch = 1;
                        
                        // Routine
                        for ( int i = 0; i < 8; i++ ) {
                                if ( i == 7 ) {
                                        B = (B^0xffu);
                                        lastinch = 1;
                                }
                                signP    = (P >> 7) & 1;
                                signB    = (B >> 7) & 1;
                                tmp      = (P + ((A & 1) ? B+lastinch : 0));
                                cy       = (tmp >> 8) & 1;
                                P        = tmp;
                                newsignP = (A & 1) ? (signB^signP^cy) : signP;
                                A = ((P & 1)<<7) | (A>>1);
                                P = ( (newsignP<<7) | (P >> 1));
                        }

                        // Checking
                        int32_t calc = ((P & 0xff)<<8) | A;
                        int rawfacit = ((int8_t)ia) * ((int8_t)ib);
                        facit = rawfacit & 0xffff;
                        if ( facit != calc ) {
                                printf( "No luck... ia=%d ib=%d facit=%d=%x calc=%d=%x\n",
                                        ia, ib, rawfacit, facit, calc, calc);
                                return 1;
                        }
                }
        }
        printf( "variant 1 Ok\n" );
        
        printf( "Multiplication:         Signed   * Signed:   sa*sb " );
        for ( ia = 0; ia < 0x100; ia++ ) { 
                for ( ib = 0; ib < 0x100; ib++ ) {
                        iterations++;

                        // Loading
                        uint16_t P = 0; // P is 9 bits
                        uint16_t B = ((ib&0x80)<<1) | ib; // Sign extend to 9 bits
                        uint8_t  A = ia;
                        uint8_t  invb = (ib^255);

                        // Routine
                        for ( int i = 0; i < 8; i++ ) {
                                if ( i == 7 && (A & 1) ) {
                                        if ( invb & 0x80 )
                                                P ^= 0x100;
                                        P += invb+1;
                                } else {
                                        P = (P + ((A & 1) ? B : 0)) & 0x1ff;
                                } 
                                A = ((P & 1)<<7) | (A>>1);
                                P = ((P&0x100) | (P >> 1)) & 0x1ff;
                        }
                        

                        // Checking
                        int32_t calc = ((P & 0xff)<<8) | A;
                        facit = ((int8_t)ia) * ((int8_t)ib);
                        facit &= 0xffff;
                        if ( facit != calc ) {
                                printf( "No luck. ia=%d ib=%d facit=%d calc=%d\n",
                                        ia, ib, facit,calc);
                                return 1;
                        }
                                
                }
        }
        printf( "variant 2 Ok\n" );

        for ( int j = 0; j < 2; j++ ) {
                
                if ( j == 0 )
                        printf( "Restoring division:     Unsigned/Unsigned:   ia/ib "  );
                else
                        printf( "Non-restoring division: Unsigned/Unsigned:   ia/ib "  );
                
                for ( ia = 0; ia < 0x100; ia += 1 ) { 
                        for ( ib = 0; ib < 0x100; ib++ ) {
                                iterations++;
                                uint16_t tmp;
                                
                                if ( j == 0 )
                                        tmp = divu_restoring( ia, ib );
                                else
                                        tmp = divu_nonrestoring( ia, ib );
                                
                                uint8_t P = tmp >> 8;
                                uint8_t A = tmp;
                                
                                int facit;
                                if ( ib == 0 ) {
                                        facit = 0xff;
                                } else {
                                        facit = ia/ib;
                                }
                                if ( facit != A ) {
                                        printf( "Error. facit=%d A=%d\n", facit, A );
                                        return 1;
                                }
                                
                                // ib is divisor,
                                // ia is dividend.
                                // A is quotient
                                // P is remainder
                                if ( ia != ib * A + P ) {
                                        printf( "pError, does not follow RISCV spec\n" );
                                        return 3;
                                }
                        }
                }
                printf( "          Ok\n" );
                
                if ( j == 0 ) 
                        printf( "Restoring division:     Signed/Signed:       sa/sb  "  );
                else
                        printf( "Non-restoring division: Signed/Signed:       sa/sb  "  );

                for ( ia = 0x0; ia < 0x100; ia += 1 ) { 
                        for ( ib = 0; ib < 0x100; ib++ ) {
                                iterations++;
                                
                                // Preliminaries
                                int signA = ia>>7;
                                int signB = ib>>7;
                                int signresult = signA ^ signB;
                                uint8_t A = signA ? (ia^0xff)+1 : ia;
                                uint8_t B = signB ? (ib^0xff)+1 : ib;
                                
                                // The real routine, unsigned divide.
                                
                                uint16_t tmp;
                                
                                if ( j == 0 )
                                        tmp = divu_restoring( A, B );
                                else
                                        tmp = divu_nonrestoring( A, B );
                                
                                uint8_t P = tmp >> 8;
                                A = tmp;
                                
                                // Adjustments
                                if ( signresult && ib != 0) 
                                        A = (A^255)+1;                        
                                if ( signA ) 
                                        P = (P^255)+1;
                                
                                //
                                // The rest is checking
                                //
                                int8_t sia = ia;
                                int8_t sib = ib;
                                int sA = (int8_t)A;
                                int8_t sP = P;
                                //printf( "%3d / %3d = %3d  Remainder = %3d\n", sia, sib, sA, sP );
                                
                                int facit;
                                if ( ib == 0 ) {
                                        // Division by zero. Spec say: n/0 = -1 remainder = n
                                        facit = -1;
                                } else if ( ib == 0xff && ia == 0x80 ) {
                                        // Special case, division overflow. Spec say: -128/-1 = -128 remainder = 0
                                        facit = -128;
                                } else {
                                        facit = sia/sib;
                                }
                                if ( facit != sA ) {
                                        printf( "%3d / %3d = %3d  Remainder = %3d  signresult=%d ", sia, sib, sA, sP, signresult );
                                        printf( "Facit %d/%d = %d Reaminder = %d\n", sia, sib, facit, sia - facit * sib );
                                        printf( "tError. facit=%d A=%d\n", facit, A );
                                        return 1;
                                }
                                
                                // ib is divisor,
                                // ia is dividend.
                                // A is quotient
                                // P is remainder
                                if ( ib == 0xff && ia == 0x80 ) {
                                        // Special case, division overflow. Spec say: -128/-1 = -128 remainer = 0
                                        if ( sA != -128 || sP != 0 ) {
                                                printf( "Division overflow failed\n" );
                                                return 0;
                                        }
                                } else if ( sia != sib * sA + sP ) {
                                        //printf( "ia=%3d / ib=%3d = sA = %3d  Remainder = sP = %3d  signresult=%d\n", ia, ib, sA, sP, signresult );
                                        printf( "Calc  %d/%d = %d Reminder = %d\n", sia, sib, sA, sP );
                                        printf( "Facit %d/%d = %d Reminder = %d\n", sia, sib, facit, sia - facit * sib );
                                        printf( "xError, does not follow RISCV spec\n" );
                                        return 1;
                                }
                        }
                }
                printf( "         Ok\n" );
        }

                  
        if ( iterations != 0x90000 ) 
                printf( "Not all tests done. 0x%x iterations\n", iterations );
        return 0;
}
/*
 * isMULHU 
 * | A[0]
 * | | Di[31] == DAT_O[31] == signB
 * | | | rcysign = signP       
 * | | | |    sp2 sp1 sp0     
 * 0 0 x 0    0   1   0       
 * 0 0 x 1    0   1   1       
 * 0 1 0 0    1   0   0       
 * 0 1 0 1    1   0   1       
 * 0 1 1 0    1   0   1
 * 0 1 1 1    1   0   0
 * 1 x x x    1   1   x   
 * 
 * cmb_cysignP = (~sp2 & sp1 & sp0) | (sp2 & ~sp1 & (sp0^alucy[33])) | (sp2 & sp1 & alucy[33])
 * 
 * Idea. For unsigned division, nonrestoring.
 * Prepare invB to Rjj.
 * Wwhen SHLQ, shift signP inverted into A[0], shift Q[31] into signP,  shift A[31] into Q[0]
 *       Test on A[0] to either subtract B (add invB+1 in 33 bits)
 *                    or to add B zero-extended in 33 bits
 * 
 *         alu_carryout correct
 * sp[2:1] |  cmb_cysignP
 * 00      0
 * 01/10   1  A[0]^signP^alucy[33]     P <= P+{A[0],B} in 33 bits for add B zero-extended OR | For DIV[U]/REM[U]
 *                                     P <= P+{A[0],Rjj}+1 in 33 bits to subtract B          |     
 *            signP                    P <= P+0 in 33 bits when A[0] == 0.          | For MULH/MULHSU
 *            signB^signP^alucy[33]    P <= P+signext(B) in 33 bits when A[0] == 1. |
 * 11      0  alucy[33]                For MULHU and microcode SHLQ
 * 
 * sp2 =  A[0] | isMULHU                                                                      
 * sp1 = ~A[0] | isMULHU                                                                      
 * sp0 = ~isDIVREM * ((~A[0] & rcysign) | (A[0] & (DAT_O[31]^rcysign)))
 *     |  isDIVREM * (A[0]^rcysign)
 * isMULHU = INSTR[25] & ~INSTR[6] & INSTR[5] & ~FUNC3[2] & FUNC3[1] & FUNC3[0]                           
 * isDIVREM= INSTR[25] & ~INSTR[6] & INSTR[5] & FUNC3[2]
 * isMULHU and isDIVREM are also active for certain LUI instructions.
 * 
 * The ouput rcysignP is used by sra_msb:
 * 
 * FUNC7[5]
 * |FUNC7[0]
 * ||     sra_msb
 * 00     0             SRL/SRLI, logical shift right     
 * 01     signP         MULHU/MULH/MULSU
 * 10     ADR_O[31]     SRA/SRAI
 * 11     x
 * 
 */
