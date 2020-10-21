/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 43 columns
 * Removed:  0000000000001000000000001000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 43
 * 161 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 160 161 161 161 161 161 161 161 161 161 161 161   x 161 161 161 161 160 161 161 160 161 161 160   x 161 161 161 161 159 158 160 161 160 161 160 160 160 161 161 160 161 160  kill col 12  Tbl  40 cols 0000000000001000000000001000001000000000000 has 158 unique lines.
 * 157 158 158 158 158 158 158 158 158 158 158 158   x 158 158 158 158 156 158 158 155 158 158 157   x 158 158 158 158 156     156 157 157 158 157 157 157 158 158 157 158 157  kill col 22  Tbl  39 cols 0000000000001000000010001000001000000000000 has 155 unique lines.
 * 154 155 155 155 155 155 155 155 155 155 155 155   x 155 155 155 155 154 155 155     155 155 154   x 155 155 155 155 153     153 154 154 155 154 153 153 155 155 154 155 153  kill col 13  Tbl  38 cols 0000000000001000000010001000011000000000000 has 153 unique lines.
 * 152 153 153 153 153 153 153 153 153 153 153 153   x 153 153 153 153 152 153 153     153 153 152   x 153 153 153 153         147 152 152 152 152 151 151 153 153 152 153 151  kill col 11  Tbl  37 cols 0000000000001000000010001000011100000000000 has 147 unique lines.
 * 146 147 147 147 147 147 147 147 147 147 147 147   x 147 147 147 147 146 147 147     147 147 145   x 147 147 147 147             146 146 146 146 145 145 146 147 146 147 145  kill col 19  Tbl  36 cols 0000000000001000000010011000011100000000000 has 145 unique lines.
 * 144 145 145 145 145 145 145 145 145 145 145 145   x 145 145 145 145 144 145 145     145 145       x 145 145 145 145             144 144 144 144 143 143 144 145 144 145 143  kill col  6  Tbl  35 cols 0000000000001000000010011000011100001000000 has 143 unique lines.
 * 142 143 143 143 143 143 143 143 142 143 143 143   x 143 143 143 143 142 143 143     143 143       x 143 143 143 143             142 142 142 142     141 141 143 141 143 141  kill col  5  Tbl  34 cols 0000000000001000000010011000011100001100000 has 141 unique lines.
 * 140 141 141 141 141 141 141 141 140 141 141 141   x 140 141 141 141 140 141 141     141 141       x 140 141 141 141             140 140 140 139         139 140 138 139 138  kill col  2  Tbl  33 cols 0000000000001000000010011000011100001100100 has 138 unique lines.
 * 137 138 138 138 138 138 138 138 137 138 138 138   x 137 138 138 138 136 138 138     138 138       x 137 136 138 138             137 137 137 134         134 134     136 133  kill col  0  Tbl  32 cols 0000000000001000000010011000011100001100101 has 133 unique lines.
 * 132 133 133 133 133 133 133 133 132 133 133 133   x 132 133 132 133 131 133 133     133 133       x 131 131 133 133             132 132 132 128         125 129     131      kill col  4  Tbl  31 cols 0000000000001000000010011000011100001110101 has 125 unique lines.
 * 124 125 125 125 125 125 125 125 123 125 125 125   x 124 124 123 125 122 124 124     125 125       x 122 123 125 125             124 124 124 117             118     119      kill col  7  Tbl  30 cols 0000000000001000000010011000011100011110101 has 117 unique lines.
 * 116 117 117 117 117 117 117 117 115 117 117 117   x 116 115 115 117 111 111 115     117 117       x 113 114 117 116             116 116 116                 105     105      kill col  3  Tbl  29 cols 0000000000001000000010011000011100011111101 has 105 unique lines.
 * 104 105 105 105 105 105 105 105 102 105 105 104   x 102 102 103 103  98  98 100     105 105       x  98  99 105 102             104 104 104                          85      kill col  1  Tbl  28 cols 0000000000001000000010011000011100011111111 has  85 unique lines.
 *  84  85  85  85  85  85  85  85  82  85  84  84   x  82  82  84  84  77  78  80      85  85       x  79  80  84  81              84  84  83                                  kill col 25  Tbl  27 cols 0000000000001000010010011000011100011111111 has  77 unique lines.
 *  76  77  77  77  77  77  77  77  74  77  76  76   x  74  75  75  76      69  68      77  77       x  70  71  75  72              76  76  75                                  kill col 23  Tbl  26 cols 0000000000001000010110011000011100011111111 has  68 unique lines.
 *  67  67  68  68  68  68  68  68  65  67  67  66   x  65  66  65  66      61          68  68       x  63  61  66  63              67  67  66                                  kill col 24  Tbl  25 cols 0000000000001000011110011000011100011111111 has  61 unique lines.
 *  60  60  61  60  61  60  61  61  58  60  60  59   x  58  60  58  59                  61  61       x  57  55  59  57              60  60  59                                  kill col 16  Tbl  24 cols 0000000000001000011110011010011100011111111 has  55 unique lines.
 *  54  54  55  54  55  54  55  55  52  54  54  53   x  52  53  52  53                  53  54       x  52      53  52              54  54  53                                  kill col 34  Tbl  23 cols 0000000010001000011110011010011100011111111 has  52 unique lines.
 *  51  51  52  51  52  51  52  52      51  51  50   x  50  50  49  50                  50  51       x  49      50  49              51  51  51                                  kill col 27  Tbl  22 cols 0000000010001001011110011010011100011111111 has  49 unique lines.
 *  48  48  49  47  49  48  49  49      48  48  47   x  47  47      45                  47  48       x  47      47  46              48  48  48                                  kill col 26  Tbl  21 cols 0000000010001001111110011010011100011111111 has  45 unique lines.
 *  44  44  45  43  45  44  45  45      44  44  43   x  43  43                          43  44       x  42      43  42              44  44  44                                  kill col 17  Tbl  20 cols 0000000010001001111110011110011100011111111 has  42 unique lines.
 *  40  41  41  40  42  41  41  42      41  41  40   x  38  39                          40  41       x          40  39              41  41  41                                  kill col 29  Tbl  19 cols 0000000010001101111110011110011100011111111 has  38 unique lines.
 *  36  37  37  33  38  37  37  38      37  37  36   x      36                          36  37       x          36  35              37  37  37                                  kill col 39  Tbl  18 cols 0001000010001101111110011110011100011111111 has  33 unique lines.
 *  31  32  30      33  32  32  33      32  32  31   x      29                          31  31       x          32  31              32  32  32                                  kill col 28  Tbl  17 cols 0001000010001111111110011110011100011111111 has  29 unique lines.
 *  27  28  25      28  28  27  29      28  28  26   x                                  27  26       x          28  28              28  28  28                                  kill col 40  Tbl  16 cols 0011000010001111111110011110011100011111111 has  25 unique lines.
 *  23  23          24  24  23  25      22  24  23   x                                  23  22       x          24  24              24  24  24                                  kill col 33  Tbl  15 cols 0011000011001111111110011110011100011111111 has  22 unique lines.
 *  21  20          21  21  20  22          21  20   x                                  20  19       x          21  21              21  21  21                                  kill col 20  Tbl  14 cols 0011000011001111111110111110011100011111111 has  19 unique lines.
 *  18  17          18  18  17  19          18  18   x                                  18           x          18  18              18  18  18                                  kill col 41  Tbl  13 cols 0111000011001111111110111110011100011111111 has  17 unique lines.
 *  16              16  16  15  17          16  16   x                                  16           x          16  16              16  16  16                                  kill col 36  Tbl  12 cols 0111001011001111111110111110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 14 
 *
 * Round 1: 1000110100110000000001000001100011100000000  4 columns for indexes to table representing 12 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 35
 * 157 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 157 157 157   x   x 156   x 157 157   x   x   x 157 157 157 157 156 157 157 156   x 157 154   x 157 157   x   x 155 154 155   x   x   x 156 156 156 157 157 156 157 156  kill col 19  Tbl  28 cols 1000110100111000000001011001100011100000000 has 154 unique lines.
 *   x 154 154 154   x   x 153   x 154 154   x   x   x 154 154 154 154 153 154 154 153   x 154       x 154 154   x   x 152 151 152   x   x   x 153 153 153 154 154 153 154 153  kill col 12  Tbl  27 cols 1000110100111000000001011001101011100000000 has 151 unique lines.
 *   x 151 151 151   x   x 150   x 151 151   x   x   x 151 151 151 151 149 151 151 148   x 151       x 151 151   x   x 149     148   x   x   x 150 150 150 151 151 150 151 150  kill col 22  Tbl  26 cols 1000110100111000000011011001101011100000000 has 148 unique lines.
 *   x 148 148 148   x   x 147   x 148 148   x   x   x 148 148 148 148 147 148 148       x 148       x 148 148   x   x 145     145   x   x   x 147 146 146 148 148 147 148 146  kill col 13  Tbl  25 cols 1000110100111000000011011001111011100000000 has 145 unique lines.
 *   x 145 145 145   x   x 144   x 145 145   x   x   x 145 145 145 145 144 145 145       x 145       x 145 145   x   x         138   x   x   x 144 143 143 145 145 144 145 143  kill col 11  Tbl  24 cols 1000110100111000000011011001111111100000000 has 138 unique lines.
 *   x 138 138 138   x   x 137   x 138 138   x   x   x 138 138 138 138 137 138 138       x 138       x 138 138   x   x               x   x   x 137 136 136 137 138 137 138 136  kill col  6  Tbl  23 cols 1000110100111000000011011001111111101000000 has 136 unique lines.
 *   x 136 136 136   x   x 135   x 135 136   x   x   x 136 136 136 136 135 136 136       x 136       x 135 136   x   x               x   x   x 135     134 134 136 134 136 134  kill col  5  Tbl  22 cols 1000110100111000000011011001111111101100000 has 134 unique lines.
 *   x 134 134 134   x   x 133   x 132 133   x   x   x 132 134 134 134 133 134 134       x 134       x 132 132   x   x               x   x   x 131         132 132 130 132 131  kill col  2  Tbl  21 cols 1000110100111000000011011001111111101100100 has 130 unique lines.
 *   x 130 130 130   x   x 129   x 128 128   x   x   x 128 130 130 130 126 128 129       x 129       x 126 125   x   x               x   x   x 125         126 125     128 125  kill col 16  Tbl  20 cols 1000110100111000000011011011111111101100100 has 125 unique lines.
 *   x 125 125 125   x   x 124   x 123 123   x   x   x 123 125 125 125 118 120 121       x 124       x 119       x   x               x   x   x 119         120 117     120 119  kill col  3  Tbl  19 cols 1000110100111000000011011011111111101101100 has 117 unique lines.
 *   x 117 117 117   x   x 116   x 115 114   x   x   x 115 117 117 117 109 112 113       x 116       x 111       x   x               x   x   x 104         108         106 109  kill col  7  Tbl  18 cols 1000110100111000000011011011111111111101100 has 104 unique lines.
 *   x 104 104 104   x   x 103   x 100 101   x   x   x 102 102 102 103  94  93  97       x 103       x  96       x   x               x   x   x              91          90  93  kill col  1  Tbl  17 cols 1000110100111000000011011011111111111101110 has  90 unique lines.
 *   x  90  90  90   x   x  89   x  86  87   x   x   x  88  88  87  88  79  78  81       x  88       x  81       x   x               x   x   x              72              74  kill col  4  Tbl  16 cols 1000110100111000000011011011111111111111110 has  72 unique lines.
 *   x  72  71  72   x   x  70   x  68  69   x   x   x  69  68  70  71  61  62  65       x  70       x  63       x   x               x   x   x                              57  kill col  0  Tbl  15 cols 1000110100111000000011011011111111111111111 has  57 unique lines.
 *   x  57  56  57   x   x  55   x  54  54   x   x   x  54  53  55  55  45  47  51       x  54       x  50       x   x               x   x   x                                  kill col 25  Tbl  14 cols 1000110100111000010011011011111111111111111 has  45 unique lines.
 *   x  45  44  45   x   x  43   x  42  42   x   x   x  43  43  43  43      39  39       x  42       x  39       x   x               x   x   x                                  kill col 24  Tbl  13 cols 1000110100111000011011011011111111111111111 has  39 unique lines.
 *   x  39  38  39   x   x  37   x  36  36   x   x   x  37  37  37  37          34       x  36       x  34       x   x               x   x   x                                  kill col 23  Tbl  12 cols 1000110100111000011111011011111111111111111 has  34 unique lines.
 *   x  33  33  33   x   x  31   x  31  31   x   x   x  32  32  30  30                   x  31       x  30       x   x               x   x   x                                  kill col 27  Tbl  11 cols 1000110100111001011111011011111111111111111 has  30 unique lines.
 *   x  29  29  28   x   x  27   x  27  27   x   x   x  27  27      25                   x  26       x  26       x   x               x   x   x                                  kill col 26  Tbl  10 cols 1000110100111001111111011011111111111111111 has  25 unique lines.
 *   x  24  24  23   x   x  22   x  22  22   x   x   x  22  23                           x  21       x  21       x   x               x   x   x                                  kill col 20  Tbl   9 cols 1000110100111001111111111011111111111111111 has  21 unique lines.
 *   x  20  19  20   x   x  18   x  18  18   x   x   x  18  19                           x           x  17       x   x               x   x   x                                  kill col 17  Tbl   8 cols 1000110100111001111111111111111111111111111 has  17 unique lines.
 *   x  16  14  16   x   x  15   x  14  14   x   x   x  14  15                           x           x           x   x               x   x   x                                  kill col 40  Tbl   7 cols 1010110100111001111111111111111111111111111 has  14 unique lines.
Possible good candidates for removal, columns : 29 33 34 
 *
 * Round 2: 0101001011000110000000000000000000000000000  4 columns for indexes to table representing  7 original columns (uses 14 of 16 lines in indirect table).
 * Direct:  0010000000000001111110110110011100011111111 22 columns
 * Can even chose 2 more columns to be represented directly.
 * Success. Use 2 EBRs, 17 LUTs.
 */

module m_2ebr
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
    * 02 IJ_0     IJ_1     2 2 000110111111000010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 0 00000101x10xxxx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 0 000001011101000011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 0 00000001x01xxxx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 0 00001101111010x000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 0 00001011111011x000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     4 0 000111001111000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 0 00001011111000x010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     4 0 000111001111000001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    5 0 00000101110011x010000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   0 0 00011101111001x000000100| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 0 00011101x10xxxx000010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 0 00011111111000x010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 0 00011101111000x000011010|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   6 3 110110110011001001110110|  Fr00u IncPC, OpFetch
    * 13 condb_2  condb_3  0 0 00011111111000x000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  0 4 000110011111001000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  0 5 00000001111001x000010110|        Branch on condition
    * 16 condb_5  StdIncPc 0 0 00000101x10xxxx011100110|        Branch not taken.
    * 17 condb_5t Fetch    6 0 110110111011000011011110|        Branch taken.
    * 18 BEQ      condb_2  5 0 000111011101100000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 0 000101011101000001000001| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 3 0 00000101110011x011100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    0 0 000000011011100000110010| JAL    J-imm is in q.
    * 1c ECAL_BRK ECAL_RET 0 2 000101111011100010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 0 000001011101110011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 0 4 000101010111001011010100|        Q = 4
    * 1f IJ_2     IJ_3     5 0 000101011101100010110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     5 2 100110101111000001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
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
    * 2b SLTIX_1  SLTIX_2  0 4 000xxxx11101001000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 0 00011101x0xxxxx000111110| SLL    Shift left
    * 2d _L0x2d   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 2e unx2e             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 3 0 000001011101100011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 7 000001011101101011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 0 00011111111000x000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    5 0 000001011101000010000110|        Target adr to yy
    * 33 unx33             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 33: Not in use 
    * 34 JAL_3    Fetch    6 0 11011011101001x011011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 6 00010111111001x000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 6 000101111111010000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  5 5 001xxxx1110001x011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 0 000111011101100000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   3 8 00010101111001x100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    0 0 000000011011100000110010| JAL    J-imm is in q.
    * 3c CSRRW_0  CSRRW_1  5 0 000011011101100001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 8 00010101111001x100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   0 6 0001111010x001x000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   0 6 0001111010x001x000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 9 100110111111000001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   0 4 000000011111001000001011|        Q=1
    * 42 _L0x42   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  0 0 00011111111010x000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 4 000101011111001001100101|        More check offset
    * 46 ILL_1    ILL_2    5 0 0011010110x001x001000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    5 0 01110101110001x010001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     9 9 100111011111000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 4 000000011111001001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     9 9 100111011111000001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  7 a 01110101101001x010110000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 0 00011101x10xxxx000110001| SLT    Set less than (signed)
    * 4d unx4d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 0 4 000101011111001011100110|        Prep +4
    * 50 LW_1     StdIncPc a b 00010111110001x011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   5 0 011101011011100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 00010111111001x101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   5 0 011101011011100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     b 8 00010101111001x111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 5 0 011101011101100000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 0 00010001111011x001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 0 00010001111000x010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     5 6 00010111111001x001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    0 0 000000011011100000110010| JAL    J-imm is in q.
    * 5c CSRRS_0  CSRRW_1  5 0 000011011101100001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     c 6 000101111111010011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 00010111111001x101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   5 0 011101011011100011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 4 5 00001101110010x011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 _L0x62   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  0 0 00011111111010x000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    0 5 00000101x10xxxx011101111|        Prepare read PC
    * 66 SW_1     SW_2     7 0 01111101101001x011110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    5 0 0110010110x1100010010011|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 69 unx69             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     9 0 11011001111001x001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 0 00011101x10xxxx000110001| SLTU   Set less than (unsigned)
    * 6d unx6d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   0 4 000xxxx11111001011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    b 8 00010101111001x110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 5 0 011101011101100000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 0 00001101111010x000011010|        Invert q. Prepare read mask
    * 73 unx73             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 73: Not in use 
    * 74 unx74             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 74: Not in use 
    * 75 unx75             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 75: Not in use 
    * 76 Fetchu   Fetch2   0 c 000001111101100011110100|  Fr00u Read and latch instruction
    * 77 eFetchu  Fetch2   1 d 000101111101100011110100|  Fr00u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 _L0x78   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     7 0 01011001101001x011110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    0 0 000000011011100000110010| JAL    J-imm is in q.
    * 7c CSRRC_0  CSRRW_1  5 0 000011011101100001001001| CSRRC  Decoded CSR adr in yy
    * 7d unx7d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 7d: Not in use 
    * 7e NMI_1    NMI_2    5 0 001xxxx1110001x010010000|        Store pc to mepc.
    * 7f unx7f             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 100110101111000010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 _L0x82   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   0 0 00011111111010x000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 00010111111001x111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    3 3 0001100100x1001000110100|        Return address to TRG
    * 87 unx87             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 _L0x88   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 89 unx89             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 3 4 000001011101001011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 0 00011111x10xxxx000101001| XOR    xor
    * 8d unx8d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 4 000101011111001010101001|        Q = 1
    * 90 NMI_2    JAL_3    d a 011010011101100000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   d e 0100010100x1001010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    5 0 0011001110x001x000110100|        PC to mepc
    * 93 SW_E2    SW_E3    5 0 00110111110001x010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    d a 0101001110x1010000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    0 4 000101110111001010010100|        Q = 3
    * 96 SH_1     SH_2     5 6 00010111111001x010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    5 0 0110010110x1100010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 0 000111011101100000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    d a 0101001100x1000000110100|        mcause = 11
    * 9b unx9b             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 9b: Not in use 
    * 9c _L0x9c   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * 9d unx9d             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e SH_4     SH_5     9 0 10111001111001x010011111|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     7 0 00111001101001x011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    5 2 100110101111000001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  0 4 000101010111001010110110|        Q = 4
    * a2 _L0xa2   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   0 6 0001111010x1100000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 4 000011011111001010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  0 9 000101111011100011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 0 000xxxx11111000001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    d e 0101001110x1001000110100|        Store 2 to mcause
    * aa _L0xaa   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  5 0 00110101110001x010011010|        pc to mepc
    * ac _L0xac   SRx_1    0 0 00011101x0xxxxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad unxad             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    0 0 00011101x0xxxxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 4 000xxxx11111001011000101|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  0 4 000101010111001010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 aF_SW_3  LDAF_3   d a 0100010100x1000010010010|        Store 7 to mcause
    * b2 CSRRW_4  Fetch    6 4 110110110011001011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 ic0reser          7 6 xxxxxxxxxxxxxxxxxxxxxxxx|  Fr00  Not really used, reserved to allow LASTINCH
    * b5 SH_3     SH_4     0 0 000000011101100010011110|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  0 4 000101010111001010011010|        Q = 8
    * b7 IJ_3     IJ_4     0 4 000110011111001010111101|        Construct Q = 1
    * b8 BGE      condb_2  5 0 000111011101100000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   0 0 00001111111010x000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     c 6 000101111111010010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 0 000011011101100001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    6 0 11011011101011x011011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 0 00010111111001x000011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 0 00010111111001x011000001|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    5 0 000101011101100011101001|        Read word is to be masked with ~1u
    * c2 _L0xc2   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    4 0 00011111110010x011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 0 00000001111010x001101111|        ~302
    * c6 IJT_4    ILL_2    5 0 00110101111011x001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   5 0 001xxxx1110001x011001011|        Store pc to mepc.
    * c8 _L0xc8   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   0 0 000011010111000010100101|        0xff+3 = 0x102
    * ca _L0xca   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc d a 011010011101100011100110|        mtval = 0.
    * cc OR_0     OR_1     0 0 00011111x10xxxx000100110| OR     or
    * cd unxcd             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * cf MRET_7   MRET_8   0 5 00001101x10xxxx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 4 000001011111001000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 0 000011011101100011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     b 8 00010101111001x100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 5 0 011101011101100000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   d e 0100010110x1001010010010|        Store 5 to mcause
    * d5 unalignd straddle 0 0 000001011101100000010010|  Fr00u Unaligned pc, prep read high hword
    * d6 eILL0c   ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  5 0 011101011101100010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 0 000111011101100000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   0 0 00010101x10xxxx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 4 0100010110x1001010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 0 000011011101100001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  5 0 011101011101100011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 c 000001111101100011110100|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   6 d 000101111101100011110100|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    0 0 00000001111001x000011101|        Q = RS1
    * e2 _L0xe2   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   0 0 00011111111010x000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  0 4 000101010111001010110001|        Q = 4
    * e6 StdIncPc Fetch    6 3 110110110011001011011110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 5 0 011101011101100000011110|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    0 4 000110011111001011000110|        Construct Q = 1
    * ea _L0xea   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * eb LH_3     LH_4     0 0 00001111111010x001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 0 00011111x10xxxx000010001| AND    And 
    * ed unxed             7 6 xxxxxxxxxxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     0 0 000xxxx1x0xxxxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    6 4 110110110011001011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    b 8 00010101111001x101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 5 0 011101011101100000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 0 00000101x10xxxx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 0 000xxxx1x01xxxx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd 4 0 011111111111000011010101|  Fr00  Upd ttime, I. Q=imm Use dinx unless unaligned 
    * f5 jFault   jFault_1 5 0 011101011101100011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    0 4 000000010111001011111010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 5 0 011001011101100010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 0 000111011101100000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     0 0 000xxxx1x0xxxxx011111110|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    0 4 000101011111001001000101|        Check offset
    * fb SB_3     SB_4     0 0 000000011101100001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 0 000011011101100001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 0 00000101x10xxxx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    0 0 00000101x0xxxxx001000110| Illegal
    * ff QINT_0   QINT_1   0 0 00000101x10xxxx011000111| INT    Get current PC
    */
   localparam u0_0 = 256'hd8e64010d8e6e404cc86f05ae08bf05aec09e8072004d0e640e6f0bee5d2f001;
   localparam u0_1 = 256'hd8b772d4dce6b8a6b832cce6d041d813b0de40e6e416f215e0143276e01ae08b;
   localparam u0_2 = 256'hd8e60000d8e6003ed230f096e021f096f01dc0272004983540e600fec0e6f052;
   localparam u0_3 = 256'h843a8435e503d849b832e53d00fed813c4d7f403e436a4de0000d086e02bdae6;
   localparam u0_4 = 256'hf2e600fe00004031a4b0f066f24bf066c48f8447f265e82b00fe00fef20bf050;
   localparam u0_5 = 256'hb8dae570f4fbd849b832e45d00fe00fee08bec57d81ee5ebb8dae554b8dac4e6;
   localparam u0_6 = 256'hf2cf000000004031e47a00fe000000fe9893a4f240efe82b00fe00fec8f700fe;
   localparam u0_7 = 256'h0000c4900000d849b832a4f200fe00fed8f4d8f4000000000000e81ad81ee5ba;
   localparam u0_8 = 256'hf2a900fe00004029d2e600fe000000fe00001234e5f0e82100fe00fe0000f085;
   localparam u0_9 = 256'ha4f2e49f000000fe0000103400fed8139893e4bb72949434c49584341292d834;
   localparam u0_A = 256'hf2c5003f0000003fc49a00fe923400fef061b8d0f2af983a00fe00fe72b6f05e;
   localparam u0_B = 256'he4c1e41facded849f4b5e81a00fed813f2bd729ad89e0000000032de109272b2;
   localparam u0_C = 256'h404f00fe00004026d8e600fe70a500fec4cbec47e86fc8e100fe00fed8e900fe;
   localparam u0_D = 256'hd8f4d8f4d8e5d8499292409100fed813d8a100fed8129292d81ee506d8c9f237;
   localparam u0_E = 256'h32de00fe00004011e85600fef2c600fed81e32de72b1e81a00fe00fee41d00fe;
   localparam u0_F = 256'h40c70046407ed849d86bf24500fed813d8ab72fad8dbf0d520dd40e6d81ee572;
   localparam u1_0 = 256'h3005001d3005001d5005401c000b401c000b000d000130050005221b1117009a;
   localparam u1_1 = 256'h5015041530050217000130054015501d60db000505010419001f63db001d001f;
   localparam u1_2 = 256'h300576003005001d0401421c001d421c0001401d0001061e000500013005529a;
   localparam u1_3 = 256'h061e061e8815500d000138150001501d55218617361760db76005005001f3705;
   localparam u1_4 = 256'h041500017600001d7a75999d0401999d507550350415001f000100010401099b;
   localparam u1_5 = 256'h50751117c617500d0001561700010001001100115075b815507511175075ab17;
   localparam u1_6 = 256'h040176007600001d90d90001760000015065707d0505001f00010001450d0001;
   localparam u1_7 = 256'h760050217600500d00017059000100011d170c07760076007600000d5075b815;
   localparam u1_8 = 256'h041500017600001f3405000176000001760033191117001f000100017600009a;
   localparam u1_9 = 256'h703990b9760000017600da530001501d506556170417da5350375033de45da69;
   localparam u1_A = 256'h0401001d7600001d50350001de53000100010917040d061e000100010415529a;
   localparam u1_B = 256'h1017101760db500dc617000f0001501d0419041500017600760064dbda450415;
   localparam u1_C = 256'h050d00017600001fda690001000d0001502150350001401f0001000150150001;
   localparam u1_D = 256'h6d174c075075500d544500150001501d507500010005de455075b815400d0405;
   localparam u1_E = 256'h64db00017600001f000f000104190001507563db0415001f0001000100010001;
   localparam u1_F = 256'h000500050005500d000104150001501d506504015075407f000100055075b815;
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
   // replaces = 1000110100110000000001000001100010000000000
   SB_LUT4 #(.LUT_INIT(16'h4018)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h7ebf)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0204)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4400)) cmb_d37(.O(d[37]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2800)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d42(.O(d[42]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0101001011000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h3528)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h3070)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0442)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1900)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0a07)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;        bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));assign d[30] = d[18];
endmodule
