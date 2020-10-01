/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 42 columns
 * Removed:  000000000000000000000000000000000000000000 These are treated already, removed from consideration
 * Reserved: 000000000000000000000001000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 42
 * 168 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 
 * 167 168 168 167 168 167 166 167 168 167 168 167 163 165 168 168 168 168   x 167 168 168 167 168 168 167 168 167 168 168 168 168 168 168 168 168 168 168 168 168 168 168  kill col 12  Tbl  40 cols 000000000000000000000001000001000000000000 has 163 unique lines.
 * 162 163 163 162 163 162 161 162 163 162 162 161     160 163 163 163 163   x 162 163 163 160 163 163 161 163 162 163 163 163 163 163 163 163 163 163 163 163 163 163 163  kill col 22  Tbl  39 cols 000000000000000000010001000001000000000000 has 160 unique lines.
 * 158 160 160 159 160 158 157 159 160 159 159 158     157 160 160 160 160   x 159 160 160     160 160 159 160 159 160 160 160 160 160 160 160 160 160 160 160 160 160 160  kill col 13  Tbl  38 cols 000000000000000000010001000011000000000000 has 157 unique lines.
 * 155 157 157 156 157 155 154 156 156 156 156 153         157 157 157 157   x 156 157 157     157 157 156 157 156 157 157 157 157 157 157 157 157 157 157 157 157 157 157  kill col 11  Tbl  37 cols 000000000000000000010001000011100000000000 has 153 unique lines.
 * 151 153 153 152 152 151 150 152 152 152 152             153 153 153 153   x 151 153 153     153 153 152 153 152 153 153 153 153 153 153 153 153 153 153 153 153 153 153  kill col  6  Tbl  36 cols 000000000000000000010001000011100001000000 has 150 unique lines.
 * 147 150 149 149 149 148     149 149 149 149             150 150 150 150   x 148 150 150     150 150 149 150 149 150 150 150 150 150 150 149 150 150 150 150 150 150 150  kill col  0  Tbl  35 cols 000000000000000000010001000011100001000001 has 147 unique lines.
 *     147 146 146 145 144     145 146 146 146             147 147 147 147   x 144 147 147     147 147 146 147 145 147 147 147 147 147 147 146 147 147 147 147 147 147 147  kill col 19  Tbl  34 cols 000000000000000000010011000011100001000001 has 144 unique lines.
 *     144 143 143 142 141     142 143 143 143             144 144 144 144   x     144 144     144 144 143 144 142 144 144 144 144 144 144 143 144 144 144 144 144 144 144  kill col  5  Tbl  33 cols 000000000000000000010011000011100001100001 has 141 unique lines.
 *     139 138 137 138         138 140 140 140             141 141 141 140   x     141 141     141 140 140 141 139 141 140 141 141 141 141 140 141 141 141 141 141 141 141  kill col  3  Tbl  32 cols 000000000000000000010011000011100001101001 has 137 unique lines.
 *     133 132     132         134 136 136 136             136 137 135 136   x     137 137     136 136 135 137 135 137 136 137 137 137 137 136 137 137 137 137 137 137 137  kill col  4  Tbl  31 cols 000000000000000000010011000011100001111001 has 132 unique lines.
 *     122 124                 125 131 131 131             131 132 130 129   x     132 132     129 131 126 132 129 132 131 132 132 132 132 131 132 132 132 132 132 132 132  kill col  1  Tbl  30 cols 000000000000000000010011000011100001111011 has 122 unique lines.
 *         108                 111 120 121 121             121 122 117 117   x     122 122     118 120 114 120 119 122 120 122 122 122 122 121 122 122 122 122 122 122 122  kill col  2  Tbl  29 cols 000000000000000000010011000011100001111111 has 108 unique lines.
 *                              92 106 107 107             105 108 102 102   x     108 108     100 103  98 107 106 107 106 108 108 107 108 105 108 108 108 108 108 108 108  kill col  7  Tbl  28 cols 000000000000000000010011000011100011111111 has  92 unique lines.
 *                                  90  91  91              88  92  85  84   x      92  92      84  82  81  91  90  89  89  92  91  91  92  89  92  92  92  92  92  92  92  kill col 25  Tbl  27 cols 000000000000000010010011000011100011111111 has  81 unique lines.
 *                                  79  80  80              76  81  74  73   x      81  81      71  72      80  79  79  78  81  79  80  80  78  81  81  81  81  81  81  81  kill col 23  Tbl  26 cols 000000000000000010110011000011100011111111 has  71 unique lines.
 *                                  69  70  70              66  71  65  66   x      71  71          62      69  68  68  68  71  69  70  70  68  71  71  71  71  71  71  70  kill col 24  Tbl  25 cols 000000000000000011110011000011100011111111 has  62 unique lines.
 *                                  60  61  61              58  62  57  57   x      62  62                  60  59  60  59  62  60  61  61  59  62  62  61  62  61  62  61  kill col 17  Tbl  24 cols 000000000000000011110011100011100011111111 has  57 unique lines.
 *                                  55  56  56              53  57  53       x      57  57                  54  55  55  54  57  55  56  56  54  57  56  56  57  56  56  56  kill col 16  Tbl  23 cols 000000000000000011110011110011100011111111 has  53 unique lines.
 *                                  51  52  52              50  53           x      52  51                  50  51  51  49  53  51  52  52  50  53  52  52  53  52  51  52  kill col 29  Tbl  22 cols 000000000000100011110011110011100011111111 has  49 unique lines.
 *                                  47  48  48              46  49           x      48  47                  44  45  46      49  47  48  48  47  49  48  48  49  45  47  48  kill col 26  Tbl  21 cols 000000000000100111110011110011100011111111 has  44 unique lines.
 *                                  42  43  43              41  44           x      43  42                      40  41      44  42  43  43  42  44  43  43  44  40  42  43  kill col 39  Tbl  20 cols 001000000000100111110011110011100011111111 has  40 unique lines.
 *                                  38  39  39              38  40           x      38  38                      35  34      39  38  39  39  38  40  39  39  40      37  39  kill col 28  Tbl  19 cols 001000000000110111110011110011100011111111 has  34 unique lines.
 *                                  32  33  33              33  34           x      30  32                      30          33  31  33  33  32  34  32  33  33      30  32  kill col 40  Tbl  18 cols 011000000000110111110011110011100011111111 has  30 unique lines.
 *                                  28  29  29              29  30           x      27  28                      25          29  28  29  27  28  30  28  29  29          27  kill col 27  Tbl  17 cols 011000000000111111110011110011100011111111 has  25 unique lines.
 *                                  23  24  24              24  25           x      22  23                                  24  23  24  23  23  25  23  24  24          23  kill col 20  Tbl  16 cols 011000000000111111110111110011100011111111 has  22 unique lines.
 *                                  20  21  21              21  22           x          21                                  21  21  21  20  20  22  20  21  21          20  kill col 41  Tbl  15 cols 111000000000111111110111110011100011111111 has  20 unique lines.
 *                                  18  19  19              19  20           x          19                                  19  19  19  18  18  20  18  19  19              kill col 36  Tbl  14 cols 111001000000111111110111110011100011111111 has  18 unique lines.
 *                                  16  17  17              17  18           x          17                                  17  17  17  16  16  18      16  17              kill col 37  Tbl  13 cols 111011000000111111110111110011100011111111 has  16 unique lines.
 *
 * Round 1: 000100111111000000001000001100011100000000  4 columns for indexes to table representing 13 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 165 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 
 * 164 165 165 164 165 164 163 164   x   x   x 163 160 162   x   x 165 165   x 163 165   x 164 165 165 164 165 164 165 165   x   x   x   x   x   x 165 165   x 165 165 165  kill col 12  Tbl  27 cols 000100111111000000001001001101011100000000 has 160 unique lines.
 * 159 160 160 159 160 159 158 159   x   x   x 157     157   x   x 160 160   x 158 160   x 157 160 160 158 160 159 160 160   x   x   x   x   x   x 160 160   x 160 160 160  kill col 22  Tbl  26 cols 000100111111000000011001001101011100000000 has 157 unique lines.
 * 155 156 157 156 157 155 154 156   x   x   x 154     153   x   x 157 157   x 155 157   x     157 157 155 157 156 157 157   x   x   x   x   x   x 157 157   x 157 157 157  kill col 13  Tbl  25 cols 000100111111000000011001001111011100000000 has 153 unique lines.
 * 151 152 153 152 153 151 148 152   x   x   x 146           x   x 153 153   x 151 153   x     153 153 151 153 152 153 153   x   x   x   x   x   x 153 153   x 153 153 153  kill col 11  Tbl  24 cols 000100111111000000011001001111111100000000 has 146 unique lines.
 * 144 145 146 145 145 144 141 145   x   x   x               x   x 146 146   x 143 146   x     146 146 144 146 145 146 146   x   x   x   x   x   x 146 146   x 146 146 146  kill col  6  Tbl  23 cols 000100111111000000011001001111111101000000 has 141 unique lines.
 * 138 140 140 140 140 139     140   x   x   x               x   x 141 140   x 138 141   x     141 140 139 141 140 141 141   x   x   x   x   x   x 141 141   x 141 141 141  kill col 19  Tbl  22 cols 000100111111000000011011001111111101000000 has 138 unique lines.
 * 133 136 137 136 137 135     135   x   x   x               x   x 138 137   x     138   x     138 137 136 138 137 138 138   x   x   x   x   x   x 138 138   x 138 138 138  kill col  0  Tbl  21 cols 000100111111000000011011001111111101000001 has 133 unique lines.
 *     130 132 130 130 129     129   x   x   x               x   x 132 132   x     133   x     133 130 130 132 131 133 133   x   x   x   x   x   x 133 133   x 133 133 133  kill col  7  Tbl  20 cols 000100111111000000011011001111111111000001 has 129 unique lines.
 *     125 122 124 122 121           x   x   x               x   x 128 127   x     129   x     129 122 125 128 127 128 129   x   x   x   x   x   x 129 129   x 129 129 129  kill col  5  Tbl  19 cols 000100111111000000011011001111111111100001 has 121 unique lines.
 *     116 111 115 111               x   x   x               x   x 116 117   x     121   x     119 110 116 120 119 120 119   x   x   x   x   x   x 121 121   x 121 121 121  kill col 24  Tbl  18 cols 000100111111000001011011001111111111100001 has 110 unique lines.
 *     105 100 104 101               x   x   x               x   x 103 105   x     110   x     104     100 109 108 109 108   x   x   x   x   x   x 110 110   x 110 110 110  kill col 25  Tbl  17 cols 000100111111000011011011001111111111100001 has 100 unique lines.
 *      91  89  92  89               x   x   x               x   x  93  92   x     100   x      91          99  97  97  98   x   x   x   x   x   x 100 100   x 100 100 100  kill col  4  Tbl  16 cols 000100111111000011011011001111111111110001 has  89 unique lines.
 *      77  74  80                   x   x   x               x   x  81  81   x      88   x      81          88  85  87  87   x   x   x   x   x   x  88  89   x  89  89  89  kill col  2  Tbl  15 cols 000100111111000011011011001111111111110101 has  74 unique lines.
 *      62      61                   x   x   x               x   x  66  64   x      72   x      66          73  70  71  72   x   x   x   x   x   x  73  74   x  74  73  74  kill col  3  Tbl  14 cols 000100111111000011011011001111111111111101 has  61 unique lines.
 *      45                           x   x   x               x   x  52  51   x      59   x      51          58  57  58  58   x   x   x   x   x   x  60  61   x  61  60  61  kill col  1  Tbl  13 cols 000100111111000011011011001111111111111111 has  45 unique lines.
 *                                   x   x   x               x   x  38  37   x      43   x      37          43  42  43  43   x   x   x   x   x   x  44  44   x  45  44  45  kill col 23  Tbl  12 cols 000100111111000011111011001111111111111111 has  37 unique lines.
 *                                   x   x   x               x   x  32  31   x      35   x                  33  33  35  35   x   x   x   x   x   x  36  36   x  36  36  36  kill col 17  Tbl  11 cols 000100111111000011111011101111111111111111 has  31 unique lines.
 *                                   x   x   x               x   x  27       x      29   x                  26  27  29  28   x   x   x   x   x   x  30  30   x  30  30  30  kill col 26  Tbl  10 cols 000100111111000111111011101111111111111111 has  26 unique lines.
 *                                   x   x   x               x   x  21       x      22   x                      21  22  23   x   x   x   x   x   x  25  25   x  24  24  25  kill col 27  Tbl   9 cols 000100111111001111111011101111111111111111 has  21 unique lines.
 *                                   x   x   x               x   x  17       x      17   x                          17  18   x   x   x   x   x   x  20  20   x  19  18  20  kill col 28  Tbl   8 cols 000100111111011111111011101111111111111111 has  17 unique lines.
 *                                   x   x   x               x   x  14       x      12   x                              15   x   x   x   x   x   x  16  16   x  14  14  16  kill col 20  Tbl   7 cols 000100111111011111111111101111111111111111 has  12 unique lines.
 *
 * Round 2: 111011000000100000000000010000000000000000  4 columns for indexes to table representing  7 original columns (uses 12 of 16 lines in indirect table).
 * Direct:  000000000000011111110111100011100011111111 22 columns
 * Can even chose 2 more columns to be represented directly.
 * Success. Use 2 EBRs, 18 LUTs.
 */

module m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
   output [47:0] d
   );
   /*                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 000110101011000000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 00010111101001x111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 000110111011000010111110| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 FENCE    StdIncPc 3 0 00000101x01xxxx011100110| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 4 0 100001011011000011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   1 0 00000101x00xxxx000000100| AUIPC  q = imm20 (copy x/8)
    * 06 LB_3     LB_4     1 0 00001101101010x000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 0 00001011101011x000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     5 0 000111001011000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 0 00001011101000x010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     5 0 000111001011000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    6 3 10000101101011x010000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 0 00011101101001x000000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 0e SUB_0    SUB_1    3 0 00011101x01xxxx000010000| SUB    Subtraction
    * 0f _L0f     StdIncPc 4 0 100001011011100011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     1 0 00011111101000x010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 0 00011101101000x000011010|        RS1^0xffffffff to Q
    * 12 eFetch3           5 4 001111111011001000000000|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * 13 condb_2  condb_3  1 0 00011111101000x000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  1 5 000001011011001000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 6 00011001101001x000010110|        Branch on condition
    * 16 condb_5  Fetch    7 7 010110110001101011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  7 3 010110111011000001110100|        Branch taken.
    * 18 BEQ      condb_2  6 0 100111011011100000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   6 0 000101011011000001000001| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 4 0 10000101101011x011100110|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    1 3 000001011001100000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 000101111001100010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 4 0 100001011011110011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 5 000101010011001011010100|        Q = 4
    * 1f IJ_2     IJ_3     6 0 100101011011100010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     7 2 100110101011000001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 0 10000101101000x011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 23 FENCEI   StdIncPc 3 0 00000101x01xxxx011100110| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   3 8 000111101001100000110101| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   1 0 00000101x00xxxx000000100| AUIPC  q = imm20 (copy x/8)
    * 26 OR_1     OR_2     6 0 00011101101000x000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 0 000000011011000000011101|        Q = rs2
    * 28 _L28     SH_1     5 2 000111001011000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 0 00011101101000x000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     5 2 000111001011000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 5 000xxxx11011001000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 0 00011101x00xxxx000111110| SLL    Shift left
    * 2d MULH_0   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 2e EBRKWFI2 EBREAK_1 6 6 00001101101010x011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 4 0 100001011011100011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 9 100001011011101011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 0 00011111101000x000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    6 0 100001011011000010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  6 0 111001011001000010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    7 a 01011011100001x011011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   8 8 10010111101001x000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    8 b 100101111011010000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  6 6 101xxxx1101001x011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  6 0 100111011011100000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 3a SRxI_1   SRxI_2   8 c 10010101101001x100111101|        Register to shift to Q
    * 3b _L3b     JAL_1    1 3 000001011001100000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  6 0 100011011011100001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   FENCE    8 d 10010101101001x100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   3 8 00011110100001x000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   3 8 00011110100001x000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 3 000110111011000001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 5 000000011011001000001011|        Q=1
    * 42 MULHU_2  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 43 MULHU_4  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 44 SLTI_0   SLTIX_1  1 0 00011111101010x000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 5 000101011011001001100101|        More check offset
    * 46 ILL_1    ILL_2    7 0 10111011101001x001000111|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    1 a 00010111101001x010001111|        Read until Q is offending instruction
    * 48 _L48     SW_1     9 3 000111011011000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 5 000000011011001001001011|        Construct PC storage adr
    * 4a _L4a     SW_1     9 3 000111011011000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 0 01110101100001x010110000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 0 00011101x01xxxx000110001| SLT    Set less than (signed)
    * 4d MULHSU_0 ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 4e eILL0b   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 5 000101011011001011100110|        Prep +4
    * 50 LW_1     StdIncPc 4 e 10010111101001x011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   5 0 111101011001100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 00010111101001x101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   5 0 111101011001100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     1 d 00010101101001x111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 6 0 111101011011100000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 0 00010001101011x001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 0 00010001101000x010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 59 DIV_B    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 5a SB_1     SB_2     5 8 10010111101001x001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    1 3 000001011001100000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  6 0 100011011011100001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     5 b 100101111011010011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 00010111101001x101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   5 0 111101011001100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 DIV_14   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 61 DIV_15   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 62 DIV_8    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 63 DIV_9    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 64 SLTIU_0  SLTIX_1  1 0 00011111101010x000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 6 00000101x01xxxx011101111|        Prepare read PC
    * 66 SW_1     SW_2     8 0 01111101100001x011110010|        Write d to a+k until accepted
    * 67 SWE      SW_E2    6 0 111001011001100010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 69 DIV_13   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 6a MULH_1   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 6b SB_4     SB_5     9 0 01011001101001x001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 0 00011101x01xxxx000110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 6e LHU_3    ANDI_1   1 0 00001111101010x000011010|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   1 5 000xxxx11011001011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    1 d 00010101101001x101101110|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 6 0 111101011011100000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 0 00001101101010x000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  6 0 11111001101001x001110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   3 f 00010111101001x011110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  3 0 00000101x00xxxx001110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 0 00000101101000x001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  6 5 101101011001001001111101|        origPC to mepc. Prep read 0
    * 78 DIV_4    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 79 DIV_5    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 7a SB_5     SW_2     8 0 01011001100001x011110010|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    1 3 000001011001100000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  6 0 100011011011100001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    b 0 11010011100001x000110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    6 0 101xxxx1101001x010010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  6 0 11110101100001x001111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0 000110101011000010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  6 0 10110101100001x001111101|        Store PC to mepc
    * 82 DIV_1    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 83 DIV_2    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 84 XORI_0   XORI_1   1 0 00011111101010x000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 00010111101001x111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    4 5 100110010001001000110100|        Return address to TRG
    * 87 JALRE1   JALRE2   6 0 10111001100001x001111111|  err   Store pc to mepc
    * 88 DIV_E    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 89 DIV_F    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 8a DIVU_5   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 8b LB_6     StdIncPc 4 5 100001011011001011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 0 00011111x01xxxx000101001| XOR    xor
    * 8d DIV_0    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 8e aF_SW_3  LDAF_3   b 0 110001010001000010010010|        Store 7 to mcause
    * 8f ILL_3    ILL_4    6 0 111101011011100010101001|        Store illegal instruction to mtval
    * 90 NMI_2    JAL_3    b 0 111010011011100000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   b 5 110001010001001010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    6 0 10110011100001x000110100|        PC to mepc
    * 93 SW_E2    SW_E3    6 0 10110111101001x010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    b 0 110100111001010000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 5 000101110011001010010100|        Q = 3
    * 96 SH_1     SH_2     5 8 10010111101001x010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    6 0 111001011001100010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  6 0 100111011011100000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 9a ECALL_6  JAL_3    b 0 110100110001000000110100|        mcause = 11
    * 9b ILL_5    JAL_3    b 5 110100111001001000110100|        Store 2 to mcause
    * 9c DIV_10   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 9d DIV_11   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 9e SH_4     SH_5     9 0 00111001101001x010011111|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     8 0 00111001100001x011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    7 2 100110101011000001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  1 5 000101010011001011001110|        Q = 4
    * a2 MULHU_3  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * a3 MULHU_1  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * a4 SRxI_0   SRxI_1   3 8 000111101001100000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 5 000011011011001010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 3 000101111001100011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 0 000xxxx11011000000101110| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * a9 ILL_4    ILL_5    1 5 000101011011001010011011|        Q = 1
    * aa DIV_6    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ab EBREAK_2 ECALL_6  6 0 10110101101001x010011010|        pc to mepc
    * ac _Lac     SRx_1    3 0 00011101x00xxxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ae _Lae     SRx_1    3 0 00011101x00xxxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 5 000xxxx11011001011000101|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  1 5 000101010011001010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  Fetch    4 8 xxxxxxxxxxxxxxxx11x1111x|        Not in use
    * b2 CSRRW_4  Fetch    7 7 010110110001001011011110|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1 Fetch    4 8 xxxxxxxxxxxxxxxx11x1111x|        Not in use
    * b4 CSRRWI_2 Fetch    4 8 xxxxxxxxxxxxxxxx11x1111x|        Not in use
    * b5 SH_3     SH_4     3 0 000000011011100010011110|        Prepare get back address to use 
    * b6 CSRRCI_1 Fetch    4 8 xxxxxxxxxxxxxxxx11x1111x|        Not in use
    * b7 IJ_3     IJ_4     1 0 000110010011000010111101|        Construct Q = 3
    * b8 BGE      condb_2  6 0 100111011011100000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ba DIV_C    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * bb SH_2     SH_3     5 b 100101111011010010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  6 0 100011011011100001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    7 a 01011011100011x011011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 a 00010111101001x000011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 a 00010111101001x011000001|        Exit CSR, enter trap
    * c0 DIV_D    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * c1 IJT_2    IJT_3    6 0 100101011011100011101001|        Read word is to be masked with ~3u
    * c2 DIVU_3   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * c3 DIVU_4   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * c4 ORI_0    ORI_1    6 0 00011111101010x011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 0 00000001101010x001101111|        ~302
    * c6 IJT_4    ILL_2    7 0 10111011101011x001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   6 0 101xxxx1101001x011001011|        Store pc to mepc.
    * c8 DIV_7    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * c9 MRET_2   MRET_3   1 0 000011010011000010100101|        0xff+3 = 0x102
    * ca DIVU_2   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * cb QINT_2   StdIncPc b 0 111010011011100011100110|        mtval = 0.
    * cc OR_0     OR_1     3 0 00011111x01xxxx000100110| OR     or
    * cd REM_0    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ce ECALL_5  ECALL_6  1 5 000101010011001010011010|        Q = 8
    * cf MRET_7   MRET_8   3 6 00001101x01xxxx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 5 000001011011001000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   6 0 000011011011100011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     1 d 00010101101001x100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 6 0 111101011011100000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   b 5 110001011001001010010010|        Store 5 to mcause
    * d5 eFetch2  Fetch    4 8 xxxxxxxxxxxxxxxx11x1111x|  Fr11  Not in use
    * d6 eILL0c   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  6 0 111101011011100010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  6 0 100111011011100000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * da LDAF_a   LDAF_2   3 0 00010101x01xxxx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   6 5 110001011001001010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  6 0 100011011011100001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  6 0 111101011011100011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   6 f 000101111011100011110100|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   6 f 000101111011100011110100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * e1 ORI_1    ORI_2    1 0 00000001101001x000011101|        Q = RS1
    * e2 MUL_1    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * e3 MUL_3    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * e4 ANDI_0   ANDI_1   1 0 00011111101010x000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 5 000101010011001010001110|        Q = 4
    * e6 StdIncPc Fetch    7 7 010110110001001011011110|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 6 0 111101011011100000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * e9 IJT_3    IJT_4    1 0 000110010011000011000110|        Construct Q = 3
    * ea MULHU_5  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * eb LH_3     LH_4     1 0 00001111101010x001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 0 00011111x01xxxx000010001| AND    And 
    * ed REMU_0   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ee eILL0a   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    7 7 010110110001001011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    1 d 00010101101001x101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 6 0 111101011011100000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 0 00000101x01xxxx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 0 000xxxx1x00xxxx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  6 0 011000111111000000010010|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 6 0 111101011011100011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 5 000000010011001011111010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 6 0 111001011011100010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  6 0 100111011011100000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * fa WFI_2    WFI_3    1 5 000101011011001001000101|        Check offset
    * fb SB_3     SB_4     3 0 000000011011100001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  6 0 100011011011100001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 0 00000101x01xxxx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 0 00000101x01xxxx001000110| Illegal
    * ff QINT_0   QINT_1   3 0 00000101x01xxxx011000111| INT    Get current PC
    */
   localparam u0_0 = 256'hb8e6201000fea404ac86b05aa08bb05aac09a8070004b0e620e6b0bea5d2b001;
   localparam u0_1 = 256'hb8b732d4bce698a69832ace6b041b813b0741adea416b215a014b200a01aa08b;
   localparam u0_2 = 256'hb8e6a8f700fe003eb230b096a021b096b01da0270004983520e600fea0e6b052;
   localparam u0_3 = 256'h843a8435a503b8499832a53d00feb813a4d7b403a43684de9081b086a02bbae6;
   localparam u0_4 = 256'hb2e600fe00fe203184b0b066b24bb066a48fa447b265a82b00fe00feb20bb050;
   localparam u0_5 = 256'h98daa570b4fbb8499832a45d00fe00fea08bac57b81ea5eb98daa55498daa4e6;
   localparam u0_6 = 256'hb2cfa81a00fe2031a47a00fe00fe00fe989384f220efa82b00fe00fe00fe00fe;
   localparam u0_7 = 256'h847da4908434b849983284f200fe00fe927da0770073a4f4a476a81ab81ea56e;
   localparam u0_8 = 256'hb8a9109200fe2029b2e600fe00fe00fe847f1234a5f0a82100fe00fe847db085;
   localparam u0_9 = 256'h84f2a49f00fe00fe9234103400feb8139893a4bb32949434a49584341292b834;
   localparam u0_A = 256'hb2c5003f00fe003fa49a00feb29b00feb02e98d0b2af983a00fe00fe32ceb05e;
   localparam u0_B = 256'ha4c1a41f8cdeb849b4b500fe00feb81330bd00deb89e00de00de12de00de32b2;
   localparam u0_C = 256'h204f329a00fe2026b8e600fe30a500fea4cbac47a86fa8e100fe00feb8e900fe;
   localparam u0_D = 256'hb8f4b8f4b8e5b8499292209100feb813b8a100fe00de9292b81ea506b8c9b237;
   localparam u0_E = 256'h12de00fe00fe2011a85600fe30c600feb81e12de328ea81a00fe00fea41d00fe;
   localparam u0_F = 256'h20c72046207eb849b86bb24500feb813b8ab32fab8dbf01200dd20e6b81ea572;
   localparam u1_0 = 256'h4085301d3001101d6385501c100b501c100b100d100540853005221b1117001a;
   localparam u1_1 = 256'h6095151540851217130540856015609d735b775b16191505101f543f101d101f;
   localparam u1_2 = 256'h4085660d3001301d3501521c101d521c1001601d1005381e300530014085729a;
   localparam u1_3 = 256'h381e381e8d95608d13058c953001609d66a18b9788977a5b60e56085101f4985;
   localparam u1_4 = 256'h151530013001301da075931d1501931d1a1770bb1515101f300130011501031b;
   localparam u1_5 = 256'h50f511175b97608d13055897300130011011101160f51d1550f5111750f54e97;
   localparam u1_6 = 256'h1501100f3001301d905930013001300160e5807d3605101f3001300130013001;
   localparam u1_7 = 256'h60f560a1b0d3608d130580593001300165b5100530053f1760f9100d60f51d15;
   localparam u1_8 = 256'h60f5b0c53001301f458530013001300160b945991117101f3001300160b5001a;
   localparam u1_9 = 256'h8039903930013001b5d3b0d33001609d60e558971517b0d360b760b3b5c5b0e9;
   localparam u1_A = 256'h1501301d3001301d60b530011515300110011317150d381e300130011515729a;
   localparam u1_B = 256'h1a171a177a5b608d5b9730013001609d10194800300148004800775b48001515;
   localparam u1_C = 256'h360d15153001301fb0e93001100d300160a170bb1001601f3001300160953001;
   localparam u1_D = 256'h6f176f1760f5608d65c530153001609d60f530014800b5c560f51d15600d1505;
   localparam u1_E = 256'h775b30013001301f100f30011019300160f5775b1515101f3001300110013001;
   localparam u1_F = 256'h300530053005608d300115153001609d60e5150160f560631001300560f51d15;
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
   assign d[17] = indir[13];
   assign d[18] = indir[14];
   assign d[19] = indir[15];
   assign d[20] = indir[16];
   assign d[22] = indir[17];
   assign d[23] = indir[18];
   assign d[24] = indir[19];
   assign d[25] = indir[20];
   assign d[26] = indir[21];
   assign d[27] = indir[22];
   assign d[28] = indir[23];
   // replaces = 000100111111000000001000001100010000000000
   SB_LUT4 #(.LUT_INIT(16'h00b0)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hc6ff)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h000c)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hc482)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2800)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 111011000000100000000000010000000000000000
   SB_LUT4 #(.LUT_INIT(16'h07a7)) cmb_d16(.O(d[16]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h08e0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0804)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0c00)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h020f)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0281)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
