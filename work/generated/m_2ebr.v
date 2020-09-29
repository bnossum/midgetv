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
 *                                  79  80  80              76  80  74  73   x      81  81      71  72      80  79  79  78  81  79  80  80  78  81  81  81  81  81  81  81  kill col 23  Tbl  26 cols 000000000000000010110011000011100011111111 has  71 unique lines.
 *                                  69  70  70              66  70  65  66   x      71  71          62      69  68  69  68  71  69  70  70  68  71  71  71  71  71  71  70  kill col 24  Tbl  25 cols 000000000000000011110011000011100011111111 has  62 unique lines.
 *                                  60  61  61              58  61  57  57   x      62  62                  60  59  61  59  62  60  61  61  59  62  62  61  62  61  62  61  kill col 17  Tbl  24 cols 000000000000000011110011100011100011111111 has  57 unique lines.
 *                                  55  56  56              53  56  53       x      57  57                  54  55  56  54  57  55  56  56  54  57  56  56  57  56  56  56  kill col 16  Tbl  23 cols 000000000000000011110011110011100011111111 has  53 unique lines.
 *                                  51  52  52              50  52           x      52  51                  50  51  52  50  53  51  52  52  50  53  52  52  53  52  51  52  kill col 34  Tbl  22 cols 000000010000000011110011110011100011111111 has  50 unique lines.
 *                                  49  49  49              47  49           x      49  48                  47  48  49  48  50  48  49  49      50  49  49  50  49  48  49  kill col 26  Tbl  21 cols 000000010000000111110011110011100011111111 has  47 unique lines.
 *                                  46  46  46              44  46           x      46  45                      43  44  43  47  45  46  46      47  46  46  47  45  45  46  kill col 29  Tbl  20 cols 000000010000100111110011110011100011111111 has  43 unique lines.
 *                                  42  42  42              40  42           x      42  41                      39  40      42  41  42  42      43  42  42  43  39  41  42  kill col 39  Tbl  19 cols 001000010000100111110011110011100011111111 has  39 unique lines.
 *                                  38  38  38              37  38           x      37  37                      34  33      38  37  38  38      39  38  38  39      36  38  kill col 28  Tbl  18 cols 001000010000110111110011110011100011111111 has  33 unique lines.
 *                                  32  32  32              32  32           x      29  31                      29          32  30  32  32      33  31  32  32      29  31  kill col 40  Tbl  17 cols 011000010000110111110011110011100011111111 has  29 unique lines.
 *                                  28  28  28              28  28           x      26  27                      24          28  27  28  26      29  27  28  28          26  kill col 27  Tbl  16 cols 011000010000111111110011110011100011111111 has  24 unique lines.
 *                                  23  23  23              23  23           x      21  22                                  23  22  23  22      24  22  23  23          22  kill col 20  Tbl  15 cols 011000010000111111110111110011100011111111 has  21 unique lines.
 *                                  20  20  20              20  20           x          20                                  20  20  20  19      21  19  20  20          19  kill col 41  Tbl  14 cols 111000010000111111110111110011100011111111 has  19 unique lines.
 *                                  18  18  18              18  18           x          18                                  18  18  18  17      19  17  18  18              kill col 36  Tbl  13 cols 111001010000111111110111110011100011111111 has  17 unique lines.
 *                                  16  16  16              16  16           x          16                                  16  16  16  15      17      15  16              kill col 37  Tbl  12 cols 111011010000111111110111110011100011111111 has  15 unique lines.
 *
 * Round 1: 000100101111000000001000001100011100000000  4 columns for indexes to table representing 12 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 165 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 
 * 164 165 165 164 165 164 163 164   x   x   x 163 160 162   x   x 165 165   x 163 165   x 164 165 165 163 165 164 165 165   x   x   x   x 165   x 165 165   x 165 165 165  kill col 12  Tbl  28 cols 000100101111000000001001001101011100000000 has 160 unique lines.
 * 159 160 160 159 160 159 158 159   x   x   x 157     157   x   x 160 160   x 158 160   x 157 160 160 157 160 159 160 160   x   x   x   x 160   x 160 160   x 160 160 160  kill col 25  Tbl  27 cols 000100101111000010001001001101011100000000 has 157 unique lines.
 * 156 156 157 156 157 156 155 156   x   x   x 154     154   x   x 157 157   x 155 157   x 154 156 157     157 156 157 157   x   x   x   x 157   x 157 157   x 157 157 157  kill col 22  Tbl  26 cols 000100101111000010011001001101011100000000 has 154 unique lines.
 * 152 153 154 153 154 152 151 153   x   x   x 151     150   x   x 154 154   x 152 154   x     153 153     154 153 154 154   x   x   x   x 154   x 154 154   x 154 154 154  kill col 13  Tbl  25 cols 000100101111000010011001001111011100000000 has 150 unique lines.
 * 148 149 150 149 150 148 146 148   x   x   x 143           x   x 150 150   x 148 150   x     149 149     150 149 150 150   x   x   x   x 150   x 150 150   x 150 150 150  kill col 11  Tbl  24 cols 000100101111000010011001001111111100000000 has 143 unique lines.
 * 141 142 143 142 142 141 139 141   x   x   x               x   x 143 143   x 140 143   x     142 142     143 142 143 143   x   x   x   x 143   x 143 143   x 143 143 143  kill col  6  Tbl  23 cols 000100101111000010011001001111111101000000 has 139 unique lines.
 * 135 137 137 138 137 137     137   x   x   x               x   x 139 138   x 136 139   x     136 137     139 138 139 139   x   x   x   x 138   x 139 139   x 139 139 139  kill col  0  Tbl  22 cols 000100101111000010011001001111111101000001 has 135 unique lines.
 *     132 133 132 132 132     132   x   x   x               x   x 135 134   x 130 135   x     132 131     134 133 135 135   x   x   x   x 134   x 135 135   x 135 135 135  kill col 19  Tbl  21 cols 000100101111000010011011001111111101000001 has 130 unique lines.
 *     126 128 127 127 126     126   x   x   x               x   x 128 128   x     130   x     127 126     129 128 130 130   x   x   x   x 129   x 130 130   x 130 130 130  kill col 24  Tbl  20 cols 000100101111000011011011001111111101000001 has 126 unique lines.
 *     118 121 119 122 119     118   x   x   x               x   x 121 123   x     126   x     122         125 124 125 126   x   x   x   x 124   x 126 126   x 126 126 126  kill col  7  Tbl  19 cols 000100101111000011011011001111111111000001 has 118 unique lines.
 *     110 105 109 109 104           x   x   x               x   x 112 113   x     118   x     110         117 116 116 118   x   x   x   x 113   x 118 118   x 118 118 118  kill col  5  Tbl  18 cols 000100101111000011011011001111111111100001 has 104 unique lines.
 *      95  92  96  93               x   x   x               x   x  97  96   x     104   x      95         103 101 101 102   x   x   x   x  99   x 104 104   x 104 104 104  kill col  2  Tbl  17 cols 000100101111000011011011001111111111100101 has  92 unique lines.
 *      79      80  77               x   x   x               x   x  85  83   x      91   x      82          91  89  89  90   x   x   x   x  88   x  91  92   x  92  92  92  kill col  4  Tbl  16 cols 000100101111000011011011001111111111110101 has  77 unique lines.
 *      65      64                   x   x   x               x   x  69  67   x      75   x      69          76  73  75  75   x   x   x   x  73   x  76  77   x  77  76  77  kill col  3  Tbl  15 cols 000100101111000011011011001111111111111101 has  64 unique lines.
 *      47                           x   x   x               x   x  55  54   x      62   x      54          61  60  62  60   x   x   x   x  60   x  63  64   x  64  63  64  kill col  1  Tbl  14 cols 000100101111000011011011001111111111111111 has  47 unique lines.
 *                                   x   x   x               x   x  40  39   x      45   x      39          45  44  46  44   x   x   x   x  44   x  46  46   x  47  46  47  kill col 23  Tbl  13 cols 000100101111000011111011001111111111111111 has  39 unique lines.
 *                                   x   x   x               x   x  34  33   x      37   x                  35  35  38  36   x   x   x   x  36   x  38  38   x  38  38  38  kill col 17  Tbl  12 cols 000100101111000011111011101111111111111111 has  33 unique lines.
 *                                   x   x   x               x   x  29       x      31   x                  28  29  31  29   x   x   x   x  30   x  32  32   x  32  32  32  kill col 26  Tbl  11 cols 000100101111000111111011101111111111111111 has  28 unique lines.
 *                                   x   x   x               x   x  24       x      25   x                      24  25  24   x   x   x   x  25   x  27  27   x  26  25  27  kill col 29  Tbl  10 cols 000100101111100111111011101111111111111111 has  24 unique lines.
 *                                   x   x   x               x   x  19       x      19   x                      20  21       x   x   x   x  22   x  23  23   x  21  21  23  kill col 20  Tbl   9 cols 000100101111100111111111101111111111111111 has  19 unique lines.
 *                                   x   x   x               x   x  15       x           x                      15  16       x   x   x   x  17   x  18  18   x  17  16  18  kill col 27  Tbl   8 cols 000100101111101111111111101111111111111111 has  15 unique lines.
 *
 * Round 2: 111011010000010000000000010000000000000000  4 columns for indexes to table representing  8 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  000000000000101111110111100011100011111111 22 columns
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
    * 04 ADDI_0   StdIncPc 4 0 000001011011000011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   1 0 00000101x00xxxx000000100| AUIPC  q = imm20 (copy x/8)
    * 06 LB_3     LB_4     1 0 00001101101010x000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 0 00001011101011x000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     5 0 100111001011000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 0 00001011101000x010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     5 0 100111001011000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    4 3 10000101101011x010000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 0 00011101101001x000000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 0e SUB_0    SUB_1    3 0 00011101x01xxxx000010000| SUB    Subtraction
    * 0f _L0f     StdIncPc 4 0 000001011011100011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     1 0 00011111101000x010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 0 00011101101000x000011010|        RS1^0xffffffff to Q
    * 12 eFetch3  Fetch    6 4 xxxxxxxxxxxxxxxx11x1111x|  Fr00  Not in use
    * 13 condb_2  condb_3  1 0 00011111101000x000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  1 5 000001011011001000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 6 00011001101001x000010110|        Branch on condition
    * 16 condb_5  Fetch    7 7 110110110001101011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  7 3 110110111011000001110100|        Branch taken.
    * 18 BEQ      condb_2  4 0 100111011011100000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   6 0 100101011011000001000001| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 4 0 00000101101011x011100110|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    1 3 000001011001100000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 000101111001100010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 4 0 000001011011110011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 5 000101010011001011010100|        Q = 4
    * 1f IJ_2     IJ_3     4 0 100101011011100010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     8 2 100110101011000001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 0 00000101101000x011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 23 FENCEI   StdIncPc 3 0 00000101x01xxxx011100110| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   3 4 000111101001100000110101| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   1 0 00000101x00xxxx000000100| AUIPC  q = imm20 (copy x/8)
    * 26 OR_1     OR_2     6 0 10011101101000x000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 0 000000011011000000011101|        Q = rs2
    * 28 _L28     SH_1     5 2 100111001011000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 0 00011101101000x000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     5 2 100111001011000010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 5 000xxxx11011001000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 0 00011101x00xxxx000111110| SLL    Shift left
    * 2d MULH_0   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 2e EBRKWFI2 EBREAK_1 6 6 10001101101010x011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 4 0 000001011011100011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 8 000001011011101011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 0 00011111101000x000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    4 0 100001011011000010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  4 0 111001011001000010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    7 9 11011011100001x011011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   9 4 00010111101001x000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    a 4 000101111011010000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  4 6 101xxxx1101001x011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  4 0 100111011011100000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 3a SRxI_1   SRxI_2   9 a 00010101101001x100111101|        Register to shift to Q
    * 3b _L3b     JAL_1    1 3 000001011001100000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  4 0 100011011011100001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   FENCE    a a 00010101101001x100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   3 4 00011110100001x000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   3 4 00011110100001x000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 3 000110111011000001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 5 000000011011001000001011|        Q=1
    * 42 MULHU_2  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 43 MULHU_4  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 44 SLTI_0   SLTIX_1  1 0 00011111101010x000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 5 000101011011001001100101|        More check offset
    * 46 ILL_1    ILL_2    8 0 10111011101001x001000111|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    1 9 00010111101001x010001111|        Read until Q is offending instruction
    * 48 _L48     SW_1     b 3 000111011011000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 5 000000011011001001001011|        Construct PC storage adr
    * 4a _L4a     SW_1     b 3 000111011011000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  c 0 01110101100001x010110000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 0 00011101x01xxxx000110001| SLT    Set less than (signed)
    * 4d MULHSU_0 ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 4e eILL0b   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 5 000101011011001011100110|        Prep +4
    * 50 LW_1     StdIncPc 4 b 00010111101001x011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   9 0 111101011001100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 00010111101001x101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   9 0 111101011001100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     d a 00010101101001x111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 4 0 111101011011100000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 0 00010001101011x001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 0 00010001101000x010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 59 DIV_B    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 5a SB_1     SB_2     9 4 10010111101001x001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    1 3 000001011001100000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  4 0 100011011011100001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     a 4 100101111011010011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 00010111101001x101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   9 0 111101011001100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 DIV_14   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 61 DIV_15   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 62 DIV_8    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 63 DIV_9    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 64 SLTIU_0  SLTIX_1  1 0 00011111101010x000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 6 00000101x01xxxx011101111|        Prepare read PC
    * 66 SW_1     SW_2     5 0 01111101100001x011110010|        Write d to a+k until accepted
    * 67 SWE      SW_E2    4 0 111001011001100010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 69 DIV_13   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 6a MULH_1   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 6b SB_4     SB_5     b 0 01011001101001x001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 0 00011101x01xxxx000110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 6e LHU_3    ANDI_1   1 0 00001111101010x000011010|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   1 5 000xxxx11011001011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    d a 00010101101001x101101110|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 4 0 111101011011100000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 0 00001101101010x000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  4 0 11111001101001x001110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   3 c 00010111101001x011110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  3 0 00000101x00xxxx001110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 0 00000101101000x001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  4 5 101101011001001001111101|        origPC to mepc. Prep read 0
    * 78 DIV_4    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 79 DIV_5    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 7a SB_5     SW_2     5 0 01011001100001x011110010|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    1 3 000001011001100000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  4 0 100011011011100001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    e 0 11010011100001x000110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    4 0 101xxxx1101001x010010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  4 0 11110101100001x001111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0 000110101011000010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  4 0 10110101100001x001111101|        Store PC to mepc
    * 82 DIV_1    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 83 DIV_2    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 84 XORI_0   XORI_1   1 0 00011111101010x000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 00010111101001x111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    4 5 000110010001001000110100|        Return address to TRG
    * 87 JALRE1   JALRE2   4 0 10111001100001x001111111|  err   Store pc to mepc
    * 88 DIV_E    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 89 DIV_F    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 8a DIVU_5   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 8b LB_6     StdIncPc 4 5 000001011011001011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 0 00011111x01xxxx000101001| XOR    xor
    * 8d DIV_0    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 8e aF_SW_3  LDAF_3   e 0 110001010001000010010010|        Store 7 to mcause
    * 8f ILL_3    ILL_4    4 0 111101011011100010101001|        Store illegal instruction to mtval
    * 90 NMI_2    JAL_3    e 0 111010011011100000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   e 5 110001010001001010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    4 0 10110011100001x000110100|        PC to mepc
    * 93 SW_E2    SW_E3    4 0 10110111101001x010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    e 0 110100111001010000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 5 000101110011001010010100|        Q = 3
    * 96 SH_1     SH_2     9 4 10010111101001x010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    4 0 111001011001100010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  4 0 100111011011100000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 9a ECALL_6  JAL_3    e 0 110100110001000000110100|        mcause = 11
    * 9b ILL_5    JAL_3    e 5 110100111001001000110100|        Store 2 to mcause
    * 9c DIV_10   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 9d DIV_11   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * 9e SH_4     SH_5     b 0 00111001101001x010011111|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     5 0 00111001100001x011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    8 2 100110101011000001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  1 5 000101010011001011001110|        Q = 4
    * a2 MULHU_3  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * a3 MULHU_1  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * a4 SRxI_0   SRxI_1   3 4 000111101001100000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 5 000011011011001010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 3 000101111001100011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 0 000xxxx11011000000101110| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * a9 ILL_4    ILL_5    1 5 000101011011001010011011|        Q = 1
    * aa DIV_6    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ab EBREAK_2 ECALL_6  4 0 10110101101001x010011010|        pc to mepc
    * ac _Lac     SRx_1    3 0 00011101x00xxxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ae _Lae     SRx_1    3 0 00011101x00xxxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 5 000xxxx11011001011000101|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  1 5 000101010011001010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  Fetch    6 4 xxxxxxxxxxxxxxxx11x1111x|        Not in use
    * b2 CSRRW_4  Fetch    7 7 110110110001001011011110|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1 Fetch    6 4 xxxxxxxxxxxxxxxx11x1111x|        Not in use
    * b4 CSRRWI_2 Fetch    6 4 xxxxxxxxxxxxxxxx11x1111x|        Not in use
    * b5 SH_3     SH_4     3 0 000000011011100010011110|        Prepare get back address to use 
    * b6 CSRRCI_1 Fetch    6 4 xxxxxxxxxxxxxxxx11x1111x|        Not in use
    * b7 IJ_3     IJ_4     1 0 000110010011000010111101|        Construct Q = 3
    * b8 BGE      condb_2  4 0 100111011011100000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ba DIV_C    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * bb SH_2     SH_3     a 4 100101111011010010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  4 0 100011011011100001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    7 9 11011011100011x011011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 9 00010111101001x000011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 9 00010111101001x011000001|        Exit CSR, enter trap
    * c0 DIV_D    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * c1 IJT_2    IJT_3    4 0 100101011011100011101001|        Read word is to be masked with ~3u
    * c2 DIVU_3   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * c3 DIVU_4   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * c4 ORI_0    ORI_1    6 0 10011111101010x011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 0 00000001101010x001101111|        ~302
    * c6 IJT_4    ILL_2    8 0 10111011101011x001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   4 0 101xxxx1101001x011001011|        Store pc to mepc.
    * c8 DIV_7    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * c9 MRET_2   MRET_3   1 0 000011010011000010100101|        0xff+3 = 0x102
    * ca DIVU_2   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * cb QINT_2   StdIncPc e 0 111010011011100011100110|        mtval = 0.
    * cc OR_0     OR_1     3 0 00011111x01xxxx000100110| OR     or
    * cd REM_0    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ce ECALL_5  ECALL_6  1 5 000101010011001010011010|        Q = 8
    * cf MRET_7   MRET_8   3 6 00001101x01xxxx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 5 000001011011001000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   6 0 100011011011100011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     d a 00010101101001x100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 4 0 111101011011100000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   e 5 110001011001001010010010|        Store 5 to mcause
    * d5 eFetch2  Fetch    6 4 xxxxxxxxxxxxxxxx11x1111x|  Fr00  Not in use
    * d6 eILL0c   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  4 0 111101011011100010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  4 0 100111011011100000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * da LDAF_a   LDAF_2   3 0 00010101x01xxxx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 5 110001011001001010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  4 0 100011011011100001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  4 0 111101011011100011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   6 d 100001111011100011110100|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   6 c 100101111011100011110100|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * e1 ORI_1    ORI_2    1 0 00000001101001x000011101|        Q = RS1
    * e2 MUL_1    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * e3 MUL_3    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * e4 ANDI_0   ANDI_1   1 0 00011111101010x000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 5 000101010011001010001110|        Q = 4
    * e6 StdIncPc Fetch    7 7 110110110001001011011110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 4 0 111101011011100000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * e9 IJT_3    IJT_4    1 0 000110010011000011000110|        Construct Q = 3
    * ea MULHU_5  ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * eb LH_3     LH_4     1 0 00001111101010x001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 0 00011111x01xxxx000010001| AND    And 
    * ed REMU_0   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ee eILL0a   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    7 7 110110110001001011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    d a 00010101101001x101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 4 0 111101011011100000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 0 00000101x01xxxx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 0 000xxxx1x00xxxx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            5 e 111111111111000000000000|  Fr00  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 4 0 111101011011100011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 5 000000010011001011111010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 4 0 111001011011100010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  4 0 100111011011100000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   ILLe     3 0 000xxxx1x00xxxx011111110| Illegal instruction seen
    * fa WFI_2    WFI_3    1 5 000101011011001001000101|        Check offset
    * fb SB_3     SB_4     3 0 000000011011100001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  4 0 100011011011100001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 0 00000101x01xxxx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 0 00000101x01xxxx001000110| Illegal
    * ff QINT_0   QINT_1   3 0 00000101x01xxxx011000111| INT    Get current PC
    */
   localparam u0_0 = 256'hb8e6201000fea404ac86b05aa08bb05aac09a8070004b0e620e6b0bea5d2b001;
   localparam u0_1 = 256'hb8b732d4bce698a69832ace6b041b813b0741adea416b215a01400dea01aa08b;
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
   localparam u0_F = 256'h20c72046207eb849b86bb24500feb813b8ab32fab8dbf00000dd20e6b81ea572;
   localparam u1_0 = 256'h4005301d3001101d4385509c100b509c100b100d100540053005221b1117001a;
   localparam u1_1 = 256'h4095151540051217130540056095409d73db77db16191505101f6400101d101f;
   localparam u1_2 = 256'h4005668d3001301d3501529c101d529c1001609d1005341e300530014005829a;
   localparam u1_3 = 256'h341e341eaa15408d13059a153001409d46a1a417941779db40e54085101f4805;
   localparam u1_4 = 256'h151530013001301dc075b31d1501b31d191780bb1515101f300130011501031b;
   localparam u1_5 = 256'h90f51117a497408d13059497300130011011101140f5da1590f5111790f54b17;
   localparam u1_6 = 256'h1501100f3001301db05930013001300140e5507d3605101f3001300130013001;
   localparam u1_7 = 256'h40f540a1e0d3408d130550593001300145b5100530053c1740f9100d40f5da15;
   localparam u1_8 = 256'h40f5e0c53001301f450530013001300140b945191117101f3001300140b5001a;
   localparam u1_9 = 256'h5039b03930013001e5d3e0d33001409d40e594971517e0d340b740b3e5c5e0e9;
   localparam u1_A = 256'h1501301d3001301d40b530011515300110011317150d341e300130011515829a;
   localparam u1_B = 256'h1917191779db408da49730013001409d1019640030016400640077db64001515;
   localparam u1_C = 256'h360d15153001301fe0e93001100d300140a180bb1001609f3001300140953001;
   localparam u1_D = 256'h6c976d8740f5408d45c530153001409d40f530016400e5c540f5da15608d1505;
   localparam u1_E = 256'h77db30013001301f100f30011019300140f577db1515101f3001300110013001;
   localparam u1_F = 256'h300530053005408d300115153001409d40e5150140f55eff1001300540f5da15;
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
   assign d[29] = indir[23];
   // replaces = 000100101111000000001000001100010000000000
   SB_LUT4 #(.LUT_INIT(16'h00a0)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h7bef)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h000c)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1a82)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1800)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 111011010000010000000000010000000000000000
   SB_LUT4 #(.LUT_INIT(16'h3fa7)) cmb_d16(.O(d[16]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4710)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2400)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h280f)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0981)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0800)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
