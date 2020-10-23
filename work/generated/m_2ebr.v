/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   No MULDIV
 *   minstret not implemented
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 42 columns
 * Removed:  000000000001000000000001000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 42
 * 169 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 169 169 169 169 169 169 169 169 169 169 169   x 169 169 167 169 168 169 169 168 169 169 168   x 169 169 169 169 166 166 168 169 168 169 168 169 168 169 169 168 168 168  kill col 13  Tbl  39 cols 000000000001000000000001000010000000000000 has 166 unique lines.
 * 166 166 166 166 166 166 166 166 166 166 166   x 166 166 164 166 165 166 166 165 166 166 165   x 166 166 166 166     163 164 166 165 166 165 166 165 166 166 165 165 165  kill col 12  Tbl  38 cols 000000000001000000000001000011000000000000 has 163 unique lines.
 * 163 163 163 163 163 163 163 163 163 163 163   x 163 163 161 163 161 163 163 160 163 163 162   x 163 163 163 163         159 162 162 163 162 163 162 163 163 162 162 162  kill col 11  Tbl  37 cols 000000000001000000000001000011100000000000 has 159 unique lines.
 * 159 159 159 159 159 159 159 159 159 159 159   x 159 159 157 159 157 159 159 156 159 159 157   x 159 159 159 159             158 158 159 158 159 158 159 159 158 158 158  kill col 22  Tbl  36 cols 000000000001000000010001000011100000000000 has 156 unique lines.
 * 156 156 156 156 156 156 156 156 156 156 156   x 156 156 154 156 155 156 156     156 156 154   x 156 156 156 156             155 155 155 155 155 154 155 156 155 155 154  kill col 27  Tbl  35 cols 000000000001001000010001000011100000000000 has 154 unique lines.
 * 154 154 154 154 154 154 154 154 154 154 154   x 154 154     153 153 154 153     154 154 152   x 154 154 154 154             153 153 153 153 153 152 153 154 153 153 152  kill col 19  Tbl  34 cols 000000000001001000010011000011100000000000 has 152 unique lines.
 * 152 152 152 152 152 152 152 152 152 152 152   x 152 152     151 151 152 151     152 152       x 152 152 152 152             151 151 151 151 151 150 151 152 151 151 150  kill col  5  Tbl  33 cols 000000000001001000010011000011100000100000 has 150 unique lines.
 * 150 150 150 150 150 150 150 150 150 150 150   x 150 150     149 149 150 149     150 150       x 150 150 150 150             149 149 149 148 149     149 149 147 146 147  kill col  1  Tbl  32 cols 000000000001001000010011000011100000100010 has 146 unique lines.
 * 146 146 146 146 146 146 146 146 146 146 146   x 146 146     144 145 146 145     146 146       x 146 144 146 146             145 145 145 142 145     143 143 144     143  kill col  7  Tbl  31 cols 000000000001001000010011000011100010100010 has 142 unique lines.
 * 142 142 142 142 142 142 142 142 142 142 142   x 142 141     140 141 140 141     142 142       x 140 139 142 142             141 141 141     141     139 138 138     138  kill col  3  Tbl  30 cols 000000000001001000010011000011100010101010 has 138 unique lines.
 * 138 138 138 138 138 138 138 138 138 138 138   x 138 137     136 135 136 137     138 138       x 135 133 138 137             137 137 137     135     131     130     133  kill col  2  Tbl  29 cols 000000000001001000010011000011100010101110 has 130 unique lines.
 * 130 130 130 130 130 130 130 128 130 130 130   x 130 129     127 125 127 126     130 130       x 124 124 130 129             129 129 129     121     120             122  kill col  4  Tbl  28 cols 000000000001001000010011000011100010111110 has 120 unique lines.
 * 120 120 120 120 120 120 120 117 120 120 120   x 119 118     117 111 114 113     120 120       x 113 114 120 117             119 119 119     105                     108  kill col  6  Tbl  27 cols 000000000001001000010011000011100011111110 has 105 unique lines.
 * 105 105 105 105 105 105 105 103 105 104 104   x 103 103     103  94  98  96     105 105       x  97  98 105 102             104 104 104                              92  kill col  0  Tbl  26 cols 000000000001001000010011000011100011111111 has  92 unique lines.
 *  92  92  92  92  92  92  92  89  92  91  91   x  89  90      88  81  83  82      92  92       x  82  84  92  89              91  91  90                                  kill col 25  Tbl  25 cols 000000000001001010010011000011100011111111 has  81 unique lines.
 *  81  81  81  81  81  81  81  78  80  80  79   x  78  80      78      71  69      81  81       x  71  73  81  77              80  80  79                                  kill col 23  Tbl  24 cols 000000000001001010110011000011100011111111 has  69 unique lines.
 *  68  69  69  69  69  69  69  66  68  68  67   x  65  68      64      61          69  69       x  61  62  69  65              68  68  67                                  kill col 24  Tbl  23 cols 000000000001001011110011000011100011111111 has  61 unique lines.
 *  60  61  59  61  60  61  61  58  60  60  59   x  57  59      57                  61  61       x  55  55  60  58              60  60  59                                  kill col 17  Tbl  22 cols 000000000001001011110011100011100011111111 has  55 unique lines.
 *  54  53  53  55  54  55  55  52  54  54  53   x  50  53      50                  55  55       x      51  54  52              54  54  53                                  kill col 29  Tbl  21 cols 000000000001101011110011100011100011111111 has  50 unique lines.
 *  49  48  43  50  49  50  50  48  49  49  48   x      48      45                  50  49       x      45  49  46              49  49  48                                  kill col 39  Tbl  20 cols 001000000001101011110011100011100011111111 has  43 unique lines.
 *  42  40      43  42  43  43  41  42  42  41   x      39      38                  43  41       x      39  42  40              42  42  41                                  kill col 26  Tbl  19 cols 001000000001101111110011100011100011111111 has  38 unique lines.
 *  37  35      38  37  38  38  36  37  37  36   x      33                          37  36       x      34  37  35              37  37  36                                  kill col 28  Tbl  18 cols 001000000001111111110011100011100011111111 has  33 unique lines.
 *  32  29      33  32  33  33  31  32  32  30   x                                  32  31       x      29  32  31              32  32  31                                  kill col 40  Tbl  17 cols 011000000001111111110011100011100011111111 has  29 unique lines.
 *  27          29  28  28  29  27  27  28  27   x                                  28  27       x      25  28  27              28  28  27                                  kill col 16  Tbl  16 cols 011000000001111111110011110011100011111111 has  25 unique lines.
 *  23          24  24  23  25  23  23  24  23   x                                  23  22       x          24  24              24  24  23                                  kill col 20  Tbl  15 cols 011000000001111111110111110011100011111111 has  22 unique lines.
 *  20          21  21  20  22  20  20  21  21   x                                  21           x          21  21              21  21  20                                  kill col 41  Tbl  14 cols 111000000001111111110111110011100011111111 has  20 unique lines.
 *              19  19  18  20  18  18  19  19   x                                  19           x          19  19              19  19  18                                  kill col 36  Tbl  13 cols 111001000001111111110111110011100011111111 has  18 unique lines.
 *              17  16      18  16  16  17  17   x                                  17           x          17  17              17  17  16                                  kill col 37  Tbl  12 cols 111011000001111111110111110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 33 34 
 *
 * Round 1: 000100111110000000001000001100011100000000  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  111011000000111111110110110011100011111111 28 columns
 * Success. Use 2 EBRs, 12 LUTs.
 */

module v0_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    * inx         next     indirect index 0
    * || ucode    ucode    | direct representation
    * 00 LB_0     LB_1     0 0110000001101011110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 0010000001011111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 0110100001101111110010111110| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 00100000000101x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 0 0000001000010111010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 00100000000101x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     0 0010000000110111101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 0010000000101111101100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     0 0000010001110011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 0010000000101111100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     0 0000010001110011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    3 0000011000010111001110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   0 0010000001110111100100000100| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 00100000011101x10xxx00010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 0010000001111111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 0010000001110111100000011010|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  0 0010000001111111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  4 0010000000010111110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  5 0000010001100111100100010110|        Branch on condition
    * 16 condb_5  Fetch    6 0100010101101100111011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  3 0100010101101111110001110100|        Branch taken.
    * 18 BEQ      condb_2  0 0000011001110111011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   0 0000011001010111010001000001| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 0 0000001000010111001111100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 2 0010000001011110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 0 0000001000010111011111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 4 0010000001010101110011010100|        Q = 4
    * 1f IJ_2     IJ_3     0 0000011001010111011010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     2 0100011001101011110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 0 0000001000010111000011100110|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 0 00100000000101x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   7 0010000001111010x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 00100000000101x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     0 0000010001110111000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 0010000000000111110000011101|        Q = rs2
    * 28 _L0x28   SH_1     2 0000010001110011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 0010000001110111100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     2 0000010001110011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  4 001000000xxxx111010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 00100000011101x0xxxx00111110| SLL    Shift left
    * 2d _L0x2d   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 2e unx2e             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 8 0000001000010111011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 0010000001111111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    0 0000011000010111010010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  0 0000011110010110x10010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    9 0100010101101110100111011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   7 0000001001011111100100110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   a 0000001001011111110100000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  5 000001101xxxx111000111010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  0 0000011001110111011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   b 0000001001010111100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  0 0000011000110111011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   c 0000001001010111100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   7 0010000001111010x00100110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   7 0010000001111010x00100111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     3 0110000001101111110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   4 0010000001100111110000001011|        Q=1
    * 42 _L0x42   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  0 0010000001111111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    4 0010000001010111110001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    0 0000011011010110x00101000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    0 0000011111010111000110001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     3 1110000001110111110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  4 0010000000010111110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     3 1110000001110111110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  0 0001000111010110100110110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 00100000011101x10xxx00110001| SLT    Set less than (signed)
    * 4d unx4d             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 4 0010000001010111110011100110|        Prep +4
    * 50 LW_1     StdIncPc d 0000001001011111000111100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   0 0000011111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 0010000001011111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   0 0000011111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     c 0010000001010111100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 0 0000011111010111011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 0010000001000111101101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 0010000001000111100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     7 0000011001011111100101011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  0 0000011000110111011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     a 0000011001011111110111111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 0010000001011111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   0 0000011111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 5 0000010000110111001011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 _L0x62   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  0 0010000001111111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    5 00100000000101x10xxx11101111|        Prepare read PC
    * 66 SW_1     SW_2     0 0000000111110110100111110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    0 0000011110010110x11010010011|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 69 unx69             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     0 1110000101100111100101111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 00100000011101x10xxx00110001| SLTU   Set less than (unsigned)
    * 6d unx6d             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   4 001000000xxxx111110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    c 0010000001010111100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 0 0000011111010111011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 0010000000110111101000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  0 0000011111100111000101110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   e 0010000001011111011011110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  0 00100000000101x0xxxx01110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  0 0010000000010111100001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  4 0000011011010110x10001111101|        origPC to mepc. Prep read 0
    * 78 _L0x78   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     0 0000000101100110100111110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  0 0000011000110111011001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    0 0001111101001110x00100110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    0 000001101xxxx111000110010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  0 0000011111010110x00101111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0110000001101011110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  0 0000011011010110x00101111101|        Store PC to mepc
    * 82 _L0x82   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   0 0010000001111111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 0010000001011111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   4 0000001000010100x10010011110|        Return address to TRG
    * 87 JALRE1   JALRE2   0 0000011011100110x00101111111|  err   Store pc to mepc
    * 88 _L0x88   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 89 unx89             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 4 0000001000010111010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 00100000011111x10xxx00101001| XOR    xor
    * 8d unx8d             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    4 0010000001010111110010101001|        Q = 1
    * 90 NMI_2    JAL_3    0 0001111110100111011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   4 0001111100010100x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    0 0000011011001110x00100110100|        PC to mepc
    * 93 SW_E2    SW_E3    0 0000011011011111000110010101|        Store address that faulted
    * 94 SW_E4    JAL_3    0 0001111101001110x10100110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    4 0010000001011101110010010100|        Q = 3
    * 96 SH_1     SH_2     7 0000011001011111100110111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    0 0000011110010110x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  0 0000011001110111011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    0 0001111101001100x10000110100|        mcause = 11
    * 9b SH_4     SH_5     0 1110000011100111100110011111|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 9d unx9d             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    0 0000010001100110x00100110100|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     0 0000000011100110100111110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    2 0100011001101011110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  4 0010000001010101110010110110|        Q = 4
    * a2 _L0xa2   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   7 0010000001111010x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   4 0010000000110111110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 0010000001011110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 001000000xxxx111110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    4 0001111101001110x10000110100|        Store 2 to mcause
    * aa _L0xaa   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  0 0000011011010111000110011010|        pc to mepc
    * ac _L0xac   SRx_1    0 00100000011101x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad unxad             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    0 00100000011101x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   4 001000000xxxx111110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   0 0001111100010100x10010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  4 0010000001010101110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 0100010001101100110011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 i0reserv          7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| Not in use, reserved to allow LASTINCH
    * b5 SH_3     SH_4     0 0010000000000111011010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  4 0010000001010101110010011010|        Q = 8
    * b7 IJ_3     IJ_4     0 0010000001100101110010111101|        Construct Q = 3
    * b8 BGE      condb_2  0 0000011001110111011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   0 0010000000111111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     a 0000011001011111110110110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  0 0000011000110111011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    9 0110000001101110101111011110|        Mask and use as PC
    * be IJ_1     IJ_2     9 0010000001011111100100011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    9 0010000001011111100111000001|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    0 0000011001010111011011101001|        Read word is to be masked with ~3u
    * c2 _L0xc2   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    0 0000010001111111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 0010000000000111101001101111|        ~302
    * c6 IJT_4    ILL_2    0 0000011011010111101101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   0 000001101xxxx111000111001011|        Store pc to mepc.
    * c8 _L0xc8   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   0 0010000000110101110010100101|        0xff+3 = 0x102
    * ca _L0xca   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc 0 0001111110100111011011100110|        mtval = 0.
    * cc OR_0     OR_1     0 00100000011111x10xxx00100110| OR     or
    * cd unxcd             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * cf MRET_7   MRET_8   5 00100000001101x10xxx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  4 0010000000010111110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   0 0000010000110111011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     c 0010000001010111100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 0 0000011111010111011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   4 0001111100010110x10010010010|        Store 5 to mcause
    * d5 unxd5             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| d5: Not in use
    * d6 eILL0c   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  0 0000011111010111011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  0 0000011001110111011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   0 00100000010101x10xxx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 0000011100000110x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  0 0000011000110111011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  0 0000011111010111011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   f 0000010100011111011011110100|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   e 0000010101011111011011110100|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    0 0010000000000111100100011101|        Q = RS1
    * e2 _L0xe2   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   0 0010000001111111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  4 0010000001010101110010110000|        Q = 4
    * e6 StdIncPc Fetch    6 0100010001101100110011011110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 0 0000011111010111011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    0 0010000001100101110011000110|        Construct Q = 3
    * ea _L0xea   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * eb LH_3     LH_4     0 0010000000111111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 00100000011111x10xxx00010001| AND    And 
    * ed unxed             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    6 0100010101101100110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    c 0010000001010111100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 0 0000011111010111011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 00100000000101x10xxx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 001000000xxxx1x01xxx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            0 0000010111111111110000000000|  Fr00  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 0 0000011111010111011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    4 0010000000000101110011111010| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 0 0000011110010111011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  0 0000011001110111011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    4 0010000001010111110001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 0010000000000111011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  0 0000011000110111011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 00100000000101x10xxx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    0 00100000000101x0xxxx01000110| Illegal
    * ff QINT_0   QINT_1   0 00100000000101x10xxx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'h76e6501076e6790473863c5af88b3c5afb097a07480474e650e6fcbef9d2bc01;
   localparam u0_1 = 256'h76b75cd477e6eea66e3273e674417613fc74cede79167c15f81440fe781af88b;
   localparam u0_2 = 256'h76e6000076e6403e74303c9678213c967c1d70274804a63550e640fe70e6bc52;
   localparam u0_3 = 256'ha13aa135790376496e32793d40fe761371d7fd03f936e9de64817486f82b76e6;
   localparam u0_4 = 256'h7ce640fe0000503169b17c667c4b7c66718f61477c65fa2b40fe40fe7c0bfc50;
   localparam u0_5 = 256'h6edaf970fdfb76496e32f95d40fe40fe788b7b57761e79eb6edaf9546edaf1e6;
   localparam u0_6 = 256'h7ccf000000005031797a40fe000040fe669369f250effa2b40fe40fe72f740fe;
   localparam u0_7 = 256'h617d7190e13476496e3269f240fe40fe647d78774073f6f471767a1a761e79ba;
   localparam u0_8 = 256'h7ca940fe0000d02974e640fe000040fe617f449ef9f0fa2140fe40fe617dbc85;
   localparam u0_9 = 256'h69f26134000040fe799fc43440fe76136693f9bbdc94e534f195e13444927634;
   localparam u0_A = 256'h7cc5403f0000403f719a40fee43440fe7c61eed07cafa63a40fe40fe5cb6bc5e;
   localparam u0_B = 256'hf9c1f91febde7649fdb5fa1a40fe76135cbd5c9a769b00000000ccde5cb24492;
   localparam u0_C = 256'h504f40fe0000d02676e640fe5ca540fe71cb7b477a6ff2e140fe40fe76e940fe;
   localparam u0_D = 256'hf6f4f6f476e576496492509140fe761376a140fe00006492761e790676c97c37;
   localparam u0_E = 256'hccde40fe0000d011fa5640fe5cc640fe761eccde5cb0fa1a40fe40fe791d40fe;
   localparam u0_F = 256'h50c74046507e7649766b7c4540fe761376ab5cfa76dbfc0048dd50e6761e7972;
   localparam u1_0 = 256'h0021020700210207306100470202004702020203020100210201268612050606;
   localparam u1_1 = 256'h0065420500212205320100210065006734566456504642010207020002070207;
   localparam u1_2 = 256'h0021700000210207420020470207204702000047020172070201020000212466;
   localparam u1_3 = 256'h72077207c02500633201b025020000675068a025702594560079006102078021;
   localparam u1_4 = 256'h4205020070000207011d3e0742013e07007d006d420502070200020042063606;
   localparam u1_5 = 256'h007d1205a0650063320170650200020002040204007dc205007d1205007dd025;
   localparam u1_6 = 256'h42007000700002070e160200700002000079001f520102070200020050430200;
   localparam u1_7 = 256'h007d006801f400633201001602000200406d02010201e205007e0203007dc205;
   localparam u1_8 = 256'h42050200700002074021020070000200006e40211205020702000200006d0606;
   localparam u1_9 = 256'h000e0046700002000e0e01f40200006700797065420501f4006d006c41f101fa;
   localparam u1_A = 256'h4200020770000207006d020041f4020002003205420372070200020042052466;
   localparam u1_B = 256'h9205920596060063a065020302000067020642050200700070006446420501f1;
   localparam u1_C = 256'h520302007000020701fa0200020302000068006d020000470200020000650200;
   localparam u1_D = 256'he055f051007d00634070020502000067007d0200700041f1007dc20500434201;
   localparam u1_E = 256'h64560200700002070203020002060200007d6446420502070200020002000200;
   localparam u1_F = 256'h0201020102010063020042050200006700794200007d005f02000201007dc205;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[11] = indir[8];
   assign d[12] = indir[9];
   assign d[13] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[19] = indir[13];
   assign d[20] = indir[14];
   assign d[22] = indir[15];
   assign d[23] = indir[16];
   assign d[24] = indir[17];
   assign d[25] = indir[18];
   assign d[26] = indir[19];
   assign d[27] = indir[20];
   assign d[28] = indir[21];
   assign d[29] = indir[22];
   assign d[36] = indir[23];
   assign d[37] = indir[24];
   assign d[39] = indir[25];
   assign d[40] = indir[26];
   assign d[41] = indir[27];
   // replaces = 000100111110000000001000001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h1802)) cmb_d08(.O(d[8]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0150)) cmb_d09(.O(d[9]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0050)) cmb_d10(.O(d[10]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d15(.O(d[15]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'he37f)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h000c)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d32(.O(d[32]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6242)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4002)) cmb_d35(.O(d[35]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6000)) cmb_d38(.O(d[38]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;            bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));    bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));    SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));    assign d[30] = d[18];
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   No MULDIV
 *   minstret for instructions in SRAM
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 42 columns
 * Removed:  000000000001000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 42
 * 171 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 171 171 171 171 171 171 171 171 171 171 171   x 171 171 169 171 170 171 171 170 171 171 170 171 171 171 171 171 168 168 170 171 170 171 170 171 170 171 171 170 170 170  kill col 13  Tbl  40 cols 000000000001000000000000000010000000000000 has 168 unique lines.
 * 168 168 168 168 168 168 168 168 168 168 168   x 168 168 166 168 167 168 168 167 168 168 167 168 168 168 168 168     165 166 168 167 168 167 168 167 168 168 167 167 167  kill col 12  Tbl  39 cols 000000000001000000000000000011000000000000 has 165 unique lines.
 * 165 165 165 165 165 165 165 165 165 165 165   x 165 165 163 165 163 165 165 162 165 165 164 165 165 165 165 165         161 164 164 165 164 165 164 165 165 164 164 164  kill col 11  Tbl  38 cols 000000000001000000000000000011100000000000 has 161 unique lines.
 * 161 161 161 161 161 161 161 161 161 161 161   x 161 161 159 161 159 161 161 158 161 161 159 161 161 161 161 161             160 160 161 160 161 160 161 161 160 160 160  kill col 22  Tbl  37 cols 000000000001000000010000000011100000000000 has 158 unique lines.
 * 158 158 158 158 158 158 158 158 158 158 158   x 158 158 156 158 157 158 158     158 158 156 158 158 158 158 158             157 157 157 157 157 156 157 158 157 157 156  kill col 27  Tbl  36 cols 000000000001001000010000000011100000000000 has 156 unique lines.
 * 156 156 156 156 156 156 156 156 156 156 156   x 156 156     155 155 156 155     156 156 154 156 156 156 156 156             155 155 155 155 155 154 155 156 155 155 154  kill col 19  Tbl  35 cols 000000000001001000010010000011100000000000 has 154 unique lines.
 * 154 154 154 154 154 154 154 154 154 154 154   x 154 154     153 153 154 153     154 154     154 154 154 154 154             153 153 153 153 153 152 153 154 153 153 152  kill col  5  Tbl  34 cols 000000000001001000010010000011100000100000 has 152 unique lines.
 * 152 152 152 152 152 152 152 152 152 152 152   x 152 152     151 151 152 151     152 152     152 152 152 152 152             151 151 151 150 151     151 151 149 148 149  kill col  1  Tbl  33 cols 000000000001001000010010000011100000100010 has 148 unique lines.
 * 148 148 148 148 148 148 148 148 148 148 148   x 148 148     146 147 148 147     148 148     148 148 146 148 148             147 147 147 144 147     145 145 146     145  kill col  7  Tbl  32 cols 000000000001001000010010000011100010100010 has 144 unique lines.
 * 144 144 144 144 144 144 144 144 144 144 144   x 144 143     142 143 142 143     144 144     144 142 141 144 144             143 143 143     143     141 140 140     140  kill col  3  Tbl  31 cols 000000000001001000010010000011100010101010 has 140 unique lines.
 * 140 140 140 140 140 140 140 140 140 140 140   x 140 139     138 137 138 139     140 140     140 137 135 140 139             139 139 139     137     133     132     135  kill col  2  Tbl  30 cols 000000000001001000010010000011100010101110 has 132 unique lines.
 * 132 132 132 132 132 132 132 130 132 132 132   x 132 131     129 127 129 128     132 132     132 126 126 132 131             131 131 131     123     122             124  kill col  4  Tbl  29 cols 000000000001001000010010000011100010111110 has 122 unique lines.
 * 122 122 122 122 122 122 122 119 122 122 122   x 121 120     119 113 116 115     122 122     122 115 116 122 119             121 121 121     107                     110  kill col  6  Tbl  28 cols 000000000001001000010010000011100011111110 has 107 unique lines.
 * 107 107 107 107 107 107 107 105 107 106 106   x 105 105     105  96 100  98     107 107     107  99 100 107 104             106 106 106                              94  kill col  0  Tbl  27 cols 000000000001001000010010000011100011111111 has  94 unique lines.
 *  94  94  94  94  94  94  94  91  94  93  93   x  91  92      90  83  85  84      94  94      94  84  86  94  91              93  93  92                                  kill col 25  Tbl  26 cols 000000000001001010010010000011100011111111 has  83 unique lines.
 *  83  83  83  83  83  83  83  80  82  82  81   x  80  82      80      73  71      83  83      83  73  75  83  79              82  82  81                                  kill col 23  Tbl  25 cols 000000000001001010110010000011100011111111 has  71 unique lines.
 *  70  71  71  71  71  71  71  68  70  70  69   x  67  70      66      63          71  71      71  63  64  71  67              70  70  69                                  kill col 24  Tbl  24 cols 000000000001001011110010000011100011111111 has  63 unique lines.
 *  62  63  61  63  62  63  63  60  62  62  61   x  59  62      59                  63  63      63  57  56  62  60              62  62  61                                  kill col 16  Tbl  23 cols 000000000001001011110010010011100011111111 has  56 unique lines.
 *  55  56  54  56  55  56  56  53  55  55  54   x  51  55      52                  54  55      56  52      55  53              55  55  54                                  kill col 29  Tbl  22 cols 000000000001101011110010010011100011111111 has  51 unique lines.
 *  50  51  44  51  50  51  51  49  50  50  49   x      49      47                  50  50      51  47      50  48              50  50  49                                  kill col 39  Tbl  21 cols 001000000001101011110010010011100011111111 has  44 unique lines.
 *  43  43      44  43  44  44  42  43  43  42   x      40      39                  43  43      44  41      43  42              43  43  42                                  kill col 26  Tbl  20 cols 001000000001101111110010010011100011111111 has  39 unique lines.
 *  38  38      39  38  39  39  37  38  38  37   x      34                          38  38      38  35      38  37              38  38  37                                  kill col 28  Tbl  19 cols 001000000001111111110010010011100011111111 has  34 unique lines.
 *  33  31      33  33  33  34  32  33  33  31   x                                  33  33      33  30      33  33              33  33  32                                  kill col 17  Tbl  18 cols 001000000001111111110010110011100011111111 has  30 unique lines.
 *  29  26      29  29  29  30  28  29  29  27   x                                  28  27      29          29  29              29  29  28                                  kill col 40  Tbl  17 cols 011000000001111111110010110011100011111111 has  26 unique lines.
 *  24          25  25  24  26  24  24  25  24   x                                  24  23      25          25  25              25  25  24                                  kill col 20  Tbl  16 cols 011000000001111111110110110011100011111111 has  23 unique lines.
 *  21          22  22  21  23  21  21  22  22   x                                  22          22          22  22              22  22  21                                  kill col 41  Tbl  15 cols 111000000001111111110110110011100011111111 has  21 unique lines.
 *              20  20  19  21  19  19  20  20   x                                  20          20          20  20              20  20  19                                  kill col 36  Tbl  14 cols 111001000001111111110110110011100011111111 has  19 unique lines.
 *              18  17      19  17  17  18  18   x                                  18          18          18  18              18  18  17                                  kill col 37  Tbl  13 cols 111011000001111111110110110011100011111111 has  17 unique lines.
 *              16          17  15  15  16  16   x                                  16          16          16  16              16  16  15                                  kill col 34  Tbl  12 cols 111011010001111111110110110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 8 33 
 *
 * Round 1: 000100101110000000001001001100011100000000  4 columns for indexes to table representing 12 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 168 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 168 168 168   x 168 168   x 168   x   x   x   x 168 168 165 168 167 168 168 167   x 168 166   x 168 168   x   x 165 165 166   x   x   x 167 168 167 168 168 167 167 167  kill col 27  Tbl  28 cols 000100101111001000001001001100011100000000 has 165 unique lines.
 * 165 165 165   x 165 165   x 165   x   x   x   x 165 165     164 164 165 164 164   x 165 163   x 165 165   x   x 162 162 163   x   x   x 164 165 164 165 165 164 164 164  kill col 13  Tbl  27 cols 000100101111001000001001001110011100000000 has 162 unique lines.
 * 162 162 162   x 162 162   x 162   x   x   x   x 162 162     161 161 162 161 160   x 162 160   x 162 162   x   x     159 158   x   x   x 161 161 161 162 162 161 161 161  kill col 11  Tbl  26 cols 000100101111001000001001001110111100000000 has 158 unique lines.
 * 158 158 158   x 158 158   x 158   x   x   x   x 158 158     157 157 158 157 156   x 158 155   x 158 158   x   x     152       x   x   x 157 157 157 158 158 157 157 157  kill col 12  Tbl  25 cols 000100101111001000001001001111111100000000 has 152 unique lines.
 * 152 152 152   x 152 152   x 152   x   x   x   x 152 152     151 150 152 151 148   x 152 149   x 152 152   x   x               x   x   x 151 151 151 152 152 151 151 151  kill col 22  Tbl  24 cols 000100101111001000011001001111111100000000 has 148 unique lines.
 * 148 148 148   x 148 148   x 148   x   x   x   x 148 148     147 146 148 147       x 148 145   x 148 148   x   x               x   x   x 147 146 146 147 148 147 147 146  kill col 19  Tbl  23 cols 000100101111001000011011001111111100000000 has 145 unique lines.
 * 145 145 145   x 145 145   x 145   x   x   x   x 145 145     144 143 145 144       x 145       x 145 145   x   x               x   x   x 143 142 143 144 145 144 144 143  kill col  6  Tbl  22 cols 000100101111001000011011001111111101000000 has 142 unique lines.
 * 142 142 142   x 142 142   x 141   x   x   x   x 142 142     141 140 141 141       x 142       x 141 142   x   x               x   x   x 140     139 140 141 140 141 139  kill col  5  Tbl  21 cols 000100101111001000011011001111111101100000 has 139 unique lines.
 * 139 139 139   x 139 139   x 137   x   x   x   x 137 139     138 137 138 136       x 139       x 137 138   x   x               x   x   x 135         136 136 135 136 135  kill col  7  Tbl  20 cols 000100101111001000011011001111111111100000 has 135 unique lines.
 * 135 135 135   x 135 135   x 131   x   x   x   x 133 134     133 132 129 132       x 135       x 131 133   x   x               x   x   x             131 129 128 130 131  kill col  2  Tbl  19 cols 000100101111001000011011001111111111100100 has 128 unique lines.
 * 128 128 128   x 128 128   x 124   x   x   x   x 126 126     126 121 118 122       x 127       x 124 123   x   x               x   x   x             122 119     122 121  kill col 24  Tbl  18 cols 000100101111001001011011001111111111100100 has 118 unique lines.
 * 118 118 118   x 118 118   x 113   x   x   x   x 116 115     116 108     110       x 117       x 113 111   x   x               x   x   x             107 108     110 111  kill col  4  Tbl  17 cols 000100101111001001011011001111111111110100 has 107 unique lines.
 * 107 107 107   x 107 107   x 103   x   x   x   x 105 103     105  93      98       x 106       x 101  95   x   x               x   x   x                  93      94  94  kill col 25  Tbl  16 cols 000100101111001011011011001111111111110100 has  93 unique lines.
 *  93  93  93   x  93  93   x  89   x   x   x   x  91  89      91          82       x  92       x  83  82   x   x               x   x   x                  75      78  78  kill col  3  Tbl  15 cols 000100101111001011011011001111111111111100 has  75 unique lines.
 *  75  75  75   x  75  75   x  71   x   x   x   x  72  72      70          64       x  74       x  65  65   x   x               x   x   x                          61  64  kill col  1  Tbl  14 cols 000100101111001011011011001111111111111110 has  61 unique lines.
 *  60  59  61   x  61  60   x  57   x   x   x   x  58  57      56          50       x  59       x  50  53   x   x               x   x   x                              48  kill col  0  Tbl  13 cols 000100101111001011011011001111111111111111 has  48 unique lines.
 *  47  45  47   x  47  47   x  45   x   x   x   x  45  44      43          39       x  46       x  38  40   x   x               x   x   x                                  kill col 17  Tbl  12 cols 000100101111001011011011101111111111111111 has  38 unique lines.
 *  37  36  37   x  37  37   x  35   x   x   x   x  33  34      31          30       x  36       x      32   x   x               x   x   x                                  kill col 23  Tbl  11 cols 000100101111001011111011101111111111111111 has  30 unique lines.
 *  29  28  28   x  29  29   x  27   x   x   x   x  25  25      23                   x  27       x      24   x   x               x   x   x                                  kill col 26  Tbl  10 cols 000100101111001111111011101111111111111111 has  23 unique lines.
 *  22  21  21   x  22  22   x  20   x   x   x   x  19  20                           x  20       x      19   x   x               x   x   x                                  kill col 29  Tbl   9 cols 000100101111101111111011101111111111111111 has  19 unique lines.
 *  18  17  15   x  18  18   x  17   x   x   x   x      17                           x  15       x      15   x   x               x   x   x                                  kill col 39  Tbl   8 cols 001100101111101111111011101111111111111111 has  15 unique lines.
Possible good candidates for removal, columns : 16 20 
 *
 * Round 2: 110011010000010000000100010000000000000000  4 columns for indexes to table representing  8 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  001000000000101111110010100011100011111111 21 columns
 * Can even chose 3 more columns to be represented directly.
 * Success. Use 2 EBRs, 17 LUTs.
 */

module v2_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 100011011110000000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1000101111001xx111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 100011011110000010111110| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 0 10000010x1xxxxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 4 0 000000101110000011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   1 0 10000010x0xxxxx000000100| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     1 0 1000011011010xx000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 0 1000010111011xx000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     5 0 010011101110000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 0 1000010111000xx010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     5 0 010011101110000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    4 3 0100001011011xx010000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 0 1000111011001xx000000100| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 4 0 000000101111000011100110| LUI    q = imm20
    * 0e SUB_0    SUB_1    3 0 10001110x1xxxxx000010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 4 0 000000101111000011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     1 0 1000111111000xx010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 0 1000111011000xx000011010|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  1 0 1000111111000xx000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  1 4 100000101110011000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 5 0100110011001xx000010110|        Branch on condition
    * 16 condb_5  Fetch    6 6 011011010011011011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  6 3 011011011110000001110100|        Branch taken.
    * 18 BEQ      condb_2  4 0 010011101111000000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 0 010010101110000001000001| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 4 0 0000001011011xx011100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    1 3 100000101011000000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 100010111011000010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 4 0 000000101111100011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 4 100010100110011011010100|        Q = 4
    * 1f IJ_2     IJ_3     4 0 010010101111000010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     7 2 010011011110000001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 0 0000001011000xx011100110|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 3 0 10000010x1xxxxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   8 7 100011111011000000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   1 0 10000010x0xxxxx000000100| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     3 0 0100111011000xx000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 0 100000001110000000011101|        Q = rs2
    * 28 _L0x28   SH_1     5 2 010011101110000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 0 1000111011000xx000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     5 2 010011101110000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 4 1000xxxx1110011000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 0 10001110x0xxxxx000111110| SLL    Shift left
    * 2d _L0x2d   StdIncPc 4 0 000000101111000011100110| LUI    q = imm20
    * 2e unx2e             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 4 0 000000101111000011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 8 000000101111001011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 0 1000111111000xx000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    4 0 010000101110000010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  4 0 011100101010000010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    6 9 0110110110001xx011011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   9 7 0000101111001xx000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   a 7 000010111110100000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  4 5 0101xxxx11001xx011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  4 0 010011101111000000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   9 a 0000101011001xx100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    1 3 100000101011000000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  4 0 010001101111000001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   a a 0000101011001xx100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   8 7 1000111110001xx000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   8 7 1000111110001xx000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     6 3 100011011110000001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 4 100011001110011000001011|        Q=1
    * 42 _L0x42   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  1 0 1000111111010xx000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 4 100010101110011001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    4 0 0101101010001xx001000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    4 0 0111101011001xx010001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     b 3 100011101110000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 4 100000101110011001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     b 3 100011101110000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  c 0 0011101010001xx010110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 0 10001110x1xxxxx000110001| SLT    Set less than (signed)
    * 4d unx4d             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     3 0 1000xxxxx0xxxxx011111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 4 100010101110011011100110|        Prep +4
    * 50 LW_1     StdIncPc 4 b 0000101111001xx011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   9 0 011110101011000011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1000101111001xx101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   9 0 011110101011000011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     d a 1000101011001xx111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 4 0 011110101111000000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 0 1000100011011xx001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 0 1000100011000xx010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     9 7 0100101111001xx001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    1 3 100000101011000000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  4 0 010001101111000001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     a 7 010010111110100011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1000101111001xx101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   9 0 011110101011000011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 3 5 0100011011010xx011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 _L0x62   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  1 0 1000111111010xx000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 5 10000010x1xxxxx011101111|        Prepare read PC
    * 66 SW_1     SW_2     1 0 0011111010001xx011110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    4 0 011100101011000010010011|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 69 unx69             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     b 0 1010110011001xx001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 0 10001110x1xxxxx000110001| SLTU   Set less than (unsigned)
    * 6d unx6d             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   1 4 1000xxxx1110011011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    d a 1000101011001xx110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 4 0 011110101111000000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 0 1000011011010xx000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  4 0 0111110011001xx001110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   3 c 100010111111000011110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  3 0 10000010x0xxxxx001110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 0 1000001011000xx001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  4 4 010110101010011001111101|        origPC to mepc. Prep read 0
    * 78 _L0x78   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     1 0 0010110010001xx011110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    1 3 100000101011000000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  4 0 010001101111000001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    e 0 0110100110001xx000110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    4 0 0101xxxx11001xx010010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  4 0 0111101010001xx001111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0 100011011110000010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  4 0 0101101010001xx001111101|        Store PC to mepc
    * 82 _L0x82   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   1 0 1000111111010xx000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1000101111001xx111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   4 4 000000100010011010011110|        Return address to TRG
    * 87 JALRE1   JALRE2   4 0 0101110010001xx001111111|  err   Store pc to mepc
    * 88 _L0x88   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 89 unx89             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 4 4 000000101110011011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 0 10001111x1xxxxx000101001| XOR    xor
    * 8d unx8d             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     3 0 1000xxxxx0xxxxx011111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    1 4 100010101110011010101001|        Q = 1
    * 90 NMI_2    JAL_3    e 0 011101001111000000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   e 4 011000100010011010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    4 0 0101100110001xx000110100|        PC to mepc
    * 93 SW_E2    SW_E3    4 0 0101101111001xx010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    e 0 011010011010100000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 4 100010110110011010010100|        Q = 3
    * 96 SH_1     SH_2     9 7 0100101111001xx010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    4 0 011100101011000010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  4 0 010011101111000000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    e 0 011010010010000000110100|        mcause = 11
    * 9b SH_4     SH_5     b 0 1001110011001xx010011111|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * 9d unx9d             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    3 0 0100110010001xx000110100|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     1 0 0001110010001xx011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    7 2 010011011110000001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  1 4 100010100110011010110110|        Q = 4
    * a2 _L0xa2   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   8 7 100011111011000000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 4 100001101110011010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 3 100010111011000011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 0 1000xxxx1110000001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    e 4 011010011010011000110100|        Store 2 to mcause
    * aa _L0xaa   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  4 0 0101101011001xx010011010|        pc to mepc
    * ac _L0xac   SRx_1    3 0 10001110x0xxxxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad unxad             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    3 0 10001110x0xxxxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 4 1000xxxx1110011011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   e 0 011000100010000010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  1 4 100010100110011010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 6 010011010010011011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3           1 4 010111111110011000000000|  Fr10  Update minstret, Q=immediate. Use dinx
    * b5 SH_3     SH_4     3 0 100000001111000010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  1 4 100010100110011010011010|        Q = 8
    * b7 IJ_3     IJ_4     1 0 100011000110000010111101|        Construct Q = 3
    * b8 BGE      condb_2  4 0 010011101111000000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   1 0 1000011111010xx000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     a 7 010010111110100010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  4 0 010001101111000001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    6 9 1000110110011xx011011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 9 1000101111001xx000011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 9 1000101111001xx011000001|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    4 0 010010101111000011101001|        Read word is to be masked with ~3u
    * c2 _L0xc2   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    3 0 0100111111010xx011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 0 1000000011010xx001101111|        ~302
    * c6 IJT_4    ILL_2    9 0 0101101011011xx001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   4 0 0101xxxx11001xx011001011|        Store pc to mepc.
    * c8 _L0xc8   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   1 0 100001100110000010100101|        0xff+3 = 0x102
    * ca _L0xca   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc e 0 011101001111000011100110|        mtval = 0.
    * cc OR_0     OR_1     3 0 10001111x1xxxxx000100110| OR     or
    * cd unxcd             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     3 0 1000xxxxx0xxxxx011111110| Illegal instruction seen
    * cf MRET_7   MRET_8   3 5 10000110x1xxxxx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 4 100000101110011000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   3 0 010001101111000011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     d a 1000101011001xx100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 4 0 011110101111000000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   e 4 011000101010011010010010|        Store 5 to mcause
    * d5 eFetch2  eFetch3  3 d 011100011110000010110100|  Fr10  Update ttime
    * d6 eILL0c   ILLe     3 0 1000xxxxx0xxxxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  4 0 011110101111000010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  4 0 010011101111000000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   3 0 10001010x1xxxxx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 4 011000001010011010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  4 0 010001101111000001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  4 0 011110101111000011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   3 e 011000111111000011110100|  Fr10  Read and latch instruction
    * df eFetch   eFetch2  3 c 011010111111000011010101|  Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    1 0 1000000011001xx000011101|        Q = RS1
    * e2 _L0xe2   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   1 0 1000111111010xx000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 4 100010100110011010110000|        Q = 4
    * e6 StdIncPc Fetch    6 6 010011010010011011011110|  Fr10  IncPC, OpFetch
    * e7 aFault   aFault_1 4 0 011110101111000000011110|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    1 0 100011000110000011000110|        Construct Q = 3
    * ea _L0xea   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * eb LH_3     LH_4     1 0 1000011111010xx001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 0 10001111x1xxxxx000010001| AND    And 
    * ed unxed             8 7 xxxxxxxxxxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     3 0 1000xxxxx0xxxxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    6 6 011011010010011011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    d a 1000101011001xx101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 4 0 011110101111000000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 0 10000010x1xxxxx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 0 1000xxxxx0xxxxx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            1 d 011111111110000000000000|  Fr10  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 4 0 011110101111000011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 4 100000000110011011111010| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 4 0 011100101111000010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  4 0 010011101111000000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     3 0 1000xxxxx0xxxxx011111110|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    1 4 100010101110011001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     3 0 100000001111000001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  4 0 010001101111000001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 0 10000010x1xxxxx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 0 10000010x0xxxxx001000110| Illegal
    * ff QINT_0   QINT_1   3 0 10000010x1xxxxx011000111| INT    Get current PC
    */
   localparam u0_0 = 256'hf0e64010f0e6c804d886e05ac08be05ad809d0070004e0e640e6e0bec9d2e001;
   localparam u0_1 = 256'hf0b766d4f8e6b0a6b032d8e6e041f013e07436dec816e615c01400fec01ac08b;
   localparam u0_2 = 256'hf0e60000f0e6003ee630e096c021e096e01dc0270004b03540e600fec0e6e052;
   localparam u0_3 = 256'h883a8835c903f049b032c93d00fef013c8d7e803c83688dea081e086c02bf2e6;
   localparam u0_4 = 256'he6e600fe0000403188b1e066e64be066c88f8847e665d02b00fe00fee60be050;
   localparam u0_5 = 256'hb0dac970e8fbf049b032c85d00fe00fec08bd857f01ec9ebb0dac954b0dac8e6;
   localparam u0_6 = 256'he6cf000000004031c87a00fe000000feb09388f240efd02b00fe00fed0f700fe;
   localparam u0_7 = 256'h887dc8908834f049b03288f200fe00fea67dc0770073f0f4c876d01af01ec9ba;
   localparam u0_8 = 256'he6a900fe00004029e6e600fe000000fe887f269ec9f0d02100fe00fe887de085;
   localparam u0_9 = 256'h88f28834000000fec89f203400fef013b093c8bb6694a834c89588342692f034;
   localparam u0_A = 256'he6c5003f0000003fc89a00fea63400fee061b0d0e6afb03a00fe00fe66b6e05e;
   localparam u0_B = 256'hc8c1c81f98def049e8b5d01a00fef01360bd669af09be600000026de66b22092;
   localparam u0_C = 256'h404f00fe00004026f0e600fe60a500fec8cbd847d06fd0e100fe00fef0e900fe;
   localparam u0_D = 256'hf0d5f0f4f0e5f049a692409100fef013f0a100fee0b4a692f01ec906f0c9e637;
   localparam u0_E = 256'h26de00fe00004011d05600fe60c600fef01e26de66b0d01a00fe00fec81d00fe;
   localparam u0_F = 256'h40c70046407ef049f06be64500fef013f0ab66faf0dbe00000dd40e6f01ec972;
   localparam u1_0 = 256'h4002308e4002108e4342504e1085504e10851086108240023082228d118b008d;
   localparam u1_1 = 256'h404a148a4002128b13824002404a404e636d666d154c1482108f3080108e108f;
   localparam u1_2 = 256'h400287004002308e3480524e108e524e1080304e1082878f308230804002724d;
   localparam u1_3 = 256'h878f878faa0a404613829a0a3080404e4550a70b970b696d40724042108f4802;
   localparam u1_4 = 256'h148a30808700308ec03ab38e1482b38e407a405a148a108f30803080148c638d;
   localparam u1_5 = 256'h907a118ba74b40461382974b3080308010881088407ada8a907a118b907a4b0b;
   localparam u1_6 = 256'h148087008700308eb0ac3080870030804072103e3582108f3080308035463080;
   localparam u1_7 = 256'h407a4050e06940461382102c30803080445a108230823c8b407c1086407ada8a;
   localparam u1_8 = 256'h148a30808700308f4402308087003080405c4402118b108f30803080405a008d;
   localparam u1_9 = 256'h101c304c87003080b09ce0693080404e4072974b148be069405b4059e462e074;
   localparam u1_A = 256'h1480308e8700308e405a3080e46930801080138b1486878f30803080148a724d;
   localparam u1_B = 256'h198b198b698d4046a74b10873080404e108c148a3080145f8700664d148ae062;
   localparam u1_C = 256'h358630808700308fe0743080108630804050905a1080304f30803080404a3080;
   localparam u1_D = 256'h3c6b3e63407a40464460308a3080404e407a30803d71e462407ada8a30461482;
   localparam u1_E = 256'h666d30808700308f10873080108c3080407a664d148a108f3080308010803080;
   localparam u1_F = 256'h30823082308240463080148a3080404e40721480407a1d7f10803082407ada8a;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[8] = indir[8];
   assign d[9] = indir[9];
   assign d[10] = indir[10];
   assign d[11] = indir[11];
   assign d[12] = indir[12];
   assign d[13] = indir[13];
   assign d[17] = indir[14];
   assign d[19] = indir[15];
   assign d[22] = indir[16];
   assign d[23] = indir[17];
   assign d[24] = indir[18];
   assign d[25] = indir[19];
   assign d[26] = indir[20];
   assign d[27] = indir[21];
   assign d[29] = indir[22];
   assign d[39] = indir[23];
   // replaces = 000100101110000000001001001100000000000000
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h7b7f)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h000c)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1a42)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1800)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 110011010000010000000100010000000000000000
   SB_LUT4 #(.LUT_INIT(16'h3ee7)) cmb_d16(.O(d[16]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h7e5e)) cmb_d20(.O(d[20]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4690)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2400)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h08c5)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0800)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;            bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));    bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));    SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr1x110100));
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   No MULDIV
 *   minstret for instructions in SRAM and EBR
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 42 columns
 * Removed:  000000000001000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 42
 * 169 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 169 169 169 169 169 169 169 169 169 169 169   x 169 169 167 169 168 169 169 168 169 169 168 169 169 169 169 169 166 166 168 169 168 169 168 169 168 169 169 168 168 168  kill col 13  Tbl  40 cols 000000000001000000000000000010000000000000 has 166 unique lines.
 * 166 166 166 166 166 166 166 166 166 166 166   x 166 166 164 166 165 166 166 165 166 166 165 166 166 166 166 166     163 164 166 165 166 165 166 165 166 166 165 165 165  kill col 12  Tbl  39 cols 000000000001000000000000000011000000000000 has 163 unique lines.
 * 163 163 163 163 163 163 163 163 163 163 163   x 163 163 161 163 161 163 163 160 163 163 162 163 163 163 163 163         159 162 162 163 162 163 162 163 163 162 162 162  kill col 11  Tbl  38 cols 000000000001000000000000000011100000000000 has 159 unique lines.
 * 159 159 159 159 159 159 159 159 159 159 159   x 159 159 157 159 157 159 159 156 159 159 157 159 159 159 159 159             158 158 159 158 159 158 159 159 158 158 158  kill col 22  Tbl  37 cols 000000000001000000010000000011100000000000 has 156 unique lines.
 * 156 156 156 156 156 156 156 156 156 156 156   x 156 156 154 156 155 156 156     156 156 154 156 156 156 156 156             155 155 155 155 155 154 155 156 155 155 154  kill col 27  Tbl  36 cols 000000000001001000010000000011100000000000 has 154 unique lines.
 * 154 154 154 154 154 154 154 154 154 154 154   x 154 154     153 153 154 153     154 154 152 154 154 154 154 154             153 153 153 153 153 152 153 154 153 153 152  kill col 19  Tbl  35 cols 000000000001001000010010000011100000000000 has 152 unique lines.
 * 152 152 152 152 152 152 152 152 152 152 152   x 152 152     151 151 152 151     152 152     152 152 152 152 152             151 151 151 151 151 150 151 152 151 151 150  kill col  5  Tbl  34 cols 000000000001001000010010000011100000100000 has 150 unique lines.
 * 150 150 150 150 150 150 150 150 150 150 150   x 150 150     149 149 150 149     150 150     150 150 150 150 150             149 149 149 148 149     149 149 147 146 147  kill col  1  Tbl  33 cols 000000000001001000010010000011100000100010 has 146 unique lines.
 * 146 146 146 146 146 146 146 146 146 146 146   x 146 146     144 145 146 145     146 146     146 146 144 146 146             145 145 145 142 145     143 143 144     143  kill col  7  Tbl  32 cols 000000000001001000010010000011100010100010 has 142 unique lines.
 * 142 142 142 142 142 142 142 142 142 142 142   x 142 141     140 141 140 141     142 142     142 140 139 142 142             141 141 141     141     139 138 138     138  kill col  3  Tbl  31 cols 000000000001001000010010000011100010101010 has 138 unique lines.
 * 138 138 138 138 138 138 138 138 138 138 138   x 138 137     136 135 136 137     138 138     138 135 133 138 137             137 137 137     135     131     130     133  kill col  2  Tbl  30 cols 000000000001001000010010000011100010101110 has 130 unique lines.
 * 130 130 130 130 130 130 130 128 130 130 130   x 130 129     127 125 127 126     130 130     130 124 124 130 129             129 129 129     121     120             122  kill col  4  Tbl  29 cols 000000000001001000010010000011100010111110 has 120 unique lines.
 * 120 120 120 120 120 120 120 117 120 120 120   x 119 118     117 111 114 113     120 120     120 113 114 120 117             119 119 119     105                     108  kill col  6  Tbl  28 cols 000000000001001000010010000011100011111110 has 105 unique lines.
 * 105 105 105 105 105 105 105 103 105 104 104   x 103 103     103  94  98  96     105 105     105  97  98 105 102             104 104 104                              92  kill col  0  Tbl  27 cols 000000000001001000010010000011100011111111 has  92 unique lines.
 *  92  92  92  92  92  92  92  89  92  91  91   x  89  90      88  81  83  82      92  92      92  82  84  92  89              91  91  90                                  kill col 25  Tbl  26 cols 000000000001001010010010000011100011111111 has  81 unique lines.
 *  81  81  81  81  81  81  81  78  80  80  79   x  78  80      78      71  69      81  81      81  71  73  81  77              80  80  79                                  kill col 23  Tbl  25 cols 000000000001001010110010000011100011111111 has  69 unique lines.
 *  68  69  69  69  69  69  69  66  68  68  67   x  65  68      64      61          69  69      69  61  62  69  65              68  68  67                                  kill col 24  Tbl  24 cols 000000000001001011110010000011100011111111 has  61 unique lines.
 *  60  61  59  61  60  61  61  58  60  60  59   x  57  60      57                  61  61      61  55  55  61  58              60  60  59                                  kill col 17  Tbl  23 cols 000000000001001011110010100011100011111111 has  55 unique lines.
 *  54  53  53  55  54  55  55  52  54  54  53   x  51  54      50                  55  55      55      51  55  52              54  54  53                                  kill col 26  Tbl  22 cols 000000000001001111110010100011100011111111 has  50 unique lines.
 *  49  48  48  50  49  50  50  47  49  49  48   x  46  48                          49  50      49      46  50  47              49  49  48                                  kill col 29  Tbl  21 cols 000000000001101111110010100011100011111111 has  46 unique lines.
 *  45  44  38  46  45  46  46  44  45  45  44   x      43                          45  45      45      41  46  42              45  45  44                                  kill col 39  Tbl  20 cols 001000000001101111110010100011100011111111 has  38 unique lines.
 *  37  35      38  37  38  38  36  37  37  36   x      33                          37  36      37      34  38  35              37  37  36                                  kill col 28  Tbl  19 cols 001000000001111111110010100011100011111111 has  33 unique lines.
 *  32  29      33  32  33  33  31  32  32  30   x                                  32  31      32      29  33  31              32  32  31                                  kill col 40  Tbl  18 cols 011000000001111111110010100011100011111111 has  29 unique lines.
 *  27          29  28  28  29  27  27  28  27   x                                  28  27      28      25  29  27              28  28  27                                  kill col 16  Tbl  17 cols 011000000001111111110010110011100011111111 has  25 unique lines.
 *  23          24  24  23  25  23  23  24  23   x                                  23  22      24          25  24              24  24  23                                  kill col 20  Tbl  16 cols 011000000001111111110110110011100011111111 has  22 unique lines.
 *  20          21  21  20  22  20  20  21  21   x                                  21          21          22  21              21  21  20                                  kill col 41  Tbl  15 cols 111000000001111111110110110011100011111111 has  20 unique lines.
 *              19  19  18  20  18  18  19  19   x                                  19          19          20  19              19  19  18                                  kill col 36  Tbl  14 cols 111001000001111111110110110011100011111111 has  18 unique lines.
 *              17  16      18  16  16  17  17   x                                  17          17          18  17              17  17  16                                  kill col 37  Tbl  13 cols 111011000001111111110110110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 33 34 
 *
 * Round 1: 000100111110000000001001001100011100000000  4 columns for indexes to table representing 13 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  111011000000111111110110110011100011111111 28 columns
 * Success. Use 2 EBRs, 13 LUTs.
 */

module v3_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    * inx         next     indirect index 0
    * || ucode    ucode    | direct representation
    * 00 LB_0     LB_1     0 0110000001101011110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 0010000001011111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 0110100001101111110010111110| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 00100000000101x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 0 0000001000010111010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 00100000000101x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     0 0010000000110111101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 0010000000101111101100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     0 0000010001110011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 0010000000101111100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     0 0000010001110011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    3 0000011000010111001110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   0 0010000001110111100100000100| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 00100000011101x10xxx00010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 0010000001111111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 0010000001110111100000011010|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  0 0010000001111111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  4 0010000000010111110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  5 0000010001100111100100010110|        Branch on condition
    * 16 condb_5  Fetch    6 0100010101101100111011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  3 0100010101101111110001110100|        Branch taken.
    * 18 BEQ      condb_2  0 0000011001110111011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   0 0000011001010111010001000001| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 0 0000001000010111001111100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 2 0010000001011110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 0 0000001000010111011111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 4 0010000001010101110011010100|        Q = 4
    * 1f IJ_2     IJ_3     0 0000011001010111011010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     2 0100011001101011110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 0 0000001000010111000011100110|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 0 00100000000101x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   7 0010000001111010x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 00100000000101x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     0 0000010001110111000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 0010000000000111110000011101|        Q = rs2
    * 28 _L0x28   SH_1     2 0000010001110011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 0010000001110111100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     2 0000010001110011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  4 001000000xxxx111010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 00100000011101x0xxxx00111110| SLL    Shift left
    * 2d _L0x2d   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 2e unx2e             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 8 0000001000010111011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 0010000001111111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    0 0000011000010111010010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  0 0000011110010110x10010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    9 0100010101101110100111011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   7 0000001001011111100100110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   a 0000001001011111110100000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  5 000001101xxxx111000111010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  0 0000011001110111011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   b 0000001001010111100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  0 0000011000110111011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   c 0000001001010111100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   7 0010000001111010x00100110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   7 0010000001111010x00100111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     3 0110000001101111110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   4 0010000001100111110000001011|        Q=1
    * 42 _L0x42   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  0 0010000001111111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    4 0010000001010111110001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    0 0000011011010110x00101000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    0 0000011111010111000110001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     3 1110000001110111110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  4 0010000000010111110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     3 1110000001110111110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  0 0001000111010110100110110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 00100000011101x10xxx00110001| SLT    Set less than (signed)
    * 4d unx4d             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 4 0010000001010111110011100110|        Prep +4
    * 50 LW_1     StdIncPc d 0000001001011111000111100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   0 0000011111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 0010000001011111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   0 0000011111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     c 0010000001010111100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 0 0000011111010111011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 0010000001000111101101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 0010000001000111100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     7 0000011001011111100101011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  0 0000011000110111011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     a 0000011001011111110111111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 0010000001011111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   0 0000011111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 5 0000010000110111001011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 _L0x62   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  0 0010000001111111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    5 00100000000101x10xxx11101111|        Prepare read PC
    * 66 SW_1     SW_2     0 0000000111110110100111110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    0 0000011110010110x11010010011|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 69 unx69             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     0 1110000101100111100101111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 00100000011101x10xxx00110001| SLTU   Set less than (unsigned)
    * 6d unx6d             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   4 001000000xxxx111110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    c 0010000001010111100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 0 0000011111010111011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 0010000000110111101000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  0 0000011111100111000101110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   e 0010000001011111011011110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  0 00100000000101x0xxxx01110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  0 0010000000010111100001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  4 0000011011010110x10001111101|        origPC to mepc. Prep read 0
    * 78 _L0x78   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     0 0000000101100110100111110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  0 0000011000110111011001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    0 0001111101001110x00100110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    0 000001101xxxx111000110010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  0 0000011111010110x00101111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0110000001101011110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  0 0000011011010110x00101111101|        Store PC to mepc
    * 82 _L0x82   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   0 0010000001111111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 0010000001011111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   4 0000001000010100x10010011110|        Return address to TRG
    * 87 JALRE1   JALRE2   0 0000011011100110x00101111111|  err   Store pc to mepc
    * 88 _L0x88   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 89 unx89             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 4 0000001000010111010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 00100000011111x10xxx00101001| XOR    xor
    * 8d unx8d             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    4 0010000001010111110010101001|        Q = 1
    * 90 NMI_2    JAL_3    0 0001111110100111011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   4 0001111100010100x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    0 0000011011001110x00100110100|        PC to mepc
    * 93 SW_E2    SW_E3    0 0000011011011111000110010101|        Store address that faulted
    * 94 SW_E4    JAL_3    0 0001111101001110x10100110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    4 0010000001011101110010010100|        Q = 3
    * 96 SH_1     SH_2     7 0000011001011111100110111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    0 0000011110010110x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  0 0000011001110111011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    0 0001111101001100x10000110100|        mcause = 11
    * 9b SH_4     SH_5     0 1110000011100111100110011111|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 9d unx9d             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    0 0000010001100110x00100110100|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     0 0000000011100110100111110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    2 0100011001101011110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  4 0010000001010101110010110110|        Q = 4
    * a2 _L0xa2   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   7 0010000001111010x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   4 0010000000110111110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 0010000001011110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 001000000xxxx111110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    4 0001111101001110x10000110100|        Store 2 to mcause
    * aa _L0xaa   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  0 0000011011010111000110011010|        pc to mepc
    * ac _L0xac   SRx_1    0 00100000011101x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad unxad             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    0 00100000011101x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   4 001000000xxxx111110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   0 0001111100010100x10010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  4 0010000001010101110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 0100010001101100110011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3           4 0000010011111111110000000000|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     0 0010000000000111011010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  4 0010000001010101110010011010|        Q = 8
    * b7 IJ_3     IJ_4     0 0010000001100101110010111101|        Construct Q = 3
    * b8 BGE      condb_2  0 0000011001110111011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   0 0010000000111111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     a 0000011001011111110110110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  0 0000011000110111011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    9 0110000001101110101111011110|        Mask and use as PC
    * be IJ_1     IJ_2     9 0010000001011111100100011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    9 0010000001011111100111000001|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    0 0000011001010111011011101001|        Read word is to be masked with ~3u
    * c2 _L0xc2   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    0 0000010001111111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 0010000000000111101001101111|        ~302
    * c6 IJT_4    ILL_2    0 0000011011010111101101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   0 000001101xxxx111000111001011|        Store pc to mepc.
    * c8 _L0xc8   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   0 0010000000110101110010100101|        0xff+3 = 0x102
    * ca _L0xca   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc 0 0001111110100111011011100110|        mtval = 0.
    * cc OR_0     OR_1     0 00100000011111x10xxx00100110| OR     or
    * cd unxcd             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * cf MRET_7   MRET_8   5 00100000001101x10xxx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  4 0010000000010111110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   0 0000010000110111011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     c 0010000001010111100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 0 0000011111010111011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   4 0001111100010110x10010010010|        Store 5 to mcause
    * d5 unxd5             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| d5: Not in use
    * d6 eILL0c   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  0 0000011111010111011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  0 0000011001110111011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   0 00100000010101x10xxx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 0000011100000110x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  0 0000011000110111011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  0 0000011111010111011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   e 0000010101011111011011110100|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   e 0000010101011111011011110100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    0 0010000000000111100100011101|        Q = RS1
    * e2 _L0xe2   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   0 0010000001111111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  4 0010000001010101110010110000|        Q = 4
    * e6 StdIncPc Fetch    6 0100010001101100110011011110|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 0 0000011111010111011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    0 0010000001100101110011000110|        Construct Q = 3
    * ea _L0xea   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * eb LH_3     LH_4     0 0010000000111111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 00100000011111x10xxx00010001| AND    And 
    * ed unxed             7 xxxxxxxxxxxxxxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    6 0100010101101100110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    c 0010000001010111100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 0 0000011111010111011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 00100000000101x10xxx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 001000000xxxx1x01xxx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  f 0000010110001111010010110100|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 0 0000011111010111011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    4 0010000000000101110011111010| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 0 0000011110010111011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  0 0000011001110111011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     0 001000000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    4 0010000001010111110001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 0010000000000111011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  0 0000011000110111011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 00100000000101x10xxx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    0 00100000000101x0xxxx01000110| Illegal
    * ff QINT_0   QINT_1   0 00100000000101x10xxx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'h76e6501076e6790473863c5af88b3c5afb097a07480474e650e6fcbef9d2bc01;
   localparam u0_1 = 256'h76b75cd477e6eea66e3273e674417613fc74cede79167c15f81440fe781af88b;
   localparam u0_2 = 256'h76e6000076e6403e74303c9678213c967c1d70274804a63550e640fe70e6bc52;
   localparam u0_3 = 256'ha13aa135790376496e32793d40fe761371d7fd03f936e9de64817486f82b76e6;
   localparam u0_4 = 256'h7ce640fe0000503169b17c667c4b7c66718f61477c65fa2b40fe40fe7c0bfc50;
   localparam u0_5 = 256'h6edaf970fdfb76496e32f95d40fe40fe788b7b57761e79eb6edaf9546edaf1e6;
   localparam u0_6 = 256'h7ccf000000005031797a40fe000040fe669369f250effa2b40fe40fe72f740fe;
   localparam u0_7 = 256'h617d7190e13476496e3269f240fe40fe647d78774073f6f471767a1a761e79ba;
   localparam u0_8 = 256'h7ca940fe0000d02974e640fe000040fe617f449ef9f0fa2140fe40fe617dbc85;
   localparam u0_9 = 256'h69f26134000040fe799fc43440fe76136693f9bbdc94e534f195e13444927634;
   localparam u0_A = 256'h7cc5403f0000403f719a40fee43440fe7c61eed07cafa63a40fe40fe5cb6bc5e;
   localparam u0_B = 256'hf9c1f91febde7649fdb5fa1a40fe76135cbd5c9a769bfc000000ccde5cb24492;
   localparam u0_C = 256'h504f40fe0000d02676e640fe5ca540fe71cb7b477a6ff2e140fe40fe76e940fe;
   localparam u0_D = 256'hf6f4f6f476e576496492509140fe761376a140fe00006492761e790676c97c37;
   localparam u0_E = 256'hccde40fe0000d011fa5640fe5cc640fe761eccde5cb0fa1a40fe40fe791d40fe;
   localparam u0_F = 256'h50c74046507e7649766b7c4540fe761376ab5cfa76dbf4b448dd50e6761e7972;
   localparam u1_0 = 256'h0021020700210207306100470202004702020203020100210201268612050606;
   localparam u1_1 = 256'h0065420500212205320100210065006734566456504642010207020002070207;
   localparam u1_2 = 256'h0021700000210207420020470207204702000047020172070201020000212466;
   localparam u1_3 = 256'h72077207c02500633201b025020000675068a025702594560079006102078021;
   localparam u1_4 = 256'h4205020070000207011d3e0742013e07007d006d420502070200020042063606;
   localparam u1_5 = 256'h007d1205a0650063320170650200020002040204007dc205007d1205007dd025;
   localparam u1_6 = 256'h42007000700002070e160200700002000079001f520102070200020050430200;
   localparam u1_7 = 256'h007d006801f400633201001602000200406d02010201e205007e0203007dc205;
   localparam u1_8 = 256'h42050200700002074021020070000200006e40211205020702000200006d0606;
   localparam u1_9 = 256'h000e0046700002000e0e01f40200006700797065420501f4006d006c41f101fa;
   localparam u1_A = 256'h4200020770000207006d020041f4020002003205420372070200020042052466;
   localparam u1_B = 256'h9205920596060063a065020302000067020642050200404f70006446420501f1;
   localparam u1_C = 256'h520302007000020701fa0200020302000068006d020000470200020000650200;
   localparam u1_D = 256'he055e055007d00634070020502000067007d0200700041f1007dc20500434201;
   localparam u1_E = 256'h64560200700002070203020002060200007d6446420502070200020002000200;
   localparam u1_F = 256'h0201020102010063020042050200006700794200007df05802000201007dc205;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[11] = indir[8];
   assign d[12] = indir[9];
   assign d[13] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[19] = indir[13];
   assign d[20] = indir[14];
   assign d[22] = indir[15];
   assign d[23] = indir[16];
   assign d[24] = indir[17];
   assign d[25] = indir[18];
   assign d[26] = indir[19];
   assign d[27] = indir[20];
   assign d[28] = indir[21];
   assign d[29] = indir[22];
   assign d[36] = indir[23];
   assign d[37] = indir[24];
   assign d[39] = indir[25];
   assign d[40] = indir[26];
   assign d[41] = indir[27];
   // replaces = 000100111110000000001001001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h1802)) cmb_d08(.O(d[8]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0150)) cmb_d09(.O(d[9]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0050)) cmb_d10(.O(d[10]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d15(.O(d[15]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8000)) cmb_d18(.O(d[18]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'he37f)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h000c)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d32(.O(d[32]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6242)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4002)) cmb_d35(.O(d[35]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6000)) cmb_d38(.O(d[38]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instrxxxx0100,instr1011xxxx,instr10110100;          bn_l4v #(.I(16'h0010)) leq0100(     .o(instrxxxx0100),     .i({minx[3:0]}));  bn_l4v #(.I(16'h0800)) leq1011(     .o(instr1011xxxx),     .i({minx[7:4]}));  bn_l4v #(.I(16'h8888)) leq1x110100( .o(instr10110100), .i({2'b0,instr1011xxxx,instrxxxx0100}));   SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr10110100));
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   MULDIV included
 *   minstret not implemented
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 45 columns
 * Removed:  000000000000001000000000001000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 45
 * 210 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 210 209 210 210 210 210 210 210 210 210 210 210 210 210   x 210 210 208 210 209 210 209 209 210 210 210   x 210 210 210 210 208 208 208 210 209 210 209 210 209 210 210 209 208 209  kill col 27  Tbl  42 cols 000000000000001001000000001000000000000000000 has 208 unique lines.
 * 208 207 208 208 208 208 208 208 208 208 208 208 208 208   x 208 208     207 207 208 206 207 208 208 208   x 208 208 208 208 206 206 206 208 207 208 207 208 207 208 208 207 206 207  kill col 23  Tbl  41 cols 000000000000001001000100001000000000000000000 has 206 unique lines.
 * 206 205 206 206 206 206 206 206 206 206 206 206 206 206   x 206 206     205 204 206     205 206 206 206   x 206 206 206 206 204 204 204 206 205 206 205 206 205 206 206 205 204 205  kill col 25  Tbl  40 cols 000000000000001001010100001000000000000000000 has 204 unique lines.
 * 204 203 204 204 204 204 204 204 204 204 204 204 204 204   x 204 204     203     204     203 204 204 204   x 204 204 204 204 202 201 202 204 203 204 202 204 203 204 204 203 202 203  kill col 12  Tbl  39 cols 000000000000001001010100001000001000000000000 has 201 unique lines.
 * 201 200 200 201 201 201 201 201 201 201 201 201 201 201   x 201 201     200     201     199 201 201 201   x 201 201 201 201 198     199 201 200 201 199 201 200 201 201 200 199 200  kill col 13  Tbl  38 cols 000000000000001001010100001000011000000000000 has 198 unique lines.
 * 198 197 197 198 198 198 198 198 198 198 198 198 198 198   x 198 198     197     198     196 198 198 198   x 198 198 198 198         195 198 197 198 196 198 197 197 198 197 196 197  kill col 11  Tbl  37 cols 000000000000001001010100001000011100000000000 has 195 unique lines.
 * 195 194 193 195 195 195 195 195 195 195 195 195 195 195   x 195 195     194     195     193 195 195 195   x 195 195 195 195             195 194 195 193 195 193 193 195 194 193 194  kill col 42  Tbl  36 cols 001000000000001001010100001000011100000000000 has 193 unique lines.
 * 193 191     193 193 193 193 193 193 193 193 193 193 193   x 193 193     192     193     191 193 193 192   x 193 193 193 193             193 192 193 191 193 191 191 193 192 191 192  kill col 43  Tbl  35 cols 011000000000001001010100001000011100000000000 has 191 unique lines.
 * 191         191 191 191 191 191 191 191 191 191 191 191   x 191 191     190     191     189 191 191 189   x 191 191 191 191             190 190 191 189 191 189 189 191 190 189 189  kill col 22  Tbl  34 cols 011000000000001001010110001000011100000000000 has 189 unique lines.
 * 189         189 189 189 189 189 189 189 189 189 189 189   x 189 189     188     188         189 189 187   x 189 189 189 189             188 188 188 187 188 186 186 189 188 187 186  kill col  5  Tbl  33 cols 011000000000001001010110001000011100000100000 has 186 unique lines.
 * 186         186 186 186 186 186 186 186 186 186 186 186   x 186 186     185     185         186 186 184   x 185 186 186 186             183 185 185 180 181     183 183 182 180 182  kill col  7  Tbl  32 cols 011000000000001001010110001000011100010100000 has 180 unique lines.
 * 180         180 180 180 180 180 180 180 180 179 180 180   x 180 179     179     175         180 180 178   x 177 180 180 180             178 179 179     175     177 175 172 174 176  kill col  2  Tbl  31 cols 011000000000001001010110001000011100010100100 has 172 unique lines.
 * 172         172 172 172 172 172 172 172 172 171 172 172   x 172 171     170     165         172 172 168   x 168 170 172 172             170 171 170     164     167 164     163 165  kill col  1  Tbl  30 cols 011000000000001001010110001000011100010100110 has 163 unique lines.
 * 161         163 163 163 163 163 163 163 162 161 163 163   x 163 162     158     153         161 163 159   x 156 159 163 163             161 161 160     149     153 148         153  kill col  3  Tbl  29 cols 011000000000001001010110001000011100010101110 has 148 unique lines.
 * 146         148 148 148 148 148 148 148 146 146 148 148   x 147 147     144     138         145 148 142   x 139 141 148 145             146 146 145     127     132             132  kill col  6  Tbl  28 cols 011000000000001001010110001000011100011101110 has 127 unique lines.
 * 124         127 127 127 127 127 127 127 125 125 127 125   x 126 126     123     112         123 127 120   x 118 118 127 123             125 125 122             109             109  kill col  4  Tbl  27 cols 011000000000001001010110001000011100011111110 has 109 unique lines.
 * 105         108 109 109 109 109 109 109 106 108 108 107   x 107 107     105      96         103 109 102   x 101 101 109 104             107 107 104                              91  kill col  0  Tbl  26 cols 011000000000001001010110001000011100011111111 has  91 unique lines.
 *  87          90  91  91  91  91  91  91  87  90  90  89   x  88  90      86      83          85  91  85   x  84  84  91  86              89  89  86                                  kill col 24  Tbl  25 cols 011000000000001001011110001000011100011111111 has  83 unique lines.
 *  78          82  83  82  83  82  83  83  79  82  82  81   x  80  81      78                  77  83  77   x  77  74  82  79              81  81  78                                  kill col 16  Tbl  24 cols 011000000000001001011110001010011100011111111 has  74 unique lines.
 *  70          73  74  73  74  73  74  74  70  73  73  72   x  70  71      68                  67  73  66   x  69      73  70              72  72  69                                  kill col 19  Tbl  23 cols 011000000000001001011110011010011100011111111 has  66 unique lines.
 *  62          65  66  64  66  65  66  66  62  65  65  64   x  61  63      60                  60  65       x  60      65  63              64  64  62                                  kill col 26  Tbl  22 cols 011000000000001001111110011010011100011111111 has  60 unique lines.
 *  56          59  60  58  60  59  60  60  56  59  59  58   x  55  57                          54  59       x  54      59  57              58  58  56                                  kill col 21  Tbl  21 cols 011000000000001001111111011010011100011111111 has  54 unique lines.
 *  51          53  54  52  54  53  54  54  50  53  53  52   x  50  51                              51       x  48      53  51              52  52  51                                  kill col 17  Tbl  20 cols 011000000000001001111111011110011100011111111 has  48 unique lines.
 *  46          47  45  46  48  47  48  48  44  47  47  46   x  43  44                              45       x          47  45              46  46  45                                  kill col 29  Tbl  19 cols 011000000000001101111111011110011100011111111 has  43 unique lines.
 *  41          42  40  36  43  42  43  43  40  42  42  41   x      40                              41       x          42  40              41  41  40                                  kill col 39  Tbl  18 cols 011001000000001101111111011110011100011111111 has  36 unique lines.
 *  34          35  33      36  35  36  36  33  35  35  34   x      30                              34       x          35  34              34  34  33                                  kill col 28  Tbl  17 cols 011001000000001111111111011110011100011111111 has  30 unique lines.
 *  28          29  26      29  29  29  30  28  29  29  27   x                                      28       x          29  29              28  28  28                                  kill col 40  Tbl  16 cols 011011000000001111111111011110011100011111111 has  26 unique lines.
 *  24          24          25  25  24  26  24  24  25  24   x                                      24       x          25  25              24  24  24                                  kill col 44  Tbl  15 cols 111011000000001111111111011110011100011111111 has  24 unique lines.
 *              22          23  23  22  24  22  22  23  22   x                                      22       x          23  23              22  22  22                                  kill col 41  Tbl  14 cols 111111000000001111111111011110011100011111111 has  22 unique lines.
 *                          21  21  20  22  20  20  21  20   x                                      20       x          21  21              20  20  20                                  kill col 36  Tbl  13 cols 111111001000001111111111011110011100011111111 has  20 unique lines.
 *                          19  18      20  18  18  19  18   x                                      18       x          19  19              18  18  18                                  kill col 37  Tbl  12 cols 111111011000001111111111011110011100011111111 has  18 unique lines.
 *                          17          18  16  16  17  16   x                                      16       x          17  17              16  16  16                                  kill col 34  Tbl  11 cols 111111011010001111111111011110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 31 33 
 *
 * Round 1: 000000100101110000000000100001100011100000000  4 columns for indexes to table representing 11 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 209 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 209 206 209 209 209 209   x 209 209   x 209   x   x   x   x 209 209 207 209 207 209 208 208 209   x 207   x 209 209   x   x 207 207 207   x   x   x 208 209 208 209 209 208 207 208  kill col 43  Tbl  31 cols 010000100101111000000000101001100011100000000 has 206 unique lines.
 * 206     206 206 206 206   x 206 206   x 206   x   x   x   x 206 206 204 206 204 206 205 205 206   x 204   x 206 206   x   x 204 204 204   x   x   x 205 206 205 206 206 205 204 205  kill col 27  Tbl  30 cols 010000100101111001000000101001100011100000000 has 204 unique lines.
 * 204     204 204 204 204   x 204 204   x 204   x   x   x   x 204 204     203 202 204 202 203 204   x 202   x 204 204   x   x 202 202 202   x   x   x 203 204 203 204 204 203 202 203  kill col 25  Tbl  29 cols 010000100101111001010000101001100011100000000 has 202 unique lines.
 * 202     202 202 202 202   x 202 202   x 202   x   x   x   x 202 202     201     202 199 200 202   x 200   x 202 202   x   x 200 199 200   x   x   x 201 202 201 202 202 201 200 201  kill col 23  Tbl  28 cols 010000100101111001010100101001100011100000000 has 199 unique lines.
 * 199     199 199 199 199   x 199 199   x 199   x   x   x   x 199 199     198     199     197 199   x 197   x 199 199   x   x 197 196 197   x   x   x 197 199 198 199 198 197 197 198  kill col 12  Tbl  27 cols 010000100101111001010100101001101011100000000 has 196 unique lines.
 * 196     194 196 196 196   x 196 196   x 196   x   x   x   x 196 196     195     196     193 196   x 194   x 196 196   x   x 193     194   x   x   x 194 196 195 196 195 194 194 195  kill col 22  Tbl  26 cols 010000100101111001010110101001101011100000000 has 193 unique lines.
 * 193     191 193 193 193   x 193 193   x 193   x   x   x   x 193 193     192     192         193   x 191   x 193 193   x   x 189     191   x   x   x 191 192 191 193 192 191 190 191  kill col 13  Tbl  25 cols 010000100101111001010110101001111011100000000 has 189 unique lines.
 * 189     187 189 189 189   x 189 189   x 189   x   x   x   x 189 189     188     188         189   x 187   x 189 189   x   x         186   x   x   x 185 188 185 188 188 187 186 187  kill col  7  Tbl  24 cols 010000100101111001010110101001111011110000000 has 185 unique lines.
 * 185     182 185 185 185   x 185 185   x 185   x   x   x   x 185 184     184     183         185   x 183   x 184 184   x   x         182   x   x   x     184 180 183 183 181 182 182  kill col  5  Tbl  23 cols 010000100101111001010110101001111011110100000 has 180 unique lines.
 * 180     174 180 180 180   x 180 180   x 180   x   x   x   x 180 179     179     176         180   x 178   x 178 179   x   x         176   x   x   x     177     178 175 173 173 176  kill col  2  Tbl  22 cols 010000100101111001010110101001111011110100100 has 173 unique lines.
 * 173     166 173 173 173   x 173 173   x 173   x   x   x   x 173 172     172     167         173   x 170   x 170 171   x   x         166   x   x   x     165     170 165     164 166  kill col  1  Tbl  21 cols 010000100101111001010110101001111011110100110 has 164 unique lines.
 * 162     157 164 164 164   x 164 164   x 163   x   x   x   x 163 162     162     157         163   x 161   x 161 161   x   x         153   x   x   x     148     155 149         153  kill col  6  Tbl  20 cols 010000100101111001010110101001111011111100110 has 148 unique lines.
 * 146     138 148 147 148   x 148 148   x 147   x   x   x   x 145 145     145     138         146   x 145   x 144 144   x   x         137   x   x   x             132 125         132  kill col  3  Tbl  19 cols 010000100101111001010110101001111011111101110 has 125 unique lines.
 * 122     112 125 123 125   x 125 124   x 123   x   x   x   x 121 122     122     112         123   x 118   x 116 119   x   x         111   x   x   x             103             102  kill col  0  Tbl  18 cols 010000100101111001010110101001111011111101111 has 102 unique lines.
 *  97      89 101 100 102   x 102 101   x 100   x   x   x   x  98  98      96      89          98   x  94   x  93  93   x   x          91   x   x   x              80                  kill col  4  Tbl  17 cols 010000100101111001010110101001111011111111111 has  80 unique lines.
 *  76      68  79  78  80   x  80  79   x  77   x   x   x   x  75  77      74      70          76   x  74   x  73  73   x   x          71   x   x   x                                  kill col 42  Tbl  16 cols 011000100101111001010110101001111011111111111 has  68 unique lines.
 *  65          67  66  68   x  68  67   x  65   x   x   x   x  64  65      62      59          65   x  63   x  60  61   x   x          57   x   x   x                                  kill col 11  Tbl  15 cols 011000100101111001010110101001111111111111111 has  57 unique lines.
 *  54          56  55  57   x  57  56   x  54   x   x   x   x  54  54      51      49          53   x  51   x  46  50   x   x               x   x   x                                  kill col 17  Tbl  14 cols 011000100101111001010110101101111111111111111 has  46 unique lines.
 *  43          45  43  45   x  46  45   x  43   x   x   x   x  41  42      41      40          42   x  38   x      40   x   x               x   x   x                                  kill col 19  Tbl  13 cols 011000100101111001010110111101111111111111111 has  38 unique lines.
 *  35          37  35  37   x  38  37   x  35   x   x   x   x  33  34      33      33          34   x       x      33   x   x               x   x   x                                  kill col 29  Tbl  12 cols 011000100101111101010110111101111111111111111 has  33 unique lines.
 *  30          32  30  29   x  33  32   x  31   x   x   x   x      29      29      28          28   x       x      28   x   x               x   x   x                                  kill col 24  Tbl  11 cols 011000100101111101011110111101111111111111111 has  28 unique lines.
 *  25          27  25  24   x  27  27   x  26   x   x   x   x      23      23                  22   x       x      21   x   x               x   x   x                                  kill col 16  Tbl  10 cols 011000100101111101011110111111111111111111111 has  21 unique lines.
 *  19          20  18  18   x  20  20   x  19   x   x   x   x      17      17                  17   x       x           x   x               x   x   x                                  kill col 28  Tbl   9 cols 011000100101111111011110111111111111111111111 has  17 unique lines.
 *  15          16  15  13   x  16  15   x  15   x   x   x   x              14                  14   x       x           x   x               x   x   x                                  kill col 39  Tbl   8 cols 011001100101111111011110111111111111111111111 has  13 unique lines.
Possible good candidates for removal, columns : 21 26 
 *
 * Round 2: 100110011010000000100001000000000000000000000  4 columns for indexes to table representing  8 original columns (uses 13 of 16 lines in indirect table).
 * Direct:  011001000000000111011110010110011100011111111 24 columns
 * Success. Use 2 EBRs, 19 LUTs.
 */

module v4_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 011000110111110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 001000101111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 011000110111110010111110| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 1 3 0010000010x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 1 3 010010001011010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   1 3 0010000010x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     1 3 001000011011101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 001000010111101100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     1 0 010100111011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 3 001000010111100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     1 0 010100111011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    1 4 000110001011001110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 3 001000111011100100000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    1 3 1010001110x10xxx11100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    1 3 0010001110x10xxx00010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 1 3 000010001011011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     1 3 001000111111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 3 001000111011100000011010|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     1 3 001000xxxxx0xxxx11111110|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  1 3 001000111111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  1 5 011000001011110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 6 000100110011100100010110|        Branch on condition
    * 16 condb_5  Fetch    0 7 000101110100111011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  0 4 010101110111110001110100|        Branch taken.
    * 18 BEQ      condb_2  1 3 000110111011011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   1 3 010110101011010001000001| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 1 3 000010001011001111100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    1 4 001000001010111000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 001000101110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 1 3 000010001011011111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 5 111000101001110011010100|        Q = 4
    * 1f IJ_2     IJ_3     1 3 000110101011011010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     0 8 010110110111110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 1 3 000010001011000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  1 9 001000101011110000111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 1 3 0010000010x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   3 0 001000111110x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   1 3 0010000010x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     1 3 000100111011000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 3 011000000011110000011101|        Q = rs2
    * 28 _L0x28   SH_1     1 8 010100111011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 3 001000111011100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     1 8 010100111011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  1 5 011000xxxx11010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    1 3 0010001110x0xxxx00111110| SLL    Shift left
    * 2d MULH_0   MULH_1   3 3 001000101011100101101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  1 3 100100111111011001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 1 3 000010001011011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 1 a 000010001011011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 3 001000111111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    1 3 010110001011010010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  4 3 010111001010x10010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    0 b 000101110110100111011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 3 000010101111100100110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   5 3 000010101111110100000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  4 6 000110xxxx11000111010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  1 3 000110111011011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 1 3 100010001011000111100110|        Last shift.
    * 3a SRxI_1   SRxI_2   3 9 000010101011100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    1 4 001000001010111000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  1 3 000110011011011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   5 9 000010101011100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   3 0 001000111110x00100110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   3 0 001000111110x00100111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 4 011000110111110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 5 011000110011110000001011|        Q=1
    * 42 MULHU_2  MULHU_3  3 9 001000101011110001100000|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  1 3 001000000010100011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  1 3 001000111111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 5 011000101011110001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    4 3 000110101010x00101000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    4 3 000111101011000110001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     6 4 011000111011110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 5 011000001011110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     6 4 011000111011110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  7 3 000001101010100110110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   1 3 0010001110x10xxx00110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  3 3 000110111011000100101110| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     1 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 5 011000101011110011100110|        Prep +4
    * 50 LW_1     StdIncPc 1 c 000010101111000111100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   4 3 000111101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 001000101111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   4 3 000111101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     5 9 001000101011100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 4 3 000111101011011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 001000100011101101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 3 001000100011100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 9 111000101111100101101110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   1 3 000110111111011010011100|        REM = Q to yy
    * 5a SB_1     SB_2     3 3 000110101111100101011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    1 4 001000001010111000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  1 3 000110011011011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     5 3 000110101111110111111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 001000101111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   4 3 000111101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 101000111111100101000010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 1 6 000100011011001011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 DIV_8    DIV_7    3 5 011000101111110011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    8 5 011000101111110001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  1 3 001000111111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    1 6 0010000010x10xxx11101111|        Prepare read PC
    * 66 SW_1     SW_2     4 3 000001111010100111110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    4 3 000111001010x11010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 1 3 000010001011000111100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     1 3 001000101011100010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   1 3 000110101011000011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     6 3 001001110011100101111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   1 3 0010001110x10xxx00110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  3 3 000110111011000100101110| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    1 3 000110111010100110111001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   1 5 011000xxxx11110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    5 9 001000101011100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 4 3 000111101011011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 3 001000011011101000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  4 3 000111110011000101110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   1 d 001000101111011011110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  1 3 0010000010x0xxxx01110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 3 001000001011100001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  4 5 010110101010x10001111101|        origPC to mepc. Prep read 0
    * 78 DIV_4    DIV_6    1 3 000110000011011010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    1 5 111000101011110010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     1 3 000001110010100111110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    1 4 001000001010111000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  1 3 000110011011011001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    9 3 000111100110x00100110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    4 3 000110xxxx11000110010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  4 3 000111101010x00101111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0 011000110111110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  4 3 000110101010x00101111101|        Store PC to mepc
    * 82 DIV_1    DIV_3    1 3 000100111011000010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    1 3 011000101011110010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   1 3 001000111111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 001000101111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   1 5 110010001000x10010011110|        Return address to TRG
    * 87 JALRE1   JALRE2   4 3 000110110010x00101111111|  err   Store pc to mepc
    * 88 DIV_E    DIV_10   8 3 1010001111x0xxxx10011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 1 3 000010001011011011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   1 9 1110001011x10xxx00011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 1 5 110010001011010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    1 3 0010001111x10xxx00101001| XOR    xor
    * 8d DIV_0    DIV_1    a 3 101000101111100110000010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     1 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    1 5 001000101011110010101001|        Q = 1
    * 90 NMI_2    JAL_3    b 3 000111010011011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   9 5 110111001000x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    4 3 000110100110x00100110100|        PC to mepc
    * 93 SW_E2    SW_E3    4 3 000110101111000110010101|        Store address that faulted
    * 94 SW_E4    JAL_3    9 3 000111100110x10100110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 5 111000101101110010010100|        Q = 3
    * 96 SH_1     SH_2     3 3 000110101111100110111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    4 3 000111001010x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  1 3 000110111011011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     1 3 001000xxxxx0xxxx11111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    9 3 010111100100x10000110100|        mcause = 11
    * 9b SH_4     SH_5     c 3 001000110011100110011111|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   8 3 101000110011000101101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   8 3 101000110011000110100010|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    1 3 000100110010x00100110100|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     4 3 000000110010100111110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    0 8 010110110111110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  1 5 111000101001110010110110|        Q = 4
    * a2 DIV_14   LB_6     1 3 001000101011100010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 1 3 000010001011000111100110|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   3 0 001000111110x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 5 011000011011110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 4 001000101110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 3 011000xxxx11110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    8 3 101000101011100001111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    9 5 010111100110x10000110100|        Store 2 to mcause
    * aa DIV_6    DIV_7    1 3 1010001011x10xxx11001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  4 3 000110101011000110011010|        pc to mepc
    * ac _L0xac   SRx_1    1 3 0010001110x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   3 3 1010001110x10xxx11100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    1 3 0010001110x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 5 011000xxxx11110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   9 3 010111001000x10010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  1 5 111000101001110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    0 7 110100110100110011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             3 0 00xxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 i0reserv          3 0 00xxxxxxxxxxxxxxxxxxxxxx| Not in use, reserved to allow LASTINCH
    * b5 SH_3     SH_4     1 3 001000000011011010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  1 5 111000101001110010011010|        Q = 8
    * b7 IJ_3     IJ_4     1 3 011000110001110010111101|        Construct Q = 3
    * b8 BGE      condb_2  1 3 000110111011011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    1 5 001000110011100011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   1 3 001000011111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     5 3 000110101111110110110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  1 3 000110011011011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    0 b 001000110110101111011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 b 001000101111100100011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 b 001000101111100111000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 6 001000111011100110001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    1 3 000110101011011011101001|        Read word is to be masked with ~3u
    * c2 DIVU_3   DIVU_2   3 5 011000101111110011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   8 5 011000101111110010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    1 3 000100111111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 3 001000000011101001101111|        ~302
    * c6 IJT_4    ILL_2    4 3 000110101011101101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   4 3 000110xxxx11000111001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 e 101000110011110101100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   1 3 011000011001110010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 e 101000110011110111000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc b 3 000111010011011011100110|        mtval = 0.
    * cc OR_0     OR_1     1 3 0010001111x10xxx00100110| OR     or
    * cd REM_0    DIV_1    a 3 101000101111100110000010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     1 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * cf MRET_7   MRET_8   1 6 0010000110x10xxx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 5 011000001011110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   1 3 000100011011011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     5 9 001000101011100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 4 3 000111101011011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   9 5 010111001010x10010010010|        Store 5 to mcause
    * d5 unxd5             3 0 00xxxxxxxxxxxxxxxxxxxxxx| d5: Not in use
    * d6 eILL0c   ILLe     1 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  4 3 000111101011011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  1 3 000110111011011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  1 3 1010001111x10xxx01000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   1 3 0010001010x10xxx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   1 5 010111000010x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  1 3 000110011011011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  4 3 000111101011011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   1 f 000101001111011011110100|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   1 d 000101101111011011110100|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   1 3 000110101111000011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 001000000011100100011101|        Q = RS1
    * e2 MUL_1    MUL_2    3 9 001000101011110011101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   1 9 1110001011x10xxx00011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   1 3 001000111111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 5 111000101001110010110000|        Q = 4
    * e6 StdIncPc Fetch    0 7 110100110100110011011110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 4 3 000111101011011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 101000111011100111100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    1 3 011000110001110011000110|        Construct Q = 3
    * ea MULHU_5  MULHU_6  1 3 001000110011110000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     1 3 001000011111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    1 3 0010001111x10xxx00010001| AND    And 
    * ed REMU_0   DIVU_1   3 3 1010001110x10xxx11100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     1 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    0 7 110101110100110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    5 9 001000101011100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 4 3 000111101011011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 1 3 0010000010x10xxx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 3 001000xxxxx01xxx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            4 3 010101111111110000000000|  Fr00  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 4 3 000111101011011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 5 111000000001110011111010| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 4 3 000111001011011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  1 3 000110111011011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   1 5 010100111011010011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    1 5 011000101011110001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     1 3 001000000011011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  1 3 000110011011011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    1 3 0010000010x10xxx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    1 3 0010000010x0xxxx01000110| Illegal
    * ff QINT_0   QINT_1   1 3 0010000010x10xxx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'hb6e6901090e2b904b386bc5a788bbc5a7b09ba078804b4e690e67cbef9d27c01;
   localparam u0_1 = 256'hb6b79cd4b7e6eea6ae32b3e6b441b6137c744ede3916bc15f81400feb81af88b;
   localparam u0_2 = 256'hb6e6f642b96a803e3430bc96b821bc963c1db0278804e63590e6bc39b0e67c52;
   localparam u0_3 = 256'he13ae135b903b649ae32b93db1e6b61331d7fd03f93669dea481b486f82bb6e6;
   localparam u0_4 = 256'hbce600feb12e9031a9b1bc66bc4bbc66b18fa147bc65fa2b28eabc603c0b7c50;
   localparam u0_5 = 256'haedaf970fdfbb649ae32f95df69cf96e388b3b57b61eb9ebaedaf954aedaf1e6;
   localparam u0_6 = 256'h3ccfa9b9b12e9031397ab0f9b88bb1e6a693a9f290effa2bfc58fcc8b2f7f942;
   localparam u0_7 = 256'ha17d31906134b649ae3229f2bca836aaa47db8778073f6f43176ba1ab61eb9ba;
   localparam u0_8 = 256'hbca900fef982d029b4e6d01ab6e6c09c217f849ef9f0fa21bc82b0a8a17d7c85;
   localparam u0_9 = 256'h29f2213431a23168399f443400feb613a693f9bbdc946534f195613484923634;
   localparam u0_A = 256'h3cc5803f90e0803fb19ad0c86434b8783c61eed0bcafe63ab1e6b88b9cb67c5e;
   localparam u0_B = 256'hf9c1f91f6bdeb649fdb5fa1a38c0b6131cbd9c9a369b000000004cde9cb28492;
   localparam u0_C = 256'h904f00fef982d02636e63dc29ca53d6231cbbb473a6ff2e1fc8afccab6e9b988;
   localparam u0_D = 256'hf6f4f6f4b6e5b64924929091d042b613b6a100fe0000a492b61eb906b6c9bc37;
   localparam u0_E = 256'h4cde00fe90e0d011fa563c221cc6b9e2b61e4cde9cb0fa1ad01abce8391df0ca;
   localparam u0_F = 256'h90c78046907eb649366bbc45b4d9b613b6ab1cfab6dbfc0008dd90e6b61eb972;
   localparam u1_0 = 256'h1308132313a31323141810531321105313211321132013481320226311220063;
   localparam u1_1 = 256'h131a15e21308122214201308135a131b04570717161315601323132013231323;
   localparam u1_2 = 256'h130813933322132315601853132318531360131313203023132019221308085b;
   localparam u1_3 = 256'h30233023590a13191420390a1388131b4618530a330a0b17435c135813231a08;
   localparam u1_4 = 256'h15621320331b13237306646315606463431e431a156213231320392215630463;
   localparam u1_5 = 256'h431e1122531a13191420331a131b19e213221322431e5922431e1122431e1c0a;
   localparam u1_6 = 256'h1560131b331b13236327131a13221308431c43071620132385623562161113a3;
   localparam u1_7 = 256'h431e4318931e13191420130715e21318455a132013201d22431f1321431e5922;
   localparam u1_8 = 256'h15221320a3a2132315c819e2130883a3431b15c81122132313621313431a0063;
   localparam u1_9 = 256'h4303131383a383a3c323935e1320131b431c331a15e2931e431a431a95dcb31d;
   localparam u1_A = 256'h1560132333a31323431a13a2955e83a213601422156130231308132215e2085b;
   localparam u1_B = 256'h1b221b220b231319531a13211523131b136315e213203000300007d315e2935c;
   localparam u1_C = 256'h16211320a3a21323b31d1ea313611ea34318431a1320131385623562131a1623;
   localparam u1_D = 256'h1d161f14431e1319155c132213a3131b431e13203000955c431e592213111560;
   localparam u1_E = 256'h07d7132033a3132313211323136313a3431e07d315e2132319e239221320131a;
   localparam u1_F = 256'h1320132013201319132015621553131b431c15e0431e435713201320431e5922;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[11] = indir[8];
   assign d[12] = indir[9];
   assign d[13] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[19] = indir[13];
   assign d[22] = indir[14];
   assign d[23] = indir[15];
   assign d[24] = indir[16];
   assign d[25] = indir[17];
   assign d[27] = indir[18];
   assign d[28] = indir[19];
   assign d[29] = indir[20];
   assign d[39] = indir[21];
   assign d[42] = indir[22];
   assign d[43] = indir[23];
   // replaces = 000000100101110000000000100001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0202)) cmb_d08(.O(d[8]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h04a0)) cmb_d09(.O(d[9]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h40a0)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'ha000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfefe)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0114)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3882)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 100110011010000000100001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h1bd7)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1890)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0a04)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0a80)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1045)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1040)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0500)) cmb_d44(.O(d[44]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;            bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));    bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));    SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));    assign d[30] = d[18];
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   MULDIV included
 *   minstret for instructions in SRAM
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 45 columns
 * Removed:  000000000000001000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 45
 * 212 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 212 211 212 212 212 212 212 212 212 212 212 212 212 212   x 212 212 210 212 211 212 211 211 212 212 212 212 212 212 212 212 210 210 210 212 211 212 211 212 211 212 212 211 210 211  kill col 27  Tbl  43 cols 000000000000001001000000000000000000000000000 has 210 unique lines.
 * 210 209 210 210 210 210 210 210 210 210 210 210 210 210   x 210 210     209 209 210 208 209 210 210 210 210 210 210 210 210 208 208 208 210 209 210 209 210 209 210 210 209 208 209  kill col 23  Tbl  42 cols 000000000000001001000100000000000000000000000 has 208 unique lines.
 * 208 207 208 208 208 208 208 208 208 208 208 208 208 208   x 208 208     207 206 208     207 208 208 208 208 208 208 208 208 206 206 206 208 207 208 207 208 207 208 208 207 206 207  kill col 25  Tbl  41 cols 000000000000001001010100000000000000000000000 has 206 unique lines.
 * 206 205 206 206 206 206 206 206 206 206 206 206 206 206   x 206 206     205     206     205 206 206 206 206 206 206 206 206 204 203 204 206 205 206 204 206 205 206 206 205 204 205  kill col 12  Tbl  40 cols 000000000000001001010100000000001000000000000 has 203 unique lines.
 * 203 202 202 203 203 203 203 203 203 203 203 203 203 203   x 203 203     202     203     201 203 203 203 203 203 203 203 203 200     201 203 202 203 201 203 202 203 203 202 201 202  kill col 13  Tbl  39 cols 000000000000001001010100000000011000000000000 has 200 unique lines.
 * 200 199 199 200 200 200 200 200 200 200 200 200 200 200   x 200 200     199     200     198 200 200 200 200 200 200 200 200         197 200 199 200 198 200 199 199 200 199 198 199  kill col 11  Tbl  38 cols 000000000000001001010100000000011100000000000 has 197 unique lines.
 * 197 196 195 197 197 197 197 197 197 197 197 197 197 197   x 197 197     196     197     195 197 197 197 197 197 197 197 197             197 196 197 195 197 195 195 197 196 195 196  kill col 42  Tbl  37 cols 001000000000001001010100000000011100000000000 has 195 unique lines.
 * 195 193     195 195 195 195 195 195 195 195 195 195 195   x 195 195     194     195     193 195 195 194 195 195 195 195 195             195 194 195 193 195 193 193 195 194 193 194  kill col 43  Tbl  36 cols 011000000000001001010100000000011100000000000 has 193 unique lines.
 * 193         193 193 193 193 193 193 193 193 193 193 193   x 193 193     192     193     191 193 193 191 193 193 193 193 193             192 192 193 191 193 191 191 193 192 191 191  kill col 22  Tbl  35 cols 011000000000001001010110000000011100000000000 has 191 unique lines.
 * 191         191 191 191 191 191 191 191 191 191 191 191   x 191 191     190     190         191 191 189 191 191 191 191 191             190 190 190 189 190 188 188 191 190 189 188  kill col  5  Tbl  34 cols 011000000000001001010110000000011100000100000 has 188 unique lines.
 * 188         188 188 188 188 188 188 188 188 188 188 188   x 188 188     187     187         188 188 186 188 187 188 188 188             185 187 187 182 183     185 185 184 182 184  kill col  7  Tbl  33 cols 011000000000001001010110000000011100010100000 has 182 unique lines.
 * 182         182 182 182 182 182 182 182 182 181 182 182   x 182 181     181     177         182 182 180 182 179 182 182 182             180 181 181     177     179 177 174 176 178  kill col  2  Tbl  32 cols 011000000000001001010110000000011100010100100 has 174 unique lines.
 * 174         174 174 174 174 174 174 174 174 173 174 174   x 174 173     172     167         174 174 170 174 170 172 174 174             172 173 172     166     169 166     165 167  kill col  1  Tbl  31 cols 011000000000001001010110000000011100010100110 has 165 unique lines.
 * 163         165 165 165 165 165 165 165 164 163 165 165   x 165 164     160     155         163 165 161 165 158 161 165 165             163 163 162     151     155 150         155  kill col  3  Tbl  30 cols 011000000000001001010110000000011100010101110 has 150 unique lines.
 * 148         150 150 150 150 150 150 150 148 148 150 150   x 149 149     146     140         147 150 144 150 141 143 150 147             148 148 147     129     134             134  kill col  6  Tbl  29 cols 011000000000001001010110000000011100011101110 has 129 unique lines.
 * 126         129 129 129 129 129 129 129 127 127 129 127   x 128 128     125     114         125 129 122 129 120 120 129 125             127 127 124             111             111  kill col  4  Tbl  28 cols 011000000000001001010110000000011100011111110 has 111 unique lines.
 * 107         110 111 111 111 111 111 111 108 110 110 109   x 109 109     107      98         105 111 104 111 103 103 111 106             109 109 106                              93  kill col  0  Tbl  27 cols 011000000000001001010110000000011100011111111 has  93 unique lines.
 *  89          92  93  93  93  93  93  93  89  92  92  91   x  90  92      88      85          87  93  87  93  86  86  93  88              91  91  88                                  kill col 24  Tbl  26 cols 011000000000001001011110000000011100011111111 has  85 unique lines.
 *  80          84  85  84  85  84  85  85  81  84  84  83   x  82  84      80                  79  85  79  85  79  75  84  81              83  83  80                                  kill col 16  Tbl  25 cols 011000000000001001011110000010011100011111111 has  75 unique lines.
 *  71          74  75  74  75  74  75  75  71  74  74  73   x  71  73      69                  68  74  67  75  70      74  71              73  73  70                                  kill col 19  Tbl  24 cols 011000000000001001011110010010011100011111111 has  67 unique lines.
 *  63          66  67  65  67  66  67  67  63  66  66  65   x  62  65      61                  61  66      67  61      66  64              65  65  63                                  kill col 26  Tbl  23 cols 011000000000001001111110010010011100011111111 has  61 unique lines.
 *  57          60  61  59  61  60  61  61  57  60  60  59   x  56  58                          55  60      60  55      60  58              59  59  57                                  kill col 21  Tbl  22 cols 011000000000001001111111010010011100011111111 has  55 unique lines.
 *  52          54  55  53  55  54  55  55  51  54  54  53   x  51  52                              52      54  49      54  52              53  53  52                                  kill col 17  Tbl  21 cols 011000000000001001111111010110011100011111111 has  49 unique lines.
 *  47          48  46  47  49  48  49  49  45  48  48  47   x  44  45                              46      48          48  46              47  47  46                                  kill col 29  Tbl  20 cols 011000000000001101111111010110011100011111111 has  44 unique lines.
 *  42          43  41  37  44  43  44  44  41  43  43  42   x      41                              42      43          43  41              42  42  41                                  kill col 39  Tbl  19 cols 011001000000001101111111010110011100011111111 has  37 unique lines.
 *  35          36  34      37  36  37  37  34  36  36  35   x      31                              35      36          36  35              35  35  34                                  kill col 28  Tbl  18 cols 011001000000001111111111010110011100011111111 has  31 unique lines.
 *  29          30  27      30  30  30  31  29  30  30  28   x                                      29      30          30  30              29  29  29                                  kill col 40  Tbl  17 cols 011011000000001111111111010110011100011111111 has  27 unique lines.
 *  25          25          26  26  25  27  25  25  26  25   x                                      25      26          26  26              25  25  25                                  kill col 44  Tbl  16 cols 111011000000001111111111010110011100011111111 has  25 unique lines.
 *              23          24  24  23  25  23  23  24  23   x                                      23      24          24  24              23  23  23                                  kill col 41  Tbl  15 cols 111111000000001111111111010110011100011111111 has  23 unique lines.
 *                          22  22  21  23  21  21  22  21   x                                      21      22          22  22              21  21  21                                  kill col 36  Tbl  14 cols 111111001000001111111111010110011100011111111 has  21 unique lines.
 *                          20  19      21  19  19  20  19   x                                      19      20          20  20              19  19  19                                  kill col 37  Tbl  13 cols 111111011000001111111111010110011100011111111 has  19 unique lines.
 *                          18          19  17  17  18  17   x                                      17      18          18  18              17  17  17                                  kill col 34  Tbl  12 cols 111111011010001111111111010110011100011111111 has  17 unique lines.
 *                          16          17      15  16  15   x                                      15      16          16  16              15  15  16                                  kill col 33  Tbl  11 cols 111111011011001111111111010110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 31 
 *
 * Round 1: 000000100100110000000000101001100011100000000  4 columns for indexes to table representing 11 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 211 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 211 208 211 211 211 211   x 211 211   x 211 211   x   x   x 211 211 208 211 210 211 210 210 211   x 209   x 211 211   x   x 209 209 209   x   x   x 210 211 210 211 211 210 209 210  kill col 43  Tbl  32 cols 010000100100111000000000101001100011100000000 has 208 unique lines.
 * 208     208 208 208 208   x 208 208   x 208 208   x   x   x 208 208 205 208 207 208 207 207 208   x 206   x 208 208   x   x 206 206 206   x   x   x 207 208 207 208 208 207 206 207  kill col 27  Tbl  31 cols 010000100100111001000000101001100011100000000 has 205 unique lines.
 * 205     205 205 205 205   x 205 205   x 205 205   x   x   x 205 205     204 204 205 203 204 205   x 203   x 205 205   x   x 203 203 203   x   x   x 204 205 204 205 205 204 203 204  kill col 23  Tbl  30 cols 010000100100111001000100101001100011100000000 has 203 unique lines.
 * 203     203 203 203 203   x 203 203   x 203 203   x   x   x 203 203     202 201 203     202 203   x 201   x 203 203   x   x 201 201 201   x   x   x 202 203 202 203 202 202 201 202  kill col 25  Tbl  29 cols 010000100100111001010100101001100011100000000 has 201 unique lines.
 * 201     201 201 201 201   x 201 201   x 201 201   x   x   x 201 201     200     201     200 201   x 199   x 201 201   x   x 199 198 199   x   x   x 199 201 200 201 200 199 199 200  kill col 12  Tbl  28 cols 010000100100111001010100101001101011100000000 has 198 unique lines.
 * 198     196 198 198 198   x 198 198   x 198 198   x   x   x 198 198     197     198     196 198   x 196   x 198 198   x   x 195     196   x   x   x 196 198 197 198 197 196 196 197  kill col 13  Tbl  27 cols 010000100100111001010100101001111011100000000 has 195 unique lines.
 * 195     193 195 195 195   x 195 195   x 195 195   x   x   x 195 195     194     195     192 195   x 193   x 195 195   x   x         192   x   x   x 192 195 193 194 194 193 193 194  kill col 22  Tbl  26 cols 010000100100111001010110101001111011100000000 has 192 unique lines.
 * 192     190 192 192 192   x 192 192   x 192 191   x   x   x 192 192     191     191         192   x 190   x 192 192   x   x         189   x   x   x 188 191 188 191 191 190 190 190  kill col  7  Tbl  25 cols 010000100100111001010110101001111011110000000 has 188 unique lines.
 * 188     185 188 188 188   x 188 188   x 188 187   x   x   x 188 187     187     186         188   x 186   x 187 187   x   x         185   x   x   x     187 183 186 186 184 186 185  kill col  5  Tbl  24 cols 010000100100111001010110101001111011110100000 has 183 unique lines.
 * 183     177 183 183 183   x 183 183   x 183 182   x   x   x 183 182     182     179         183   x 181   x 181 182   x   x         179   x   x   x     180     181 178 176 177 179  kill col  2  Tbl  23 cols 010000100100111001010110101001111011110100100 has 176 unique lines.
 * 176     169 176 176 176   x 176 176   x 176 175   x   x   x 176 175     175     170         176   x 173   x 173 174   x   x         169   x   x   x     168     173 168     168 170  kill col  6  Tbl  22 cols 010000100100111001010110101001111011111100100 has 168 unique lines.
 * 168     159 168 168 168   x 168 168   x 167 167   x   x   x 165 166     167     160         167   x 165   x 165 166   x   x         159   x   x   x             158 156     152 158  kill col  1  Tbl  21 cols 010000100100111001010110101001111011111100110 has 152 unique lines.
 * 150     143 152 151 152   x 152 152   x 151 150   x   x   x 149 149     149     142         150   x 149   x 148 148   x   x         141   x   x   x             137 129         137  kill col  3  Tbl  20 cols 010000100100111001010110101001111011111101110 has 129 unique lines.
 * 126     117 129 127 129   x 129 128   x 127 127   x   x   x 125 126     126     117         127   x 123   x 120 123   x   x         116   x   x   x             107             107  kill col  4  Tbl  19 cols 010000100100111001010110101001111011111111110 has 107 unique lines.
 * 104      96 106 105 107   x 107 106   x 104 105   x   x   x 102 103     102      94         105   x 101   x  99 101   x   x          95   x   x   x                              85  kill col  0  Tbl  18 cols 010000100100111001010110101001111011111111111 has  85 unique lines.
 *  81      73  84  83  85   x  85  84   x  82  81   x   x   x  80  82      79      75          81   x  79   x  78  78   x   x          76   x   x   x                                  kill col 42  Tbl  17 cols 011000100100111001010110101001111011111111111 has  73 unique lines.
 *  70          72  71  73   x  73  72   x  70  69   x   x   x  69  69      66      64          70   x  68   x  65  66   x   x          62   x   x   x                                  kill col 11  Tbl  16 cols 011000100100111001010110101001111111111111111 has  62 unique lines.
 *  59          61  60  62   x  62  61   x  59  58   x   x   x  59  58      55      54          58   x  56   x  53  54   x   x               x   x   x                                  kill col 17  Tbl  15 cols 011000100100111001010110101101111111111111111 has  53 unique lines.
 *  50          52  50  52   x  53  52   x  50  47   x   x   x  48  48      47      47          49   x  45   x      46   x   x               x   x   x                                  kill col 19  Tbl  14 cols 011000100100111001010110111101111111111111111 has  45 unique lines.
 *  42          44  42  44   x  45  44   x  42  39   x   x   x  40  40      39      40          41   x       x      39   x   x               x   x   x                                  kill col 33  Tbl  13 cols 011000100101111001010110111101111111111111111 has  39 unique lines.
 *  36          38  36  38   x  39  38   x  36       x   x   x  34  34      33      34          35   x       x      34   x   x               x   x   x                                  kill col 26  Tbl  12 cols 011000100101111001110110111101111111111111111 has  33 unique lines.
 *  30          32  30  32   x  33  32   x  30       x   x   x  29  29              27          28   x       x      28   x   x               x   x   x                                  kill col 24  Tbl  11 cols 011000100101111001111110111101111111111111111 has  27 unique lines.
 *  24          26  24  25   x  26  26   x  24       x   x   x  23  24                          22   x       x      21   x   x               x   x   x                                  kill col 16  Tbl  10 cols 011000100101111001111110111111111111111111111 has  21 unique lines.
 *  19          20  18  19   x  20  20   x  18       x   x   x  17  17                          16   x       x           x   x               x   x   x                                  kill col 21  Tbl   9 cols 011000100101111001111111111111111111111111111 has  16 unique lines.
 *
 * Round 2: 100111011010000110000000000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  011000000001000001111111010110011100011111111 24 columns
 * Success. Use 2 EBRs, 20 LUTs.
 */

module v6_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 010001101111110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 001001011111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 010001101111110010111110| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 1 3 0000000101x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 3 010000010111010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   1 3 0000000101x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     1 3 000000110111101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 000000101111101100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     4 0 010001110111110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 3 000000101111100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     4 0 010001110111110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    5 4 000000010111001110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 3 000001110111100100000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    1 3 1000011101x10xxx11100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    1 3 0000011101x10xxx00010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 3 000000010111011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     1 3 000001111111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 3 000001110111100000011010|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     1 3 00000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  1 3 000001111111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  1 5 010000010111110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  4 6 000001100111100100010110|        Branch on condition
    * 16 condb_5  Fetch    6 5 001101101100111011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  6 4 010101101111110001110100|        Branch taken.
    * 18 BEQ      condb_2  5 3 000001110111011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 3 010001010111010001000001| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 3 3 000000010111001111100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    1 4 000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 000001011110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 000000010111011111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 5 110001010101110011010100|        Q = 4
    * 1f IJ_2     IJ_3     5 3 000001010111011010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     7 7 010001101111110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 000000010111000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  1 8 000001010111110000111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 1 3 0000000101x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   1 0 000001111010x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   1 3 0000000101x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     4 3 000001110111000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 3 010000000111110000011101|        Q = rs2
    * 28 _L0x28   SH_1     4 7 010001110111110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 3 000001110111100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     4 7 010001110111110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  1 5 01000xxxx111010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    1 3 0000011101x0xxxx00111110| SLL    Shift left
    * 2d MULH_0   MULH_1   1 3 000001010011100101101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  4 3 100001111111011001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 3 3 000000010111011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 9 000000010111011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 3 000001111111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    5 3 010000010111010010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  5 3 010110010110x10010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    6 3 001101101110100111011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 3 000001011011100100110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 3 000001011011110100000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  5 6 00001xxxx111000111010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 000001110111011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 100000010111000111100110|        Last shift.
    * 3a SRxI_1   SRxI_2   3 8 000001010011100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    1 4 000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  5 3 000000110111011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 8 000001010011100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 0 000001111010x00100110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 0 000001111010x00100111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 4 010001101111110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 5 010001100111110000001011|        Q=1
    * 42 MULHU_2  MULHU_3  1 8 000001010011110001100000|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  1 3 000000000110100011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  1 3 000001111111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 5 010001010111110001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    5 3 000011010110x00101000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    5 3 000111010111000110001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     9 4 010001110111110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 5 010000010111110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     9 4 010001110111110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 3 000111010110100110110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   1 3 0000011101x10xxx00110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  5 3 000001110011000100101110| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     1 3 00000xxxx1x0xxxx11111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 5 010001010111110011100110|        Prep +4
    * 50 LW_1     StdIncPc 3 a 001001011111000111100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   5 3 000111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 001001011111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   5 3 000111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     b 8 000001010011100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 5 3 000111010111011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 000001000111101101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 3 000001000111100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 8 110001011111100101101110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 000001111111011010011100|        REM = Q to yy
    * 5a SB_1     SB_2     5 3 000001011011100101011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    1 4 000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  5 3 000000110111011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     c 3 000001011011110111111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 001001011111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   5 3 000111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 100001111111100101000010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 4 6 000000110111001011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 DIV_8    DIV_7    1 5 010001011011110011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    d 5 010001011111110001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  1 3 000001111111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    1 6 0000000101x10xxx11101111|        Prepare read PC
    * 66 SW_1     SW_2     e 3 000111110110100111110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    5 3 000110010110x11010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 000000010111000111100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     1 3 000001010111100010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 000001010111000011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     9 3 000101100111100101111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   1 3 0000011101x10xxx00110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  5 3 000001110011000100101110| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    5 3 000001110110100110111001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   1 5 01000xxxx111110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    b 8 000001010011100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 5 3 000111010111011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 3 000000110111101000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  5 3 000111100111000101110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   1 b 001001011111011011110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  1 3 0000000101x0xxxx01110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 3 000000010111100001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  5 5 010011010110x10001111101|        origPC to mepc. Prep read 0
    * 78 DIV_4    DIV_6    5 3 000000000111011010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    1 5 110001010111110010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     e 3 000101100110100111110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    1 4 000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  5 3 000000110111011001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    f 3 000101001110x00100110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    5 3 00001xxxx111000110010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  5 3 000111010110x00101111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0 010001101111110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  5 3 000011010110x00101111101|        Store PC to mepc
    * 82 DIV_1    DIV_3    4 3 000001110111000010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    1 3 010001010111110010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   1 3 000001111111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 001001011111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   3 5 110000010100x10010011110|        Return address to TRG
    * 87 JALRE1   JALRE2   5 3 000011100110x00101111111|  err   Store pc to mepc
    * 88 DIV_E    DIV_10   d 3 1000011111x0xxxx10011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 000000010111011011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   1 8 1100010111x10xxx00011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 3 5 110000010111010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    1 3 0000011111x10xxx00101001| XOR    xor
    * 8d DIV_0    DIV_1    d 3 100001011011100110000010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     1 3 00000xxxx1x0xxxx11111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    1 5 000001010111110010101001|        Q = 1
    * 90 NMI_2    JAL_3    f 3 000110100111011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   f 5 110100010100x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    5 3 000011001110x00100110100|        PC to mepc
    * 93 SW_E2    SW_E3    5 3 000011011111000110010101|        Store address that faulted
    * 94 SW_E4    JAL_3    f 3 000101001110x10100110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 5 110001011101110010010100|        Q = 3
    * 96 SH_1     SH_2     5 3 000001011011100110111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    5 3 000110010110x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 000001110111011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     1 3 00000xxxx1x0xxxx11111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    f 3 010101001100x10000110100|        mcause = 11
    * 9b SH_4     SH_5     9 3 000011100111100110011111|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   d 3 100001100111000101101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   d 3 100001100111000110100010|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    4 3 000001100110x00100110100|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     e 3 000011100110100111110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    7 7 010001101111110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  1 5 110001010101110010110110|        Q = 4
    * a2 DIV_14   LB_6     1 3 000001010111100010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 3 3 000000010111000111100110|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   1 0 000001111010x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 5 010000110111110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 4 000001011110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 3 01000xxxx111110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    d 3 100001010111100001111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    f 5 010101001110x10000110100|        Store 2 to mcause
    * aa DIV_6    DIV_7    1 3 1000010111x10xxx11001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  5 3 000011010111000110011010|        pc to mepc
    * ac _L0xac   SRx_1    1 3 0000011101x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   1 3 1000011100x10xxx11100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    1 3 0000011101x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 5 01000xxxx111110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   f 3 010100010100x10010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  1 5 110001010101110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 5 111001101100110011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             e 0 00xxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3           4 5 010011111111110000000000|  Fr10  Update minstret, Q=immediate. Use dinx
    * b5 SH_3     SH_4     1 3 000000000111011010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  1 5 110001010101110010011010|        Q = 8
    * b7 IJ_3     IJ_4     1 3 010001100101110010111101|        Construct Q = 3
    * b8 BGE      condb_2  5 3 000001110111011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    1 5 000001100111100011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   1 3 000000111111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     c 3 000001011011110110110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 000000110111011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    0 3 001001101110101111011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 3 001001011111100100011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 3 001001011111100111000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 6 000001110111100110001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 000001010111011011101001|        Read word is to be masked with ~3u
    * c2 DIVU_3   DIVU_2   1 5 010001011011110011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   d 5 010001011111110010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    4 3 000001111111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 3 000000000111101001101111|        ~302
    * c6 IJT_4    ILL_2    5 3 000011010111101101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   5 3 00001xxxx111000111001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 c 100001100111110101100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   1 3 010000110101110010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 c 100001100111110111000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc f 3 000110100111011011100110|        mtval = 0.
    * cc OR_0     OR_1     1 3 0000011111x10xxx00100110| OR     or
    * cd REM_0    DIV_1    d 3 100001011011100110000010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     1 3 00000xxxx1x0xxxx11111110| Illegal instruction seen
    * cf MRET_7   MRET_8   1 6 0000001101x10xxx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 5 010000010111110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 3 000000110111011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     b 8 000001010011100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 5 3 000111010111011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   f 5 010100010110x10010010010|        Store 5 to mcause
    * d5 eFetch2  eFetch3  4 d 010110001111010010110100|  Fr10  Update ttime
    * d6 eILL0c   ILLe     1 3 00000xxxx1x0xxxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  5 3 000111010111011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 000001110111011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  1 3 1000011111x10xxx01000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   1 3 0000010101x10xxx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 5 010100000110x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 000000110111011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  5 3 000111010111011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 e 000100011111011011110100|  Fr10  Read and latch instruction
    * df eFetch   eFetch2  4 b 001101011111011011010101|  Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 000001011111000011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 000000000111100100011101|        Q = RS1
    * e2 MUL_1    MUL_2    1 8 000001010011110011101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   1 8 1100010111x10xxx00011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   1 3 000001111111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 5 110001010101110010110000|        Q = 4
    * e6 StdIncPc Fetch    6 5 111001101100110011011110|  Fr10  IncPC, OpFetch
    * e7 aFault   aFault_1 5 3 000111010111011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 100001110111100111100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    1 3 010001100101110011000110|        Construct Q = 3
    * ea MULHU_5  MULHU_6  1 3 000001100111110000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     1 3 000000111111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    1 3 0000011111x10xxx00010001| AND    And 
    * ed REMU_0   DIVU_1   1 3 1000011100x10xxx11100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     1 3 00000xxxx1x0xxxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    6 5 111101101100110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    b 8 000001010011100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 5 3 000111010111011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 1 3 0000000101x10xxx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 3 00000xxxx1x01xxx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            4 d 010111111111110000000000|  Fr10  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 5 3 000111010111011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 5 110000000101110011111010| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 5 3 000110010111011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 000001110111011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   4 5 010001110111010011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    1 5 010001010111110001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     1 3 000000000111011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 000000110111011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    1 3 0000000101x10xxx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    1 3 0000000101x0xxxx01000110| Illegal
    * ff QINT_0   QINT_1   1 3 0000000101x10xxx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'h76e6501050e2790473867c5af88b7c5afb097a07480474e650e6fcbef9d2fc01;
   localparam u0_1 = 256'h76b75cd477e6eea66e3273e674417613fc74cede79167c15f81440fe781af88b;
   localparam u0_2 = 256'h76e6f642396a403e74307c9678217c967c1d70274804a63550e67c3970e6fc52;
   localparam u0_3 = 256'ha13aa135390376496e32393d71e6761371d7bd03b936e9de64817486f82b76e6;
   localparam u0_4 = 256'h7ce640fe312e503169b17c667c4b7c66718f61477c65fa2b68ea3c607c0bfc50;
   localparam u0_5 = 256'h6edaf970bdfb76496e32b95df69cf96e788b7b57761e39eb6edaf9546edaf1e6;
   localparam u0_6 = 256'h7ccf69b9312e5031797a70f9788b71e6669369f250effa2bfc58bcc872f7f942;
   localparam u0_7 = 256'h617d7190e13476496e3269f27ca876aa647d78774073f6f471767a1a761e39ba;
   localparam u0_8 = 256'h7ca940feb982d02974e6d01a76e6c09c617f449ef9f0fa217c8270a8617dfc85;
   localparam u0_9 = 256'h69f2613471a27168799fc43440fe76136693b9bbdc94e534f195e13444927634;
   localparam u0_A = 256'h7cc5403f10e0403f719ad0c8e43478787c61eed07cafa63a71e6788b5cb6fc5e;
   localparam u0_B = 256'hf9c1f91febde7649bdb5fa1a78c076135cbd5c9a769bfc000000ccde5cb24492;
   localparam u0_C = 256'h504f40feb982d02676e67dc25ca57d6271cb7b477a6ff2e1fc8abcca76e97988;
   localparam u0_D = 256'hf6d5f6f476e5764964925091d042761376a140fef4b46492761e390676c97c37;
   localparam u0_E = 256'hccde40fe10e0d011fa567c225cc679e2761eccde5cb0fa1ad01a3ce8791df0ca;
   localparam u0_F = 256'h50c74046507e7649766b7c4574d9761376ab5cfa76dbfc0048dd50e6761e3972;
   localparam u1_0 = 256'h3301130713871307540140471302404713021303130133411301224611250046;
   localparam u1_1 = 256'h530515c533011205140133015345530764566536460615411307130013071307;
   localparam u1_2 = 256'h3301438713051307154047471307474713404307130110071301180533017746;
   localparam u1_3 = 256'h1007100788055303140138053381530756088305330563365359534113073901;
   localparam u1_4 = 256'h1545130053071307a31d944715419447531d530d154513071300180515460446;
   localparam u1_5 = 256'h531d1125c305530314015305530718c513041304531db805531d1125531d3a25;
   localparam u1_6 = 256'h154053075307130793165305130533015319e31f16011307d545154546031387;
   localparam u1_7 = 256'h531d5308f31453031401e31615c55300554d130113011b25531e1303531db805;
   localparam u1_8 = 256'h15051300d385130735c118c53301d387530e35c11125130713454307530d0046;
   localparam u1_9 = 256'he30e4306d386d386930ef354130053075319530515c5f314530d530cf5d1f31a;
   localparam u1_A = 256'h1540130713871307530d1385f554d38513401405154310073301130515c57746;
   localparam u1_B = 256'h1325132503265303c305130315065307134615c51300454fe00065e615c5f351;
   localparam u1_C = 256'h16031300d3851307f31a1c8613431c865308530d13004307d545154553051607;
   localparam u1_D = 256'h4b354e11531d53035550130513875307531d13004d58f551531db80543031541;
   localparam u1_E = 256'h65f61300138713071303130613461387531d65e615c5130718c5180513005305;
   localparam u1_F = 256'h13011301130153031300154545475307531915c0531d4d5f13001301531db805;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[11] = indir[8];
   assign d[12] = indir[9];
   assign d[13] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[19] = indir[13];
   assign d[21] = indir[14];
   assign d[22] = indir[15];
   assign d[23] = indir[16];
   assign d[24] = indir[17];
   assign d[25] = indir[18];
   assign d[26] = indir[19];
   assign d[27] = indir[20];
   assign d[33] = indir[21];
   assign d[42] = indir[22];
   assign d[43] = indir[23];
   // replaces = 000000100100110000000000101001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0102)) cmb_d08(.O(d[8]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0220)) cmb_d09(.O(d[9]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1020)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4800)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h7f7e)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0094)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0802)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0c00)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 100111011010000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h91a8)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h90f0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1900)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8400)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2a07)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h02c5)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d44(.O(d[44]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;            bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));    bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));    SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr1x110100));
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   MULDIV included
 *   minstret for instructions in SRAM and EBR
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 45 columns
 * Removed:  000000000000001000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 45
 * 210 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 210 209 210 210 210 210 210 210 210 210 210 210 210 210   x 210 210 208 210 209 210 209 209 210 210 210 210 210 210 210 210 208 208 208 210 209 210 209 210 209 210 210 209 208 209  kill col 27  Tbl  43 cols 000000000000001001000000000000000000000000000 has 208 unique lines.
 * 208 207 208 208 208 208 208 208 208 208 208 208 208 208   x 208 208     207 207 208 206 207 208 208 208 208 208 208 208 208 206 206 206 208 207 208 207 208 207 208 208 207 206 207  kill col 23  Tbl  42 cols 000000000000001001000100000000000000000000000 has 206 unique lines.
 * 206 205 206 206 206 206 206 206 206 206 206 206 206 206   x 206 206     205 204 206     205 206 206 206 206 206 206 206 206 204 204 204 206 205 206 205 206 205 206 206 205 204 205  kill col 25  Tbl  41 cols 000000000000001001010100000000000000000000000 has 204 unique lines.
 * 204 203 204 204 204 204 204 204 204 204 204 204 204 204   x 204 204     203     204     203 204 204 204 204 204 204 204 204 202 201 202 204 203 204 202 204 203 204 204 203 202 203  kill col 12  Tbl  40 cols 000000000000001001010100000000001000000000000 has 201 unique lines.
 * 201 200 200 201 201 201 201 201 201 201 201 201 201 201   x 201 201     200     201     199 201 201 201 201 201 201 201 201 198     199 201 200 201 199 201 200 201 201 200 199 200  kill col 13  Tbl  39 cols 000000000000001001010100000000011000000000000 has 198 unique lines.
 * 198 197 197 198 198 198 198 198 198 198 198 198 198 198   x 198 198     197     198     196 198 198 198 198 198 198 198 198         195 198 197 198 196 198 197 197 198 197 196 197  kill col 11  Tbl  38 cols 000000000000001001010100000000011100000000000 has 195 unique lines.
 * 195 194 193 195 195 195 195 195 195 195 195 195 195 195   x 195 195     194     195     193 195 195 195 195 195 195 195 195             195 194 195 193 195 193 193 195 194 193 194  kill col 42  Tbl  37 cols 001000000000001001010100000000011100000000000 has 193 unique lines.
 * 193 191     193 193 193 193 193 193 193 193 193 193 193   x 193 193     192     193     191 193 193 192 193 193 193 193 193             193 192 193 191 193 191 191 193 192 191 192  kill col 43  Tbl  36 cols 011000000000001001010100000000011100000000000 has 191 unique lines.
 * 191         191 191 191 191 191 191 191 191 191 191 191   x 191 191     190     191     189 191 191 189 191 191 191 191 191             190 190 191 189 191 189 189 191 190 189 189  kill col 22  Tbl  35 cols 011000000000001001010110000000011100000000000 has 189 unique lines.
 * 189         189 189 189 189 189 189 189 189 189 189 189   x 189 189     188     188         189 189 187 189 189 189 189 189             188 188 188 187 188 186 186 189 188 187 186  kill col  5  Tbl  34 cols 011000000000001001010110000000011100000100000 has 186 unique lines.
 * 186         186 186 186 186 186 186 186 186 186 186 186   x 186 186     185     185         186 186 184 186 185 186 186 186             183 185 185 180 181     183 183 182 180 182  kill col  7  Tbl  33 cols 011000000000001001010110000000011100010100000 has 180 unique lines.
 * 180         180 180 180 180 180 180 180 180 179 180 180   x 180 179     179     175         180 180 178 180 177 180 180 180             178 179 179     175     177 175 172 174 176  kill col  2  Tbl  32 cols 011000000000001001010110000000011100010100100 has 172 unique lines.
 * 172         172 172 172 172 172 172 172 172 171 172 172   x 172 171     170     165         172 172 168 172 168 170 172 172             170 171 170     164     167 164     163 165  kill col  1  Tbl  31 cols 011000000000001001010110000000011100010100110 has 163 unique lines.
 * 161         163 163 163 163 163 163 163 162 161 163 163   x 163 162     158     153         161 163 159 163 156 159 163 163             161 161 160     149     153 148         153  kill col  3  Tbl  30 cols 011000000000001001010110000000011100010101110 has 148 unique lines.
 * 146         148 148 148 148 148 148 148 146 146 148 148   x 147 147     144     138         145 148 142 148 139 141 148 145             146 146 145     127     132             132  kill col  6  Tbl  29 cols 011000000000001001010110000000011100011101110 has 127 unique lines.
 * 124         127 127 127 127 127 127 127 125 125 127 125   x 126 126     123     112         123 127 120 127 118 118 127 123             125 125 122             109             109  kill col  4  Tbl  28 cols 011000000000001001010110000000011100011111110 has 109 unique lines.
 * 105         108 109 109 109 109 109 109 106 108 108 107   x 107 107     105      96         103 109 102 109 101 101 109 104             107 107 104                              91  kill col  0  Tbl  27 cols 011000000000001001010110000000011100011111111 has  91 unique lines.
 *  87          90  91  91  91  91  91  91  87  90  90  89   x  88  90      86      83          85  91  85  91  84  84  91  86              89  89  86                                  kill col 24  Tbl  26 cols 011000000000001001011110000000011100011111111 has  83 unique lines.
 *  78          82  83  82  83  82  83  83  79  82  82  81   x  80  82      78                  77  83  77  83  77  74  83  79              81  81  78                                  kill col 16  Tbl  25 cols 011000000000001001011110000010011100011111111 has  74 unique lines.
 *  70          73  74  73  74  73  74  74  70  73  73  72   x  70  72      68                  67  73  66  74  69      74  70              72  72  69                                  kill col 19  Tbl  24 cols 011000000000001001011110010010011100011111111 has  66 unique lines.
 *  62          65  66  64  66  65  66  66  62  65  65  64   x  61  64      60                  60  65      66  60      66  63              64  64  62                                  kill col 26  Tbl  23 cols 011000000000001001111110010010011100011111111 has  60 unique lines.
 *  56          59  60  58  60  59  60  60  56  59  59  58   x  55  57                          54  59      59  54      60  57              58  58  56                                  kill col 21  Tbl  22 cols 011000000000001001111111010010011100011111111 has  54 unique lines.
 *  51          53  54  52  54  53  54  54  50  53  53  52   x  50  51                              51      53  48      54  51              52  52  51                                  kill col 17  Tbl  21 cols 011000000000001001111111010110011100011111111 has  48 unique lines.
 *  46          47  45  46  48  47  48  48  44  47  47  46   x  43  44                              45      47          48  45              46  46  45                                  kill col 29  Tbl  20 cols 011000000000001101111111010110011100011111111 has  43 unique lines.
 *  41          42  40  36  43  42  43  43  40  42  42  41   x      40                              41      42          43  40              41  41  40                                  kill col 39  Tbl  19 cols 011001000000001101111111010110011100011111111 has  36 unique lines.
 *  34          35  33      36  35  36  36  33  35  35  34   x      30                              34      35          36  34              34  34  33                                  kill col 28  Tbl  18 cols 011001000000001111111111010110011100011111111 has  30 unique lines.
 *  28          29  26      29  29  29  30  28  29  29  27   x                                      28      29          30  29              28  28  28                                  kill col 40  Tbl  17 cols 011011000000001111111111010110011100011111111 has  26 unique lines.
 *  24          24          25  25  24  26  24  24  25  24   x                                      24      25          26  25              24  24  24                                  kill col 44  Tbl  16 cols 111011000000001111111111010110011100011111111 has  24 unique lines.
 *              22          23  23  22  24  22  22  23  22   x                                      22      23          24  23              22  22  22                                  kill col 41  Tbl  15 cols 111111000000001111111111010110011100011111111 has  22 unique lines.
 *                          21  21  20  22  20  20  21  20   x                                      20      21          22  21              20  20  20                                  kill col 36  Tbl  14 cols 111111001000001111111111010110011100011111111 has  20 unique lines.
 *                          19  18      20  18  18  19  18   x                                      18      19          20  19              18  18  18                                  kill col 37  Tbl  13 cols 111111011000001111111111010110011100011111111 has  18 unique lines.
 *                          17          18  16  16  17  16   x                                      16      17          18  17              16  16  16                                  kill col 34  Tbl  12 cols 111111011010001111111111010110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 31 33 
 *
 * Round 1: 000000100101110000000000101001100011100000000  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 37
 * 209 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 209 206 209 209 209 209   x 209 209   x 209   x   x   x   x 209 209 207 209 208 209 208 208 209   x 207   x 209 209   x   x 207 207 207   x   x   x 208 209 208 209 209 208 207 208  kill col 43  Tbl  31 cols 010000100101111000000000101001100011100000000 has 206 unique lines.
 * 206     206 206 206 206   x 206 206   x 206   x   x   x   x 206 206 204 206 205 206 205 205 206   x 204   x 206 206   x   x 204 204 204   x   x   x 205 206 205 206 206 205 204 205  kill col 27  Tbl  30 cols 010000100101111001000000101001100011100000000 has 204 unique lines.
 * 204     204 204 204 204   x 204 204   x 204   x   x   x   x 204 204     203 203 204 202 203 204   x 202   x 204 204   x   x 202 202 202   x   x   x 203 204 203 204 204 203 202 203  kill col 23  Tbl  29 cols 010000100101111001000100101001100011100000000 has 202 unique lines.
 * 202     202 202 202 202   x 202 202   x 202   x   x   x   x 202 202     201 200 202     201 202   x 200   x 202 202   x   x 200 200 200   x   x   x 201 202 201 202 201 201 200 201  kill col 25  Tbl  28 cols 010000100101111001010100101001100011100000000 has 200 unique lines.
 * 200     200 200 200 200   x 200 200   x 200   x   x   x   x 200 200     199     200     198 200   x 198   x 200 200   x   x 198 197 198   x   x   x 198 200 199 200 199 198 198 199  kill col 12  Tbl  27 cols 010000100101111001010100101001101011100000000 has 197 unique lines.
 * 197     195 197 197 197   x 197 197   x 197   x   x   x   x 197 197     196     197     194 197   x 195   x 197 197   x   x 194     195   x   x   x 195 197 196 197 196 195 195 196  kill col 22  Tbl  26 cols 010000100101111001010110101001101011100000000 has 194 unique lines.
 * 194     192 194 194 194   x 194 194   x 194   x   x   x   x 194 194     193     193         194   x 192   x 194 194   x   x 190     192   x   x   x 192 193 192 194 193 192 191 192  kill col 13  Tbl  25 cols 010000100101111001010110101001111011100000000 has 190 unique lines.
 * 190     188 190 190 190   x 190 190   x 190   x   x   x   x 190 190     189     189         190   x 188   x 190 190   x   x         187   x   x   x 186 189 186 189 189 188 187 188  kill col  7  Tbl  24 cols 010000100101111001010110101001111011110000000 has 186 unique lines.
 * 186     183 186 186 186   x 186 186   x 186   x   x   x   x 186 185     185     184         186   x 184   x 185 185   x   x         183   x   x   x     185 181 184 184 182 183 183  kill col  5  Tbl  23 cols 010000100101111001010110101001111011110100000 has 181 unique lines.
 * 181     175 181 181 181   x 181 181   x 181   x   x   x   x 181 180     180     177         181   x 179   x 179 180   x   x         177   x   x   x     178     179 176 174 174 177  kill col  2  Tbl  22 cols 010000100101111001010110101001111011110100100 has 174 unique lines.
 * 174     167 174 174 174   x 174 174   x 174   x   x   x   x 174 173     173     168         174   x 171   x 171 172   x   x         167   x   x   x     166     171 166     165 167  kill col  1  Tbl  21 cols 010000100101111001010110101001111011110100110 has 165 unique lines.
 * 163     158 165 165 165   x 165 165   x 164   x   x   x   x 164 163     163     158         164   x 162   x 162 162   x   x         154   x   x   x     149     156 150         154  kill col  6  Tbl  20 cols 010000100101111001010110101001111011111100110 has 149 unique lines.
 * 147     139 149 148 149   x 149 149   x 148   x   x   x   x 146 146     146     139         147   x 146   x 145 145   x   x         138   x   x   x             133 126         133  kill col  3  Tbl  19 cols 010000100101111001010110101001111011111101110 has 126 unique lines.
 * 123     113 126 124 126   x 126 125   x 124   x   x   x   x 122 123     123     113         124   x 119   x 117 120   x   x         112   x   x   x             104             103  kill col  0  Tbl  18 cols 010000100101111001010110101001111011111101111 has 103 unique lines.
 *  98      90 102 101 103   x 103 102   x 101   x   x   x   x  99  99      97      90          99   x  95   x  94  94   x   x          92   x   x   x              81                  kill col  4  Tbl  17 cols 010000100101111001010110101001111011111111111 has  81 unique lines.
 *  77      69  80  79  81   x  81  80   x  78   x   x   x   x  76  78      75      71          77   x  75   x  74  74   x   x          72   x   x   x                                  kill col 42  Tbl  16 cols 011000100101111001010110101001111011111111111 has  69 unique lines.
 *  66          68  67  69   x  69  68   x  66   x   x   x   x  65  65      62      60          66   x  64   x  61  62   x   x          58   x   x   x                                  kill col 11  Tbl  15 cols 011000100101111001010110101001111111111111111 has  58 unique lines.
 *  55          57  56  58   x  58  57   x  55   x   x   x   x  55  54      51      50          54   x  52   x  47  51   x   x               x   x   x                                  kill col 17  Tbl  14 cols 011000100101111001010110101101111111111111111 has  47 unique lines.
 *  44          46  44  46   x  47  46   x  44   x   x   x   x  42  42      41      41          43   x  39   x      41   x   x               x   x   x                                  kill col 19  Tbl  13 cols 011000100101111001010110111101111111111111111 has  39 unique lines.
 *  36          38  36  38   x  39  38   x  36   x   x   x   x  34  34      33      34          35   x       x      34   x   x               x   x   x                                  kill col 26  Tbl  12 cols 011000100101111001110110111101111111111111111 has  33 unique lines.
 *  30          32  30  32   x  33  32   x  30   x   x   x   x  29  29              27          28   x       x      28   x   x               x   x   x                                  kill col 24  Tbl  11 cols 011000100101111001111110111101111111111111111 has  27 unique lines.
 *  24          26  24  25   x  26  26   x  24   x   x   x   x  23  24                          22   x       x      21   x   x               x   x   x                                  kill col 16  Tbl  10 cols 011000100101111001111110111111111111111111111 has  21 unique lines.
 *  19          20  18  19   x  20  20   x  18   x   x   x   x  17  17                          16   x       x           x   x               x   x   x                                  kill col 21  Tbl   9 cols 011000100101111001111111111111111111111111111 has  16 unique lines.
 *
 * Round 2: 100111011010000110000000000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  011000000000000001111111010110011100011111111 23 columns
 * Can even chose 1 more column to be represented directly.
 * Success. Use 2 EBRs, 20 LUTs.
 */

module v7_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 010011011111100000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 000010111111001111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 010011011111100010111110| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 1 3 000000101x10xxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 3 010000101110100011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   1 3 000000101x01xxx000000100| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     1 3 000001101111010000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 000001011111011000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     4 0 010011101111100001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 3 000001011111000010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     4 0 010011101111100001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    5 4 000000101110011010000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 3 000011101111001000000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    1 3 100011101x10xxx011100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    1 3 000011101x10xxx000010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 3 000000101110110011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     1 3 000011111111000010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 3 000011101111000000011010|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     1 3 0000xxxx1x0xxxx011111110|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  1 3 000011111111000000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  1 5 010000101111100000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  4 6 000011001111001000010110|        Branch on condition
    * 16 condb_5  Fetch    6 7 001011011001110011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  6 4 011011011111100001110100|        Branch taken.
    * 18 BEQ      condb_2  5 3 000011101110110000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 3 010010101110100001000001| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 3 3 000000101110011011100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    1 4 000000101101110000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 000010111101110010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 000000101110111011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 5 110010101011100011010100|        Q = 4
    * 1f IJ_2     IJ_3     5 3 000010101110110010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     7 8 010011011111100001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 000000101110000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  1 9 000010101111100100111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 1 3 000000101x10xxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   1 0 00001111010x110000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   1 3 000000101x01xxx000000100| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     4 3 000011101110000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 3 010000001111100000011101|        Q = rs2
    * 28 _L0x28   SH_1     4 8 010011101111100010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 3 000011101111000000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     4 8 010011101111100010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  1 5 0100xxxx1110100000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    1 3 000011101x0xxxx000111110| SLL    Shift left
    * 2d MULH_0   MULH_1   1 3 000010100111001001101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  4 3 100011111110110001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 3 3 000000101110110011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 a 000000101110110011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 3 000011111111000000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    5 3 010000101110100010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  5 3 01110010110x100010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    6 b 001011011101001011011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 3 000010110111001000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 3 000010110111101000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  5 6 0001xxxx1110001011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 000011101110110000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 100000101110001011100110|        Last shift.
    * 3a SRxI_1   SRxI_2   3 9 000010100111001100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    1 4 000000101101110000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  5 3 000001101110110001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 9 000010100111001100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 0 00001111010x001000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 0 00001111010x001000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 4 010011011111100001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 5 010011001111100000001011|        Q=1
    * 42 MULHU_2  MULHU_3  1 9 000010100111100101100000|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  1 3 000000001101000011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  1 3 000011111111010000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 5 010010101111100001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    5 3 00011010110x001001000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    5 3 001110101110001010001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     9 4 010011101111100001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 5 010000101111100001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     9 4 010011101111100001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 3 001110101101001010110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   1 3 000011101x10xxx000110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  5 3 000011100110001000101110| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     1 3 0000xxxx1x0xxxx011111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 5 010010101111100011100110|        Prep +4
    * 50 LW_1     StdIncPc 3 c 000010111110001011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   5 3 001110101101110011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 000010111111001101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   5 3 001110101101110011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     b 9 000010100111001111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 5 3 001110101110110000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 000010001111011001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 3 000010001111000010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 9 110010111111001101101110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 000011111110110010011100|        REM = Q to yy
    * 5a SB_1     SB_2     5 3 000010110111001001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    1 4 000000101101110000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  5 3 000001101110110001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     c 3 000010110111101011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 000010111111001101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   5 3 001110101101110011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 100011111111001001000010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 4 6 000001101110010011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 DIV_8    DIV_7    1 5 010010110111100011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    d 5 010010111111100001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  1 3 000011111111010000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    1 6 000000101x10xxx011101111|        Prepare read PC
    * 66 SW_1     SW_2     e 3 001111101101001011110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    5 3 00110010110x110010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 000000101110001011100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     1 3 000010101111000010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 000010101110000011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     9 3 001011001111001001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   1 3 000011101x10xxx000110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  5 3 000011100110001000101110| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    5 3 000011101101001010111001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   1 5 0100xxxx1111100011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    b 9 000010100111001110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 5 3 001110101110110000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 3 000001101111010000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  5 3 001111001110001001110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   1 d 000010111110110011110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  1 3 000000101x0xxxx001110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 3 000000101111000001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  5 5 01011010110x100001111101|        origPC to mepc. Prep read 0
    * 78 DIV_4    DIV_6    5 3 000000001110110010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    1 5 110010101111100010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     e 3 001011001101001011110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    1 4 000000101101110000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  5 3 000001101110110001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    f 3 00101001110x001000110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    5 3 0001xxxx1110001010010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  5 3 00111010110x001001111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0 010011011111100010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  5 3 00011010110x001001111101|        Store PC to mepc
    * 82 DIV_1    DIV_3    4 3 000011101110000010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    1 3 010010101111100010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   1 3 000011111111010000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 000010111111001111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   3 5 11000010100x100010011110|        Return address to TRG
    * 87 JALRE1   JALRE2   5 3 00011100110x001001111111|  err   Store pc to mepc
    * 88 DIV_E    DIV_10   d 3 100011111x0xxxx010011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 000000101110110011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   1 9 110010111x10xxx100011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 3 5 110000101110100011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    1 3 000011111x10xxx000101001| XOR    xor
    * 8d DIV_0    DIV_1    d 3 100010110111001010000010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     1 3 0000xxxx1x0xxxx011111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    1 5 000010101111100010101001|        Q = 1
    * 90 NMI_2    JAL_3    f 3 001101001110110000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   f 5 11100010100x100010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    5 3 00011001110x001000110100|        PC to mepc
    * 93 SW_E2    SW_E3    5 3 000110111110001010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    f 3 00101001110x101000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 5 110010111011100010010100|        Q = 3
    * 96 SH_1     SH_2     5 3 000010110111001010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    5 3 00110010110x110010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 000011101110110000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     1 3 0000xxxx1x0xxxx011111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    f 3 01101001100x100000110100|        mcause = 11
    * 9b SH_4     SH_5     9 3 000111001111001010011111|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   d 3 100011001110001001101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   d 3 100011001110001010100010|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    4 3 00001100110x001000110100|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     e 3 000111001101001011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    7 8 010011011111100001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  1 5 110010101011100010110110|        Q = 4
    * a2 DIV_14   LB_6     1 3 000010101111000010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 3 3 000000101110001011100110|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   1 0 00001111010x110000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 5 010001101111100010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 4 000010111101110011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 3 0100xxxx1111100001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    d 3 100010101111000001111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    f 5 01101001110x100000110100|        Store 2 to mcause
    * aa DIV_6    DIV_7    1 3 100010111x10xxx011001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  5 3 000110101110001010011010|        pc to mepc
    * ac _L0xac   SRx_1    1 3 000011101x0xxxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   1 3 100011100x10xxx011100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    1 3 000011101x0xxxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 5 0100xxxx1111100011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   f 3 01100010100x100010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  1 5 110010101011100010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 7 110011011001100011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             e 0 00xxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3           4 5 010111111111100000000000|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     1 3 000000001110110010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  1 5 110010101011100010011010|        Q = 8
    * b7 IJ_3     IJ_4     1 3 010011001011100010111101|        Construct Q = 3
    * b8 BGE      condb_2  5 3 000011101110110000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    1 5 000011001111000011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   1 3 000001111111010000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     c 3 000010110111101010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 000001101110110001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    0 b 000011011101011011011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 b 000010111111001000011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 b 000010111111001011000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 6 000011101111001010001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 000010101110110011101001|        Read word is to be masked with ~3u
    * c2 DIVU_3   DIVU_2   1 5 010010110111100011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   d 5 010010111111100010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    4 3 000011111110010011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 3 000000001111010001101111|        ~302
    * c6 IJT_4    ILL_2    5 3 000110101111011001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   5 3 0001xxxx1110001011001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 e 100011001111101001100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   1 3 010001101011100010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 e 100011001111101011000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc f 3 001101001110110011100110|        mtval = 0.
    * cc OR_0     OR_1     1 3 000011111x10xxx000100110| OR     or
    * cd REM_0    DIV_1    d 3 100010110111001010000010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     1 3 0000xxxx1x0xxxx011111110| Illegal instruction seen
    * cf MRET_7   MRET_8   1 6 000001101x10xxx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 5 010000101111100000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 3 000001101110110011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     b 9 000010100111001100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 5 3 001110101110110000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   f 5 01100010110x100010010010|        Store 5 to mcause
    * d5 unxd5             e 0 00xxxxxxxxxxxxxxxxxxxxxx| d5: Not in use
    * d6 eILL0c   ILLe     1 3 0000xxxx1x0xxxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  5 3 001110101110110010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 000011101110110000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  1 3 100011111x10xxx001000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   1 3 000010101x10xxx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 5 01100000110x100010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 000001101110110001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  5 3 001110101110110011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 d 001010111110110011110100|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   4 d 001010111110110011110100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 000010111110000011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 000000001111001000011101|        Q = RS1
    * e2 MUL_1    MUL_2    1 9 000010100111100111101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   1 9 110010111x10xxx100011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   1 3 000011111111010000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 5 110010101011100010110000|        Q = 4
    * e6 StdIncPc Fetch    6 7 110011011001100011011110|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 5 3 001110101110110000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 100011101111001011100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    1 3 010011001011100011000110|        Construct Q = 3
    * ea MULHU_5  MULHU_6  1 3 000011001111100000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     1 3 000001111111010001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    1 3 000011111x10xxx000010001| AND    And 
    * ed REMU_0   DIVU_1   1 3 100011100x10xxx011100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     1 3 0000xxxx1x0xxxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    6 7 111011011001100011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    b 9 000010100111001101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 5 3 001110101110110000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 1 3 000000101x10xxx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 3 0000xxxx1x01xxx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  4 f 011100011110100010110100|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 5 3 001110101110110011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 5 110000001011100011111010| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 5 3 001100101110110010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 000011101110110000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   4 5 010011101110100011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    1 5 010010101111100001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     1 3 000000001110110001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 000001101110110001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    1 3 000000101x10xxx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    1 3 000000101x0xxxx001000110| Illegal
    * ff QINT_0   QINT_1   1 3 000000101x10xxx011000111| INT    Get current PC
    */
   localparam u0_0 = 256'hece6a010a0e2f204e686f85af08bf85af609f4079004e8e6a0e6f8bef3d2f801;
   localparam u0_1 = 256'hecb7b8d4eee6dca6dc32e6e6e841ec13f8749cdef216f815f01480fef01af08b;
   localparam u0_2 = 256'hece6ec42726a803ee830f896f021f896f81de02790044c35a0e6f939e0e6f852;
   localparam u0_3 = 256'h423a42357303ec49dc32733de2e6ec13e2d77a037236d2dec881e886f02bece6;
   localparam u0_4 = 256'hf8e680fe622ea031d2b1f866f84bf866e28fc247f865f42bd0ea7960f80bf850;
   localparam u0_5 = 256'hdcdaf3707afbec49dc32725dec9cf36ef08bf657ec1e73ebdcdaf354dcdae2e6;
   localparam u0_6 = 256'hf8cfd2b9622ea031f27ae0f9f08be2e6cc93d2f2a0eff42bf85878c8e4f7f242;
   localparam u0_7 = 256'hc27de290c234ec49dc32d2f2f8a8ecaac87df0778073ecf4e276f41aec1e73ba;
   localparam u0_8 = 256'hf8a980fe7282a029e8e6a11aece6809cc27f889ef3f0f421f882e0a8c27df885;
   localparam u0_9 = 256'hd2f2c234e2a2e268f29f883480feec13cc9372bbb894ca34e295c2348892ec34;
   localparam u0_A = 256'hf8c5803f20e0803fe29aa0c8c834f078f861dcd0f8af4c3ae2e6f08bb8b6f85e;
   localparam u0_B = 256'hf2c1f21fd6deec497ab5f41af0c0ec13b8bdb89aec9bf800000098deb8b28892;
   localparam u0_C = 256'ha04f80fe7282a026ece6fac2b8a5fa62e2cbf647f46fe4e1f88a78caece9f288;
   localparam u0_D = 256'hecf4ecf4ece5ec49c892a091a042ec13eca180fe0000c892ec1e7306ecc9f837;
   localparam u0_E = 256'h98de80fe20e0a011f456f822b8c6f2e2ec1e98deb8b0f41aa11a79e8f21de0ca;
   localparam u0_F = 256'ha0c78046a07eec49ec6bf845e8d9ec13ecabb8faecdbe8b490dda0e6ec1e7372;
   localparam u1_0 = 256'h3302130e138e130e5402404e1305404e13051306130233421302224d110b004d;
   localparam u1_1 = 256'h530a15ca3302120b14023302534a530e646d672d460c1542130f1300130e130f;
   localparam u1_2 = 256'h3302438f130a130e1540484e130e484e1340430e1302100f1302190a3302784d;
   localparam u1_3 = 256'h100f100f890a53061402390a3382530e5610830b330b6b2d53725342130f3a02;
   localparam u1_4 = 256'h154a1300530e130ea33a944e1542944e533a531a154a130f1300190a154c044d;
   localparam u1_5 = 256'h533a110bc30b53061402530b530f19cb13081308533ab90a533a110b533a3c0b;
   localparam u1_6 = 256'h1540530e530e130e932c530a130a33025332e33e1602130fd54b154b4606138f;
   localparam u1_7 = 256'h533a5310f32953061402e32c15ca5300555a130213021d0b533c1306533ab90a;
   localparam u1_8 = 256'h150a1300d38b130f35c219cb3302d38f531c35c2110b130f134a430e531a004d;
   localparam u1_9 = 256'he31c430cd38cd38c931cf3691300530e5332530b15cbf329531b5319f5e2f334;
   localparam u1_A = 256'h1540130e138e130e531a138bf569d38a1340140b1546100f3302130a15ca784d;
   localparam u1_B = 256'h1b0b1b0b0b0d5306c30b1307150c530e134c15ca1300455fe00067cd15caf362;
   localparam u1_C = 256'h16061300d38b130ff3341e8c13461e8c5310531a1300430fd54b154b530a160e;
   localparam u1_D = 256'h4d2b4d2b533a53065560130a138f530e533a1300e000f562533ab90a43061542;
   localparam u1_E = 256'h67ed1300138e130f1307130c134c138e533a67cd15ca130f19cb190a1300530b;
   localparam u1_F = 256'h13021302130253061300154a454e530e533215c0533a4f7113001302533ab90a;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[8] = indir[8];
   assign d[11] = indir[9];
   assign d[12] = indir[10];
   assign d[13] = indir[11];
   assign d[16] = indir[12];
   assign d[17] = indir[13];
   assign d[19] = indir[14];
   assign d[21] = indir[15];
   assign d[22] = indir[16];
   assign d[23] = indir[17];
   assign d[24] = indir[18];
   assign d[25] = indir[19];
   assign d[26] = indir[20];
   assign d[27] = indir[21];
   assign d[42] = indir[22];
   assign d[43] = indir[23];
   // replaces = 000000100101110000000000101001100011000000000
   SB_LUT4 #(.LUT_INIT(16'h04a0)) cmb_d09(.O(d[9]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h40a0)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfefe)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0114)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3882)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 100111011010000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h91a8)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h90f0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1900)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8400)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2a07)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h02c5)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d44(.O(d[44]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instrxxxx0100,instr1011xxxx,instr10110100;          bn_l4v #(.I(16'h0010)) leq0100(     .o(instrxxxx0100),     .i({minx[3:0]}));  bn_l4v #(.I(16'h0800)) leq1011(     .o(instr1011xxxx),     .i({minx[7:4]}));  bn_l4v #(.I(16'h8888)) leq1x110100( .o(instr10110100), .i({2'b0,instr1011xxxx,instrxxxx0100}));   SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr10110100));
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   No MULDIV
 *   minstret not implemented
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 43 columns
 * Removed:  0000000000001000000000001000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 43
 * 167 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 166 167 167 167 167 167 167 167 167 167 167 167   x 167 167 167 167 166 167 166 166 167 167 165   x 167 167 167 167 165 164 166 167 166 167 166 167 166 167 167 166 166 166  kill col 12  Tbl  40 cols 0000000000001000000000001000001000000000000 has 164 unique lines.
 * 163 164 164 164 164 164 164 164 164 164 164 164   x 164 164 164 164 162 164 163 161 164 164 162   x 164 164 164 164 162     162 163 163 164 163 164 163 164 164 163 163 163  kill col 22  Tbl  39 cols 0000000000001000000010001000001000000000000 has 161 unique lines.
 * 160 161 161 161 161 161 161 161 161 161 161 161   x 161 161 161 161 160 161 160     161 161 159   x 161 161 161 161 159     159 160 160 161 160 160 159 161 161 160 160 159  kill col 19  Tbl  38 cols 0000000000001000000010011000001000000000000 has 159 unique lines.
 * 158 159 159 159 159 159 159 159 159 159 159 159   x 159 159 159 159 158 159 158     159 159       x 159 159 159 159 157     156 158 158 159 158 158 157 159 159 158 158 157  kill col 11  Tbl  37 cols 0000000000001000000010011000001100000000000 has 156 unique lines.
 * 155 156 156 156 156 156 156 156 156 156 156 156   x 156 156 156 156 155 156 155     156 156       x 156 156 156 156 150         155 155 156 155 155 154 155 156 155 155 154  kill col 13  Tbl  36 cols 0000000000001000000010011000011100000000000 has 150 unique lines.
 * 149 150 150 150 150 150 150 150 150 150 150 150   x 150 150 150 150 149 150 149     150 150       x 150 150 150 150             149 149 149 149 149 148 149 150 149 149 148  kill col  5  Tbl  35 cols 0000000000001000000010011000011100000100000 has 148 unique lines.
 * 147 148 148 148 148 148 148 148 148 148 148 148   x 148 148 148 148 147 148 147     148 148       x 148 148 148 148             147 147 147 145 147     147 147 145 145 145  kill col  7  Tbl  34 cols 0000000000001000000010011000011100010100000 has 145 unique lines.
 * 144 145 145 145 145 145 145 145 145 145 145 145   x 145 144 145 145 144 144 144     145 145       x 144 145 145 145             144 144 144     144     144 143 141 140 142  kill col  1  Tbl  33 cols 0000000000001000000010011000011100010100010 has 140 unique lines.
 * 139 140 140 140 140 140 140 140 140 140 140 140   x 140 139 140 140 139 139 139     140 140       x 139 138 140 140             139 139 139     138     139 136 137     137  kill col  3  Tbl  32 cols 0000000000001000000010011000011100010101010 has 136 unique lines.
 * 135 136 136 136 136 136 136 136 136 136 136 136   x 136 135 136 135 134 135 135     136 136       x 135 132 135 136             135 135 135     132     133     129     133  kill col  2  Tbl  31 cols 0000000000001000000010011000011100010101110 has 129 unique lines.
 * 128 129 129 129 129 129 129 129 127 129 129 129   x 129 128 128 128 125 127 124     129 129       x 126 124 128 128             128 128 128     118     119             121  kill col  6  Tbl  30 cols 0000000000001000000010011000011100011101110 has 118 unique lines.
 * 117 118 118 118 118 118 118 118 117 118 118 117   x 118 117 115 117 112 114 113     118 118       x 114 112 117 117             117 117 117             102             106  kill col  4  Tbl  29 cols 0000000000001000000010011000011100011111110 has 102 unique lines.
 * 100 102 102 102 102 102 102 102 100 102 101 101   x 101 100  99 101  95  98  97     102 102       x  96  96 101  99             101 101 101                              87  kill col  0  Tbl  28 cols 0000000000001000000010011000011100011111111 has  87 unique lines.
 *  85  87  87  87  87  87  87  87  84  87  86  86   x  85  85  85  86  81  83  82      87  87       x  81  80  86  83              86  86  85                                  kill col 16  Tbl  27 cols 0000000000001000000010011010011100011111111 has  80 unique lines.
 *  78  80  80  80  80  80  80  80  77  79  79  79   x  78  78  77  79  73  75  74      79  79       x  74      79  76              79  79  78                                  kill col 25  Tbl  26 cols 0000000000001000010010011010011100011111111 has  73 unique lines.
 *  71  73  73  73  73  73  73  73  70  72  72  71   x  70  72  70  71      67  63      71  72       x  66      72  69              72  72  71                                  kill col 23  Tbl  25 cols 0000000000001000010110011010011100011111111 has  63 unique lines.
 *  61  62  63  63  63  63  63  63  60  62  62  61   x  60  62  60  60      58          61  62       x  57      62  59              62  62  61                                  kill col 17  Tbl  24 cols 0000000000001000010110011110011100011111111 has  57 unique lines.
 *  55  56  57  57  57  57  57  57  54  56  56  55   x  53  56  55  55      53          55  56       x          56  53              56  56  55                                  kill col 29  Tbl  23 cols 0000000000001100010110011110011100011111111 has  53 unique lines.
 *  51  52  53  50  53  53  53  53  51  52  52  51   x      52  50  50      48          52  52       x          52  49              52  52  51                                  kill col 24  Tbl  22 cols 0000000000001100011110011110011100011111111 has  48 unique lines.
 *  46  47  47  44  48  47  48  48  46  47  47  46   x      45  44  43                  46  47       x          46  45              47  47  46                                  kill col 26  Tbl  21 cols 0000000000001100111110011110011100011111111 has  43 unique lines.
 *  41  42  42  39  43  42  43  43  41  42  42  41   x      41  39                      41  42       x          41  41              42  42  41                                  kill col 39  Tbl  20 cols 0001000000001100111110011110011100011111111 has  39 unique lines.
 *  37  38  37      39  38  39  39  37  38  38  37   x      34  35                      37  37       x          38  37              38  38  37                                  kill col 28  Tbl  19 cols 0001000000001110111110011110011100011111111 has  34 unique lines.
 *  32  33  31      33  33  33  34  32  33  33  31   x          31                      32  31       x          33  33              33  33  32                                  kill col 40  Tbl  18 cols 0011000000001110111110011110011100011111111 has  31 unique lines.
 *  29  28          30  30  29  31  29  28  30  29   x          27                      29  28       x          30  30              30  30  29                                  kill col 27  Tbl  17 cols 0011000000001111111110011110011100011111111 has  27 unique lines.
 *  25  25          26  26  25  27  25  24  26  25   x                                  25  24       x          26  26              26  26  25                                  kill col 33  Tbl  16 cols 0011000001001111111110011110011100011111111 has  24 unique lines.
 *  23  22          23  23  22  24  22      23  22   x                                  22  21       x          23  23              23  23  22                                  kill col 20  Tbl  15 cols 0011000001001111111110111110011100011111111 has  21 unique lines.
 *  20  19          20  20  19  21  19      20  20   x                                  20           x          20  20              20  20  19                                  kill col 41  Tbl  14 cols 0111000001001111111110111110011100011111111 has  19 unique lines.
 *  18              18  18  17  19  17      18  18   x                                  18           x          18  18              18  18  17                                  kill col 36  Tbl  13 cols 0111001001001111111110111110011100011111111 has  17 unique lines.
 *  16              16  15      17  15      16  16   x                                  16           x          16  16              16  16  15                                  kill col 37  Tbl  12 cols 0111011001001111111110111110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 8 14 31 34 
 *
 * Round 1: 1000100110110000000001000001100011100000000  4 columns for indexes to table representing 12 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 35
 * 162 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 162 162 162   x 162 162   x   x 162   x   x   x 162 162 162 162 161 162 161 161   x 162 159   x 162 162   x   x 160 159 160   x   x   x 161 162 161 162 162 161 161 161  kill col 19  Tbl  28 cols 1000100110111000000001011001100011100000000 has 159 unique lines.
 *   x 159 159 159   x 159 159   x   x 159   x   x   x 159 159 159 159 158 159 158 158   x 159       x 159 159   x   x 157 156 157   x   x   x 158 159 158 159 159 158 158 158  kill col 12  Tbl  27 cols 1000100110111000000001011001101011100000000 has 156 unique lines.
 *   x 156 156 156   x 156 156   x   x 156   x   x   x 156 156 156 156 154 156 155 153   x 156       x 156 156   x   x 154     153   x   x   x 155 156 155 156 156 155 155 155  kill col 22  Tbl  26 cols 1000100110111000000011011001101011100000000 has 153 unique lines.
 *   x 153 153 153   x 153 153   x   x 153   x   x   x 153 153 153 153 152 153 152       x 153       x 153 153   x   x 150     150   x   x   x 152 152 151 153 153 152 152 151  kill col 13  Tbl  25 cols 1000100110111000000011011001111011100000000 has 150 unique lines.
 *   x 150 150 150   x 150 150   x   x 150   x   x   x 150 150 150 150 149 150 149       x 150       x 150 150   x   x         143   x   x   x 149 148 148 150 150 149 149 148  kill col 11  Tbl  24 cols 1000100110111000000011011001111111100000000 has 143 unique lines.
 *   x 143 143 143   x 143 143   x   x 143   x   x   x 143 143 143 143 142 143 142       x 143       x 143 143   x   x               x   x   x 142 141 140 142 142 142 142 141  kill col  5  Tbl  23 cols 1000100110111000000011011001111111100100000 has 140 unique lines.
 *   x 140 140 140   x 140 140   x   x 139   x   x   x 140 140 140 140 139 140 139       x 140       x 140 139   x   x               x   x   x 136 138     139 139 137 137 136  kill col  7  Tbl  22 cols 1000100110111000000011011001111111110100000 has 136 unique lines.
 *   x 136 136 136   x 136 136   x   x 134   x   x   x 136 135 136 136 134 133 135       x 136       x 134 134   x   x               x   x   x     133     134 133 130 131 132  kill col  2  Tbl  21 cols 1000100110111000000011011001111111110100100 has 130 unique lines.
 *   x 130 130 130   x 130 130   x   x 127   x   x   x 130 129 129 130 126 127 126       x 129       x 126 127   x   x               x   x   x     126     128 126     124 125  kill col  1  Tbl  20 cols 1000100110111000000011011001111111110100110 has 124 unique lines.
 *   x 124 124 124   x 124 124   x   x 122   x   x   x 123 123 123 124 120 119 118       x 123       x 120 116   x   x               x   x   x     116     118 112         119  kill col  3  Tbl  19 cols 1000100110111000000011011001111111110101110 has 112 unique lines.
 *   x 112 111 112   x 112 112   x   x 110   x   x   x 111 111 111 111 108 106 105       x 110       x 106 103   x   x               x   x   x     102      99             100  kill col  4  Tbl  18 cols 1000100110111000000011011001111111110111110 has  99 unique lines.
 *   x  99  98  99   x  99  99   x   x  96   x   x   x  98  97  97  97  91  91  89       x  97       x  91  89   x   x               x   x   x      81                      84  kill col  6  Tbl  17 cols 1000100110111000000011011001111111111111110 has  81 unique lines.
 *   x  81  80  81   x  81  80   x   x  79   x   x   x  80  79  78  79  72  73  73       x  79       x  73  69   x   x               x   x   x                              64  kill col  0  Tbl  16 cols 1000100110111000000011011001111111111111111 has  64 unique lines.
 *   x  64  63  64   x  64  63   x   x  62   x   x   x  63  62  62  62  56  56  57       x  62       x  57  54   x   x               x   x   x                                  kill col 16  Tbl  15 cols 1000100110111000000011011011111111111111111 has  54 unique lines.
 *   x  54  53  54   x  54  53   x   x  52   x   x   x  53  52  51  53  45  47  48       x  51       x  47       x   x               x   x   x                                  kill col 25  Tbl  14 cols 1000100110111000010011011011111111111111111 has  45 unique lines.
 *   x  45  44  45   x  45  44   x   x  42   x   x   x  44  43  42  43      40  38       x  42       x  38       x   x               x   x   x                                  kill col 23  Tbl  13 cols 1000100110111000010111011011111111111111111 has  38 unique lines.
 *   x  37  37  38   x  38  37   x   x  35   x   x   x  37  36  33  34      34           x  35       x  32       x   x               x   x   x                                  kill col 17  Tbl  12 cols 1000100110111000010111011111111111111111111 has  32 unique lines.
 *   x  31  30  32   x  32  31   x   x  29   x   x   x  30  30  27  29      29           x  29       x           x   x               x   x   x                                  kill col 27  Tbl  11 cols 1000100110111001010111011111111111111111111 has  27 unique lines.
 *   x  26  25  26   x  27  26   x   x  24   x   x   x  24  25      23      24           x  24       x           x   x               x   x   x                                  kill col 26  Tbl  10 cols 1000100110111001110111011111111111111111111 has  23 unique lines.
 *   x  22  21  22   x  23  22   x   x  20   x   x   x  21  21              19           x  20       x           x   x               x   x   x                                  kill col 24  Tbl   9 cols 1000100110111001111111011111111111111111111 has  19 unique lines.
 *   x  18  16  17   x  18  18   x   x  16   x   x   x  16  17                           x  15       x           x   x               x   x   x                                  kill col 20  Tbl   8 cols 1000100110111001111111111111111111111111111 has  15 unique lines.
 *
 * Round 2: 0111011001000110000000000000000000000000000  4 columns for indexes to table representing  8 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0000000000000001111110110110011100011111111 21 columns
 * Can even chose 3 more columns to be represented directly.
 * Success. Use 2 EBRs, 17 LUTs.
 */

module v8_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 001101011110000000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 0010111111001xx111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 001101111110000010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 0 0000101x10xxxxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 4 0 000010111010000011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   3 0 0000001x01xxxxx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     3 0 0001101111010xx000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     3 0 0001011111011xx000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     5 0 001110011110000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     3 0 0001011111000xx010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     5 0 001110011110000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   3 3 000010111110011000110011|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   3 0 0011101111001xx000000100| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 4 0 000010111011000011100110| LUI    q = imm20
    * 0e SUB_0    SUB_1    3 0 0011101x10xxxxx000010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 4 0 000010111011000011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     3 0 0011111111000xx010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   3 0 0011101111000xx000011010|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   6 4 101101100110011001110110|  Fr00u IncPC, OpFetch
    * 13 condb_2  condb_3  3 0 0011111111000xx000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  3 3 001100111110011000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  3 5 0000001111001xx000010110|        Branch on condition
    * 16 condb_5  StdIncPc 3 0 0000001x10xxxxx011100110|        Branch not taken.
    * 17 condb_5t condb_6t 7 0 0000001101001xx001111101|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  7 0 001110111011000000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 0 100000110x10000001000001| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 4 0 0000101110011xx011100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 0 0000001x01xxxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 3 2 001011110111000010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 4 0 000010111011100011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 3 001010101110011011010100|        Q = 4
    * 1f IJ_2     IJ_3     5 0 100000110111000010110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     8 2 001101011110000001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 0 0000101110000xx011100110|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 3 0 0000101x10xxxxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   3 6 001111010x11000000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   3 0 0000001x01xxxxx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     5 0 0011101110000xx000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    3 0 000000111110000000011101|        Q = rs2
    * 28 _L0x28   SH_1     5 2 001110011110000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   3 0 0011101111000xx000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     5 2 001110011110000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 3 00xxxx111010011000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 0 0011101x0xxxxxx000111110| SLL    Shift left
    * 2d _L0x2d   StdIncPc 4 0 000010111011000011100110| LUI    q = imm20
    * 2e unx2e             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 4 0 000010111011000011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 7 000010111011001011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  3 0 0011111111000xx000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    7 0 0000001101001xx010000110|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   5 0 1000001110011xx010011110|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    6 0 1011011101001xx011011110|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   4 6 0010111111001xx000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   4 8 001011111110100000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  7 5 01xxxx1110001xx011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  7 0 001110111011000000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   4 9 0010101111001xx100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 0 0000001x01xxxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  7 0 000110111011000001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   4 a 0010101111001xx100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   3 6 001111010x001xx000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   3 6 001111010x001xx000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 b 001101111110000001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   7 0 0010101110001xx000001011|        yy=jj. Prep get Q=1
    * 42 _L0x42   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  3 0 0011111111010xx000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    3 3 001010111110011001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    7 0 011010110x001xx001000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    7 0 1110101110001xx010001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     a b 001110111110000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  3 3 000010111110011001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     a b 001110111110000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  b 0 1110101101001xx010110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 0 0011101x10xxxxx000110001| SLT    Set less than (signed)
    * 4d unx4d             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     3 0 00xxxx1x0xxxxxx011111110| Illegal instruction seen
    * 4f MRET_8   MRET_9   3 3 001010101110011001110100|        +4, so now 0x103
    * 50 LW_1     StdIncPc c c 0010111110001xx011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   7 0 111010110111000011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 0010111111001xx101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   7 0 111010110111000011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     3 a 0010101111001xx111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 7 0 111010111011000000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     3 0 0010001111011xx001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     3 0 0010001111000xx010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     7 6 0010111111001xx001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 0 0000001x01xxxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  7 0 000110111011000001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 8 001011111110100011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 0010111111001xx101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   7 0 111010110111000011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 7 5 0001101110010xx011110111| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 _L0x62   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  3 0 0011111111010xx000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 5 0000001x10xxxxx011101111|        Prepare read PC.
    * 66 SW_1     SW_2     9 0 1111101101001xx011110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    7 0 110010110x11000010010011|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 69 unx69             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     a 0 1011001111001xx001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 0 0011101x10xxxxx000110001| SLTU   Set less than (unsigned)
    * 6d unx6d             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   3 3 00xxxx111110011011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    3 a 0010101111001xx110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 7 0 111010111011000000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   3 0 0001101111010xx000011010|        Invert q. Prepare read mask
    * 73 unx73             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 73: Not in use 
    * 74 MRET_9   Fetch    6 3 101101110110011011011110|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    6 0 1011011101011xx011011110|        Mask and use as PC
    * 76 Fetchu   Fetch2   3 d 000011111011000011110100|  Fr00u Read and latch instruction
    * 77 eFetchu  Fetch2   1 e 001011111011000011110100|  Fr00u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 _L0x78   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     9 0 1011001101001xx011110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 0 0000001x01xxxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  7 0 000110111011000001001001| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    6 0 101101110110000011011110|        Branch taken.
    * 7e NMI_1    NMI_2    7 0 01xxxx1110001xx010010000|        Store pc to mepc.
    * 7f unx7f             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 001101011110000010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 _L0x82   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   3 0 0011111111010xx000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 0010111111001xx111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   5 0 100000111010000010011110|      Prep pc = jj + ofs
    * 87 unx87             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 _L0x88   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 89 unx89             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 4 3 000010111010011011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 0 0011111x10xxxxx000101001| XOR    xor
    * 8d unx8d             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     3 0 00xxxx1x0xxxxxx011111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    3 3 001010111110011010101001|        Q = 1
    * 90 NMI_2    JAL_3    d 0 110100111011000000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   d 3 100010100x10011010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    7 0 011001110x001xx000110100|        PC to mepc
    * 93 SW_E2    SW_E3    7 0 0110111110001xx010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    d 0 101001110x10100000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 3 001011101110011010010100|        Q = 3
    * 96 SH_1     SH_2     7 6 0010111111001xx010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    7 0 110010110x11000010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  7 0 001110111011000000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    d 0 101001100x10000000110100|        mcause = 11
    * 9b SH_4     SH_5     a 0 0111001111001xx010011111|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * 9d unx9d             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    4 4 000010101010011000110100|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     9 0 0111001101001xx011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    8 2 001101011110000001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  3 3 001010101110011010110110|        Q = 4
    * a2 _L0xa2   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   3 6 001111010x11000000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   3 3 000110111110011010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 b 001011110111000011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 3 0 00xxxx111110000001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    d 3 101001110x10011000110100|        Store 2 to mcause
    * aa _L0xaa   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  7 0 0110101110001xx010011010|        pc to mepc
    * ac _L0xac   SRx_1    3 0 0011101x0xxxxxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad unxad             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    3 0 0011101x0xxxxxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   3 3 00xxxx111110011011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   d 0 100010100x10000010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  3 3 001010101110011010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 3 101101100110011011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 ic0reser          9 6 xxxxxxxxxxxxxxxxxxxxxxxx|  Fr00  Not really used, reserved to allow LASTINCH
    * b5 SH_3     SH_4     3 0 000000111011000010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  3 3 001010101110011010011010|        Q = 8
    * b7 IJ_3     IJ_4     7 0 0010101110001xx010111101|        Store present PC in case of access error
    * b8 BGE      condb_2  7 0 001110111011000000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   3 0 0001111111010xx000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     7 8 001011111110100010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  7 0 000110111011000001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     3 3 000010111110011001110101|        Construct Q = 1
    * be IJ_1     IJ_2     1 0 0010111111001xx000011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 0 0010111111001xx011000001|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    7 0 001010111011000011101001|        Read word is to be masked with ~1u
    * c2 _L0xc2   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    5 0 0011111110010xx011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   3 0 0000001111010xx001101111|        ~302
    * c6 IJT_4    ILL_2    7 0 0110101111011xx001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   7 0 01xxxx1110001xx011001011|        Store pc to mepc.
    * c8 _L0xc8   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   3 0 000110101110000010100101|        0xff+3 = 0x102
    * ca _L0xca   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc d 0 110100111011000011100110|        mtval = 0.
    * cc OR_0     OR_1     3 0 0011111x10xxxxx000100110| OR     or
    * cd unxcd             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     3 0 00xxxx1x0xxxxxx011111110| Illegal instruction seen
    * cf MRET_7   MRET_8   3 5 0001101x10xxxxx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  3 3 000000111110011000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   5 0 000110111011000011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     3 a 0010101111001xx100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 7 0 111010111011000000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   d 3 100010110x10011010010010|        Store 5 to mcause
    * d5 unalignd straddle 3 0 000010111011000000010010|  Fr00u Unaligned pc, prep read high hword
    * d6 eILL0c   ILLe     3 0 00xxxx1x0xxxxxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  7 0 111010111011000010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  7 0 001110111011000000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   3 0 0010101x10xxxxx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   7 3 101100110x10011010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  7 0 000110111011000001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  7 0 111010111011000011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   5 d 000011111011000011110100|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   e e 001011111011000011110100|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    3 0 0000001111001xx000011101|        Q = RS1
    * e2 _L0xe2   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   3 0 0011111111010xx000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 3 001010101110011010110000|        Q = 4
    * e6 StdIncPc Fetch    6 4 101101100110011011011110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 7 0 111010111011000000011110|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    3 3 001100111110011011000110|        Construct Q = 1
    * ea _L0xea   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * eb LH_3     LH_4     3 0 0001111111010xx001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 0 0011111x10xxxxx000010001| AND    And 
    * ed unxed             9 6 xxxxxxxxxxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     3 0 00xxxx1x0xxxxxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    6 3 101101100110011011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    3 a 0010101111001xx101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 7 0 111010111011000000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 0 0000101x10xxxxx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 0 00xxxx1x01xxxxx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd 5 0 111111111110000011010101|  Fr00  Upd ttime, I. Q=imm Use dinx unless unaligned 
    * f5 jFault   jFault_1 7 0 111010111011000011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 3 001100101110011011111010| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 7 0 110000111011000010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  7 0 001110111011000000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     3 0 00xxxx1x0xxxxxx011111110|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    3 3 001010111110011001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     3 0 000000111011000001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  7 0 000110111011000001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 0 0000101x10xxxxx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 0 0000101x0xxxxxx001000110| Illegal
    * ff QINT_0   QINT_1   3 0 0000101x10xxxxx011000111| INT    Get current PC
    */
   localparam u0_0 = 256'hb0e68010b0e6c804e633e05ac08be05ad809d0074004a0e680e6e0bec9d2e001;
   localparam u0_1 = 256'h70b7e6d4b8e670a6403298e62041b013487d80e6c816e615c0146676c01ac08b;
   localparam u0_2 = 256'hb0e60000b0e6003ea630e096c021e096e01d80274004303580e600fe80e6e052;
   localparam u0_3 = 256'h083a0835c903b0494032c93d00feb01388d7e803c83648de989e4886c02bb2e6;
   localparam u0_4 = 256'he67400fe0000803148b1e066e64be066888f0847e665d02b00fe00fe880be050;
   localparam u0_5 = 256'h70dac970e8fbb0494032c85d00fe00fec08bd857b01ec9eb70dac95470da88e6;
   localparam u0_6 = 256'he6cf000000008031c87a00fe000000fe309348f280efd02b00fe00fe90f700fe;
   localparam u0_7 = 256'h0000889060deb049403248f200fe00feb0f4b0f458de66de0000d01ab01ec9ba;
   localparam u0_8 = 256'he6a900fe00008029a6e600fe000000fe0000a09ec9f0d02100fe00fe0000e085;
   localparam u0_9 = 256'h48f2a634000000fec89f203400feb0133093c8bbe6942834889508342692b034;
   localparam u0_A = 256'he6c5003f0000003f889a00fe263400fee06170d0e6af303a00fe00fee6b6e05e;
   localparam u0_B = 256'hc8c1c81fe675b049e8b5d01a00feb01388bde69ab09b0000000066dee6b22092;
   localparam u0_C = 256'h804f00fe00008026b0e600fee0a500fe88cbd847d06f90e100fe00feb0e900fe;
   localparam u0_D = 256'hb0f4b0f4b0e5b0492692809100feb013b0a100feb0122692b01ec906b0c9e637;
   localparam u0_E = 256'h66de00fe00008011d05600fee6c600feb01e66dee6b0d01a00fe00fec81d00fe;
   localparam u0_F = 256'h80c70046807eb049b06be64500feb013b0abe6fab0dbe0d540dd80e6b01ec972;
   localparam u1_0 = 256'h400b303a400b303b330b5039301750393017301b3002400b300a2237112f0035;
   localparam u1_1 = 256'h5083332a400b322f3002400b5083703b7003300235033333303f64b6303b303f;
   localparam u1_2 = 256'h400b9600400b303a33035239303b52393003503b3002363d300a3002400b8235;
   localparam u1_3 = 256'h363d363d4a2b701b3002492b3002703b7543482f462f60b750837003303f470b;
   localparam u1_4 = 256'h332a30029600303ab0ebab3b330bab3b70eb706b332b303f30023002702b0b37;
   localparam u1_5 = 256'h70eb112f782f701b3002762f300230023023302370eb3a2b70eb112f70ebcc2f;
   localparam u1_6 = 256'h330396009600303aa0b330029600300270cb90fb3502303f30023002751b3002;
   localparam u1_7 = 256'h9600704360b7701b300290b3300230021e2f3d0f60b763b79600301b70eb3a2b;
   localparam u1_8 = 256'h332b30029600303e430b30029600300296005083112f303f3002300296000035;
   localparam u1_9 = 256'h9073440a96003002a073d0a63002703b70cb762f332ed0a7706f7067d38ad0d3;
   localparam u1_A = 256'h3303303a9600303a706b3002d3a7300230033b2f331b363d30023002332a8235;
   localparam u1_B = 256'h102f102f330b701b782f301f3002703b702b332a30039600960063b6332ad08a;
   localparam u1_C = 256'h351a30029600303ed0d33002301a30027043706b3003503f30023002702b3002;
   localparam u1_D = 256'hee2f5d0f70eb701b73b3302a3002703b70eb3002300bd38b70eb3a2b501b3303;
   localparam u1_E = 256'h63b630029600303e301f30023333300270eb64b6332a303f3002300230033002;
   localparam u1_F = 256'h300a300a300a701b3003332b3002703b70c3333270eb50ff3002300a70eb3a2b;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[8] = indir[8];
   assign d[9] = indir[9];
   assign d[10] = indir[10];
   assign d[11] = indir[11];
   assign d[12] = indir[12];
   assign d[13] = indir[13];
   assign d[16] = indir[14];
   assign d[17] = indir[15];
   assign d[19] = indir[16];
   assign d[20] = indir[17];
   assign d[22] = indir[18];
   assign d[23] = indir[19];
   assign d[24] = indir[20];
   assign d[25] = indir[21];
   assign d[26] = indir[22];
   assign d[27] = indir[23];
   // replaces = 1000100110110000000001000001100000000000000
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h6000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h78bf)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0804)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0800)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0500)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d42(.O(d[42]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0111011001000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h3190)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h61e0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5042)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2800)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h040f)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0545)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0400)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;        bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));assign d[30] = d[18];
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   No MULDIV
 *   minstret for instructions in SRAM
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 43 columns
 * Removed:  0000000000000000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 43
 * 169 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 168 169 169 169 169 169 169 169 169 169 169 169 169 169 169 169 169 168 169 168 168 169 169 167 169 169 169 169 169 167 166 168 169 168 169 168 169 168 169 169 168 168 168  kill col 12  Tbl  42 cols 0000000000000000000000000000001000000000000 has 166 unique lines.
 * 165 166 166 166 166 166 166 166 166 166 166 166 166 166 166 166 166 164 166 165 163 166 166 164 166 166 166 166 166 164     164 165 165 166 165 166 165 166 166 165 165 165  kill col 22  Tbl  41 cols 0000000000000000000010000000001000000000000 has 163 unique lines.
 * 162 163 163 163 163 163 163 163 163 163 163 163 163 163 163 163 163 162 163 162     163 163 161 163 163 163 163 163 161     161 162 162 163 162 162 161 163 163 162 162 161  kill col 19  Tbl  40 cols 0000000000000000000010010000001000000000000 has 161 unique lines.
 * 160 161 161 161 161 161 161 161 161 161 161 161 161 161 161 161 161 160 161 160     161 161     161 161 161 161 161 159     158 160 160 161 160 160 159 161 161 160 160 159  kill col 11  Tbl  39 cols 0000000000000000000010010000001100000000000 has 158 unique lines.
 * 157 158 158 158 158 158 158 158 158 158 158 158 158 158 158 158 158 157 158 157     158 158     158 158 158 158 158 152         157 157 158 157 157 156 157 158 157 157 156  kill col 13  Tbl  38 cols 0000000000000000000010010000011100000000000 has 152 unique lines.
 * 151 152 152 152 152 152 152 152 152 152 152 152 152 152 152 152 152 151 152 151     152 152     152 152 152 152 152             151 151 151 151 151 150 151 152 151 151 150  kill col  5  Tbl  37 cols 0000000000000000000010010000011100000100000 has 150 unique lines.
 * 149 150 150 150 150 150 150 150 150 150 150 150 150 150 150 150 150 149 150 149     150 150     150 150 150 150 150             149 149 149 147 149     149 149 147 147 147  kill col  7  Tbl  36 cols 0000000000000000000010010000011100010100000 has 147 unique lines.
 * 146 147 147 147 147 147 147 147 147 147 147 147 147 147 146 147 147 146 146 146     147 147     147 146 147 147 147             146 146 146     146     146 145 142 142 144  kill col  2  Tbl  35 cols 0000000000000000000010010000011100010100100 has 142 unique lines.
 * 141 142 142 142 142 142 142 142 142 142 142 142 142 142 141 141 142 140 141 140     142 142     142 141 140 142 141             141 141 141     140     141 139     138 138  kill col  1  Tbl  34 cols 0000000000000000000010010000011100010100110 has 138 unique lines.
 * 137 138 138 138 138 138 138 138 137 138 138 138 138 138 137 137 138 136 137 136     138 138     138 137 133 138 137             137 137 137     132     134 130         134  kill col  3  Tbl  33 cols 0000000000000000000010010000011100010101110 has 130 unique lines.
 * 129 130 130 130 130 130 130 130 128 130 130 130 130 130 129 129 129 127 128 126     130 130     130 127 125 129 129             129 129 129     119     121             122  kill col  6  Tbl  32 cols 0000000000000000000010010000011100011101110 has 119 unique lines.
 * 118 119 119 119 119 119 119 119 118 119 119 118 119 119 118 116 118 114 116 115     119 119     119 115 113 118 118             118 118 118             104             107  kill col  4  Tbl  31 cols 0000000000000000000010010000011100011111110 has 104 unique lines.
 * 102 104 104 104 104 104 104 104 102 104 103 103 104 103 102 101 103  97 100  99     104 104     104  98  98 103 101             103 103 103                              89  kill col  0  Tbl  30 cols 0000000000000000000010010000011100011111111 has  89 unique lines.
 *  87  89  89  89  89  89  89  89  86  89  88  88  89  87  87  87  88  83  85  84      89  89      89  83  82  88  85              88  88  87                                  kill col 16  Tbl  29 cols 0000000000000000000010010010011100011111111 has  82 unique lines.
 *  80  82  82  82  82  82  82  82  79  81  81  81  82  80  80  79  81  75  77  76      81  81      82  76      81  78              81  81  80                                  kill col 25  Tbl  28 cols 0000000000000000010010010010011100011111111 has  75 unique lines.
 *  73  75  75  75  75  75  75  75  72  74  74  73  75  72  74  72  73      69  65      73  74      75  68      74  71              74  74  73                                  kill col 23  Tbl  27 cols 0000000000000000010110010010011100011111111 has  65 unique lines.
 *  63  64  65  65  65  65  65  65  62  64  64  63  65  62  64  62  62      60          63  64      65  59      64  61              64  64  63                                  kill col 17  Tbl  26 cols 0000000000000000010110010110011100011111111 has  59 unique lines.
 *  57  58  59  59  59  59  59  59  56  58  58  57  59  56  58  57  57      55          57  58      59          58  55              58  58  57                                  kill col 24  Tbl  25 cols 0000000000000000011110010110011100011111111 has  55 unique lines.
 *  53  54  54  54  55  54  55  55  52  54  54  53  54  51  54  52  51                  53  54      55          53  52              54  54  53                                  kill col 29  Tbl  24 cols 0000000000000100011110010110011100011111111 has  51 unique lines.
 *  49  50  50  47  51  50  51  51  49  50  50  49  50      48  47  46                  49  50      50          49  48              50  50  49                                  kill col 26  Tbl  23 cols 0000000000000100111110010110011100011111111 has  46 unique lines.
 *  44  45  45  42  46  45  46  46  44  45  45  44  45      44  42                      44  45      45          44  44              45  45  44                                  kill col 39  Tbl  22 cols 0001000000000100111110010110011100011111111 has  42 unique lines.
 *  40  41  40      42  41  42  42  40  41  41  40  40      37  38                      40  40      41          41  40              41  41  40                                  kill col 28  Tbl  21 cols 0001000000000110111110010110011100011111111 has  37 unique lines.
 *  35  36  34      36  36  36  37  35  36  36  34  35          34                      35  34      36          36  36              36  36  35                                  kill col 40  Tbl  20 cols 0011000000000110111110010110011100011111111 has  34 unique lines.
 *  32  31          33  33  32  34  32  31  33  32  32          30                      32  31      33          33  33              33  33  32                                  kill col 27  Tbl  19 cols 0011000000000111111110010110011100011111111 has  30 unique lines.
 *  28  28          29  29  28  30  28  27  29  28  28                                  28  27      29          29  29              29  29  28                                  kill col 33  Tbl  18 cols 0011000001000111111110010110011100011111111 has  27 unique lines.
 *  26  25          26  26  25  27  25      26  25  25                                  25  24      26          26  26              26  26  25                                  kill col 20  Tbl  17 cols 0011000001000111111110110110011100011111111 has  24 unique lines.
 *  23  22          23  23  22  24  22      23  23  22                                  23          23          23  23              23  23  22                                  kill col 41  Tbl  16 cols 0111000001000111111110110110011100011111111 has  22 unique lines.
 *  21              21  21  20  22  20      21  21  20                                  21          21          21  21              21  21  20                                  kill col 36  Tbl  15 cols 0111001001000111111110110110011100011111111 has  20 unique lines.
 *  19              19  18      20  18      19  19  18                                  19          19          19  19              19  19  18                                  kill col 37  Tbl  14 cols 0111011001000111111110110110011100011111111 has  18 unique lines.
 *  17              17          18  16      17  17  16                                  17          17          17  17              17  17  16                                  kill col 34  Tbl  13 cols 0111011011000111111110110110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 14 30 31 
 *
 * Round 1: 1000100100111000000001001001100011100000000  4 columns for indexes to table representing 13 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 164 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 164 164 164   x 164 164   x 164 164   x   x   x 164 164 163 164 163 164 163 163   x 164 161   x 164 164   x   x 162 161 162   x   x   x 163 164 163 164 164 163 163 163  kill col 19  Tbl  29 cols 1000100100111000000001011001100011100000000 has 161 unique lines.
 *   x 161 161 161   x 161 161   x 161 161   x   x   x 161 161 160 161 160 161 160 160   x 161       x 161 161   x   x 159 158 159   x   x   x 160 161 160 161 161 160 160 160  kill col 12  Tbl  28 cols 1000100100111000000001011001101011100000000 has 158 unique lines.
 *   x 158 158 158   x 158 158   x 158 158   x   x   x 158 158 157 158 156 158 157 155   x 158       x 158 158   x   x 156     155   x   x   x 157 158 157 158 158 157 157 157  kill col 22  Tbl  27 cols 1000100100111000000011011001101011100000000 has 155 unique lines.
 *   x 155 155 155   x 155 155   x 155 155   x   x   x 155 155 154 155 154 155 154       x 155       x 155 155   x   x 152     152   x   x   x 154 154 153 155 155 154 154 153  kill col 13  Tbl  26 cols 1000100100111000000011011001111011100000000 has 152 unique lines.
 *   x 152 152 152   x 152 152   x 152 152   x   x   x 152 152 151 152 151 152 151       x 152       x 152 152   x   x         145   x   x   x 151 151 150 152 152 151 151 150  kill col 11  Tbl  25 cols 1000100100111000000011011001111111100000000 has 145 unique lines.
 *   x 145 145 145   x 145 145   x 145 145   x   x   x 145 145 144 145 144 145 144       x 145       x 145 145   x   x               x   x   x 144 144 143 144 145 144 144 143  kill col  5  Tbl  24 cols 1000100100111000000011011001111111100100000 has 143 unique lines.
 *   x 143 143 143   x 143 143   x 142 142   x   x   x 143 143 142 143 142 143 142       x 143       x 143 141   x   x               x   x   x 139 142     142 142 139 140 139  kill col  7  Tbl  23 cols 1000100100111000000011011001111111110100000 has 139 unique lines.
 *   x 139 139 139   x 139 139   x 138 138   x   x   x 139 138 138 139 138 136 138       x 139       x 138 136   x   x               x   x   x     138     138 136 132 134 135  kill col  2  Tbl  22 cols 1000100100111000000011011001111111110100100 has 132 unique lines.
 *   x 132 132 132   x 132 132   x 131 130   x   x   x 132 131 130 132 129 129 129       x 131       x 129 129   x   x               x   x   x     130     131 128     128 127  kill col  0  Tbl  21 cols 1000100100111000000011011001111111110100101 has 127 unique lines.
 *   x 127 127 127   x 127 127   x 126 124   x   x   x 127 126 125 127 122 124 123       x 126       x 124 121   x   x               x   x   x     124     121 122     123      kill col 16  Tbl  20 cols 1000100100111000000011011011111111110100101 has 121 unique lines.
 *   x 121 121 121   x 121 121   x 120 118   x   x   x 120 120 119 120 115 118 117       x 120       x 115       x   x               x   x   x     116     113 112     110      kill col  1  Tbl  19 cols 1000100100111000000011011011111111110100111 has 110 unique lines.
 *   x 110 110 110   x 110 110   x 107 107   x   x   x 109 109 107 109 103 106 104       x 109       x 104       x   x               x   x   x     101      99  97              kill col  3  Tbl  18 cols 1000100100111000000011011011111111110101111 has  97 unique lines.
 *   x  97  96  97   x  97  97   x  91  94   x   x   x  96  96  94  94  90  90  91       x  96       x  89       x   x               x   x   x      79      80                  kill col  6  Tbl  17 cols 1000100100111000000011011011111111111101111 has  79 unique lines.
 *   x  79  78  79   x  79  78   x  76  77   x   x   x  78  78  75  76  67  70  71       x  78       x  70       x   x               x   x   x              59                  kill col  4  Tbl  16 cols 1000100100111000000011011011111111111111111 has  59 unique lines.
 *   x  59  58  59   x  59  58   x  56  57   x   x   x  57  56  55  56  50  52  53       x  56       x  52       x   x               x   x   x                                  kill col 25  Tbl  15 cols 1000100100111000010011011011111111111111111 has  50 unique lines.
 *   x  50  49  50   x  50  49   x  47  47   x   x   x  48  47  46  46      45  43       x  47       x  43       x   x               x   x   x                                  kill col 23  Tbl  14 cols 1000100100111000010111011011111111111111111 has  43 unique lines.
 *   x  42  42  43   x  43  42   x  40  40   x   x   x  41  40  37  37      38           x  40       x  37       x   x               x   x   x                                  kill col 27  Tbl  13 cols 1000100100111001010111011011111111111111111 has  37 unique lines.
 *   x  36  36  36   x  37  36   x  34  34   x   x   x  35  33      31      31           x  34       x  31       x   x               x   x   x                                  kill col 26  Tbl  12 cols 1000100100111001110111011011111111111111111 has  31 unique lines.
 *   x  30  30  30   x  31  30   x  28  28   x   x   x  29  28              26           x  28       x  26       x   x               x   x   x                                  kill col 24  Tbl  11 cols 1000100100111001111111011011111111111111111 has  26 unique lines.
 *   x  25  25  24   x  25  25   x  23  23   x   x   x  23  24                           x  22       x  22       x   x               x   x   x                                  kill col 20  Tbl  10 cols 1000100100111001111111111011111111111111111 has  22 unique lines.
 *   x  21  20  21   x  21  21   x  19  19   x   x   x  19  20                           x           x  18       x   x               x   x   x                                  kill col 17  Tbl   9 cols 1000100100111001111111111111111111111111111 has  18 unique lines.
 *   x  17  15  17   x  17  17   x  15  15   x   x   x  15  16                           x           x           x   x               x   x   x                                  kill col 40  Tbl   8 cols 1010100100111001111111111111111111111111111 has  15 unique lines.
Possible good candidates for removal, columns : 29 33 34 
 *
 * Round 2: 0101011011000110000000000000000000000000000  4 columns for indexes to table representing  8 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0010000000000001111110110110011100011111111 22 columns
 * Can even chose 2 more columns to be represented directly.
 * Success. Use 2 EBRs, 19 LUTs.
 */

module v10_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 100110101111000000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 00010111111001x111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 100110111111000010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 0 00000101x10xxxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 0 000001011101000011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 0 00000001x01xxxx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 0 00001101111010x000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 0 00001011111011x000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     4 0 000111001111000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 0 00001011111000x010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     4 0 000111001111000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   0 3 000001011111001000110011|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   0 0 00011101111001x000000100| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 0 00011101x10xxxx000010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 0 00011111111000x010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 0 00011101111000x000011010|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   5 4 110110110011001001110110|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  0 0 00011111111000x000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 000110011111001000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  0 5 00000001111001x000010110|        Branch on condition
    * 16 condb_5  StdIncPc 0 0 00000001x10xxxx011100110|        Branch not taken.
    * 17 condb_5t condb_6t 6 0 00000001101001x001111101|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  6 0 000111011101100000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 0 0100000110x1000001000001| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 3 0 00000101110011x011100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    0 0 00000001x01xxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 0 2 000101111011100010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 0 000001011101110011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 0 3 000101010111001011010100|        Q = 4
    * 1f IJ_2     IJ_3     4 0 010000011011100010110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     6 2 100110101111000001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 0 00000101110000x011100110|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 0 0 00000101x10xxxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 6 0001111010x1100000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 0 00000001x01xxxx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     4 0 00011101110000x000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 0 000000011111000000011101|        Q = rs2
    * 28 _L0x28   SH_1     4 2 000111001111000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 0 00011101111000x000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     4 2 000111001111000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 000xxxx11101001000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 0 00011101x0xxxxx000111110| SLL    Shift left
    * 2d _L0x2d   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 2e unx2e             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 7 000001011101101011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 0 00011111111000x000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    6 0 00000001101001x010000110|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   4 0 01000001110011x010011110|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    5 0 11011011101001x011011110|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   3 6 00010111111001x000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 6 000101111111010000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  6 5 001xxxx1110001x011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  6 0 000111011101100000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   3 8 00010101111001x100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    0 0 00000001x01xxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  6 0 000011011101100001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 8 00010101111001x100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   0 6 0001111010x001x000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   0 6 0001111010x001x000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 9 100110111111000001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   6 0 00010101110001x000001011|        yy=jj. Prep get Q=1
    * 42 _L0x42   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  0 0 00011111111010x000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 000101011111001001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    6 0 0011010110x001x001000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    6 0 01110101110001x010001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     9 9 100111011111000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 000000011111001001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     9 9 100111011111000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 0 01110101101001x010110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 0 00011101x10xxxx000110001| SLT    Set less than (signed)
    * 4d unx4d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * 4f MRET_8   MRET_9   0 3 000101010111001001110100|        +4, so now 0x103
    * 50 LW_1     StdIncPc b a 00010111110001x011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   6 0 011101011011100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 00010111111001x101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   6 0 011101011011100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     c 8 00010101111001x111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 6 0 011101011101100000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 0 00010001111011x001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 0 00010001111000x010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     6 6 00010111111001x001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    0 0 00000001x01xxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  6 0 000011011101100001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     d 6 000101111111010011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 00010111111001x101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   6 0 011101011011100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 6 5 00001101110010x011110111| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 _L0x62   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  0 0 00011111111010x000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    0 5 00000001x10xxxx011101111|        Prepare read PC.
    * 66 SW_1     SW_2     7 0 01111101101001x011110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    6 0 0110010110x1100010010011|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 69 unx69             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     9 0 11011001111001x001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 0 00011101x10xxxx000110001| SLTU   Set less than (unsigned)
    * 6d unx6d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   0 3 000xxxx11111001011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    c 8 00010101111001x110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 6 0 011101011101100000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 0 00001101111010x000011010|        Invert q. Prepare read mask
    * 73 unalignd straddle 0 0 000001011101100000010010|  Fr10u Unaligned pc, prep read high hword
    * 74 MRET_9   Fetch    5 3 110110111011001011011110|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    5 0 11011011101011x011011110|        Mask and use as PC
    * 76 Fetchu   Fetch2   0 b 000001111101100011110100|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2   1 c 000101111101100011110100|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 _L0x78   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     7 0 01011001101001x011110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    0 0 00000001x01xxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  6 0 000011011101100001001001| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    5 0 110110111011000011011110|        Branch taken.
    * 7e NMI_1    NMI_2    6 0 001xxxx1110001x010010000|        Store pc to mepc.
    * 7f unx7f             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 100110101111000010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 _L0x82   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   0 0 00011111111010x000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 00010111111001x111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   4 0 010000011101000010011110|      Prep pc = jj + ofs
    * 87 unx87             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 _L0x88   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 89 unx89             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 3 3 000001011101001011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 0 00011111x10xxxx000101001| XOR    xor
    * 8d unx8d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 3 000101011111001010101001|        Q = 1
    * 90 NMI_2    JAL_3    e 0 011010011101100000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   e 3 0100010100x1001010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    6 0 0011001110x001x000110100|        PC to mepc
    * 93 SW_E2    SW_E3    6 0 00110111110001x010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    e 0 0101001110x1010000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    0 3 000101110111001010010100|        Q = 3
    * 96 SH_1     SH_2     6 6 00010111111001x010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    6 0 0110010110x1100010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  6 0 000111011101100000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    e 0 0101001100x1000000110100|        mcause = 11
    * 9b SH_4     SH_5     9 0 10111001111001x010011111|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 9d unx9d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    3 4 000001010101001000110100|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     7 0 00111001101001x011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    6 2 100110101111000001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  0 3 000101010111001010110110|        Q = 4
    * a2 _L0xa2   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   0 6 0001111010x1100000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 000011011111001010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  0 9 000101111011100011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 0 000xxxx11111000001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    e 3 0101001110x1001000110100|        Store 2 to mcause
    * aa _L0xaa   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  6 0 00110101110001x010011010|        pc to mepc
    * ac _L0xac   SRx_1    0 0 00011101x0xxxxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad unxad             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    0 0 00011101x0xxxxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 000xxxx11111001011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   e 0 0100010100x1000010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  0 3 000101010111001010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    5 3 110110110011001011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3  unalignd 4 d 001111111111001001110011|  Fr10  Update minstret, Q=immediate. Use dinx
    * b5 SH_3     SH_4     0 0 000000011101100010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  0 3 000101010111001010011010|        Q = 8
    * b7 IJ_3     IJ_4     6 0 00010101110001x010111101|        Store present PC in case of access error
    * b8 BGE      condb_2  6 0 000111011101100000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   0 0 00001111111010x000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     d 6 000101111111010010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  6 0 000011011101100001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     0 3 000001011111001001110101|        Construct Q = 1
    * be IJ_1     IJ_2     1 0 00010111111001x000011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 0 00010111111001x011000001|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    6 0 000101011101100011101001|        Read word is to be masked with ~1u
    * c2 _L0xc2   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    4 0 00011111110010x011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 0 00000001111010x001101111|        ~302
    * c6 IJT_4    ILL_2    6 0 00110101111011x001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   6 0 001xxxx1110001x011001011|        Store pc to mepc.
    * c8 _L0xc8   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   0 0 000011010111000010100101|        0xff+3 = 0x102
    * ca _L0xca   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc e 0 011010011101100011100110|        mtval = 0.
    * cc OR_0     OR_1     0 0 00011111x10xxxx000100110| OR     or
    * cd unxcd             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * cf MRET_7   MRET_8   0 5 00001101x10xxxx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 000000011111001000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 0 000011011101100011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     c 8 00010101111001x100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 6 0 011101011101100000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   e 3 0100010110x1001010010010|        Store 5 to mcause
    * d5 eFetch2  eFetch3  4 e 011000111101000010110100|  Fr10  Update ttime
    * d6 eILL0c   ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  6 0 011101011101100010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  6 0 000111011101100000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   0 0 00010101x10xxxx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   6 3 0101100110x1001010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  6 0 000011011101100001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  6 0 011101011101100011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 b 000001111101100011110100|  Fr10  Read and latch instruction
    * df eFetch   eFetch2  5 c 000101111101100011010101|  Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    0 0 00000001111001x000011101|        Q = RS1
    * e2 _L0xe2   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   0 0 00011111111010x000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  0 3 000101010111001010110000|        Q = 4
    * e6 StdIncPc Fetch    5 4 110110110011001011011110|  Fr10  IncPC, OpFetch
    * e7 aFault   aFault_1 6 0 011101011101100000011110|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    0 3 000110011111001011000110|        Construct Q = 1
    * ea _L0xea   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * eb LH_3     LH_4     0 0 00001111111010x001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 0 00011111x10xxxx000010001| AND    And 
    * ed unxed             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    5 3 110110110011001011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    c 8 00010101111001x101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 6 0 011101011101100000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 0 00000101x10xxxx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 0 000xxxx1x01xxxx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd 4 f 011111111111000001110011|  Fr10  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 6 0 011101011101100011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    0 3 000110010111001011111010| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 6 0 011000011101100010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  6 0 000111011101100000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    0 3 000101011111001001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 0 000000011101100001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  6 0 000011011101100001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 0 00000101x10xxxx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    0 0 00000101x0xxxxx001000110| Illegal
    * ff QINT_0   QINT_1   0 0 00000101x10xxxx011000111| INT    Get current PC
    */
   localparam u0_0 = 256'hd8e64010d8e6e404f233f05ae08bf05aec09e8072004d0e640e6f0bee5d2f001;
   localparam u0_1 = 256'hb8b772d4dce6b8a62032cce69041d813a47d40e6e416f215e0143276e01ae08b;
   localparam u0_2 = 256'hd8e60000d8e6003ed230f096e021f096f01dc0272004983540e600fec0e6f052;
   localparam u0_3 = 256'h843a8435e503d8492032e53d00fed813c4d7f403e436a4decc9ea486e02bdae6;
   localparam u0_4 = 256'h727400fe00004031a4b1f066f24bf066c48f8447f265e82b00fe00fec40bf050;
   localparam u0_5 = 256'hb8dae570f4fbd8492032e45d00fe00fee08bec57d81ee5ebb8dae554b8dac4e6;
   localparam u0_6 = 256'hf2cf000000004031e47a00fe000000fe9893a4f240efe82b00fe00fec8f700fe;
   localparam u0_7 = 256'h0000c490b0ded8492032a4f200fe00fed8f4d8f4acdeb2ded812e81ad81ee5ba;
   localparam u0_8 = 256'hf2a900fe00004029d2e600fe000000fe0000d09ee5f0e82100fe00fe0000f085;
   localparam u0_9 = 256'ha4f25234000000fee49f103400fed8139893e4bb72949434c49584341292d834;
   localparam u0_A = 256'hf2c5003f0000003fc49a00fe923400fef061b8d0f2af983a00fe00fe72b6f05e;
   localparam u0_B = 256'he4c1e41ff275d849f4b5e81a00fed813c4bd729ad89bf273000032de72b21092;
   localparam u0_C = 256'h404f00fe00004026d8e600fe70a500fec4cbec47e86fc8e100fe00fed8e900fe;
   localparam u0_D = 256'hd8d5d8f4d8e5d8499292409100fed813d8a100fed0b49292d81ee506d8c9f237;
   localparam u0_E = 256'h32de00fe00004011e85600fef2c600fed81e32de72b0e81a00fe00fee41d00fe;
   localparam u0_F = 256'h40c70046407ed849d86bf24500fed813d8ab72fad8dbf07320dd40e6d81ee572;
   localparam u1_0 = 256'h3005001d3005001d0305401c000b401c000b000d000130050005229b1117009a;
   localparam u1_1 = 256'h4041031530050217000130054041601d6001000105010319001f54db001d001f;
   localparam u1_2 = 256'h300576003005001d0301421c001d421c0001401d0001061e000500013005629a;
   localparam u1_3 = 256'h061e061e8815600d000138150001601d65218617361750db40416001001f3705;
   localparam u1_4 = 256'h031500017600001da075999d0301999d607560350315001f000100016015099b;
   localparam u1_5 = 256'h60751117d617600d0001661700010001001100116075c815607511176075ba17;
   localparam u1_6 = 256'h030176007600001d90d90001760000016065707d0501001f00010001650d0001;
   localparam u1_7 = 256'h7600602150db600d00017059000100011c170b0750db53db0005000d6075c815;
   localparam u1_8 = 256'h031500017600001f3305000176000001760040411117001f000100017600009a;
   localparam u1_9 = 256'h703934057600000190b9e0530001601d606566170317e05360376033e345e069;
   localparam u1_A = 256'h0301001d7600001d60350001e353000100010917030d061e000100010315629a;
   localparam u1_B = 256'h101710170305600dd617000f0001601d6015031500014d3f760053db0315e045;
   localparam u1_C = 256'h050d00017600001fe0690001000d0001602160350001401f0001000160150001;
   localparam u1_D = 256'h5c174b076075600d635900150001601d607500014e63e3456075c815400d0301;
   localparam u1_E = 256'h53db00017600001f000f000103190001607554db0315001f0001000100010001;
   localparam u1_F = 256'h000500050005600d000103150001601d6061031960754f7f000100056075c815;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[8] = indir[8];
   assign d[9] = indir[9];
   assign d[11] = indir[10];
   assign d[12] = indir[11];
   assign d[13] = indir[12];
   assign d[16] = indir[13];
   assign d[17] = indir[14];
   assign d[19] = indir[15];
   assign d[20] = indir[16];
   assign d[22] = indir[17];
   assign d[23] = indir[18];
   assign d[24] = indir[19];
   assign d[25] = indir[20];
   assign d[26] = indir[21];
   assign d[27] = indir[22];
   assign d[40] = indir[23];
   // replaces = 1000100100111000000001001001100010000000000
   SB_LUT4 #(.LUT_INIT(16'h2018)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1800)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfebf)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'ha000)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0204)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d42(.O(d[42]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0101011011000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h6948)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6070)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0822)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h3100)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4400)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1207)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   No MULDIV
 *   minstret for instructions in SRAM and EBR
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 43 columns
 * Removed:  0000000000000000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 43
 * 168 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 167 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 167 168 167 167 168 168 166 168 168 168 168 168 166 165 167 168 167 168 167 168 167 168 168 167 167 167  kill col 12  Tbl  42 cols 0000000000000000000000000000001000000000000 has 165 unique lines.
 * 164 165 165 165 165 165 165 165 165 165 165 165 165 165 165 165 165 163 165 164 162 165 165 163 165 165 165 165 165 163     163 164 164 165 164 165 164 165 165 164 164 164  kill col 22  Tbl  41 cols 0000000000000000000010000000001000000000000 has 162 unique lines.
 * 161 162 162 162 162 162 162 162 162 162 162 162 162 162 162 162 162 161 162 161     162 162 160 162 162 162 162 162 160     160 161 161 162 161 161 160 162 162 161 161 160  kill col 19  Tbl  40 cols 0000000000000000000010010000001000000000000 has 160 unique lines.
 * 159 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 159 160 159     160 160     160 160 160 160 160 158     157 159 159 160 159 159 158 160 160 159 159 158  kill col 11  Tbl  39 cols 0000000000000000000010010000001100000000000 has 157 unique lines.
 * 156 157 157 157 157 157 157 157 157 157 157 157 157 157 157 157 157 156 157 156     157 157     157 157 157 157 157 151         156 156 157 156 156 155 156 157 156 156 155  kill col 13  Tbl  38 cols 0000000000000000000010010000011100000000000 has 151 unique lines.
 * 150 151 151 151 151 151 151 151 151 151 151 151 151 151 151 151 151 150 151 150     151 151     151 151 151 151 151             150 150 150 150 150 149 150 151 150 150 149  kill col  5  Tbl  37 cols 0000000000000000000010010000011100000100000 has 149 unique lines.
 * 148 149 149 149 149 149 149 149 149 149 149 149 149 149 149 149 149 148 149 148     149 149     149 149 149 149 149             148 148 148 146 148     148 148 146 146 146  kill col  7  Tbl  36 cols 0000000000000000000010010000011100010100000 has 146 unique lines.
 * 145 146 146 146 146 146 146 146 146 146 146 146 146 146 145 146 146 145 145 145     146 146     146 145 146 146 146             145 145 145     145     145 144 141 141 143  kill col  2  Tbl  35 cols 0000000000000000000010010000011100010100100 has 141 unique lines.
 * 140 141 141 141 141 141 141 141 141 141 141 141 141 141 140 140 141 139 140 139     141 141     141 140 139 141 140             140 140 140     139     140 138     137 137  kill col  1  Tbl  34 cols 0000000000000000000010010000011100010100110 has 137 unique lines.
 * 136 137 137 137 137 137 137 137 136 137 137 137 137 137 136 136 137 135 136 135     137 137     137 136 132 137 136             136 136 136     131     133 129         133  kill col  3  Tbl  33 cols 0000000000000000000010010000011100010101110 has 129 unique lines.
 * 128 129 129 129 129 129 129 129 127 129 129 129 129 129 128 128 128 126 127 125     129 129     129 126 124 129 128             128 128 128     118     120             121  kill col  6  Tbl  32 cols 0000000000000000000010010000011100011101110 has 118 unique lines.
 * 117 118 118 118 118 118 118 118 117 118 118 117 118 118 117 115 117 113 115 114     118 118     118 114 112 118 117             117 117 117             103             106  kill col  4  Tbl  31 cols 0000000000000000000010010000011100011111110 has 103 unique lines.
 * 101 103 103 103 103 103 103 103 101 103 102 102 103 102 101 100 102  96  99  98     103 103     103  97  97 102 100             102 102 102                              88  kill col  0  Tbl  30 cols 0000000000000000000010010000011100011111111 has  88 unique lines.
 *  86  88  88  88  88  88  88  88  85  88  87  87  88  86  86  86  87  82  84  83      88  88      88  82  81  87  84              87  87  86                                  kill col 16  Tbl  29 cols 0000000000000000000010010010011100011111111 has  81 unique lines.
 *  79  81  81  81  81  81  81  81  78  80  80  80  81  79  79  78  80  74  76  75      80  80      81  75      80  77              80  80  79                                  kill col 25  Tbl  28 cols 0000000000000000010010010010011100011111111 has  74 unique lines.
 *  72  74  74  74  74  74  74  74  71  73  73  72  74  71  73  71  72      68  64      72  73      74  67      73  70              73  73  72                                  kill col 23  Tbl  27 cols 0000000000000000010110010010011100011111111 has  64 unique lines.
 *  62  63  64  64  64  64  64  64  61  63  63  62  64  61  63  61  61      59          62  63      64  58      63  60              63  63  62                                  kill col 17  Tbl  26 cols 0000000000000000010110010110011100011111111 has  58 unique lines.
 *  56  57  58  58  58  58  58  58  55  57  57  56  58  55  57  56  56      54          56  57      58          57  54              57  57  56                                  kill col 24  Tbl  25 cols 0000000000000000011110010110011100011111111 has  54 unique lines.
 *  52  53  53  53  54  53  54  54  51  53  53  52  53  50  53  51  50                  52  53      54          53  51              53  53  52                                  kill col 29  Tbl  24 cols 0000000000000100011110010110011100011111111 has  50 unique lines.
 *  48  49  49  47  50  49  50  50  48  49  49  48  49      47  46  45                  48  49      49          49  47              49  49  48                                  kill col 26  Tbl  23 cols 0000000000000100111110010110011100011111111 has  45 unique lines.
 *  43  44  44  42  45  44  45  45  43  44  44  43  44      43  41                      43  44      44          44  43              44  44  43                                  kill col 27  Tbl  22 cols 0000000000000101111110010110011100011111111 has  41 unique lines.
 *  39  40  40  38  41  40  41  41  39  40  40  39  40      40                          39  40      40          40  39              40  40  39                                  kill col 39  Tbl  21 cols 0001000000000101111110010110011100011111111 has  38 unique lines.
 *  36  37  35      38  37  38  38  36  37  37  36  36      34                          36  36      37          37  36              37  37  36                                  kill col 28  Tbl  20 cols 0001000000000111111110010110011100011111111 has  34 unique lines.
 *  32  33  30      33  33  33  34  32  33  33  31  32                                  32  31      33          33  33              33  33  32                                  kill col 40  Tbl  19 cols 0011000000000111111110010110011100011111111 has  30 unique lines.
 *  28  28          29  29  28  30  28  27  29  28  28                                  28  27      29          29  29              29  29  28                                  kill col 33  Tbl  18 cols 0011000001000111111110010110011100011111111 has  27 unique lines.
 *  26  25          26  26  25  27  25      26  25  25                                  25  24      26          26  26              26  26  25                                  kill col 20  Tbl  17 cols 0011000001000111111110110110011100011111111 has  24 unique lines.
 *  23  22          23  23  22  24  22      23  23  22                                  23          23          23  23              23  23  22                                  kill col 41  Tbl  16 cols 0111000001000111111110110110011100011111111 has  22 unique lines.
 *  21              21  21  20  22  20      21  21  20                                  21          21          21  21              21  21  20                                  kill col 36  Tbl  15 cols 0111001001000111111110110110011100011111111 has  20 unique lines.
 *  19              19  18      20  18      19  19  18                                  19          19          19  19              19  19  18                                  kill col 37  Tbl  14 cols 0111011001000111111110110110011100011111111 has  18 unique lines.
 *  17              17          18  16      17  17  16                                  17          17          17  17              17  17  16                                  kill col 34  Tbl  13 cols 0111011011000111111110110110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 14 30 
 *
 * Round 1: 1000100100111000000001001001100011100000000  4 columns for indexes to table representing 13 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 163 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 163 163 163   x 163 163   x 163 163   x   x   x 163 163 163 163 162 163 162 162   x 163 160   x 163 163   x   x 161 160 161   x   x   x 162 163 162 163 163 162 162 162  kill col 19  Tbl  29 cols 1000100100111000000001011001100011100000000 has 160 unique lines.
 *   x 160 160 160   x 160 160   x 160 160   x   x   x 160 160 160 160 159 160 159 159   x 160       x 160 160   x   x 158 157 158   x   x   x 159 160 159 160 160 159 159 159  kill col 12  Tbl  28 cols 1000100100111000000001011001101011100000000 has 157 unique lines.
 *   x 157 157 157   x 157 157   x 157 157   x   x   x 157 157 157 157 155 157 156 154   x 157       x 157 157   x   x 155     154   x   x   x 156 157 156 157 157 156 156 156  kill col 22  Tbl  27 cols 1000100100111000000011011001101011100000000 has 154 unique lines.
 *   x 154 154 154   x 154 154   x 154 154   x   x   x 154 154 154 154 153 154 153       x 154       x 154 154   x   x 151     151   x   x   x 153 153 152 154 154 153 153 152  kill col 13  Tbl  26 cols 1000100100111000000011011001111011100000000 has 151 unique lines.
 *   x 151 151 151   x 151 151   x 151 151   x   x   x 151 151 151 151 150 151 150       x 151       x 151 151   x   x         144   x   x   x 150 150 149 151 151 150 150 149  kill col 11  Tbl  25 cols 1000100100111000000011011001111111100000000 has 144 unique lines.
 *   x 144 144 144   x 144 144   x 144 144   x   x   x 144 144 144 144 143 144 143       x 144       x 144 144   x   x               x   x   x 143 143 142 143 144 143 143 142  kill col  5  Tbl  24 cols 1000100100111000000011011001111111100100000 has 142 unique lines.
 *   x 142 142 142   x 142 142   x 141 141   x   x   x 142 142 142 142 141 142 141       x 142       x 142 140   x   x               x   x   x 138 141     141 141 138 139 138  kill col  7  Tbl  23 cols 1000100100111000000011011001111111110100000 has 138 unique lines.
 *   x 138 138 138   x 138 138   x 137 137   x   x   x 138 137 138 138 137 135 137       x 138       x 137 135   x   x               x   x   x     137     137 135 131 133 134  kill col  2  Tbl  22 cols 1000100100111000000011011001111111110100100 has 131 unique lines.
 *   x 131 131 131   x 131 131   x 130 129   x   x   x 131 130 130 131 128 128 128       x 130       x 128 128   x   x               x   x   x     129     130 127     127 126  kill col  0  Tbl  21 cols 1000100100111000000011011001111111110100101 has 126 unique lines.
 *   x 126 126 126   x 126 126   x 125 123   x   x   x 126 125 125 126 121 123 122       x 125       x 123 120   x   x               x   x   x     123     120 121     122      kill col 16  Tbl  20 cols 1000100100111000000011011011111111110100101 has 120 unique lines.
 *   x 120 120 120   x 120 120   x 119 117   x   x   x 119 119 119 119 114 117 116       x 119       x 114       x   x               x   x   x     115     112 111     109      kill col  1  Tbl  19 cols 1000100100111000000011011011111111110100111 has 109 unique lines.
 *   x 109 109 109   x 109 109   x 106 106   x   x   x 108 108 107 108 102 105 103       x 108       x 103       x   x               x   x   x     100      98  96              kill col  3  Tbl  18 cols 1000100100111000000011011011111111110101111 has  96 unique lines.
 *   x  96  95  96   x  96  96   x  90  93   x   x   x  95  95  94  93  89  89  90       x  95       x  88       x   x               x   x   x      78      79                  kill col  6  Tbl  17 cols 1000100100111000000011011011111111111101111 has  78 unique lines.
 *   x  78  77  78   x  78  77   x  75  76   x   x   x  77  77  75  75  66  69  70       x  77       x  69       x   x               x   x   x              58                  kill col  4  Tbl  16 cols 1000100100111000000011011011111111111111111 has  58 unique lines.
 *   x  58  57  58   x  58  57   x  55  56   x   x   x  56  55  54  55  49  52  52       x  55       x  51       x   x               x   x   x                                  kill col 25  Tbl  15 cols 1000100100111000010011011011111111111111111 has  49 unique lines.
 *   x  49  48  49   x  49  48   x  46  47   x   x   x  47  47  45  45      45  42       x  46       x  42       x   x               x   x   x                                  kill col 23  Tbl  14 cols 1000100100111000010111011011111111111111111 has  42 unique lines.
 *   x  41  41  42   x  42  41   x  39  40   x   x   x  40  40  37  36      38           x  39       x  36       x   x               x   x   x                                  kill col 26  Tbl  13 cols 1000100100111000110111011011111111111111111 has  36 unique lines.
 *   x  35  35  35   x  36  35   x  33  34   x   x   x  34  33  31          31           x  33       x  31       x   x               x   x   x                                  kill col 27  Tbl  12 cols 1000100100111001110111011011111111111111111 has  31 unique lines.
 *   x  30  30  30   x  31  30   x  28  28   x   x   x  29  28              26           x  28       x  26       x   x               x   x   x                                  kill col 24  Tbl  11 cols 1000100100111001111111011011111111111111111 has  26 unique lines.
 *   x  25  25  24   x  25  25   x  23  23   x   x   x  23  24                           x  22       x  22       x   x               x   x   x                                  kill col 20  Tbl  10 cols 1000100100111001111111111011111111111111111 has  22 unique lines.
 *   x  21  20  21   x  21  21   x  19  19   x   x   x  19  20                           x           x  18       x   x               x   x   x                                  kill col 17  Tbl   9 cols 1000100100111001111111111111111111111111111 has  18 unique lines.
 *   x  17  15  17   x  17  17   x  15  15   x   x   x  15  16                           x           x           x   x               x   x   x                                  kill col 40  Tbl   8 cols 1010100100111001111111111111111111111111111 has  15 unique lines.
Possible good candidates for removal, columns : 29 33 34 
 *
 * Round 2: 0101011011000110000000000000000000000000000  4 columns for indexes to table representing  8 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0010000000000001111110110110011100011111111 22 columns
 * Can even chose 2 more columns to be represented directly.
 * Success. Use 2 EBRs, 19 LUTs.
 */

module v11_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 100110101111000000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 00010111111001x111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 100110111111000010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 0 00000101x10xxxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 0 000001011101000011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 0 00000001x01xxxx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 0 00001101111010x000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 0 00001011111011x000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     4 0 000111001111000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 0 00001011111000x010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     4 0 000111001111000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   0 3 000001011111001000110011|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   0 0 00011101111001x000000100| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 0 00011101x10xxxx000010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 0 00011111111000x010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 0 00011101111000x000011010|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   5 4 110110110011001001110110|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  0 0 00011111111000x000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 000110011111001000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  0 5 00000001111001x000010110|        Branch on condition
    * 16 condb_5  StdIncPc 0 0 00000001x10xxxx011100110|        Branch not taken.
    * 17 condb_5t condb_6t 6 0 00000001101001x001111101|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  6 0 000111011101100000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 0 0100000110x1000001000001| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 3 0 00000101110011x011100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    0 0 00000001x01xxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 0 2 000101111011100010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 0 000001011101110011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 0 3 000101010111001011010100|        Q = 4
    * 1f IJ_2     IJ_3     4 0 010000011011100010110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     6 2 100110101111000001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 0 00000101110000x011100110|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 0 0 00000101x10xxxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 6 0001111010x1100000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 0 00000001x01xxxx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     4 0 00011101110000x000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 0 000000011111000000011101|        Q = rs2
    * 28 _L0x28   SH_1     4 2 000111001111000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 0 00011101111000x000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     4 2 000111001111000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 000xxxx11101001000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 0 00011101x0xxxxx000111110| SLL    Shift left
    * 2d _L0x2d   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 2e unx2e             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 7 000001011101101011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 0 00011111111000x000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    6 0 00000001101001x010000110|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   4 0 01000001110011x010011110|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    5 0 11011011101001x011011110|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   3 6 00010111111001x000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 6 000101111111010000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  6 5 001xxxx1110001x011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  6 0 000111011101100000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   3 8 00010101111001x100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    0 0 00000001x01xxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  6 0 000011011101100001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 8 00010101111001x100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   0 6 0001111010x001x000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   0 6 0001111010x001x000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 9 100110111111000001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   6 0 00010101110001x000001011|        yy=jj. Prep get Q=1
    * 42 _L0x42   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  0 0 00011111111010x000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 000101011111001001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    6 0 0011010110x001x001000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    6 0 01110101110001x010001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     9 9 100111011111000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 000000011111001001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     9 9 100111011111000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 0 01110101101001x010110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 0 00011101x10xxxx000110001| SLT    Set less than (signed)
    * 4d unx4d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * 4f MRET_8   MRET_9   0 3 000101010111001001110100|        +4, so now 0x103
    * 50 LW_1     StdIncPc b a 00010111110001x011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   6 0 011101011011100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 00010111111001x101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   6 0 011101011011100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     c 8 00010101111001x111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 6 0 011101011101100000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 0 00010001111011x001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 0 00010001111000x010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     6 6 00010111111001x001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    0 0 00000001x01xxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  6 0 000011011101100001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     d 6 000101111111010011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 00010111111001x101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   6 0 011101011011100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 6 5 00001101110010x011110111| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 _L0x62   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  0 0 00011111111010x000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    0 5 00000001x10xxxx011101111|        Prepare read PC.
    * 66 SW_1     SW_2     7 0 01111101101001x011110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    6 0 0110010110x1100010010011|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 69 unx69             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     9 0 11011001111001x001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 0 00011101x10xxxx000110001| SLTU   Set less than (unsigned)
    * 6d unx6d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   0 3 000xxxx11111001011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    c 8 00010101111001x110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 6 0 011101011101100000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 0 00001101111010x000011010|        Invert q. Prepare read mask
    * 73 unalignd straddle 0 0 000001011101100000010010|  Fr10u Unaligned pc, prep read high hword
    * 74 MRET_9   Fetch    5 3 110110111011001011011110|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    5 0 11011011101011x011011110|        Mask and use as PC
    * 76 Fetchu   Fetch2u  0 b 000001111101100011010101|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2u  1 c 000101111101100011010101|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 _L0x78   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     7 0 01011001101001x011110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    0 0 00000001x01xxxx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  6 0 000011011101100001001001| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    5 0 110110111011000011011110|        Branch taken.
    * 7e NMI_1    NMI_2    6 0 001xxxx1110001x010010000|        Store pc to mepc.
    * 7f unx7f             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 100110101111000010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 _L0x82   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   0 0 00011111111010x000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 00010111111001x111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   4 0 010000011101000010011110|      Prep pc = jj + ofs
    * 87 unx87             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 _L0x88   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 89 unx89             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 3 3 000001011101001011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 0 00011111x10xxxx000101001| XOR    xor
    * 8d unx8d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 3 000101011111001010101001|        Q = 1
    * 90 NMI_2    JAL_3    e 0 011010011101100000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   e 3 0100010100x1001010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    6 0 0011001110x001x000110100|        PC to mepc
    * 93 SW_E2    SW_E3    6 0 00110111110001x010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    e 0 0101001110x1010000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    0 3 000101110111001010010100|        Q = 3
    * 96 SH_1     SH_2     6 6 00010111111001x010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    6 0 0110010110x1100010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  6 0 000111011101100000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    e 0 0101001100x1000000110100|        mcause = 11
    * 9b SH_4     SH_5     9 0 10111001111001x010011111|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 9d unx9d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    3 4 000001010101001000110100|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     7 0 00111001101001x011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    6 2 100110101111000001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  0 3 000101010111001010110110|        Q = 4
    * a2 _L0xa2   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   0 6 0001111010x1100000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 000011011111001010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  0 9 000101111011100011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 0 000xxxx11111000001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    e 3 0101001110x1001000110100|        Store 2 to mcause
    * aa _L0xaa   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  6 0 00110101110001x010011010|        pc to mepc
    * ac _L0xac   SRx_1    0 0 00011101x0xxxxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad unxad             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    0 0 00011101x0xxxxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 000xxxx11111001011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   e 0 0100010100x1000010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  0 3 000101010111001010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    5 3 110110110011001011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3  unalignd 4 d 001111111111001001110011|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     0 0 000000011101100010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  0 3 000101010111001010011010|        Q = 8
    * b7 IJ_3     IJ_4     6 0 00010101110001x010111101|        Store present PC in case of access error
    * b8 BGE      condb_2  6 0 000111011101100000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   0 0 00001111111010x000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     d 6 000101111111010010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  6 0 000011011101100001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     0 3 000001011111001001110101|        Construct Q = 1
    * be IJ_1     IJ_2     1 0 00010111111001x000011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 0 00010111111001x011000001|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    6 0 000101011101100011101001|        Read word is to be masked with ~1u
    * c2 _L0xc2   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    4 0 00011111110010x011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 0 00000001111010x001101111|        ~302
    * c6 IJT_4    ILL_2    6 0 00110101111011x001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   6 0 001xxxx1110001x011001011|        Store pc to mepc.
    * c8 _L0xc8   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   0 0 000011010111000010100101|        0xff+3 = 0x102
    * ca _L0xca   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc e 0 011010011101100011100110|        mtval = 0.
    * cc OR_0     OR_1     0 0 00011111x10xxxx000100110| OR     or
    * cd unxcd             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * cf MRET_7   MRET_8   0 5 00001101x10xxxx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 000000011111001000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 0 000011011101100011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     c 8 00010101111001x100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 6 0 011101011101100000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   e 3 0100010110x1001010010010|        Store 5 to mcause
    * d5 Fetch2u           4 e 011111111111000000000000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * d6 eILL0c   ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  6 0 011101011101100010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  6 0 000111011101100000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   0 0 00010101x10xxxx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   6 3 0101100110x1001010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  6 0 000011011101100001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  6 0 011101011101100011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   5 c 000101111101100011110100|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   5 c 000101111101100011110100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    0 0 00000001111001x000011101|        Q = RS1
    * e2 _L0xe2   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   0 0 00011111111010x000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  0 3 000101010111001010110000|        Q = 4
    * e6 StdIncPc Fetch    5 4 110110110011001011011110|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 6 0 011101011101100000011110|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    0 3 000110011111001011000110|        Construct Q = 1
    * ea _L0xea   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * eb LH_3     LH_4     0 0 00001111111010x001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 0 00011111x10xxxx000010001| AND    And 
    * ed unxed             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    5 3 110110110011001011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    c 8 00010101111001x101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 6 0 011101011101100000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 0 00000101x10xxxx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 0 000xxxx1x01xxxx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  4 f 011000111101000010110100|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 6 0 011101011101100011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    0 3 000110010111001011111010| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 6 0 011000011101100010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  6 0 000111011101100000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    0 3 000101011111001001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 0 000000011101100001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  6 0 000011011101100001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 0 00000101x10xxxx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    0 0 00000101x0xxxxx001000110| Illegal
    * ff QINT_0   QINT_1   0 0 00000101x10xxxx011000111| INT    Get current PC
    */
   localparam u0_0 = 256'hd8e64010d8e6e404f233f05ae08bf05aec09e8072004d0e640e6f0bee5d2f001;
   localparam u0_1 = 256'hb8b772d4dce6b8a62032cce69041d813a47d40e6e416f215e0143276e01ae08b;
   localparam u0_2 = 256'hd8e60000d8e6003ed230f096e021f096f01dc0272004983540e600fec0e6f052;
   localparam u0_3 = 256'h843a8435e503d8492032e53d00fed813c4d7f403e436a4decc9ea486e02bdae6;
   localparam u0_4 = 256'h727400fe00004031a4b1f066f24bf066c48f8447f265e82b00fe00fec40bf050;
   localparam u0_5 = 256'hb8dae570f4fbd8492032e45d00fe00fee08bec57d81ee5ebb8dae554b8dac4e6;
   localparam u0_6 = 256'hf2cf000000004031e47a00fe000000fe9893a4f240efe82b00fe00fec8f700fe;
   localparam u0_7 = 256'h0000c490b0ded8492032a4f200fe00fed8d5d8d5acdeb2ded812e81ad81ee5ba;
   localparam u0_8 = 256'hf2a900fe00004029d2e600fe000000fe0000d09ee5f0e82100fe00fe0000f085;
   localparam u0_9 = 256'ha4f25234000000fee49f103400fed8139893e4bb72949434c49584341292d834;
   localparam u0_A = 256'hf2c5003f0000003fc49a00fe923400fef061b8d0f2af983a00fe00fe72b6f05e;
   localparam u0_B = 256'he4c1e41ff275d849f4b5e81a00fed813c4bd729ad89bf273000032de72b21092;
   localparam u0_C = 256'h404f00fe00004026d8e600fe70a500fec4cbec47e86fc8e100fe00fed8e900fe;
   localparam u0_D = 256'hd8f4d8f4d8e5d8499292409100fed813d8a100fef0009292d81ee506d8c9f237;
   localparam u0_E = 256'h32de00fe00004011e85600fef2c600fed81e32de72b0e81a00fe00fee41d00fe;
   localparam u0_F = 256'h40c70046407ed849d86bf24500fed813d8ab72fad8dbd0b420dd40e6d81ee572;
   localparam u1_0 = 256'h3005001d3005001d0305401c000b401c000b000d000130050005229b1117009a;
   localparam u1_1 = 256'h4041031530050217000130054041601d6001000105010319001f54db001d001f;
   localparam u1_2 = 256'h300576003005001d0301421c001d421c0001401d0001061e000500013005629a;
   localparam u1_3 = 256'h061e061e8815600d000138150001601d65218617361750db40416001001f3705;
   localparam u1_4 = 256'h031500017600001da075999d0301999d607560350315001f000100016015099b;
   localparam u1_5 = 256'h60751117d617600d0001661700010001001100116075c815607511176075ba17;
   localparam u1_6 = 256'h030176007600001d90d90001760000016065707d0501001f00010001650d0001;
   localparam u1_7 = 256'h7600602150db600d00017059000100011c170b0750db53db0005000d6075c815;
   localparam u1_8 = 256'h031500017600001f3305000176000001760040411117001f000100017600009a;
   localparam u1_9 = 256'h703934057600000190b9e0530001601d606566170317e05360376033e345e069;
   localparam u1_A = 256'h0301001d7600001d60350001e353000100010917030d061e000100010315629a;
   localparam u1_B = 256'h101710170305600dd617000f0001601d6015031500014d3f760053db0315e045;
   localparam u1_C = 256'h050d00017600001fe0690001000d0001602160350001401f0001000160150001;
   localparam u1_D = 256'h5c175c176075600d635900150001601d607500014e7fe3456075c815400d0301;
   localparam u1_E = 256'h53db00017600001f000f000103190001607554db0315001f0001000100010001;
   localparam u1_F = 256'h000500050005600d000103150001601d6061031960754f63000100056075c815;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[8] = indir[8];
   assign d[9] = indir[9];
   assign d[11] = indir[10];
   assign d[12] = indir[11];
   assign d[13] = indir[12];
   assign d[16] = indir[13];
   assign d[17] = indir[14];
   assign d[19] = indir[15];
   assign d[20] = indir[16];
   assign d[22] = indir[17];
   assign d[23] = indir[18];
   assign d[24] = indir[19];
   assign d[25] = indir[20];
   assign d[26] = indir[21];
   assign d[27] = indir[22];
   assign d[40] = indir[23];
   // replaces = 1000100100111000000001001001100010000000000
   SB_LUT4 #(.LUT_INIT(16'h2018)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1800)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfebf)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h6000)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0204)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d42(.O(d[42]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0101011011000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h6948)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6070)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0822)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h3100)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4400)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1207)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   MULDIV included
 *   minstret not implemented
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 46 columns
 * Removed:  0000000000000001000000000001000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 208 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 207 208 207 208 208 208 208 208 208 208 208 208 208 208 208   x 208 208 208 208 207 208 206 207 208 208 208   x 208 208 208 208 207 205 206 208 207 208 207 208 207 208 208 207 206 207  kill col 12  Tbl  43 cols 0000000000000001000000000001000001000000000000 has 205 unique lines.
 * 204 205 204 204 205 205 205 205 205 205 205 205 205 205 205   x 205 205 205 205 203 205 203 202 205 205 205   x 205 205 205 205 203     203 205 204 205 204 205 204 205 205 204 203 204  kill col 22  Tbl  42 cols 0000000000000001000000010001000001000000000000 has 202 unique lines.
 * 201 202 201 201 202 202 202 202 202 202 202 202 202 202 202   x 202 202 202 202 201 201 200     202 202 202   x 202 202 202 202 200     200 202 201 202 201 201 200 202 202 201 200 200  kill col 23  Tbl  41 cols 0000000000000001000000110001000001000000000000 has 200 unique lines.
 * 199 200 199 199 200 200 200 200 200 200 200 200 200 200 200   x 200 200 199 199 198 199         200 200 200   x 200 200 200 200 198     198 200 199 200 199 199 198 200 200 198 198 198  kill col 25  Tbl  40 cols 0000000000000001000010110001000001000000000000 has 198 unique lines.
 * 197 198 197 197 198 198 198 198 198 198 198 198 198 198 198   x 198 198 197 197     197         198 198 198   x 198 198 198 198 196     196 198 197 198 196 197 196 197 198 196 196 196  kill col 13  Tbl  39 cols 0000000000000001000010110001000011000000000000 has 196 unique lines.
 * 195 196 195 195 196 196 196 196 196 196 196 196 196 196 196   x 196 196 195 195     195         196 196 196   x 196 196 196 196         193 196 195 195 194 195 194 194 196 194 194 194  kill col 11  Tbl  38 cols 0000000000000001000010110001000011100000000000 has 193 unique lines.
 * 192 193 192 189 193 193 193 193 193 193 193 193 193 193 193   x 193 193 192 192     192         193 193 193   x 193 193 193 193             193 192 192 191 192 191 190 193 191 191 191  kill col 42  Tbl  37 cols 0001000000000001000010110001000011100000000000 has 189 unique lines.
 * 188 189 188     189 189 189 189 189 189 189 189 189 189 189   x 189 189 188 188     188         189 189 188   x 189 189 189 189             189 188 188 187 188 187 186 189 187 187 187  kill col  4  Tbl  36 cols 0001000000000001000010110001000011100000010000 has 186 unique lines.
 * 185 186 185     186 186 186 186 186 186 186 186 186 186 186   x 186 186 184 185     185         186 186 185   x 186 185 186 186             186 185 185 184 185 184     185 184 184 184  kill col 27  Tbl  35 cols 0001000000000001001010110001000011100000010000 has 184 unique lines.
 * 183 184 183     184 184 184 184 184 184 184 184 184 184 184   x 184 184     183     183         184 184 183   x 184 183 184 184             184 183 183 182 183 182     183 182 182 182  kill col  7  Tbl  34 cols 0001000000000001001010110001000011100010010000 has 182 unique lines.
 * 181 182 181     182 182 182 182 182 182 182 182 182 182 182   x 182 181     181     180         182 182 181   x 181 180 182 182             180 181 181     181 175     179 177 179 178  kill col  5  Tbl  33 cols 0001000000000001001010110001000011100010110000 has 175 unique lines.
 * 174 175 174     175 175 175 175 175 175 175 175 174 175 175   x 175 174     172     170         175 175 174   x 173 173 175 175             174 174 174     170         165 166 170 167  kill col  3  Tbl  32 cols 0001000000000001001010110001000011100010111000 has 165 unique lines.
 * 164 165 164     165 165 165 165 165 165 165 165 164 165 165   x 165 164     161     158         165 165 163   x 162 163 165 164             164 164 164     157             153 154 154  kill col  2  Tbl  31 cols 0001000000000001001010110001000011100010111100 has 153 unique lines.
 * 152 153 151     153 153 153 153 153 153 153 153 151 153 153   x 152 149     148     144         153 153 149   x 148 148 153 149             152 152 151     140                 134 142  kill col  1  Tbl  30 cols 0001000000000001001010110001000011100010111110 has 134 unique lines.
 * 133 134 131     133 134 134 134 134 134 134 130 132 134 134   x 132 130     130     122         132 134 129   x 128 129 134 129             133 133 131     115                     120  kill col  6  Tbl  29 cols 0001000000000001001010110001000011100011111110 has 115 unique lines.
 * 114 115 110     114 115 115 115 115 115 115 112 114 114 113   x 113 111     111     101         111 115 109   x 109 108 113 109             114 114 111                              99  kill col  0  Tbl  28 cols 0001000000000001001010110001000011100011111111 has  99 unique lines.
 *  98  98  92      98  99  99  99  99  99  99  95  98  98  97   x  96  96      95      88          93  99  94   x  93  92  97  93              98  98  94                                  kill col 24  Tbl  27 cols 0001000000000001001011110001000011100011111111 has  88 unique lines.
 *  87  86  82      87  88  87  88  87  88  88  84  87  87  86   x  84  85      83                  82  88  83   x  82  79  86  84              87  86  82                                  kill col 16  Tbl  26 cols 0001000000000001001011110001010011100011111111 has  79 unique lines.
 *  78  77  73      78  79  78  79  78  79  79  75  78  78  77   x  75  76      73                  72  78  72   x  74      77  75              78  77  73                                  kill col 21  Tbl  25 cols 0001000000000001001011111001010011100011111111 has  72 unique lines.
 *  71  70  66      71  72  71  72  71  72  72  68  71  71  70   x  69  69      66                      70  65   x  67      70  68              71  70  67                                  kill col 19  Tbl  24 cols 0001000000000001001011111011010011100011111111 has  65 unique lines.
 *  63  63  58      64  65  63  65  64  65  65  61  64  64  63   x  62  62      59                      62       x  60      63  62              64  63  61                                  kill col 43  Tbl  23 cols 0011000000000001001011111011010011100011111111 has  58 unique lines.
 *  56  55          57  58  56  58  57  58  58  54  57  57  56   x  55  55      52                      55       x  53      56  55              56  56  55                                  kill col 26  Tbl  22 cols 0011000000000001001111111011010011100011111111 has  52 unique lines.
 *  50  49          51  52  50  52  51  52  52  48  51  51  50   x  49  50                              49       x  47      50  50              50  50  49                                  kill col 17  Tbl  21 cols 0011000000000001001111111011110011100011111111 has  47 unique lines.
 *  45  45          46  45  45  47  46  47  47  43  46  46  45   x  42  44                              44       x          45  45              45  45  44                                  kill col 29  Tbl  20 cols 0011000000000001101111111011110011100011111111 has  42 unique lines.
 *  40  40          41  40  37  42  41  42  42  39  41  41  40   x      40                              40       x          40  40              40  40  39                                  kill col 39  Tbl  19 cols 0011001000000001101111111011110011100011111111 has  37 unique lines.
 *  35  35          36  34      37  36  37  37  34  36  36  35   x      32                              35       x          36  35              35  35  34                                  kill col 28  Tbl  18 cols 0011001000000001111111111011110011100011111111 has  32 unique lines.
 *  30  30          31  28      31  31  31  32  30  31  31  29   x                                      30       x          31  31              30  30  30                                  kill col 40  Tbl  17 cols 0011011000000001111111111011110011100011111111 has  28 unique lines.
 *  26  26          26          27  27  26  28  26  25  27  26   x                                      26       x          27  27              26  26  26                                  kill col 33  Tbl  16 cols 0011011000001001111111111011110011100011111111 has  25 unique lines.
 *  24  23          23          24  24  23  24  23      24  23   x                                      23       x          24  24              23  23  23                                  kill col 44  Tbl  15 cols 0111011000001001111111111011110011100011111111 has  23 unique lines.
 *  22              21          22  22  21  22  21      22  21   x                                      21       x          22  22              21  21  21                                  kill col 41  Tbl  14 cols 0111111000001001111111111011110011100011111111 has  21 unique lines.
 *  20                          20  20  19  20  19      20  19   x                                      19       x          20  20              19  19  19                                  kill col 36  Tbl  13 cols 0111111001001001111111111011110011100011111111 has  19 unique lines.
 *  18                          18  17      18  17      18  17   x                                      17       x          18  18              17  17  17                                  kill col 37  Tbl  12 cols 0111111011001001111111111011110011100011111111 has  17 unique lines.
 *  16                          16          16  15      16  15   x                                      15       x          16  16              15  15  15                                  kill col 34  Tbl  11 cols 0111111011011001111111111011110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 31 
 *
 * Round 1: 1000000100100110000000000100001100011100000000  4 columns for indexes to table representing 11 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 39
 * 205 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 205 202 205 205 205 205   x 205 205   x 205 205   x   x   x 205 205 205 205 204 205 203 204 205   x 203   x 205 205   x   x 204 202 203   x   x   x 204 205 204 205 205 204 203 204  kill col 43  Tbl  32 cols 1010000100100111000000000101001100011100000000 has 202 unique lines.
 *   x 202     202 202 202 202   x 202 202   x 202 202   x   x   x 202 202 202 202 201 202 200 201 202   x 199   x 202 202   x   x 201 199 200   x   x   x 201 202 201 202 202 201 200 201  kill col 19  Tbl  31 cols 1010000100100111000000000111001100011100000000 has 199 unique lines.
 *   x 199     199 199 199 199   x 199 199   x 199 199   x   x   x 199 199 199 199 198 199 197 198 199   x       x 199 199   x   x 198 196 197   x   x   x 198 199 198 199 199 198 197 198  kill col 12  Tbl  30 cols 1010000100100111000000000111001101011100000000 has 196 unique lines.
 *   x 196     195 196 196 196   x 196 196   x 196 196   x   x   x 196 196 196 196 194 196 194 193 196   x       x 196 196   x   x 194     194   x   x   x 195 196 195 196 196 195 194 195  kill col 22  Tbl  29 cols 1010000100100111000000010111001101011100000000 has 193 unique lines.
 *   x 193     192 193 193 193   x 193 193   x 193 193   x   x   x 193 193 193 193 192 192 191     193   x       x 193 193   x   x 190     191   x   x   x 192 192 191 193 193 192 191 191  kill col 13  Tbl  28 cols 1010000100100111000000010111001111011100000000 has 190 unique lines.
 *   x 190     189 190 190 190   x 190 190   x 190 190   x   x   x 190 190 190 190 189 189 188     190   x       x 190 190   x   x         187   x   x   x 189 189 188 189 190 189 188 188  kill col 11  Tbl  27 cols 1010000100100111000000010111001111111100000000 has 187 unique lines.
 *   x 187     182 187 187 187   x 187 187   x 187 187   x   x   x 187 187 187 187 186 186 185     187   x       x 187 185   x   x               x   x   x 186 185 185 185 187 186 184 185  kill col 42  Tbl  26 cols 1011000100100111000000010111001111111100000000 has 182 unique lines.
 *   x 182         182 182 182   x 182 182   x 182 182   x   x   x 182 182 182 182 181 181 180     182   x       x 182 180   x   x               x   x   x 181 180 178 180 182 180 179 179  kill col  5  Tbl  25 cols 1011000100100111000000010111001111111100100000 has 178 unique lines.
 *   x 178         178 178 178   x 178 178   x 178 177   x   x   x 178 178 178 178 177 176 174     178   x       x 178 174   x   x               x   x   x 170 176     175 177 173 172 173  kill col  7  Tbl  24 cols 1011000100100111000000010111001111111110100000 has 170 unique lines.
 *   x 170         170 170 170   x 170 170   x 170 169   x   x   x 170 169 170 170 169 165 167     170   x       x 169 165   x   x               x   x   x     168     166 166 162 162 165  kill col  2  Tbl  23 cols 1011000100100111000000010111001111111110100100 has 162 unique lines.
 *   x 162         162 162 162   x 162 162   x 162 160   x   x   x 162 161 161 162 159 157 157     160   x       x 158 157   x   x               x   x   x     157     158 156     155 156  kill col  1  Tbl  22 cols 1011000100100111000000010111001111111110100110 has 155 unique lines.
 *   x 153         155 155 155   x 155 155   x 154 152   x   x   x 154 154 154 155 152 149 148     152   x       x 151 145   x   x               x   x   x     143     145 142         145  kill col  3  Tbl  21 cols 1011000100100111000000010111001111111110101110 has 142 unique lines.
 *   x 139         142 141 142   x 142 142   x 140 139   x   x   x 141 141 141 141 136 133 134     137   x       x 136 131   x   x               x   x   x     122     126             123  kill col  6  Tbl  20 cols 1011000100100111000000010111001111111111101110 has 122 unique lines.
 *   x 118         122 121 122   x 122 121   x 120 118   x   x   x 121 120 119 121 112 112 113     117   x       x 114 110   x   x               x   x   x              98              99  kill col  4  Tbl  19 cols 1011000100100111000000010111001111111111111110 has  98 unique lines.
 *   x  95          98  96  98   x  98  97   x  95  95   x   x   x  96  95  95  95  88  88  90      92   x       x  89  85   x   x               x   x   x                              75  kill col  0  Tbl  18 cols 1011000100100111000000010111001111111111111111 has  75 unique lines.
 *   x  72          75  74  75   x  75  74   x  72  73   x   x   x  73  73  73  73  67  67  68      70   x       x  67  65   x   x               x   x   x                                  kill col 16  Tbl  17 cols 1011000100100111000000010111011111111111111111 has  65 unique lines.
 *   x  61          65  64  65   x  65  64   x  62  64   x   x   x  63  63  62  63  57  56  59      59   x       x  55       x   x               x   x   x                                  kill col 17  Tbl  16 cols 1011000100100111000000010111111111111111111111 has  55 unique lines.
 *   x  51          55  54  55   x  55  54   x  52  54   x   x   x  52  53  53  53  47  46  48      50   x       x           x   x               x   x   x                                  kill col 24  Tbl  15 cols 1011000100100111000001010111111111111111111111 has  46 unique lines.
 *   x  43          46  45  46   x  45  45   x  43  44   x   x   x  42  43  44  44  40      40      43   x       x           x   x               x   x   x                                  kill col 25  Tbl  14 cols 1011000100100111000011010111111111111111111111 has  40 unique lines.
 *   x  37          40  38  40   x  39  39   x  37  37   x   x   x  35  37  37  36          34      36   x       x           x   x               x   x   x                                  kill col 23  Tbl  13 cols 1011000100100111000011110111111111111111111111 has  34 unique lines.
 *   x  32          33  32  33   x  33  33   x  31  31   x   x   x  29  30  29  28                  30   x       x           x   x               x   x   x                                  kill col 26  Tbl  12 cols 1011000100100111000111110111111111111111111111 has  28 unique lines.
 *   x  26          27  26  26   x  27  27   x  25  25   x   x   x  23  24  24                      23   x       x           x   x               x   x   x                                  kill col 29  Tbl  11 cols 1011000100100111100111110111111111111111111111 has  23 unique lines.
 *   x  21          22  21  20   x  22  22   x  21  20   x   x   x      19  20                      19   x       x           x   x               x   x   x                                  kill col 28  Tbl  10 cols 1011000100100111110111110111111111111111111111 has  19 unique lines.
 *   x  17          18  17  14   x  18  17   x  17  17   x   x   x          17                      16   x       x           x   x               x   x   x                                  kill col 39  Tbl   9 cols 1011001100100111110111110111111111111111111111 has  14 unique lines.
Possible good candidates for removal, columns : 21 
 *
 * Round 2: 0100110011011000001000001000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 14 of 16 lines in indirect table).
 * Direct:  0011001000000000110111110010110011100011111111 24 columns
 * Success. Use 2 EBRs, 20 LUTs.
 */

module v12_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 011000110111110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 001000101111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 011000110111110010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 3 0010000010x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 3 010010001011010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   3 3 0010000000x01xxx00000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     3 3 001000011011101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     3 3 001000010111101100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     3 0 010100111011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     3 3 001000010111100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     3 0 010100111011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   3 4 011000001011110000110011|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   3 3 001000111011100100000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    3 3 1010001110x10xxx11100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    3 3 0010001110x10xxx00010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 3 000010001011011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     3 3 001000111111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   3 3 001000111011100000011010|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   4 5 110100110100110001110110|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  3 3 001000111111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  3 4 011000110011110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  3 6 001000000011100100010110|        Branch on condition
    * 16 condb_5  StdIncPc 3 3 0010000000x10xxx11100110|        Branch not taken.
    * 17 condb_5t condb_6t 3 3 000110000010100101111101|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  3 3 000110111011011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 3 010100000010x10001000001| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 3 3 000010001011001111100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 3 0010000000x01xxx00110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 3 2 001000101110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 000010001011011111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 4 111000101001110011010100|        Q = 4
    * 1f IJ_2     IJ_3     5 3 000100000010111010110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     0 7 010110110111110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 000010001011000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  3 8 001000101011110000111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 3 3 0010000010x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   6 0 001000111110x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   3 3 0010000000x01xxx00000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     3 3 000100111011000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    3 3 011000000011110000011101|        Q = rs2
    * 28 _L0x28   SH_1     3 7 010100111011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   3 3 001000111011100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     3 7 010100111011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 4 011000xxxx11010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 3 0010001110x0xxxx00111110| SLL    Shift left
    * 2d MULH_0   MULH_1   6 3 001000101011100101101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  3 3 100100111111011001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 3 3 000010001011011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 9 000010001011011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  3 3 001000111111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    3 3 000110000010100110000110|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   5 3 000100000011001110011110|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    4 3 000100110110100111011110|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   6 3 000010101111100100110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   7 3 000010101111110100000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  3 6 000111xxxx11000111010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  3 3 000110111011011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 100010001011000111100110|        Last shift.
    * 3a SRxI_1   SRxI_2   6 8 000010101011100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 3 0010000000x01xxx00110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  3 3 000110011011011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   7 8 000010101011100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   6 0 001000111110x00100110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   6 0 001000111110x00100111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 a 011000110111110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   3 3 000110101011000100001011|        yy=jj. Prep get Q=1
    * 42 MULHU_2  MULHU_3  6 8 001000101011110001100000|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  3 3 001000000010100011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  3 3 001000111111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    3 4 011000101011110001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    3 3 000111101010x00101000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    5 3 000111101011000110001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     8 a 011000111011110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  3 4 011000000011110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     8 a 011000111011110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  9 3 000001101010100110110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 3 0010001110x10xxx00110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  6 3 000110111011000100101110| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * 4f MRET_8   MRET_9   3 4 111000101001110001110100|        +4, so now 0x103
    * 50 LW_1     StdIncPc 1 b 000010101111000111100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   5 3 000111101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 001000101111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   5 3 000111101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     7 8 001000101011100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 5 3 000111101011011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     3 3 001000100011101101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     3 3 001000100011100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    3 8 111000101111100101101110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   3 3 000110111111011010011100|        REM = Q to yy
    * 5a SB_1     SB_2     6 3 000110101111100101011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 3 0010000000x01xxx00110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  3 3 000110011011011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 3 000110101111110111111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 001000101111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   5 3 000111101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  3 3 101000111111100101000010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 3 6 000110011011001011110111| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 DIV_8    DIV_7    6 4 011000101111110011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    a 4 011000101111110001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  3 3 001000111111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 6 0010000000x10xxx11101111|        Prepare read PC.
    * 66 SW_1     SW_2     5 3 000001111010100111110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    5 3 000111001010x11010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 000010001011000111100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     3 3 001000101011100010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   3 3 000110101011000011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     b 3 001000110011100101111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 3 0010001110x10xxx00110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  6 3 000110111011000100101110| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    3 3 000110111010100110111001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   3 4 011000xxxx11110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    7 8 001000101011100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 5 3 000111101011011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   3 3 001000011011101000011010|        Invert q. Prepare read mask
    * 73 unx73             6 0 00xxxxxxxxxxxxxxxxxxxxxx| 73: Not in use 
    * 74 MRET_9   Fetch    4 4 010100110110110011011110|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    4 3 000100110110101111011110|        Mask and use as PC
    * 76 Fetchu   Fetch2   3 c 001000001111011011110100|  Fr00u Read and latch instruction
    * 77 eFetchu  Fetch2   1 d 001000101111011011110100|  Fr00u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    3 3 000110000011011010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    3 4 111000101011110010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     5 3 000000110010100111110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 3 0010000000x01xxx00110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  3 3 000110011011011001001001| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    4 3 010100110110110011011110|        Branch taken.
    * 7e NMI_1    NMI_2    3 3 000111xxxx11000110010000|        Store pc to mepc.
    * 7f unx7f             6 0 00xxxxxxxxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 011000110111110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             6 0 00xxxxxxxxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 DIV_1    DIV_3    3 3 000100111011000010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    3 3 011000101011110010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   3 3 001000111111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 001000101111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   5 3 010100000011010010011110|      Prep pc = jj + ofs
    * 87 unx87             6 0 00xxxxxxxxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 DIV_E    DIV_10   a 3 1010001111x0xxxx10011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 000010001011011011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   3 8 1110001011x10xxx00011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 3 4 110010001011010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 3 0010001111x10xxx00101001| XOR    xor
    * 8d DIV_0    DIV_1    c 3 101000101111100110000010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    3 4 001000101011110010101001|        Q = 1
    * 90 NMI_2    JAL_3    d 3 000111010011011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   d 4 110110001000x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    3 3 000111100110x00100110100|        PC to mepc
    * 93 SW_E2    SW_E3    3 3 000111101111000110010101|        Store address that faulted
    * 94 SW_E4    JAL_3    d 3 000110100110x10100110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 4 111000101101110010010100|        Q = 3
    * 96 SH_1     SH_2     6 3 000110101111100110111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    5 3 000111001010x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  3 3 000110111011011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 3 001000xxxxx0xxxx11111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    d 3 010110100100x10000110100|        mcause = 11
    * 9b SH_4     SH_5     8 3 001001110011100110011111|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   a 3 101000110011000101101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   a 3 101000110011000110100010|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    3 5 110010001001010000110100|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     3 3 000001110010100111110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    0 7 010110110111110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  3 4 111000101001110010110110|        Q = 4
    * a2 DIV_14   LB_6     3 3 001000101011100010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 3 3 000010001011000111100110|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   6 0 001000111110x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   3 4 011000011011110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 a 001000101110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 3 3 011000xxxx11110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    a 3 101000101011100001111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    d 4 010110100110x10000110100|        Store 2 to mcause
    * aa DIV_6    DIV_7    3 3 1010001011x10xxx11001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  3 3 000111101011000110011010|        pc to mepc
    * ac _L0xac   SRx_1    3 3 0010001110x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   6 3 1010001110x10xxx11100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    3 3 0010001110x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   3 4 011000xxxx11110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   d 3 010110001000x10010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  3 4 111000101001110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    4 4 110100110100110011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             6 0 00xxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 ic0reser          6 0 00xxxxxxxxxxxxxxxxxxxxxx|  Fr00  Not really used, reserved to allow LASTINCH
    * b5 SH_3     SH_4     3 3 001000000011011010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  3 4 111000101001110010011010|        Q = 8
    * b7 IJ_3     IJ_4     3 3 000110101011000110111101|        Store present PC in case of access error
    * b8 BGE      condb_2  3 3 000110111011011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    3 4 001000110011100011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   3 3 001000011111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     7 3 000110101111110110110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  3 3 000110011011011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     3 4 011000001011110001110101|        Construct Q = 1
    * be IJ_1     IJ_2     1 3 001000101111100100011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 3 001000101111100111000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    3 6 001000111011100110001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    3 3 000110101011011011101001|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   6 4 011000101111110011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   a 4 011000101111110010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    3 3 000100111111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   3 3 001000000011101001101111|        ~302
    * c6 IJT_4    ILL_2    3 3 000111101011101101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   3 3 000111xxxx11000111001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    3 e 101000110011110101100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   3 3 011000011001110010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   3 e 101000110011110111000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc d 3 000111010011011011100110|        mtval = 0.
    * cc OR_0     OR_1     3 3 0010001111x10xxx00100110| OR     or
    * cd REM_0    DIV_1    c 3 101000101111100110000010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * cf MRET_7   MRET_8   3 6 0010000110x10xxx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  3 4 011000000011110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   3 3 000100011011011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     7 8 001000101011100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 5 3 000111101011011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   d 4 010110001010x10010010010|        Store 5 to mcause
    * d5 unalignd straddle 3 3 001000001011011000010010|  Fr00u Unaligned pc, prep read high hword
    * d6 eILL0c   ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  5 3 000111101011011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  3 3 000110111011011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  3 3 1010001111x10xxx01000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 3 0010001010x10xxx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 4 010110110010x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  3 3 000110011011011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  5 3 000111101011011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   3 c 000100001111011011110100|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   1 d 000100101111011011110100|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   3 3 000110101111000011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    3 3 001000000011100100011101|        Q = RS1
    * e2 MUL_1    MUL_2    6 8 001000101011110011101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 8 1110001011x10xxx00011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   3 3 001000111111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 4 111000101001110010110000|        Q = 4
    * e6 StdIncPc Fetch    4 5 110100110100110011011110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 5 3 000111101011011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    3 3 101000111011100111100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    3 4 011000110011110011000110|        Construct Q = 1
    * ea MULHU_5  MULHU_6  3 3 001000110011110000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     3 3 001000011111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 3 0010001111x10xxx00010001| AND    And 
    * ed REMU_0   DIVU_1   6 3 1010001110x10xxx11100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    4 4 110100110100110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    7 8 001000101011100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 5 3 000111101011011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 3 0010000010x10xxx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 3 001000xxxxx01xxx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd 5 3 010101111111110011010101|  Fr00  Upd ttime, I. Q=imm Use dinx unless unaligned 
    * f5 jFault   jFault_1 5 3 000111101011011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 4 111000110001110011111010| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 5 3 000111000011011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  3 3 000110111011011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   3 4 010100111011010011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    3 4 011000101011110001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     3 3 001000000011011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  3 3 000110011011011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 3 0010000010x10xxx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 3 0010000010x0xxxx01000110| Illegal
    * ff QINT_0   QINT_1   3 3 0010000010x10xxx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'hb6e6901090e2b904bc33bc5a788bbc5a7b09ba070804b4e690e67cbef9d27c01;
   localparam u0_1 = 256'h2eb79cd4b7e6eea60832b3e62441b613297d10e639163c15f8144c76b81af88b;
   localparam u0_2 = 256'hb6e6f642b96a803e3430bc96b821bc963c1db0270804e63590e6bc39b0e67c52;
   localparam u0_3 = 256'he13ae135b903b6490832b93db1e6b61331d7fd03f93669de339e2986f82bb6e6;
   localparam u0_4 = 256'h9c7400feb12e9031a9b1bc663c4bbc66b18fa147bc65fa2b28eabc60b10b7c50;
   localparam u0_5 = 256'haedaf970fdfbb6490832f95df69cf96e388b3b57b61eb9ebaedaf954aedaf1e6;
   localparam u0_6 = 256'h3ccfa9b9b12e9031397ab0f9b88bb1e6a693a9f210effa2bfc58fcc8b2f7f942;
   localparam u0_7 = 256'h000031906cdeb649083229f2bca836aaf6f4f6f46bde6cde0000ba1ab61eb9ba;
   localparam u0_8 = 256'hbca900fef982d029b4e6d01ab6e6c09c0000349ef9f0fa21bc82b0a800007c85;
   localparam u0_9 = 256'h29f2943431a23168399f443400feb613a693f9bbdc946534f195613484923634;
   localparam u0_A = 256'h3cc5803f90e0803fb19ad0c86434b8783c61eed0bcafe63ab1e6b88b9cb67c5e;
   localparam u0_B = 256'hf9c1f91fbc75b649fdb5fa1a38c0b613b1bd9c9a369b000000004cde9cb28492;
   localparam u0_C = 256'h904f00fef982d02636e63dc29ca53d6231cbbb473a6ff2e1fc8afccab6e9b988;
   localparam u0_D = 256'hf6f4f6f4b6e5b64924929091d042b613b6a100feb612a492b61eb906b6c93c37;
   localparam u0_E = 256'h4cde00fe90e0d011fa563c223cc6b9e2b61e4cde9cb0fa1ad01abce8391df0ca;
   localparam u0_F = 256'h90c78046907eb649366bbc45b4d9b61336ab1cfab6dbfcd508dd90e6b61eb972;
   localparam u1_0 = 256'h3308332333a33323346030533321305333213321332033483320226311220063;
   localparam u1_1 = 256'h531034e233083222332033085350331b3318332036203463332345d333233323;
   localparam u1_2 = 256'h330833936322332334603753332337533360331333206023332038223308075b;
   localparam u1_3 = 256'h60236023780a33193320680a3388331b361c730a630a43135310331833233908;
   localparam u1_4 = 256'h34e23320631b332393068a6334608a63531e331e3462332333206822331a0a63;
   localparam u1_5 = 256'h531e1122731a33193320631a331b38e233223322531e7822531e1122531e1b0a;
   localparam u1_6 = 256'h3460331b631b3323b323331a33223308531c530736203323a4626462361933a3;
   localparam u1_7 = 256'h6000331c435333193320530334e233181d223c204313445360003321531e7822;
   localparam u1_8 = 256'h34223320c3a2332334c838e23308a3a360005350112233233362331360000063;
   localparam u1_9 = 256'h330735c8a3a3a3a38327d35a3320331b531c631a34e2d31a331e331ed4d8d31d;
   localparam u1_A = 256'h3460332363a33323331e33a2d45aa3a233603a22346160233308332234e2075b;
   localparam u1_B = 256'h1322132234603319731a33213423331b331a34e233206000600044d334e2d358;
   localparam u1_C = 256'h36213320c3a23323d31d3ea333613ea3331c331e33203313a4626462331a3623;
   localparam u1_D = 256'h1d123c10531e3319545b332233a3331b531e33203320d458531e782233113460;
   localparam u1_E = 256'h44d3332063a3332333213323346333a3531e45d334e2332338e268223320331a;
   localparam u1_F = 256'h3320332033203319332034623453331b531c34e3531e535733203320531e7822;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[11] = indir[8];
   assign d[12] = indir[9];
   assign d[13] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[19] = indir[13];
   assign d[22] = indir[14];
   assign d[23] = indir[15];
   assign d[24] = indir[16];
   assign d[25] = indir[17];
   assign d[26] = indir[18];
   assign d[28] = indir[19];
   assign d[29] = indir[20];
   assign d[39] = indir[21];
   assign d[42] = indir[22];
   assign d[43] = indir[23];
   // replaces = 1000000100100110000000000100001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0102)) cmb_d08(.O(d[8]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0230)) cmb_d09(.O(d[9]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4030)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h7f7e)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0484)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0400)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2800)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d45(.O(d[45]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0100110011011000001000001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h2f3f)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2a30)) cmb_d27(.O(d[27]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0012)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0080)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2200)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0915)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0900)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d44(.O(d[44]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;        bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));assign d[30] = d[18];
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   MULDIV included
 *   minstret for instructions in SRAM
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 46 columns
 * Removed:  0000000000000000000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 210 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 209 210 209 210 210 210 210 210 210 210 210 210 210 210 210 210 210 210 210 210 209 210 208 209 210 210 210 210 210 210 210 210 209 207 208 210 209 210 209 210 209 210 210 209 208 209  kill col 12  Tbl  45 cols 0000000000000000000000000000000001000000000000 has 207 unique lines.
 * 206 207 206 206 207 207 207 207 207 207 207 207 207 207 207 207 207 207 207 207 205 207 205 204 207 207 207 207 207 207 207 207 205     205 207 206 207 206 207 206 207 207 206 205 206  kill col 22  Tbl  44 cols 0000000000000000000000010000000001000000000000 has 204 unique lines.
 * 203 204 203 203 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 203 203 202     204 204 204 204 204 204 204 204 202     202 204 203 204 203 203 202 204 204 203 202 202  kill col 23  Tbl  43 cols 0000000000000000000000110000000001000000000000 has 202 unique lines.
 * 201 202 201 201 202 202 202 202 202 202 202 202 202 202 202 202 202 202 201 201 200 201         202 202 202 202 202 202 202 202 200     200 202 201 202 201 201 200 202 202 200 200 200  kill col 25  Tbl  42 cols 0000000000000000000010110000000001000000000000 has 200 unique lines.
 * 199 200 199 199 200 200 200 200 200 200 200 200 200 200 200 200 200 200 199 199     199         200 200 200 200 200 200 200 200 198     198 200 199 200 198 199 198 199 200 198 198 198  kill col 13  Tbl  41 cols 0000000000000000000010110000000011000000000000 has 198 unique lines.
 * 197 198 197 197 198 198 198 198 198 198 198 198 198 198 198 198 198 198 197 197     197         198 198 198 198 198 198 198 198         195 198 197 197 196 197 196 196 198 196 196 196  kill col 11  Tbl  40 cols 0000000000000000000010110000000011100000000000 has 195 unique lines.
 * 194 195 194 191 195 195 195 195 195 195 195 195 195 195 195 195 195 195 194 194     194         195 195 195 195 195 195 195 195             195 194 194 193 194 193 192 195 193 193 193  kill col 42  Tbl  39 cols 0001000000000000000010110000000011100000000000 has 191 unique lines.
 * 190 191 190     191 191 191 191 191 191 191 191 191 191 191 191 191 191 190 190     190         191 191 190 191 191 191 191 191             191 190 190 189 190 189 188 191 189 189 189  kill col  4  Tbl  38 cols 0001000000000000000010110000000011100000010000 has 188 unique lines.
 * 187 188 187     188 188 188 188 188 188 188 188 188 188 188 188 188 188 186 187     187         188 188 187 188 188 187 188 188             188 187 187 186 187 186     187 186 186 186  kill col 27  Tbl  37 cols 0001000000000000001010110000000011100000010000 has 186 unique lines.
 * 185 186 185     186 186 186 186 186 186 186 186 186 186 186 186 186 186     185     185         186 186 185 186 186 185 186 186             186 185 185 184 185 184     185 184 184 184  kill col  7  Tbl  36 cols 0001000000000000001010110000000011100010010000 has 184 unique lines.
 * 183 184 183     184 184 184 184 184 184 184 184 184 184 184 184 184 183     183     182         184 184 183 184 183 182 184 184             182 183 183     183 177     181 179 181 180  kill col  5  Tbl  35 cols 0001000000000000001010110000000011100010110000 has 177 unique lines.
 * 176 177 176     177 177 177 177 177 177 177 177 176 177 177 177 177 176     174     172         177 177 176 177 175 175 177 177             176 176 176     172         167 168 172 169  kill col  3  Tbl  34 cols 0001000000000000001010110000000011100010111000 has 167 unique lines.
 * 166 167 166     167 167 167 167 167 167 167 167 166 167 167 167 167 166     163     160         167 167 165 167 164 165 167 166             166 166 166     159             155 156 156  kill col  2  Tbl  33 cols 0001000000000000001010110000000011100010111100 has 155 unique lines.
 * 154 155 153     155 155 155 155 155 155 155 155 153 155 155 155 154 151     150     146         155 155 151 155 150 150 155 151             154 154 153     142                 136 144  kill col  1  Tbl  32 cols 0001000000000000001010110000000011100010111110 has 136 unique lines.
 * 135 136 133     135 136 136 136 136 136 136 132 134 136 136 136 134 132     132     124         134 136 131 136 130 131 136 131             135 135 133     117                     122  kill col  6  Tbl  31 cols 0001000000000000001010110000000011100011111110 has 117 unique lines.
 * 116 117 112     116 117 117 117 117 117 117 114 116 116 115 117 115 113     113     103         113 117 111 117 111 110 115 111             116 116 113                             101  kill col  0  Tbl  30 cols 0001000000000000001010110000000011100011111111 has 101 unique lines.
 * 100 100  94     100 101 101 101 101 101 101  97 100 100  99 101  98  98      97      90          95 101  96 101  95  94  99  95             100 100  96                                  kill col 24  Tbl  29 cols 0001000000000000001011110000000011100011111111 has  90 unique lines.
 *  89  88  84      89  90  89  90  89  90  90  86  89  89  88  90  86  88      85                  84  90  85  90  84  81  88  86              89  88  84                                  kill col 16  Tbl  28 cols 0001000000000000001011110000010011100011111111 has  81 unique lines.
 *  80  79  75      80  81  80  81  80  81  81  77  80  80  79  80  77  79      76                  74  80  74  81  76      79  77              80  79  75                                  kill col 21  Tbl  27 cols 0001000000000000001011111000010011100011111111 has  74 unique lines.
 *  73  72  68      73  74  73  74  73  74  74  70  73  73  72  73  71  72      69                      72  67  74  69      72  70              73  72  69                                  kill col 19  Tbl  26 cols 0001000000000000001011111010010011100011111111 has  67 unique lines.
 *  65  65  60      66  67  65  67  66  67  67  63  66  66  65  66  64  65      62                      64      67  62      65  64              66  65  63                                  kill col 43  Tbl  25 cols 0011000000000000001011111010010011100011111111 has  60 unique lines.
 *  58  57          59  60  58  60  59  60  60  56  59  59  58  59  57  58      55                      57      60  55      58  57              58  58  57                                  kill col 26  Tbl  24 cols 0011000000000000001111111010010011100011111111 has  55 unique lines.
 *  53  52          54  55  53  55  54  55  55  51  54  54  53  53  52  53                              52      54  50      53  53              53  53  52                                  kill col 17  Tbl  23 cols 0011000000000000001111111010110011100011111111 has  50 unique lines.
 *  48  48          49  48  48  50  49  50  50  46  49  49  48  48  45  47                              47      49          48  48              48  48  47                                  kill col 29  Tbl  22 cols 0011000000000000101111111010110011100011111111 has  45 unique lines.
 *  43  43          44  43  40  45  44  45  45  42  44  44  43  43      43                              43      44          43  43              43  43  42                                  kill col 39  Tbl  21 cols 0011001000000000101111111010110011100011111111 has  40 unique lines.
 *  38  38          39  37      40  39  40  40  37  39  39  38  38      35                              38      39          39  38              38  38  37                                  kill col 28  Tbl  20 cols 0011001000000000111111111010110011100011111111 has  35 unique lines.
 *  33  33          34  31      34  34  34  35  33  34  34  32  33                                      33      34          34  34              33  33  33                                  kill col 40  Tbl  19 cols 0011011000000000111111111010110011100011111111 has  31 unique lines.
 *  29  29          29          30  30  29  31  29  28  30  29  29                                      29      30          30  30              29  29  29                                  kill col 33  Tbl  18 cols 0011011000001000111111111010110011100011111111 has  28 unique lines.
 *  27  26          26          27  27  26  27  26      27  26  26                                      26      27          27  27              26  26  26                                  kill col 44  Tbl  17 cols 0111011000001000111111111010110011100011111111 has  26 unique lines.
 *  25              24          25  25  24  25  24      25  24  24                                      24      25          25  25              24  24  24                                  kill col 41  Tbl  16 cols 0111111000001000111111111010110011100011111111 has  24 unique lines.
 *  23                          23  23  22  23  22      23  22  22                                      22      23          23  23              22  22  22                                  kill col 36  Tbl  15 cols 0111111001001000111111111010110011100011111111 has  22 unique lines.
 *  21                          21  20      21  20      21  20  20                                      20      21          21  21              20  20  20                                  kill col 37  Tbl  14 cols 0111111011001000111111111010110011100011111111 has  20 unique lines.
 *  19                          19          19  18      19  18  18                                      18      19          19  19              18  18  18                                  kill col 34  Tbl  13 cols 0111111011011000111111111010110011100011111111 has  18 unique lines.
 *  17                          17          17          17  16  16                                      16      17          17  17              16  16  17                                  kill col 31  Tbl  12 cols 0111111011011010111111111010110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 30 
 *
 * Round 1: 1000000100100101000000000101001100011100000000  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 207 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 207 204 207 207 207 207   x 207 207   x 207 207   x 207   x 207 207 206 207 206 207 205 206 207   x 205   x 207 207   x   x 206 204 205   x   x   x 206 207 206 207 207 206 205 206  kill col 43  Tbl  33 cols 1010000100100101000000000101001100011100000000 has 204 unique lines.
 *   x 204     204 204 204 204   x 204 204   x 204 204   x 204   x 204 204 203 204 203 204 202 203 204   x 201   x 204 204   x   x 203 201 202   x   x   x 203 204 203 204 204 203 202 203  kill col 19  Tbl  32 cols 1010000100100101000000000111001100011100000000 has 201 unique lines.
 *   x 201     201 201 201 201   x 201 201   x 201 201   x 201   x 201 201 200 201 200 201 199 200 201   x       x 201 201   x   x 200 198 199   x   x   x 200 201 200 201 201 200 199 200  kill col 12  Tbl  31 cols 1010000100100101000000000111001101011100000000 has 198 unique lines.
 *   x 198     197 198 198 198   x 198 198   x 198 198   x 198   x 198 198 197 198 196 198 196 195 198   x       x 198 198   x   x 196     196   x   x   x 197 198 197 198 198 197 196 197  kill col 22  Tbl  30 cols 1010000100100101000000010111001101011100000000 has 195 unique lines.
 *   x 195     194 195 195 195   x 195 195   x 195 195   x 195   x 195 195 194 195 194 194 193     195   x       x 195 195   x   x 192     193   x   x   x 194 194 193 195 195 194 193 193  kill col 13  Tbl  29 cols 1010000100100101000000010111001111011100000000 has 192 unique lines.
 *   x 192     191 192 192 192   x 192 192   x 192 192   x 192   x 192 192 191 192 191 191 190     192   x       x 192 192   x   x         189   x   x   x 191 191 190 191 192 191 190 190  kill col 11  Tbl  28 cols 1010000100100101000000010111001111111100000000 has 189 unique lines.
 *   x 189     184 189 189 189   x 189 189   x 189 189   x 189   x 189 189 188 189 188 188 187     189   x       x 189 187   x   x               x   x   x 188 187 187 187 189 188 186 187  kill col 42  Tbl  27 cols 1011000100100101000000010111001111111100000000 has 184 unique lines.
 *   x 184         184 184 184   x 184 184   x 184 184   x 184   x 184 184 183 184 183 183 182     184   x       x 184 182   x   x               x   x   x 183 182 180 182 184 182 181 181  kill col  5  Tbl  26 cols 1011000100100101000000010111001111111100100000 has 180 unique lines.
 *   x 180         180 180 180   x 180 180   x 180 179   x 180   x 180 180 179 180 179 178 176     180   x       x 180 176   x   x               x   x   x 172 178     177 179 175 174 175  kill col  7  Tbl  25 cols 1011000100100101000000010111001111111110100000 has 172 unique lines.
 *   x 172         172 172 172   x 172 172   x 172 171   x 172   x 172 171 171 172 171 167 169     172   x       x 171 167   x   x               x   x   x     170     168 168 164 164 167  kill col  2  Tbl  24 cols 1011000100100101000000010111001111111110100100 has 164 unique lines.
 *   x 164         164 164 164   x 164 164   x 164 162   x 164   x 164 163 162 164 161 159 159     162   x       x 162 159   x   x               x   x   x     159     160 158     157 158  kill col  1  Tbl  23 cols 1011000100100101000000010111001111111110100110 has 157 unique lines.
 *   x 155         157 157 157   x 157 157   x 156 154   x 157   x 156 156 155 157 154 151 150     154   x       x 155 147   x   x               x   x   x     145     147 144         147  kill col  3  Tbl  22 cols 1011000100100101000000010111001111111110101110 has 144 unique lines.
 *   x 141         144 144 144   x 144 144   x 142 141   x 144   x 143 143 142 142 138 135 136     139   x       x 140 133   x   x               x   x   x     125     128             125  kill col  6  Tbl  21 cols 1011000100100101000000010111001111111111101110 has 125 unique lines.
 *   x 121         125 125 125   x 125 124   x 123 121   x 124   x 124 123 121 123 115 115 116     120   x       x 119 113   x   x               x   x   x             101             102  kill col  4  Tbl  20 cols 1011000100100101000000010111001111111111111110 has 101 unique lines.
 *   x  98         101 100 101   x 101 100   x  98  98   x 100   x  99  98  97  97  91  91  93      95   x       x  93  88   x   x               x   x   x                              79  kill col  0  Tbl  19 cols 1011000100100101000000010111001111111111111111 has  79 unique lines.
 *   x  76          79  78  79   x  79  78   x  76  77   x  77   x  77  76  76  75  71  71  72      74   x       x  72  69   x   x               x   x   x                                  kill col 16  Tbl  18 cols 1011000100100101000000010111011111111111111111 has  69 unique lines.
 *   x  65          69  68  69   x  69  68   x  66  68   x  67   x  67  66  65  65  62  61  63      63   x       x  60       x   x               x   x   x                                  kill col 17  Tbl  17 cols 1011000100100101000000010111111111111111111111 has  60 unique lines.
 *   x  56          60  59  60   x  60  59   x  57  59   x  57   x  57  57  57  56  52  51  53      55   x       x           x   x               x   x   x                                  kill col 24  Tbl  16 cols 1011000100100101000001010111111111111111111111 has  51 unique lines.
 *   x  48          51  50  51   x  50  50   x  48  49   x  48   x  47  46  48  47  45      45      48   x       x           x   x               x   x   x                                  kill col 25  Tbl  15 cols 1011000100100101000011010111111111111111111111 has  45 unique lines.
 *   x  42          45  44  45   x  44  44   x  42  42   x  42   x  40  40  41  39          38      41   x       x           x   x               x   x   x                                  kill col 23  Tbl  14 cols 1011000100100101000011110111111111111111111111 has  38 unique lines.
 *   x  36          37  36  37   x  37  37   x  35  35   x  35   x  32  33  33  32                  34   x       x           x   x               x   x   x                                  kill col 29  Tbl  13 cols 1011000100100101100011110111111111111111111111 has  32 unique lines.
 *   x  30          31  30  28   x  31  31   x  30  29   x  29   x      26  28  27                  28   x       x           x   x               x   x   x                                  kill col 28  Tbl  12 cols 1011000100100101110011110111111111111111111111 has  26 unique lines.
 *   x  24          25  23  20   x  25  24   x  24  24   x  23   x          24  23                  23   x       x           x   x               x   x   x                                  kill col 39  Tbl  11 cols 1011001100100101110011110111111111111111111111 has  20 unique lines.
 *   x  18          19  18       x  19  18   x  19  19   x  18   x          18  17                  18   x       x           x   x               x   x   x                                  kill col 26  Tbl  10 cols 1011001100100101110111110111111111111111111111 has  17 unique lines.
 *   x  15          15  15       x  16  15   x  16  16   x  14   x          15                      15   x       x           x   x               x   x   x                                  kill col 31  Tbl   9 cols 1011001100100111110111110111111111111111111111 has  14 unique lines.
 *
 * Round 2: 0100110011011000001000001000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 14 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 206 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x 203 206   x   x 206   x   x   x   x   x   x   x 206   x 206 206   x 205 204 206 203 205   x   x 204   x 206 206   x   x 205 203 204   x   x   x 205 205 205 206 206 205 203 205  kill col 43  Tbl  24 cols 1110110111111101001000001101001100011100000000 has 203 unique lines.
 *   x   x     203   x   x 203   x   x   x   x   x   x   x 203   x 203 203   x 202 201 203 200 202   x   x 200   x 203 203   x   x 202 200 201   x   x   x 202 202 202 203 203 202 200 202  kill col 23  Tbl  23 cols 1110110111111101001000101101001100011100000000 has 200 unique lines.
 *   x   x     200   x   x 200   x   x   x   x   x   x   x 200   x 200 200   x 199 197 200     199   x   x 197   x 200 200   x   x 199 197 198   x   x   x 199 199 199 200 200 198 197 199  kill col 25  Tbl  22 cols 1110110111111101001010101101001100011100000000 has 197 unique lines.
 *   x   x     197   x   x 197   x   x   x   x   x   x   x 197   x 197 197   x 196     196     195   x   x 194   x 197 197   x   x 196 193 195   x   x   x 195 196 196 195 197 194 194 196  kill col 12  Tbl  21 cols 1110110111111101001010101101001101011100000000 has 193 unique lines.
 *   x   x     192   x   x 193   x   x   x   x   x   x   x 193   x 193 193   x 192     192     190   x   x 190   x 193 193   x   x 191     191   x   x   x 191 192 192 191 193 190 190 192  kill col 22  Tbl  20 cols 1110110111111101001010111101001101011100000000 has 190 unique lines.
 *   x   x     189   x   x 190   x   x   x   x   x   x   x 190   x 190 190   x 189     188           x   x 187   x 190 190   x   x 187     188   x   x   x 188 188 188 188 189 187 185 188  kill col  1  Tbl  19 cols 1110110111111101001010111101001101011100000010 has 185 unique lines.
 *   x   x     184   x   x 185   x   x   x   x   x   x   x 185   x 185 185   x 184     182           x   x 182   x 185 185   x   x 182     183   x   x   x 183 179 180 183 180 182     182  kill col  6  Tbl  18 cols 1110110111111101001010111101001101011101000010 has 179 unique lines.
 *   x   x     177   x   x 179   x   x   x   x   x   x   x 179   x 179 179   x 177     174           x   x 176   x 179 177   x   x 175     176   x   x   x 176     174 174 172 173     172  kill col  3  Tbl  17 cols 1110110111111101001010111101001101011101001010 has 172 unique lines.
 *   x   x     169   x   x 172   x   x   x   x   x   x   x 172   x 172 172   x 170     162           x   x 168   x 171 170   x   x 167     166   x   x   x 166     160 162     161     160  kill col  5  Tbl  16 cols 1110110111111101001010111101001101011101101010 has 160 unique lines.
 *   x   x     154   x   x 160   x   x   x   x   x   x   x 160   x 159 160   x 156     144           x   x 156   x 158 156   x   x 151     152   x   x   x 148         149     145     144  kill col 24  Tbl  15 cols 1110110111111101001011111101001101011101101010 has 144 unique lines.
 *   x   x     137   x   x 144   x   x   x   x   x   x   x 143   x 143 141   x 140                   x   x 140   x 137 140   x   x 134     134   x   x   x 128         132     127     126  kill col  0  Tbl  14 cols 1110110111111101001011111101001101011101101011 has 126 unique lines.
 *   x   x     117   x   x 126   x   x   x   x   x   x   x 124   x 125 121   x 121                   x   x 121   x 119 118   x   x 114     116   x   x   x 109         106     104          kill col  2  Tbl  13 cols 1110110111111101001011111101001101011101101111 has 104 unique lines.
 *   x   x      95   x   x 103   x   x   x   x   x   x   x 102   x 100  98   x  96                   x   x  99   x  96  94   x   x  91      96   x   x   x  80          82                  kill col  7  Tbl  12 cols 1110110111111101001011111101001101011111101111 has  80 unique lines.
 *   x   x      72   x   x  79   x   x   x   x   x   x   x  77   x  75  74   x  72                   x   x  75   x  71  67   x   x  70      73   x   x   x              60                  kill col  4  Tbl  11 cols 1110110111111101001011111101001101011111111111 has  60 unique lines.
 *   x   x      53   x   x  59   x   x   x   x   x   x   x  58   x  54  54   x  53                   x   x  55   x  51  48   x   x  52      54   x   x   x                                  kill col 16  Tbl  10 cols 1110110111111101001011111101011101011111111111 has  48 unique lines.
 *   x   x      42   x   x  46   x   x   x   x   x   x   x  45   x  43  41   x  42                   x   x  42   x  37       x   x  38      40   x   x   x                                  kill col 17  Tbl   9 cols 1110110111111101001011111101111101011111111111 has  37 unique lines.
 *   x   x      30   x   x  34   x   x   x   x   x   x   x  33   x  30  30   x  32                   x   x  32   x           x   x  29      30   x   x   x                                  kill col 13  Tbl   8 cols 1110110111111101001011111101111111011111111111 has  29 unique lines.
 *   x   x      22   x   x  26   x   x   x   x   x   x   x  25   x  24  23   x  24                   x   x  24   x           x   x          23   x   x   x                                  kill col 42  Tbl   7 cols 1111110111111101001011111101111111011111111111 has  22 unique lines.
 *   x   x           x   x  19   x   x   x   x   x   x   x  19   x  17  15   x  17                   x   x  18   x           x   x          17   x   x   x                                  kill col 28  Tbl   6 cols 1111110111111101011011111101111111011111111111 has  15 unique lines.
Possible good candidates for removal, columns : 19 
 *
 * Round 3: 0000001000000010100100000010000000100000000000  4 columns for indexes to table representing  6 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0011000000000000010011110000110011000011111111 19 columns
 * Can even chose 1 more column to be represented directly.
 * Success. Use 2 EBRs, 26 LUTs.
 */

module v14_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 2
    *                      | indirect_index 1
    * inx         next     | | indirect index 0
    * || ucode    ucode    | | | direct representation
    * 00 LB_0     LB_1     0 0 0 01011011110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 00010111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 2 01011011110010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 3 2 000001010xx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 4 3 2 01100101010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   3 3 2 000000001xx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 3 2 00001101101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 2 00001011101000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     5 3 0 01011101110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 3 2 00001011100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     5 3 0 01011101110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   0 3 3 01000101110000110011|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   1 3 2 00011101100000000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    3 3 2 100111010xx011100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    3 3 2 000111010xx000010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 4 3 2 00100101011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 3 2 00011111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 3 2 00011101100000011010|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   6 4 4 11011010110001110110|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  0 3 2 00011111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 3 01011001110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 3 5 00000001100000010110|        Branch on condition
    * 16 condb_5  StdIncPc 3 3 2 000000010xx011100110|        Branch not taken.
    * 17 condb_5t condb_6t 7 3 2 00100000100001111101|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  5 3 2 00111101011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 5 2 01000000x10001000001| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 8 3 2 00100101001011100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 2 3 2 00010110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 8 3 2 00100101011011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 3 3 11010101110011010100|        Q = 4
    * 1f IJ_2     IJ_3     5 5 2 00000000111010110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     9 0 0 01111011110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 3 2 00100101000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  0 3 6 00010101110100111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 3 3 2 000001010xx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 6 0 00011110x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   3 3 2 000000001xx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     5 3 2 00011101000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 3 2 01000001110000011101|        Q = rs2
    * 28 _L0x28   SH_1     9 3 0 01011101110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 3 2 00011101100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     9 3 0 01011101110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 3 010xxxx1010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 3 2 00011100xxx000111110| SLL    Shift left
    * 2d MULH_0   MULH_1   1 6 2 00010101100001101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  5 3 2 10011111011001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 4 3 2 00100101011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 3 7 00100101011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 3 2 00011111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    7 3 2 00100000100010000110|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   7 5 2 00000001001010011110|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    7 4 2 00011010100011011110|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   8 6 2 00110111100000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 7 2 00110111110000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  a 3 5 001xxxx1000011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 2 00111101011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 8 3 2 10100101000011100110|        Last shift.
    * 3a SRxI_1   SRxI_2   8 6 6 00110101100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  5 3 2 00101101011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 7 6 00110101100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 6 0 00011110x00000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 6 0 00011110x00000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     2 0 8 01011011110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   7 3 2 00110101000000001011|        yy=jj. Prep get Q=1
    * 42 MULHU_2  MULHU_3  0 6 6 00010101110101100000|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  0 3 2 00000000100011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  0 3 2 00011111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 3 01010101110001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    a 3 2 00110100x00001000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    a 5 2 00110101000010001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     2 8 8 01011101110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 3 01000001110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     2 8 8 01011101110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  b 9 2 00010100100010110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 3 2 000111010xx000110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  7 6 2 00111101000000101110| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * 4f MRET_8   MRET_9   3 3 3 11010101110001110100|        +4, so now 0x103
    * 50 LW_1     StdIncPc 8 1 9 00110111000011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   c 5 2 00110100111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 00010111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   c 5 2 00110100111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     1 7 6 00010101100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 c 5 2 00110101011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 2 00010001101001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 3 2 00010001100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 3 6 11010111100101101110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 2 00111111011010011100|        REM = Q to yy
    * 5a SB_1     SB_2     7 6 2 00110111100001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  5 3 2 00101101011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 7 2 00110111110011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 00010111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   c 5 2 00110100111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 2 10011111100001000010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 5 3 5 00101101001011110111| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 DIV_8    DIV_7    0 6 3 01010111110011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    0 a 3 01010111110001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  0 3 2 00011111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 3 5 000000010xx011101111|        Prepare read PC.
    * 66 SW_1     SW_2     b 5 2 00011100100011110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    c 5 2 00100100x11010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 8 3 2 00100101000011100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     0 3 2 00010101100010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 2 00110101000011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     1 b 2 00011001100001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 3 2 000111010xx000110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  7 6 2 00111101000000101110| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    7 3 2 00111100100010111001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   0 3 3 010xxxx1110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    1 7 6 00010101100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 c 5 2 00110101011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 3 2 00001101101000011010|        Invert q. Prepare read mask
    * 73 unalignd straddle 0 3 2 00000101011000010010|  Fr10u Unaligned pc, prep read high hword
    * 74 MRET_9   Fetch    5 4 3 01011010110011011110|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    7 4 2 00011010101011011110|        Mask and use as PC
    * 76 Fetchu   Fetch2   0 3 a 00000111011011110100|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2   0 1 b 00010111011011110100|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    5 3 2 00100001011010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    0 3 3 11010101110010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     8 5 2 00011000100011110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  5 3 2 00101101011001001001| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    5 4 2 01011010110011011110|        Branch taken.
    * 7e NMI_1    NMI_2    a 3 2 001xxxx1000010010000|        Store pc to mepc.
    * 7f unx7f             d 6 0 00xxxxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 0 01011011110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             d 6 0 00xxxxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 DIV_1    DIV_3    5 3 2 00011101000010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    0 3 2 01010101110010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   0 3 2 00011111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 00010111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   5 5 2 01000001010010011110|      Prep pc = jj + ofs
    * 87 unx87             d 6 0 00xxxxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 DIV_E    DIV_10   3 a 2 10011110xxx010011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 4 3 2 00100101011011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   3 3 6 110101110xx100011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 4 3 3 11100101010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 3 2 000111110xx000101001| XOR    xor
    * 8d DIV_0    DIV_1    1 c 2 10010111100010000010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 3 3 00010101110010101001|        Q = 1
    * 90 NMI_2    JAL_3    c d 2 00101001011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   6 d 3 11100100x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    a 3 2 00110010x00000110100|        PC to mepc
    * 93 SW_E2    SW_E3    a 3 2 00110111000010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    7 d 2 00110010x10000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 3 3 11010111110010010100|        Q = 3
    * 96 SH_1     SH_2     7 6 2 00110111100010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    c 5 2 00100100x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 2 00111101011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 3 2 000xxxx0xxx011111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    6 d 2 01110010x10000110100|        mcause = 11
    * 9b SH_4     SH_5     e 8 2 00011001100010011111|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   1 a 2 10011001000001101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   1 a 2 10011001000010100010|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    d 3 4 11100101010000110100|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     b 3 2 00011000100011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    9 0 0 01111011110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  3 3 3 11010101110010110110|        Q = 4
    * a2 DIV_14   LB_6     0 3 2 00010101100010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 8 3 2 00100101000011100110|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   0 6 0 00011110x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 3 01001101110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  2 3 8 00010110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 3 2 010xxxx1110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    0 a 2 10010101100001111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    5 d 3 01110010x10000110100|        Store 2 to mcause
    * aa DIV_6    DIV_7    3 3 2 100101110xx011001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  a 3 2 00110101000010011010|        pc to mepc
    * ac _L0xac   SRx_1    3 3 2 00011100xxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   3 6 2 100111010xx011100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    3 3 2 00011100xxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 3 010xxxx1110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   6 d 2 01100100x10010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  3 3 3 11010101110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 4 3 11011010110011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             d 6 0 00xxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3  unalignd c 3 c 01011111110001110011|  Fr10  Update minstret, Q=immediate. Use dinx
    * b5 SH_3     SH_4     0 3 2 00000001011010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  3 3 3 11010101110010011010|        Q = 8
    * b7 IJ_3     IJ_4     7 3 2 00110101000010111101|        Store present PC in case of access error
    * b8 BGE      condb_2  5 3 2 00111101011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    0 3 3 00011001100011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   0 3 2 00001111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     7 7 2 00110111110010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 2 00101101011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     0 3 3 01000101110001110101|        Construct Q = 1
    * be IJ_1     IJ_2     1 1 2 00010111100000011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 1 2 00010111100011000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 3 5 00011101100010001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 2 00110101011011101001|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   0 6 3 01010111110011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   0 a 3 01010111110010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    5 3 2 00011111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 3 2 00000001101001101111|        ~302
    * c6 IJT_4    ILL_2    a 3 2 00110101101001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   a 3 2 001xxxx1000011001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 3 d 10011001110001100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   3 3 2 01001101110010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 3 d 10011001110011000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc c d 2 00101001011011100110|        mtval = 0.
    * cc OR_0     OR_1     3 3 2 000111110xx000100110| OR     or
    * cd REM_0    DIV_1    1 c 2 10010111100010000010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * cf MRET_7   MRET_8   3 3 5 000011010xx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 3 01000001110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   5 3 2 00001101011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     1 7 6 00010101100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 c 5 2 00110101011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   5 d 3 01100100x10010010010|        Store 5 to mcause
    * d5 eFetch2  eFetch3  c 5 e 01000011010010110100|  Fr10  Update ttime
    * d6 eILL0c   ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  c 5 2 00110101011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 2 00111101011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  3 3 2 100111110xx001000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 3 2 000101010xx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 5 3 01111000x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 2 00101101011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  c 5 2 00110101011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   5 3 a 00000111011011110100|  Fr10  Read and latch instruction
    * df eFetch   eFetch2  5 1 b 00010111011011010101|  Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 2 00110111000011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 2 00000001100000011101|        Q = RS1
    * e2 MUL_1    MUL_2    0 6 6 00010101110111101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 3 6 110101110xx100011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   0 3 2 00011111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 3 3 11010101110010110000|        Q = 4
    * e6 StdIncPc Fetch    6 4 4 11011010110011011110|  Fr10  IncPC, OpFetch
    * e7 aFault   aFault_1 c 5 2 00110101011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 2 10011101100011100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    0 3 3 01011001110011000110|        Construct Q = 1
    * ea MULHU_5  MULHU_6  0 3 2 00011001110000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     0 3 2 00001111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 3 2 000111110xx000010001| AND    And 
    * ed REMU_0   DIVU_1   3 6 2 100111010xx011100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    6 4 3 11011010110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    1 7 6 00010101100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 c 5 2 00110101011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 3 2 000001010xx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 3 2 000xxxx01xx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd c 5 f 01011111110001110011|  Fr10  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 c 5 2 00110101011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 3 3 11011001110011111010| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 c 5 2 00100001011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 2 00111101011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   5 3 3 01011101010011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    0 3 3 01010101110001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 3 2 00000001011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 2 00101101011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 3 2 000001010xx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 3 2 00000100xxx001000110| Illegal
    * ff QINT_0   QINT_1   3 3 2 000001010xx011000111| INT    Get current PC
    */
   localparam u0_0 = 256'h56e6d010d0e2d8045c33dc5ab88bdc5aba09da07080454e650e6bcbe79d2bc01;
   localparam u0_1 = 256'h0eb75cd456e66ea6083252e60441d613087d10e618169c15f814ac76d81af88b;
   localparam u0_2 = 256'h56e6f642586ac03e1430dc96d821dc961c1dd0270804e63550e65d3950e6bc52;
   localparam u0_3 = 256'he03ae0355903d6490832593d50e6d61310d77c037836a8de129e0886f82b56e6;
   localparam u0_4 = 256'h5c7400fed02ed03148b1dc661c4bdc66508f40475c65fa2b08ea5d60500bbc50;
   localparam u0_5 = 256'h4eda79707cfbd6490832785df69c796e188b1a57561e59eb4eda79544eda70e6;
   localparam u0_6 = 256'h1ccfc8b9d02ed031987a50f9588b50e64693c8f210effa2b7c587cc8d2f7f842;
   localparam u0_7 = 256'h00001090acded649083288f25ca816aa76f476f4aadeacde5612da1a561e59ba;
   localparam u0_8 = 256'h5ca900fe7882f02954e6711a56e6e09c0000149e79f0fa215c82d0a80000bc85;
   localparam u0_9 = 256'h88f2543490a29068989f243400fed613469378bb7c9424347095203444929634;
   localparam u0_A = 256'h1cc5c03fd0e0c03f509a70c8243458781c616ed0dcafe63a50e6588b5cb6bc5e;
   localparam u0_B = 256'h78c1781f5c75d6497cb5fa1a98c0d61350bd5c9a169bfc730000acde5cb24492;
   localparam u0_C = 256'hd04f00fe7882f02696e69cc2dca59c6210cb5a471a6ff2e17c8a7cca56e9d888;
   localparam u0_D = 256'h76d576f456e5d64984925091f042d61356a100fe34b44492561e5906d6c91c37;
   localparam u0_E = 256'hacde00fed0e0f011fa569c229cc6d8e2561eacde5cb0fa1a711a5de8181d70ca;
   localparam u0_F = 256'h50c74046507ed649166b5c45d4d9d61316ab9cfa56dbfc7308dd50e6561e5972;
   localparam u1_0 = 256'h4322332133291321033453050320530513200320332043263320222511110005;
   localparam u1_1 = 256'h5520333d83222321332083225524532373223320135003350321644d03210321;
   localparam u1_2 = 256'h4322532916213321033493050321930503245321332006013320036143229007;
   localparam u1_3 = 256'h160116018763532233208663832a5323a3528723862374217520732203214372;
   localparam u1_4 = 256'h333d332076233321b921288503342885a523a323033503210320066173232085;
   localparam u1_5 = 256'hc523111177235322332076235323136d03211321c5231761c5231111c5238193;
   localparam u1_6 = 256'h03347323762333211b21532303218322c522b521335003210a35063553521329;
   localparam u1_7 = 256'hd600a3225425532233208521033d532201b103a07421543503200320c5231761;
   localparam u1_8 = 256'h033133201c293321433e336d43223a29d60055241111032103255321d6000005;
   localparam u1_9 = 256'hb321d34e1a291a29e8216d2733205323c5227623333d7d23a323a3236d3ecd22;
   localparam u1_A = 256'h0334332136293321a32333295d370a29032423810334060183220321333d9007;
   localparam u1_B = 256'h112111210334532277230320033153237323333d0320c3c5d600643d333d6d26;
   localparam u1_C = 256'h335033201c293321cd2213d9332413d9a322a323032053210a35063553231351;
   localparam u1_D = 256'h51b153a0c52353225537332133295323c5233320c5e45d36c523176153200334;
   localparam u1_E = 256'h643d3320362933210320032103351329c523644d333d0321336d066113205323;
   localparam u1_F = 256'h33203320332053220320033553355323c522333dc523c5f533203320c5231761;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[8] = indir[8];
   assign d[12] = indir[9];
   assign d[13] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[22] = indir[13];
   assign d[23] = indir[14];
   assign d[24] = indir[15];
   assign d[25] = indir[16];
   assign d[28] = indir[17];
   assign d[42] = indir[18];
   assign d[43] = indir[19];
   // replaces = 1000000100100101000000000101001100011000000000
   SB_LUT4 #(.LUT_INIT(16'h1098)) cmb_d09(.O(d[9]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h3018)) cmb_d10(.O(d[10]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0c00)) cmb_d15(.O(d[15]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d18(.O(d[18]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hfffe)) cmb_d20(.O(d[20]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h9000)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0100)) cmb_d32(.O(d[32]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0802)) cmb_d35(.O(d[35]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0a00)) cmb_d38(.O(d[38]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d45(.O(d[45]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0100110011011000001000001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h2f3f)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2a30)) cmb_d27(.O(d[27]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0012)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0080)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2200)) cmb_d37(.O(d[37]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0915)) cmb_d40(.O(d[40]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0900)) cmb_d41(.O(d[41]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d44(.O(d[44]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000001000000010100100000010000000100000000000
   SB_LUT4 #(.LUT_INIT(16'h4d82)) cmb_d11(.O(d[11]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5fb7)) cmb_d19(.O(d[19]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5c00)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h16e0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0204)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h400f)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   MULDIV included
 *   minstret for instructions in SRAM and EBR
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 46 columns
 * Removed:  0000000000000000000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 209 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 208 209 208 209 209 209 209 209 209 209 209 209 209 209 209 209 209 209 209 209 208 209 207 208 209 209 209 209 209 209 209 209 208 206 207 209 208 209 208 209 208 209 209 208 207 208  kill col 12  Tbl  45 cols 0000000000000000000000000000000001000000000000 has 206 unique lines.
 * 205 206 205 205 206 206 206 206 206 206 206 206 206 206 206 206 206 206 206 206 204 206 204 203 206 206 206 206 206 206 206 206 204     204 206 205 206 205 206 205 206 206 205 204 205  kill col 22  Tbl  44 cols 0000000000000000000000010000000001000000000000 has 203 unique lines.
 * 202 203 202 202 203 203 203 203 203 203 203 203 203 203 203 203 203 203 203 203 202 202 201     203 203 203 203 203 203 203 203 201     201 203 202 203 202 202 201 203 203 202 201 201  kill col 23  Tbl  43 cols 0000000000000000000000110000000001000000000000 has 201 unique lines.
 * 200 201 200 200 201 201 201 201 201 201 201 201 201 201 201 201 201 201 200 200 199 200         201 201 201 201 201 201 201 201 199     199 201 200 201 200 200 199 201 201 199 199 199  kill col 25  Tbl  42 cols 0000000000000000000010110000000001000000000000 has 199 unique lines.
 * 198 199 198 198 199 199 199 199 199 199 199 199 199 199 199 199 199 199 198 198     198         199 199 199 199 199 199 199 199 197     197 199 198 199 197 198 197 198 199 197 197 197  kill col 13  Tbl  41 cols 0000000000000000000010110000000011000000000000 has 197 unique lines.
 * 196 197 196 196 197 197 197 197 197 197 197 197 197 197 197 197 197 197 196 196     196         197 197 197 197 197 197 197 197         194 197 196 196 195 196 195 195 197 195 195 195  kill col 11  Tbl  40 cols 0000000000000000000010110000000011100000000000 has 194 unique lines.
 * 193 194 193 190 194 194 194 194 194 194 194 194 194 194 194 194 194 194 193 193     193         194 194 194 194 194 194 194 194             194 193 193 192 193 192 191 194 192 192 192  kill col 42  Tbl  39 cols 0001000000000000000010110000000011100000000000 has 190 unique lines.
 * 189 190 189     190 190 190 190 190 190 190 190 190 190 190 190 190 190 189 189     189         190 190 189 190 190 190 190 190             190 189 189 188 189 188 187 190 188 188 188  kill col  4  Tbl  38 cols 0001000000000000000010110000000011100000010000 has 187 unique lines.
 * 186 187 186     187 187 187 187 187 187 187 187 187 187 187 187 187 187 185 186     186         187 187 186 187 187 186 187 187             187 186 186 185 186 185     186 185 185 185  kill col 27  Tbl  37 cols 0001000000000000001010110000000011100000010000 has 185 unique lines.
 * 184 185 184     185 185 185 185 185 185 185 185 185 185 185 185 185 185     184     184         185 185 184 185 185 184 185 185             185 184 184 183 184 183     184 183 183 183  kill col  7  Tbl  36 cols 0001000000000000001010110000000011100010010000 has 183 unique lines.
 * 182 183 182     183 183 183 183 183 183 183 183 183 183 183 183 183 182     182     181         183 183 182 183 182 181 183 183             181 182 182     182 176     180 178 180 179  kill col  5  Tbl  35 cols 0001000000000000001010110000000011100010110000 has 176 unique lines.
 * 175 176 175     176 176 176 176 176 176 176 176 175 176 176 176 176 175     173     171         176 176 175 176 174 174 176 176             175 175 175     171         166 167 171 168  kill col  3  Tbl  34 cols 0001000000000000001010110000000011100010111000 has 166 unique lines.
 * 165 166 165     166 166 166 166 166 166 166 166 165 166 166 166 166 165     162     159         166 166 164 166 163 164 166 165             165 165 165     158             154 155 155  kill col  2  Tbl  33 cols 0001000000000000001010110000000011100010111100 has 154 unique lines.
 * 153 154 152     154 154 154 154 154 154 154 154 152 154 154 154 153 150     149     145         154 154 150 154 149 149 154 150             153 153 152     141                 135 143  kill col  1  Tbl  32 cols 0001000000000000001010110000000011100010111110 has 135 unique lines.
 * 134 135 132     134 135 135 135 135 135 135 131 133 135 135 135 133 131     131     123         133 135 130 135 129 130 134 130             134 134 132     116                     121  kill col  6  Tbl  31 cols 0001000000000000001010110000000011100011111110 has 116 unique lines.
 * 115 116 111     115 116 116 116 116 116 116 113 115 115 114 116 114 112     112     102         112 116 110 116 110 109 115 110             115 115 112                             100  kill col  0  Tbl  30 cols 0001000000000000001010110000000011100011111111 has 100 unique lines.
 *  99  99  93      99 100 100 100 100 100 100  96  99  99  98 100  97  97      96      89          94 100  95 100  94  93  99  94              99  99  95                                  kill col 24  Tbl  29 cols 0001000000000000001011110000000011100011111111 has  89 unique lines.
 *  88  87  83      88  89  88  89  88  89  89  85  88  88  87  89  85  87      84                  83  89  84  89  83  80  88  85              88  87  83                                  kill col 16  Tbl  28 cols 0001000000000000001011110000010011100011111111 has  80 unique lines.
 *  79  78  74      79  80  79  80  79  80  80  76  79  79  78  79  76  78      75                  73  79  73  80  75      79  76              79  78  74                                  kill col 21  Tbl  27 cols 0001000000000000001011111000010011100011111111 has  73 unique lines.
 *  72  71  67      72  73  72  73  72  73  73  69  72  72  71  72  70  71      68                      71  66  73  68      72  69              72  71  68                                  kill col 19  Tbl  26 cols 0001000000000000001011111010010011100011111111 has  66 unique lines.
 *  64  64  59      65  66  64  66  65  66  66  62  65  65  64  65  63  64      61                      63      66  61      65  63              65  64  62                                  kill col 43  Tbl  25 cols 0011000000000000001011111010010011100011111111 has  59 unique lines.
 *  57  56          58  59  57  59  58  59  59  55  58  58  57  58  56  57      54                      56      59  54      58  56              57  57  56                                  kill col 26  Tbl  24 cols 0011000000000000001111111010010011100011111111 has  54 unique lines.
 *  52  51          53  54  52  54  53  54  54  50  53  53  52  52  51  52                              51      53  49      53  52              52  52  51                                  kill col 17  Tbl  23 cols 0011000000000000001111111010110011100011111111 has  49 unique lines.
 *  47  47          48  47  47  49  48  49  49  45  48  48  47  47  44  46                              46      48          48  47              47  47  46                                  kill col 29  Tbl  22 cols 0011000000000000101111111010110011100011111111 has  44 unique lines.
 *  42  42          43  42  40  44  43  44  44  41  43  43  42  42      42                              42      43          43  42              42  42  41                                  kill col 39  Tbl  21 cols 0011001000000000101111111010110011100011111111 has  40 unique lines.
 *  38  38          39  37      40  39  40  40  37  39  39  38  38      35                              38      39          39  38              38  38  37                                  kill col 28  Tbl  20 cols 0011001000000000111111111010110011100011111111 has  35 unique lines.
 *  33  33          34  31      34  34  34  35  33  34  34  32  33                                      33      34          34  34              33  33  33                                  kill col 40  Tbl  19 cols 0011011000000000111111111010110011100011111111 has  31 unique lines.
 *  29  29          29          30  30  29  31  29  28  30  29  29                                      29      30          30  30              29  29  29                                  kill col 33  Tbl  18 cols 0011011000001000111111111010110011100011111111 has  28 unique lines.
 *  27  26          26          27  27  26  27  26      27  26  26                                      26      27          27  27              26  26  26                                  kill col 44  Tbl  17 cols 0111011000001000111111111010110011100011111111 has  26 unique lines.
 *  25              24          25  25  24  25  24      25  24  24                                      24      25          25  25              24  24  24                                  kill col 41  Tbl  16 cols 0111111000001000111111111010110011100011111111 has  24 unique lines.
 *  23                          23  23  22  23  22      23  22  22                                      22      23          23  23              22  22  22                                  kill col 36  Tbl  15 cols 0111111001001000111111111010110011100011111111 has  22 unique lines.
 *  21                          21  20      21  20      21  20  20                                      20      21          21  21              20  20  20                                  kill col 37  Tbl  14 cols 0111111011001000111111111010110011100011111111 has  20 unique lines.
 *  19                          19          19  18      19  18  18                                      18      19          19  19              18  18  18                                  kill col 34  Tbl  13 cols 0111111011011000111111111010110011100011111111 has  18 unique lines.
 *  17                          17          17          17  16  16                                      16      17          17  17              16  16  17                                  kill col 31  Tbl  12 cols 0111111011011010111111111010110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 30 
 *
 * Round 1: 1000000100100101000000000101001100011100000000  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 206 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 206 203 206 206 206 206   x 206 206   x 206 206   x 206   x 206 206 206 206 205 206 204 205 206   x 204   x 206 206   x   x 205 203 204   x   x   x 205 206 205 206 206 205 204 205  kill col 43  Tbl  33 cols 1010000100100101000000000101001100011100000000 has 203 unique lines.
 *   x 203     203 203 203 203   x 203 203   x 203 203   x 203   x 203 203 203 203 202 203 201 202 203   x 200   x 203 203   x   x 202 200 201   x   x   x 202 203 202 203 203 202 201 202  kill col 19  Tbl  32 cols 1010000100100101000000000111001100011100000000 has 200 unique lines.
 *   x 200     200 200 200 200   x 200 200   x 200 200   x 200   x 200 200 200 200 199 200 198 199 200   x       x 200 200   x   x 199 197 198   x   x   x 199 200 199 200 200 199 198 199  kill col 12  Tbl  31 cols 1010000100100101000000000111001101011100000000 has 197 unique lines.
 *   x 197     196 197 197 197   x 197 197   x 197 197   x 197   x 197 197 197 197 195 197 195 194 197   x       x 197 197   x   x 195     195   x   x   x 196 197 196 197 197 196 195 196  kill col 22  Tbl  30 cols 1010000100100101000000010111001101011100000000 has 194 unique lines.
 *   x 194     193 194 194 194   x 194 194   x 194 194   x 194   x 194 194 194 194 193 193 192     194   x       x 194 194   x   x 191     192   x   x   x 193 193 192 194 194 193 192 192  kill col 13  Tbl  29 cols 1010000100100101000000010111001111011100000000 has 191 unique lines.
 *   x 191     190 191 191 191   x 191 191   x 191 191   x 191   x 191 191 191 191 190 190 189     191   x       x 191 191   x   x         188   x   x   x 190 190 189 190 191 190 189 189  kill col 11  Tbl  28 cols 1010000100100101000000010111001111111100000000 has 188 unique lines.
 *   x 188     183 188 188 188   x 188 188   x 188 188   x 188   x 188 188 188 188 187 187 186     188   x       x 188 186   x   x               x   x   x 187 186 186 186 188 187 185 186  kill col 42  Tbl  27 cols 1011000100100101000000010111001111111100000000 has 183 unique lines.
 *   x 183         183 183 183   x 183 183   x 183 183   x 183   x 183 183 183 183 182 182 181     183   x       x 183 181   x   x               x   x   x 182 181 179 181 183 181 180 180  kill col  5  Tbl  26 cols 1011000100100101000000010111001111111100100000 has 179 unique lines.
 *   x 179         179 179 179   x 179 179   x 179 178   x 179   x 179 179 179 179 178 177 175     179   x       x 179 175   x   x               x   x   x 171 177     176 178 174 173 174  kill col  7  Tbl  25 cols 1011000100100101000000010111001111111110100000 has 171 unique lines.
 *   x 171         171 171 171   x 171 171   x 171 170   x 171   x 171 170 171 171 170 166 168     171   x       x 170 166   x   x               x   x   x     169     167 167 163 163 166  kill col  2  Tbl  24 cols 1011000100100101000000010111001111111110100100 has 163 unique lines.
 *   x 163         163 163 163   x 163 163   x 163 161   x 163   x 163 162 162 163 160 158 158     161   x       x 161 158   x   x               x   x   x     158     159 157     156 157  kill col  1  Tbl  23 cols 1011000100100101000000010111001111111110100110 has 156 unique lines.
 *   x 154         156 156 156   x 156 156   x 155 153   x 156   x 155 155 155 156 153 150 149     153   x       x 154 146   x   x               x   x   x     145     146 144         146  kill col  3  Tbl  22 cols 1011000100100101000000010111001111111110101110 has 144 unique lines.
 *   x 141         144 144 144   x 144 144   x 142 141   x 144   x 143 143 143 142 138 135 136     139   x       x 140 133   x   x               x   x   x     125     127             124  kill col  0  Tbl  21 cols 1011000100100101000000010111001111111110101111 has 124 unique lines.
 *   x 121         124 123 124   x 124 124   x 121 121   x 124   x 123 123 123 121 115 113 115     120   x       x 120 112   x   x               x   x   x     101     104                  kill col  6  Tbl  20 cols 1011000100100101000000010111001111111111101111 has 101 unique lines.
 *   x  97         101 100 101   x 101 100   x  99  98   x 100   x 100  99  99  97  90  91  93      97   x       x  96  90   x   x               x   x   x              78                  kill col  4  Tbl  19 cols 1011000100100101000000010111001111111111111111 has  78 unique lines.
 *   x  75          78  77  78   x  78  77   x  75  76   x  76   x  76  75  75  74  70  71  71      73   x       x  71  68   x   x               x   x   x                                  kill col 16  Tbl  18 cols 1011000100100101000000010111011111111111111111 has  68 unique lines.
 *   x  64          68  67  68   x  68  67   x  65  67   x  66   x  66  65  64  64  61  61  62      62   x       x  59       x   x               x   x   x                                  kill col 17  Tbl  17 cols 1011000100100101000000010111111111111111111111 has  59 unique lines.
 *   x  55          59  58  59   x  59  58   x  56  58   x  56   x  56  56  56  55  51  51  52      54   x       x           x   x               x   x   x                                  kill col 25  Tbl  16 cols 1011000100100101000010010111111111111111111111 has  51 unique lines.
 *   x  47          51  50  51   x  51  50   x  48  49   x  48   x  47  49  48  47      45  44      45   x       x           x   x               x   x   x                                  kill col 23  Tbl  15 cols 1011000100100101000010110111111111111111111111 has  44 unique lines.
 *   x  41          43  43  43   x  44  43   x  41  42   x  41   x  39  41  40  40      38          38   x       x           x   x               x   x   x                                  kill col 24  Tbl  14 cols 1011000100100101000011110111111111111111111111 has  38 unique lines.
 *   x  36          37  36  37   x  37  37   x  35  35   x  35   x  32  33  33  32                  34   x       x           x   x               x   x   x                                  kill col 29  Tbl  13 cols 1011000100100101100011110111111111111111111111 has  32 unique lines.
 *   x  30          31  30  28   x  31  31   x  30  29   x  29   x      26  28  27                  28   x       x           x   x               x   x   x                                  kill col 28  Tbl  12 cols 1011000100100101110011110111111111111111111111 has  26 unique lines.
 *   x  24          25  23  20   x  25  24   x  24  24   x  23   x          24  23                  23   x       x           x   x               x   x   x                                  kill col 39  Tbl  11 cols 1011001100100101110011110111111111111111111111 has  20 unique lines.
 *   x  18          19  18       x  19  18   x  19  19   x  18   x          18  17                  18   x       x           x   x               x   x   x                                  kill col 26  Tbl  10 cols 1011001100100101110111110111111111111111111111 has  17 unique lines.
 *   x  15          15  15       x  16  15   x  16  16   x  14   x          15                      15   x       x           x   x               x   x   x                                  kill col 31  Tbl   9 cols 1011001100100111110111110111111111111111111111 has  14 unique lines.
Possible good candidates for removal, columns : 21 
 *
 * Round 2: 0100110011011000001000001000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 14 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 206 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x 203 206   x   x 206   x   x   x   x   x   x   x 206   x 206 206   x 205 204 206 203 205   x   x 204   x 206 206   x   x 205 203 204   x   x   x 205 205 205 206 206 205 203 205  kill col 43  Tbl  24 cols 1110110111111101001000001101001100011100000000 has 203 unique lines.
 *   x   x     203   x   x 203   x   x   x   x   x   x   x 203   x 203 203   x 202 201 203 200 202   x   x 200   x 203 203   x   x 202 200 201   x   x   x 202 202 202 203 203 202 200 202  kill col 23  Tbl  23 cols 1110110111111101001000101101001100011100000000 has 200 unique lines.
 *   x   x     200   x   x 200   x   x   x   x   x   x   x 200   x 200 200   x 199 197 200     199   x   x 197   x 200 200   x   x 199 197 198   x   x   x 199 199 199 200 200 198 197 199  kill col 25  Tbl  22 cols 1110110111111101001010101101001100011100000000 has 197 unique lines.
 *   x   x     197   x   x 197   x   x   x   x   x   x   x 197   x 197 197   x 196     196     195   x   x 194   x 197 197   x   x 196 193 195   x   x   x 195 196 196 195 197 194 194 196  kill col 12  Tbl  21 cols 1110110111111101001010101101001101011100000000 has 193 unique lines.
 *   x   x     192   x   x 193   x   x   x   x   x   x   x 193   x 193 193   x 192     192     190   x   x 190   x 193 193   x   x 191     191   x   x   x 191 192 192 191 193 190 190 192  kill col 22  Tbl  20 cols 1110110111111101001010111101001101011100000000 has 190 unique lines.
 *   x   x     189   x   x 190   x   x   x   x   x   x   x 190   x 190 190   x 189     188           x   x 187   x 190 190   x   x 187     188   x   x   x 188 188 188 188 189 187 185 188  kill col  1  Tbl  19 cols 1110110111111101001010111101001101011100000010 has 185 unique lines.
 *   x   x     184   x   x 185   x   x   x   x   x   x   x 185   x 185 185   x 184     182           x   x 182   x 185 185   x   x 182     183   x   x   x 183 179 180 183 180 182     182  kill col  6  Tbl  18 cols 1110110111111101001010111101001101011101000010 has 179 unique lines.
 *   x   x     177   x   x 179   x   x   x   x   x   x   x 179   x 179 179   x 177     174           x   x 176   x 179 177   x   x 175     176   x   x   x 176     174 174 172 173     172  kill col  3  Tbl  17 cols 1110110111111101001010111101001101011101001010 has 172 unique lines.
 *   x   x     169   x   x 172   x   x   x   x   x   x   x 172   x 172 172   x 170     162           x   x 168   x 171 170   x   x 167     166   x   x   x 166     160 162     160     160  kill col  5  Tbl  16 cols 1110110111111101001010111101001101011101101010 has 160 unique lines.
 *   x   x     154   x   x 160   x   x   x   x   x   x   x 160   x 159 160   x 156     144           x   x 156   x 158 156   x   x 151     152   x   x   x 148         149     144     145  kill col 24  Tbl  15 cols 1110110111111101001011111101001101011101101010 has 144 unique lines.
 *   x   x     137   x   x 144   x   x   x   x   x   x   x 143   x 143 141   x 140                   x   x 140   x 137 140   x   x 134     134   x   x   x 128         132     126     127  kill col  2  Tbl  14 cols 1110110111111101001011111101001101011101101110 has 126 unique lines.
 *   x   x     118   x   x 125   x   x   x   x   x   x   x 125   x 122 123   x 121                   x   x 121   x 118 120   x   x 116     117   x   x   x 105         110             105  kill col  7  Tbl  13 cols 1110110111111101001011111101001101011111101110 has 105 unique lines.
 *   x   x      97   x   x 104   x   x   x   x   x   x   x 102   x 100 100   x  96                   x   x 100   x  94  95   x   x  94      97   x   x   x              84              81  kill col  0  Tbl  12 cols 1110110111111101001011111101001101011111101111 has  81 unique lines.
 *   x   x      73   x   x  80   x   x   x   x   x   x   x  78   x  76  75   x  73                   x   x  76   x  72  68   x   x  71      74   x   x   x              60                  kill col  4  Tbl  11 cols 1110110111111101001011111101001101011111111111 has  60 unique lines.
 *   x   x      53   x   x  59   x   x   x   x   x   x   x  58   x  54  54   x  53                   x   x  55   x  51  48   x   x  52      54   x   x   x                                  kill col 16  Tbl  10 cols 1110110111111101001011111101011101011111111111 has  48 unique lines.
 *   x   x      42   x   x  46   x   x   x   x   x   x   x  45   x  43  41   x  42                   x   x  42   x  37       x   x  38      40   x   x   x                                  kill col 17  Tbl   9 cols 1110110111111101001011111101111101011111111111 has  37 unique lines.
 *   x   x      30   x   x  34   x   x   x   x   x   x   x  33   x  30  30   x  32                   x   x  32   x           x   x  29      30   x   x   x                                  kill col 13  Tbl   8 cols 1110110111111101001011111101111111011111111111 has  29 unique lines.
 *   x   x      22   x   x  26   x   x   x   x   x   x   x  25   x  24  23   x  24                   x   x  24   x           x   x          23   x   x   x                                  kill col 42  Tbl   7 cols 1111110111111101001011111101111111011111111111 has  22 unique lines.
 *   x   x           x   x  19   x   x   x   x   x   x   x  19   x  17  15   x  17                   x   x  18   x           x   x          17   x   x   x                                  kill col 28  Tbl   6 cols 1111110111111101011011111101111111011111111111 has  15 unique lines.
Possible good candidates for removal, columns : 19 
 *
 * Round 3: 0000001000000010100100000010000000100000000000  4 columns for indexes to table representing  6 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0011000000000000010011110000110011000011111111 19 columns
 * Can even chose 1 more column to be represented directly.
 * Success. Use 2 EBRs, 26 LUTs.
 */

module v15_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 2
    *                      | indirect_index 1
    * inx         next     | | indirect index 0
    * || ucode    ucode    | | | direct representation
    * 00 LB_0     LB_1     0 0 0 01011011110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 00010111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 2 01011011110010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 3 2 000001010xx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 4 3 2 01100101010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   3 3 2 000000001xx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 3 2 00001101101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 2 00001011101000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     5 3 0 01011101110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 3 2 00001011100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     5 3 0 01011101110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   0 3 3 01000101110000110011|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   1 3 2 00011101100000000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    3 3 2 100111010xx011100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    3 3 2 000111010xx000010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 4 3 2 00100101011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 3 2 00011111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 3 2 00011101100000011010|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   6 4 4 11011010110001110110|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  0 3 2 00011111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 3 01011001110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 3 5 00000001100000010110|        Branch on condition
    * 16 condb_5  StdIncPc 3 3 2 000000010xx011100110|        Branch not taken.
    * 17 condb_5t condb_6t 7 3 2 00100000100001111101|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  5 3 2 00111101011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 5 2 01000000x10001000001| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 8 3 2 00100101001011100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 2 3 2 00010110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 8 3 2 00100101011011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 3 3 11010101110011010100|        Q = 4
    * 1f IJ_2     IJ_3     5 5 2 00000000111010110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     9 0 0 01111011110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 3 2 00100101000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  0 3 6 00010101110100111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 3 3 2 000001010xx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 6 0 00011110x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   3 3 2 000000001xx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     5 3 2 00011101000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 3 2 01000001110000011101|        Q = rs2
    * 28 _L0x28   SH_1     9 3 0 01011101110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 3 2 00011101100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     9 3 0 01011101110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 3 010xxxx1010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 3 2 00011100xxx000111110| SLL    Shift left
    * 2d MULH_0   MULH_1   1 6 2 00010101100001101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  5 3 2 10011111011001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 4 3 2 00100101011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 3 7 00100101011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 3 2 00011111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    7 3 2 00100000100010000110|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   7 5 2 00000001001010011110|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    7 4 2 00011010100011011110|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   8 6 2 00110111100000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 7 2 00110111110000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  a 3 5 001xxxx1000011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 2 00111101011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 8 3 2 10100101000011100110|        Last shift.
    * 3a SRxI_1   SRxI_2   8 6 6 00110101100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  5 3 2 00101101011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 7 6 00110101100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 6 0 00011110x00000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 6 0 00011110x00000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     2 0 8 01011011110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   7 3 2 00110101000000001011|        yy=jj. Prep get Q=1
    * 42 MULHU_2  MULHU_3  0 6 6 00010101110101100000|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  0 3 2 00000000100011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  0 3 2 00011111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 3 01010101110001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    a 3 2 00110100x00001000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    a 5 2 00110101000010001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     2 8 8 01011101110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 3 01000001110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     2 8 8 01011101110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  b 9 2 00010100100010110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 3 2 000111010xx000110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  7 6 2 00111101000000101110| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * 4f MRET_8   MRET_9   3 3 3 11010101110001110100|        +4, so now 0x103
    * 50 LW_1     StdIncPc 8 1 9 00110111000011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   c 5 2 00110100111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 00010111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   c 5 2 00110100111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     1 7 6 00010101100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 c 5 2 00110101011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 2 00010001101001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 3 2 00010001100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 3 6 11010111100101101110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 2 00111111011010011100|        REM = Q to yy
    * 5a SB_1     SB_2     7 6 2 00110111100001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  5 3 2 00101101011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 7 2 00110111110011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 00010111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   c 5 2 00110100111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 2 10011111100001000010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 5 3 5 00101101001011110111| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 DIV_8    DIV_7    0 6 3 01010111110011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    0 a 3 01010111110001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  0 3 2 00011111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 3 5 000000010xx011101111|        Prepare read PC.
    * 66 SW_1     SW_2     b 5 2 00011100100011110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    c 5 2 00100100x11010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 8 3 2 00100101000011100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     0 3 2 00010101100010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 2 00110101000011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     1 b 2 00011001100001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 3 2 000111010xx000110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  7 6 2 00111101000000101110| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    7 3 2 00111100100010111001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   0 3 3 010xxxx1110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    1 7 6 00010101100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 c 5 2 00110101011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 3 2 00001101101000011010|        Invert q. Prepare read mask
    * 73 unalignd straddle 0 3 2 00000101011000010010|  Fr10u Unaligned pc, prep read high hword
    * 74 MRET_9   Fetch    5 4 3 01011010110011011110|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    7 4 2 00011010101011011110|        Mask and use as PC
    * 76 Fetchu   Fetch2u  0 3 a 00000111011011010101|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2u  0 1 b 00010111011011010101|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    5 3 2 00100001011010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    0 3 3 11010101110010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     8 5 2 00011000100011110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  5 3 2 00101101011001001001| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    5 4 2 01011010110011011110|        Branch taken.
    * 7e NMI_1    NMI_2    a 3 2 001xxxx1000010010000|        Store pc to mepc.
    * 7f unx7f             d 6 0 00xxxxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 0 01011011110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             d 6 0 00xxxxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 DIV_1    DIV_3    5 3 2 00011101000010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    0 3 2 01010101110010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   0 3 2 00011111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 00010111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   5 5 2 01000001010010011110|      Prep pc = jj + ofs
    * 87 unx87             d 6 0 00xxxxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 DIV_E    DIV_10   3 a 2 10011110xxx010011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 4 3 2 00100101011011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   3 3 6 110101110xx100011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 4 3 3 11100101010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 3 2 000111110xx000101001| XOR    xor
    * 8d DIV_0    DIV_1    1 c 2 10010111100010000010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 3 3 00010101110010101001|        Q = 1
    * 90 NMI_2    JAL_3    c d 2 00101001011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   6 d 3 11100100x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    a 3 2 00110010x00000110100|        PC to mepc
    * 93 SW_E2    SW_E3    a 3 2 00110111000010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    7 d 2 00110010x10000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 3 3 11010111110010010100|        Q = 3
    * 96 SH_1     SH_2     7 6 2 00110111100010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    c 5 2 00100100x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 2 00111101011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 3 2 000xxxx0xxx011111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    6 d 2 01110010x10000110100|        mcause = 11
    * 9b SH_4     SH_5     e 8 2 00011001100010011111|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   1 a 2 10011001000001101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   1 a 2 10011001000010100010|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    d 3 4 11100101010000110100|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     b 3 2 00011000100011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    9 0 0 01111011110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  3 3 3 11010101110010110110|        Q = 4
    * a2 DIV_14   LB_6     0 3 2 00010101100010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 8 3 2 00100101000011100110|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   0 6 0 00011110x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 3 01001101110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  2 3 8 00010110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 3 2 010xxxx1110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    0 a 2 10010101100001111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    5 d 3 01110010x10000110100|        Store 2 to mcause
    * aa DIV_6    DIV_7    3 3 2 100101110xx011001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  a 3 2 00110101000010011010|        pc to mepc
    * ac _L0xac   SRx_1    3 3 2 00011100xxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   3 6 2 100111010xx011100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    3 3 2 00011100xxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 3 010xxxx1110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   6 d 2 01100100x10010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  3 3 3 11010101110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 4 3 11011010110011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             d 6 0 00xxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3  unalignd c 3 c 01011111110001110011|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     0 3 2 00000001011010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  3 3 3 11010101110010011010|        Q = 8
    * b7 IJ_3     IJ_4     7 3 2 00110101000010111101|        Store present PC in case of access error
    * b8 BGE      condb_2  5 3 2 00111101011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    0 3 3 00011001100011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   0 3 2 00001111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     7 7 2 00110111110010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 2 00101101011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     0 3 3 01000101110001110101|        Construct Q = 1
    * be IJ_1     IJ_2     1 1 2 00010111100000011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 1 2 00010111100011000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 3 5 00011101100010001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 2 00110101011011101001|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   0 6 3 01010111110011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   0 a 3 01010111110010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    5 3 2 00011111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 3 2 00000001101001101111|        ~302
    * c6 IJT_4    ILL_2    a 3 2 00110101101001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   a 3 2 001xxxx1000011001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 3 d 10011001110001100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   3 3 2 01001101110010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 3 d 10011001110011000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc c d 2 00101001011011100110|        mtval = 0.
    * cc OR_0     OR_1     3 3 2 000111110xx000100110| OR     or
    * cd REM_0    DIV_1    1 c 2 10010111100010000010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * cf MRET_7   MRET_8   3 3 5 000011010xx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 3 01000001110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   5 3 2 00001101011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     1 7 6 00010101100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 c 5 2 00110101011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   5 d 3 01100100x10010010010|        Store 5 to mcause
    * d5 Fetch2u           c 5 e 01011111110000000000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * d6 eILL0c   ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  c 5 2 00110101011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 2 00111101011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  3 3 2 100111110xx001000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 3 2 000101010xx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 5 3 01111000x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 2 00101101011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  c 5 2 00110101011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   5 1 b 00010111011011110100|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   5 1 b 00010111011011110100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 2 00110111000011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 2 00000001100000011101|        Q = RS1
    * e2 MUL_1    MUL_2    0 6 6 00010101110111101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 3 6 110101110xx100011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   0 3 2 00011111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 3 3 11010101110010110000|        Q = 4
    * e6 StdIncPc Fetch    6 4 4 11011010110011011110|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 c 5 2 00110101011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 2 10011101100011100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    0 3 3 01011001110011000110|        Construct Q = 1
    * ea MULHU_5  MULHU_6  0 3 2 00011001110000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     0 3 2 00001111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 3 2 000111110xx000010001| AND    And 
    * ed REMU_0   DIVU_1   3 6 2 100111010xx011100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    6 4 3 11011010110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    1 7 6 00010101100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 c 5 2 00110101011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 3 2 000001010xx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 3 2 000xxxx01xx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  c 5 f 01000011010010110100|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 c 5 2 00110101011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 3 3 11011001110011111010| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 c 5 2 00100001011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 2 00111101011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   5 3 3 01011101010011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    0 3 3 01010101110001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 3 2 00000001011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 2 00101101011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 3 2 000001010xx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 3 2 00000100xxx001000110| Illegal
    * ff QINT_0   QINT_1   3 3 2 000001010xx011000111| INT    Get current PC
    */
   localparam u0_0 = 256'h56e6d010d0e2d8045c33dc5ab88bdc5aba09da07080454e650e6bcbe79d2bc01;
   localparam u0_1 = 256'h0eb75cd456e66ea6083252e60441d613087d10e618169c15f814ac76d81af88b;
   localparam u0_2 = 256'h56e6f642586ac03e1430dc96d821dc961c1dd0270804e63550e65d3950e6bc52;
   localparam u0_3 = 256'he03ae0355903d6490832593d50e6d61310d77c037836a8de129e0886f82b56e6;
   localparam u0_4 = 256'h5c7400fed02ed03148b1dc661c4bdc66508f40475c65fa2b08ea5d60500bbc50;
   localparam u0_5 = 256'h4eda79707cfbd6490832785df69c796e188b1a57561e59eb4eda79544eda70e6;
   localparam u0_6 = 256'h1ccfc8b9d02ed031987a50f9588b50e64693c8f210effa2b7c587cc8d2f7f842;
   localparam u0_7 = 256'h00001090acded649083288f25ca816aa76d576d5aadeacde5612da1a561e59ba;
   localparam u0_8 = 256'h5ca900fe7882f02954e6711a56e6e09c0000149e79f0fa215c82d0a80000bc85;
   localparam u0_9 = 256'h88f2543490a29068989f243400fed613469378bb7c9424347095203444929634;
   localparam u0_A = 256'h1cc5c03fd0e0c03f509a70c8243458781c616ed0dcafe63a50e6588b5cb6bc5e;
   localparam u0_B = 256'h78c1781f5c75d6497cb5fa1a98c0d61350bd5c9a169bfc730000acde5cb24492;
   localparam u0_C = 256'hd04f00fe7882f02696e69cc2dca59c6210cb5a471a6ff2e17c8a7cca56e9d888;
   localparam u0_D = 256'h76f476f456e5d64984925091f042d61356a100fefc004492561e5906d6c91c37;
   localparam u0_E = 256'hacde00fed0e0f011fa569c229cc6d8e2561eacde5cb0fa1a711a5de8181d70ca;
   localparam u0_F = 256'h50c74046507ed649166b5c45d4d9d61316ab9cfa56db34b408dd50e6561e5972;
   localparam u1_0 = 256'h4322332133291321033453050320530513200320332043263320222511110005;
   localparam u1_1 = 256'h5520333d83222321332083225524532373223320135003350321644d03210321;
   localparam u1_2 = 256'h4322532916213321033493050321930503245321332006013320036143229007;
   localparam u1_3 = 256'h160116018763532233208663832a5323a3528723862374217520732203214372;
   localparam u1_4 = 256'h333d332076233321b921288503342885a523a323033503210320066173232085;
   localparam u1_5 = 256'hc523111177235322332076235323136d03211321c5231761c5231111c5238193;
   localparam u1_6 = 256'h03347323762333211b21532303218322c522b521335003210a35063553521329;
   localparam u1_7 = 256'hd600a3225425532233208521033d532201b103a07421543503200320c5231761;
   localparam u1_8 = 256'h033133201c293321433e336d43223a29d60055241111032103255321d6000005;
   localparam u1_9 = 256'hb321d34e1a291a29e8216d2733205323c5227623333d7d23a323a3236d3ecd22;
   localparam u1_A = 256'h0334332136293321a32333295d370a29032423810334060183220321333d9007;
   localparam u1_B = 256'h112111210334532277230320033153237323333d0320c3c5d600643d333d6d26;
   localparam u1_C = 256'h335033201c293321cd2213d9332413d9a322a323032053210a35063553231351;
   localparam u1_D = 256'h51b151b1c52353225537332133295323c5233320c5e55d36c523176153200334;
   localparam u1_E = 256'h643d3320362933210320032103351329c523644d333d0321336d066113205323;
   localparam u1_F = 256'h33203320332053220320033553355323c522333dc523c5f433203320c5231761;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[8] = indir[8];
   assign d[12] = indir[9];
   assign d[13] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[22] = indir[13];
   assign d[23] = indir[14];
   assign d[24] = indir[15];
   assign d[25] = indir[16];
   assign d[28] = indir[17];
   assign d[42] = indir[18];
   assign d[43] = indir[19];
   // replaces = 1000000100100101000000000101001100011000000000
   SB_LUT4 #(.LUT_INIT(16'h1098)) cmb_d09(.O(d[9]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h3018)) cmb_d10(.O(d[10]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0c00)) cmb_d15(.O(d[15]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d18(.O(d[18]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hfffe)) cmb_d20(.O(d[20]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0100)) cmb_d32(.O(d[32]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0802)) cmb_d35(.O(d[35]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0a00)) cmb_d38(.O(d[38]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d45(.O(d[45]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0100110011011000001000001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h2f3f)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2a30)) cmb_d27(.O(d[27]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0012)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0080)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2200)) cmb_d37(.O(d[37]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0915)) cmb_d40(.O(d[40]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0900)) cmb_d41(.O(d[41]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d44(.O(d[44]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000001000000010100100000010000000100000000000
   SB_LUT4 #(.LUT_INIT(16'h4d82)) cmb_d11(.O(d[11]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5fb7)) cmb_d19(.O(d[19]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5c00)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h16e0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0204)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h400f)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
