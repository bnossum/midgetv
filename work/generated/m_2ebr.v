/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 46 columns
 * Removed:  0000000000000001000000000001000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 202 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 201 202 201 202 202 202 202 202 202 202 202 202 202 202 202   x 202 202 202 202 201 202 201 201 202 202 202   x 202 202 202 202 201 199 200 202 201 202 201 201 201 202 202 201 201 201  kill col 12  Tbl  43 cols 0000000000000001000000000001000001000000000000 has 199 unique lines.
 * 198 199 198 198 199 199 199 199 199 199 199 199 199 199 199   x 199 199 199 199 197 199 198 196 199 199 199   x 199 199 199 199 197     197 199 198 199 198 198 198 199 199 198 198 198  kill col 22  Tbl  42 cols 0000000000000001000000010001000001000000000000 has 196 unique lines.
 * 195 196 195 195 196 196 196 196 196 196 196 196 196 196 196   x 196 196 196 196 195 195 195     196 196 196   x 196 196 196 196 194     194 196 195 196 195 194 194 196 196 195 195 194  kill col 13  Tbl  41 cols 0000000000000001000000010001000011000000000000 has 194 unique lines.
 * 193 194 193 193 194 194 194 194 194 194 194 194 194 194 194   x 194 194 194 194 193 193 193     194 194 194   x 194 194 194 194         191 194 193 193 193 192 192 193 194 193 193 192  kill col 11  Tbl  40 cols 0000000000000001000000010001000011100000000000 has 191 unique lines.
 * 190 191 190 187 191 191 191 191 191 191 191 191 191 191 191   x 191 191 191 191 190 190 190     191 191 191   x 191 191 191 191             191 190 190 190 189 189 189 191 190 190 189  kill col 42  Tbl  39 cols 0001000000000001000000010001000011100000000000 has 187 unique lines.
 * 186 187 186     187 187 187 187 187 187 187 187 187 187 187   x 187 187 187 187 186 186 186     187 187 186   x 187 187 187 187             187 186 186 186 185 185 185 187 186 186 185  kill col  6  Tbl  38 cols 0001000000000001000000010001000011100001000000 has 185 unique lines.
 * 184 185 184     185 185 185 185 185 185 185 184 185 185 185   x 185 185 185 185 184 184 184     185 185 184   x 185 185 185 185             185 184 184 184     183 183 185 183 184 183  kill col  5  Tbl  37 cols 0001000000000001000000010001000011100001100000 has 183 unique lines.
 * 182 183 182     183 183 183 183 183 183 183 182 183 183 183   x 182 183 183 183 182 182 182     183 183 182   x 183 183 183 183             183 182 182 178         181 182 180 180 180  kill col  7  Tbl  36 cols 0001000000000001000000010001000011100011100000 has 178 unique lines.
 * 177 178 177     178 178 178 178 178 178 178 177 178 178 178   x 177 177 178 178 177 174 177     178 178 177   x 177 178 178 178             178 177 177             176 173 173 174 175  kill col  3  Tbl  35 cols 0001000000000001000000010001000011100011101000 has 173 unique lines.
 * 172 173 172     173 173 173 173 173 173 173 171 173 173 173   x 172 171 173 173 171 168 172     172 173 172   x 172 173 173 172             173 172 172             168     165 165 168  kill col  2  Tbl  34 cols 0001000000000001000000010001000011100011101100 has 165 unique lines.
 * 164 164 163     165 165 165 165 165 165 165 163 165 165 164   x 164 163 164 164 159 158 161     163 165 163   x 164 164 165 163             165 164 164             156         150 156  kill col  1  Tbl  33 cols 0001000000000001000000010001000011100011101110 has 150 unique lines.
 * 149 149 145     150 150 150 150 150 150 150 148 149 150 149   x 149 148 148 149 143 142 145     147 150 146   x 147 149 149 148             150 149 148             137             135  kill col  0  Tbl  32 cols 0001000000000001000000010001000011100011101111 has 135 unique lines.
 * 134 134 130     135 135 135 135 135 135 135 133 134 135 134   x 133 133 134 133 126 126 130     132 135 130   x 131 132 134 131             135 134 132             118                  kill col  4  Tbl  31 cols 0001000000000001000000010001000011100011111111 has 118 unique lines.
 * 117 117 111     118 118 118 118 118 118 118 114 117 117 117   x 115 115 117 116 109 108 110     112 118 113   x 113 115 117 113             118 117 113                                  kill col 24  Tbl  30 cols 0001000000000001000001010001000011100011111111 has 108 unique lines.
 * 107 106 102     108 108 108 108 107 108 108 104 107 107 107   x 105 106 107 106  99     100     102 108 103   x 103 102 106 103             108 107 102                                  kill col 25  Tbl  29 cols 0001000000000001000011010001000011100011111111 has  99 unique lines.
 *  98  97  93      99  99  99  99  98  99  99  95  98  98  98   x  96  98  97  97          88      93  99  94   x  94  92  97  94              99  98  93                                  kill col 23  Tbl  28 cols 0001000000000001000011110001000011100011111111 has  88 unique lines.
 *  87  86  82      87  88  88  88  87  88  88  84  87  87  86   x  85  87  85  86                  82  88  83   x  83  81  86  84              87  86  82                                  kill col 16  Tbl  27 cols 0001000000000001000011110001010011100011111111 has  81 unique lines.
 *  80  79  75      80  80  81  81  80  81  81  77  80  80  79   x  78  79  78  78                  74  80  74   x  76      79  77              80  79  75                                  kill col 21  Tbl  26 cols 0001000000000001000011111001010011100011111111 has  74 unique lines.
 *  73  72  68      73  73  74  74  73  74  74  70  73  73  72   x  72  72  71  71                      72  67   x  69      72  70              73  72  69                                  kill col 19  Tbl  25 cols 0001000000000001000011111011010011100011111111 has  67 unique lines.
 *  66  65  61      66  66  66  67  66  67  67  63  66  66  65   x  65  65  64  64                      65       x  62      65  64              66  65  63                                  kill col 43  Tbl  24 cols 0011000000000001000011111011010011100011111111 has  61 unique lines.
 *  60  58          60  60  60  61  60  61  61  57  60  60  59   x  59  59  58  58                      59       x  56      59  58              59  59  58                                  kill col 17  Tbl  23 cols 0011000000000001000011111011110011100011111111 has  56 unique lines.
 *  54  54          55  53  55  56  55  55  56  52  55  55  54   x  52  54  54  53                      54       x          54  53              54  54  53                                  kill col 34  Tbl  22 cols 0011000000010001000011111011110011100011111111 has  52 unique lines.
 *  50  50          51  49  51  52  51  51  52      51  51  50   x  49  50  50  49                      50       x          50  49              50  50  50                                  kill col 40  Tbl  21 cols 0011010000010001000011111011110011100011111111 has  49 unique lines.
 *  47  47          48      48  49  48  48  49      48  48  47   x  46  46  47  46                      47       x          47  46              47  47  47                                  kill col 29  Tbl  20 cols 0011010000010001100011111011110011100011111111 has  46 unique lines.
 *  44  44          45      40  46  45  45  46      44  45  44   x      41  42  42                      44       x          44  43              44  44  44                                  kill col 39  Tbl  19 cols 0011011000010001100011111011110011100011111111 has  40 unique lines.
 *  38  38          37          40  39  39  40      38  39  38   x      34  35  36                      38       x          39  38              38  38  38                                  kill col 28  Tbl  18 cols 0011011000010001110011111011110011100011111111 has  34 unique lines.
 *  32  32          31          33  33  32  34      31  33  32   x          30  30                      32       x          33  32              32  32  33                                  kill col 27  Tbl  17 cols 0011011000010001111011111011110011100011111111 has  30 unique lines.
 *  28  28          27          29  29  28  30      27  29  28   x              26                      28       x          29  28              28  28  29                                  kill col 26  Tbl  16 cols 0011011000010001111111111011110011100011111111 has  26 unique lines.
 *  24  24          24          25  25  24  26      23  25  24   x                                      24       x          25  25              24  24  25                                  kill col 33  Tbl  15 cols 0011011000011001111111111011110011100011111111 has  23 unique lines.
 *  22  21          21          22  22  21  22          22  21   x                                      21       x          22  22              21  21  22                                  kill col 44  Tbl  14 cols 0111011000011001111111111011110011100011111111 has  21 unique lines.
 *  20              19          20  20  19  20          20  19   x                                      19       x          20  20              19  19  20                                  kill col 41  Tbl  13 cols 0111111000011001111111111011110011100011111111 has  19 unique lines.
 *  18                          18  18  17  18          18  17   x                                      17       x          18  18              17  17  18                                  kill col 36  Tbl  12 cols 0111111001011001111111111011110011100011111111 has  17 unique lines.
 *  16                          16  15      16          16  15   x                                      15       x          16  16              15  15  16                                  kill col 37  Tbl  11 cols 0111111011011001111111111011110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 9 10 14 20 31 
 *
 * Round 1: 1000000100100110000000000100001100011100000000  4 columns for indexes to table representing 11 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 39
 * 200 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 200 197 200 200 200 200   x 200 200   x 200 200   x   x   x 200 200 200 200 199 200 199 199 200   x 198   x 200 200   x   x 199 197 198   x   x   x 199 199 199 200 200 199 199 199  kill col 43  Tbl  32 cols 1010000100100111000000000101001100011100000000 has 197 unique lines.
 *   x 197     197 197 197 197   x 197 197   x 197 197   x   x   x 197 197 197 197 196 197 196 196 197   x 194   x 197 197   x   x 196 194 195   x   x   x 196 196 196 197 197 196 196 196  kill col 19  Tbl  31 cols 1010000100100111000000000111001100011100000000 has 194 unique lines.
 *   x 194     194 194 194 194   x 194 194   x 194 194   x   x   x 194 194 194 194 193 194 193 193 194   x       x 194 194   x   x 193 191 192   x   x   x 193 193 193 194 194 193 193 193  kill col 12  Tbl  30 cols 1010000100100111000000000111001101011100000000 has 191 unique lines.
 *   x 191     190 191 191 191   x 191 191   x 191 191   x   x   x 191 191 191 191 189 191 190 188 191   x       x 191 191   x   x 189     189   x   x   x 190 190 190 191 191 190 190 190  kill col 22  Tbl  29 cols 1010000100100111000000010111001101011100000000 has 188 unique lines.
 *   x 188     187 188 188 188   x 188 188   x 188 188   x   x   x 188 188 188 188 187 187 187     188   x       x 188 188   x   x 185     186   x   x   x 187 186 186 188 188 187 187 186  kill col 13  Tbl  28 cols 1010000100100111000000010111001111011100000000 has 185 unique lines.
 *   x 185     184 185 185 185   x 185 185   x 185 185   x   x   x 185 185 185 185 184 184 184     185   x       x 185 185   x   x         182   x   x   x 184 183 183 184 185 184 184 183  kill col 11  Tbl  27 cols 1010000100100111000000010111001111111100000000 has 182 unique lines.
 *   x 182     177 182 182 182   x 182 182   x 182 182   x   x   x 182 182 182 182 181 181 181     182   x       x 182 180   x   x               x   x   x 181 179 180 180 182 181 180 180  kill col 42  Tbl  26 cols 1011000100100111000000010111001111111100000000 has 177 unique lines.
 *   x 177         177 177 177   x 177 177   x 177 177   x   x   x 177 177 177 177 176 176 176     177   x       x 177 175   x   x               x   x   x 176 174 173 175 177 175 175 174  kill col  5  Tbl  25 cols 1011000100100111000000010111001111111100100000 has 173 unique lines.
 *   x 173         173 173 173   x 173 173   x 173 173   x   x   x 173 173 173 173 172 171 170     173   x       x 173 169   x   x               x   x   x 166 170     170 171 169 168 169  kill col  7  Tbl  24 cols 1011000100100111000000010111001111111110100000 has 166 unique lines.
 *   x 166         166 166 166   x 166 166   x 166 165   x   x   x 166 165 166 166 164 158 164     166   x       x 165 161   x   x               x   x   x     163     162 158 160 159 162  kill col 24  Tbl  23 cols 1011000100100111000001010111001111111110100000 has 158 unique lines.
 *   x 158         158 158 158   x 158 158   x 158 157   x   x   x 158 156 158 158 154     154     158   x       x 157 151   x   x               x   x   x     154     152 149 150 151 154  kill col  3  Tbl  22 cols 1011000100100111000001010111001111111110101000 has 149 unique lines.
 *   x 148         149 149 149   x 149 149   x 149 148   x   x   x 149 145 149 149 143     145     146   x       x 148 139   x   x               x   x   x     143     141     139 136 143  kill col  1  Tbl  21 cols 1011000100100111000001010111001111111110101010 has 136 unique lines.
 *   x 134         136 135 136   x 136 136   x 136 135   x   x   x 136 132 136 135 128     130     132   x       x 134 125   x   x               x   x   x     125     127     125     123  kill col  0  Tbl  20 cols 1011000100100111000001010111001111111110101011 has 123 unique lines.
 *   x 121         123 122 123   x 123 122   x 122 120   x   x   x 123 120 122 120 111     116     119   x       x 120 111   x   x               x   x   x     109     110     107          kill col  2  Tbl  19 cols 1011000100100111000001010111001111111110101111 has 107 unique lines.
 *   x 104         107 105 107   x 107 106   x 104 103   x   x   x 105 104 106 105  94      97     103   x       x  99  96   x   x               x   x   x      83      87                  kill col  6  Tbl  18 cols 1011000100100111000001010111001111111111101111 has  83 unique lines.
 *   x  79          83  81  83   x  82  82   x  81  79   x   x   x  81  80  82  80  73      76      78   x       x  76  72   x   x               x   x   x              64                  kill col  4  Tbl  17 cols 1011000100100111000001010111001111111111111111 has  64 unique lines.
 *   x  61          64  63  64   x  63  63   x  61  61   x   x   x  61  62  63  60  57      58      59   x       x  56  55   x   x               x   x   x                                  kill col 16  Tbl  16 cols 1011000100100111000001010111011111111111111111 has  55 unique lines.
 *   x  51          55  54  55   x  54  54   x  52  53   x   x   x  52  52  53  50  48      49      51   x       x  46       x   x               x   x   x                                  kill col 17  Tbl  15 cols 1011000100100111000001010111111111111111111111 has  46 unique lines.
 *   x  43          46  44  46   x  45  45   x  43  44   x   x   x  42  43  44  42  40      41      43   x       x           x   x               x   x   x                                  kill col 25  Tbl  14 cols 1011000100100111000011010111111111111111111111 has  40 unique lines.
 *   x  37          40  37  40   x  39  39   x  37  37   x   x   x  35  38  38  35          34      36   x       x           x   x               x   x   x                                  kill col 23  Tbl  13 cols 1011000100100111000011110111111111111111111111 has  34 unique lines.
 *   x  32          33  31  33   x  33  33   x  31  31   x   x   x  30  31  30  28                  30   x       x           x   x               x   x   x                                  kill col 26  Tbl  12 cols 1011000100100111000111110111111111111111111111 has  28 unique lines.
 *   x  26          27  26  26   x  27  27   x  25  25   x   x   x  23  24  24                      23   x       x           x   x               x   x   x                                  kill col 29  Tbl  11 cols 1011000100100111100111110111111111111111111111 has  23 unique lines.
 *   x  21          22  21  20   x  22  22   x  21  20   x   x   x      19  20                      19   x       x           x   x               x   x   x                                  kill col 28  Tbl  10 cols 1011000100100111110111110111111111111111111111 has  19 unique lines.
 *   x  17          18  17  14   x  18  17   x  17  17   x   x   x          17                      16   x       x           x   x               x   x   x                                  kill col 39  Tbl   9 cols 1011001100100111110111110111111111111111111111 has  14 unique lines.
Possible good candidates for removal, columns : 21 
 *
 * Round 2: 0100110011011000001000001000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 14 of 16 lines in indirect table).
 * Direct:  0011001000000000110111110010110011100011111111 24 columns
 * Success. Use 2 EBRs, 20 LUTs.
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
    * 0b JALR_2   JAL_2    3 3 000110001011001110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   3 3 001000111011100100000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    3 3 1010001110x10xxx11100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    3 3 0010001110x10xxx00010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 3 000010001011011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     3 3 001000111111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   3 3 001000111011100000011010|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   4 4 110100110100110001110110|  Fr00u IncPC, OpFetch
    * 13 condb_2  condb_3  3 3 001000111111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  3 5 011000110011110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  3 6 001000000011100100010110|        Branch on condition
    * 16 condb_5  StdIncPc 3 3 0010000010x10xxx11100110|        Branch not taken.
    * 17 condb_5t Fetch    4 3 010100110110110011011110|        Branch taken.
    * 18 BEQ      condb_2  3 3 000110111011011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   3 3 010100101011010001000001| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 3 3 000010001011001111100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 3 001000000010111000110010| JAL    J-imm is in q.
    * 1c ECAL_BRK ECAL_RET 3 2 001000101110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 000010001011011111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 5 111000101001110011010100|        Q = 4
    * 1f IJ_2     IJ_3     3 3 000110101011011010110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     0 7 010110110111110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 000010001011000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  3 8 001000101011110000111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 3 3 0010000010x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   5 0 001000111110x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   3 3 0010000000x01xxx00000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     3 3 000100111011000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    3 3 011000000011110000011101|        Q = rs2
    * 28 _L0x28   SH_1     3 7 010100111011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   3 3 001000111011100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     3 7 010100111011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 5 011000xxxx11010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 3 0010001110x0xxxx00111110| SLL    Shift left
    * 2d MULH_0   MULH_1   5 3 001000101011100101101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  3 3 100100111111011001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 3 3 000010001011011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 9 000010001011011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  3 3 001000111111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    3 3 010110001011010010000110|        Target adr to yy
    * 33 JAERR_1           5 0 00xxxxxxxxxxxxxxxxxxxxxx|        Not in use
    * 34 JAL_3    Fetch    4 3 000100110110100111011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   5 3 000010101111100100110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   6 3 000010101111110100000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  3 6 000111xxxx11000111010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  3 3 000110111011011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 100010001011000111100110|        Last shift.
    * 3a SRxI_1   SRxI_2   5 8 000010101011100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 3 001000000010111000110010| JAL    J-imm is in q.
    * 3c CSRRW_0  CSRRW_1  3 3 000110011011011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   6 8 000010101011100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   5 0 001000111110x00100110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   5 0 001000111110x00100111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 a 011000110111110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   3 5 011000000011110000001011|        Q=1
    * 42 MULHU_2  MULHU_3  5 8 001000101011110001100000|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  3 3 001000000010100011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  3 3 001000111111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    3 5 011000101011110001100101|        More check offset
    * 46 ILL_1    ILL_2    3 3 000111101010x00101000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    7 3 000111101011000110001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     8 a 011000111011110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  3 5 011000000011110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     8 a 011000111011110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  9 3 000001101010100110110000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 3 0010001110x10xxx00110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  5 3 000110111011000100101110| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 3 5 011000101011110011100110|        Prep +4
    * 50 LW_1     StdIncPc 1 b 000010101111000111100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   7 3 000111101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 001000101111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   7 3 000111101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     6 8 001000101011100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 7 3 000111101011011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     3 3 001000100011101101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     3 3 001000100011100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    3 8 111000101111100101101110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   3 3 000110111111011010011100|        REM = Q to yy
    * 5a SB_1     SB_2     5 3 000110101111100101011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 3 001000000010111000110010| JAL    J-imm is in q.
    * 5c CSRRS_0  CSRRW_1  3 3 000110011011011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     6 3 000110101111110111111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 001000101111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   7 3 000111101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  3 3 101000111111100101000010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 3 6 000100011011001011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 DIV_8    DIV_7    5 5 011000101111110011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    a 5 011000101111110001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  3 3 001000111111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 6 0010000010x10xxx11101111|        Prepare read PC
    * 66 SW_1     SW_2     7 3 000001111010100111110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    7 3 000111001010x11010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 000010001011000111100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     3 3 001000101011100010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   3 3 000110101011000011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     b 3 001000110011100101111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 3 0010001110x10xxx00110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  5 3 000110111011000100101110| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    3 3 000110111010100110111001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   3 5 011000xxxx11110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    6 8 001000101011100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 7 3 000111101011011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   3 3 001000011011101000011010|        Invert q. Prepare read mask
    * 73 BAERR_1           5 0 00xxxxxxxxxxxxxxxxxxxxxx|       not used
    * 74 oleduck           5 0 00xxxxxxxxxxxxxxxxxxxxxx|  why oleduck
    * 75 doleduck          5 0 00xxxxxxxxxxxxxxxxxxxxxx|  why doleduck
    * 76 Fetchu   Fetch2   3 c 001000001111011011110100|  Fr00u Read and latch instruction
    * 77 eFetchu  Fetch2   1 d 001000101111011011110100|  Fr00u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    3 3 000110000011011010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    3 5 111000101011110010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     7 3 000000110010100111110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 3 001000000010111000110010| JAL    J-imm is in q.
    * 7c CSRRC_0  CSRRW_1  3 3 000110011011011001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4           5 0 00xxxxxxxxxxxxxxxxxxxxxx|       not used
    * 7e NMI_1    NMI_2    3 3 000111xxxx11000110010000|        Store pc to mepc.
    * 7f JALRE2            5 0 00xxxxxxxxxxxxxxxxxxxxxx|        Not in use
    * 80 LBU_0    LBU_1    0 0 011000110111110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2           5 0 00xxxxxxxxxxxxxxxxxxxxxx|        Not in use
    * 82 DIV_1    DIV_3    3 3 000100111011000010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    3 3 011000101011110010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   3 3 001000111111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 001000101111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    3 4 110010110000x10000110100|        Return address to TRG
    * 87 JALRE1            5 0 00xxxxxxxxxxxxxxxxxxxxxx|        Not in use
    * 88 DIV_E    DIV_10   a 3 1010001111x0xxxx10011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 000010001011011011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   3 8 1110001011x10xxx00011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 3 5 110010001011010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 3 0010001111x10xxx00101001| XOR    xor
    * 8d DIV_0    DIV_1    c 3 101000101111100110000010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    3 5 001000101011110010101001|        Q = 1
    * 90 NMI_2    JAL_3    d 3 000111010011011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   d 5 110110001000x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    3 3 000111100110x00100110100|        PC to mepc
    * 93 SW_E2    SW_E3    3 3 000111101111000110010101|        Store address that faulted
    * 94 SW_E4    JAL_3    d 3 000110100110x10100110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 5 111000101101110010010100|        Q = 3
    * 96 SH_1     SH_2     5 3 000110101111100110111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    7 3 000111001010x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  3 3 000110111011011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen (at illegal entrypt)
    * 9a ECALL_6  JAL_3    d 3 010110100100x10000110100|        mcause = 11
    * 9b ILL_5             5 0 00xxxxxxxxxxxxxxxxxxxxxx|        Not in use
    * 9c DIV_10   DIV_12   a 3 101000110011000101101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   a 3 101000110011000110100010|        RS2 < 0. Branch on sign of RS1
    * 9e SH_4     SH_5     8 3 001001110011100110011111|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     3 3 000001110010100111110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    0 7 010110110111110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  3 5 111000101001110010110110|        Q = 4
    * a2 DIV_14   LB_6     3 3 001000101011100010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 3 3 000010001011000111100110|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   5 0 001000111110x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   3 5 011000011011110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 a 001000101110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 3 3 011000xxxx11110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    a 3 101000101011100001111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    d 5 010110100110x10000110100|        Store 2 to mcause
    * aa DIV_6    DIV_7    3 3 1010001011x10xxx11001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  3 3 000111101011000110011010|        pc to mepc
    * ac _L0xac   SRx_1    3 3 0010001110x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   5 3 1010001110x10xxx11100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    3 3 0010001110x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   3 5 011000xxxx11110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  3 5 111000101001110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 aF_SW_3  LDAF_3   d 3 010110001000x10010010010|        Store 7 to mcause
    * b2 CSRRW_4  Fetch    4 5 110100110100110011011110|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1          5 0 00xxxxxxxxxxxxxxxxxxxxxx|        Not in use
    * b4 eFetch3           5 0 00xxxxxxxxxxxxxxxxxxxxxx|  Fr00  Not in use, reserved to allow LASTINCH
    * b5 SH_3     SH_4     3 3 001000000011011010011110|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  3 5 111000101001110010011010|        Q = 8
    * b7 IJ_3     IJ_4     3 5 011000110011110010111101|        Construct Q = 1
    * b8 BGE      condb_2  3 3 000110111011011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    3 5 001000110011100011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   3 3 001000011111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     6 3 000110101111110110110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  3 3 000110011011011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    4 3 000100110110101111011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 3 001000101111100100011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 3 001000101111100111000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    3 6 001000111011100110001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    3 3 000110101011011011101001|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   5 5 011000101111110011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   a 5 011000101111110010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    3 3 000100111111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   3 3 001000000011101001101111|        ~302
    * c6 IJT_4    ILL_2    0 3 000111110111101101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   3 3 000111xxxx11000111001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    3 e 101000110011110101100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   3 3 011000011001110010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   3 e 101000110011110111000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc d 3 000111010011011011100110|        mtval = 0.
    * cc OR_0     OR_1     3 3 0010001111x10xxx00100110| OR     or
    * cd REM_0    DIV_1    c 3 101000101111100110000010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * cf MRET_7   MRET_8   3 6 0010000110x10xxx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  3 5 011000001011110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   3 3 000100011011011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     6 8 001000101011100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 7 3 000111101011011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   d 5 010110001010x10010010010|        Store 5 to mcause
    * d5 unalignd straddle 3 3 001000001011011000010010|  Fr00u Unaligned pc, prep read high hword
    * d6 eILL0c   ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  7 3 000111101011011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  3 3 000110111011011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  3 3 1010001111x10xxx01000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 3 0010001010x10xxx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   7 5 010110001010x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  3 3 000110011011011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  7 3 000111101011011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   3 c 000100001111011011110100|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   1 d 000100101111011011110100|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   3 3 000110101111000011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    3 3 001000000011100100011101|        Q = RS1
    * e2 MUL_1    MUL_2    5 8 001000101011110011101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 8 1110001011x10xxx00011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   3 3 001000111111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 5 111000101001110010110001|        Q = 4
    * e6 StdIncPc Fetch    4 4 110100110100110011011110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 7 3 000111101011011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    3 3 101000111011100111100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    3 5 011000110011110011000110|        Construct Q = 1
    * ea MULHU_5  MULHU_6  3 3 001000110011110000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     3 3 001000011111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 3 0010001111x10xxx00010001| AND    And 
    * ed REMU_0   DIVU_1   5 3 1010001110x10xxx11100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 3 001000xxxxx0xxxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    4 5 110100110100110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    6 8 001000101011100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 7 3 000111101011011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 3 0010000010x10xxx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 3 001000xxxxx01xxx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd 7 3 010101111111110011010101|  Fr00  Upd ttime, I. Q=imm Use dinx unless unaligned 
    * f5 jFault   jFault_1 7 3 000111101011011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 5 111000000001110011111010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 7 3 000111001011011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  3 3 000110111011011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   3 5 010100111011010011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    3 5 011000101011110001000101|        Check offset
    * fb SB_3     SB_4     3 3 001000000011011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  3 3 000110011011011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 3 0010000010x10xxx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 3 0010000010x0xxxx01000110| Illegal
    * ff QINT_0   QINT_1   3 3 0010000010x10xxx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'hb6e6901090e2b904b386bc5a788bbc5a7b09ba070804b4e690e67cbef9d27c01;
   localparam u0_1 = 256'hb6b79cd4b7e6eea62e32b3e6b441b6136cde90e639163c15f8144c76b81af88b;
   localparam u0_2 = 256'hb6e6f642b96a803e3430bc96b821bc963c1db0270804e63590e6bc39b0e67c52;
   localparam u0_3 = 256'he13ae135b903b6492e32b93db1e6b61331d7fd03f93669de0000b486f82bb6e6;
   localparam u0_4 = 256'hbce600feb12e9031a9b0bc663c4bbc66b18fa147bc65fa2b28eabc603c0b7c50;
   localparam u0_5 = 256'haedaf970fdfbb6492e32f95df69cf96e388b3b57b61eb9ebaedaf954aedaf1e6;
   localparam u0_6 = 256'h3ccfa9b9b12e9031397ab0f9b88bb1e6a693a9f290effa2bfc58fcc8b2f7f942;
   localparam u0_7 = 256'h000031900000b6492e3229f2bca836aaf6f4f6f4000000000000ba1ab61eb9ba;
   localparam u0_8 = 256'hbca900fef982d029b4e6d01ab6e6c09c00000434f9f0fa21bc82b0a800007c85;
   localparam u0_9 = 256'h29f2399f31a231680000443400feb613a693f9bbdc946534f195613484923634;
   localparam u0_A = 256'h3cc5803f90e0803fb19ad0c86434b8783c61eed0bcafe63ab1e6b88b9cb67c5e;
   localparam u0_B = 256'hf9c1f91f6bdeb649fdb5fa1a38c0b6133cbd9c9a369e000000004cde84929cb2;
   localparam u0_C = 256'h904f00fef982d02636e63dc29ca53d6231cb7b473a6ff2e1fc8afccab6e9b988;
   localparam u0_D = 256'hf6f4f6f4b6e5b649a4929091d042b613b6a100feb612a492b61eb906b6c9bc37;
   localparam u0_E = 256'h4cde00fe90e0d011fa563c223cc6b9e2b61e4cde9cb1fa1ad01abce8391df0ca;
   localparam u0_F = 256'h90c78046907eb649366bbc45b4d9b613b6ab1cfab6dbfcd508dd90e6b61eb972;
   localparam u1_0 = 256'h3308332333a33323331830533321305333213321332033483320226311220063;
   localparam u1_1 = 256'h331a35e233083222332033083352331b4353332036203563332344d333233323;
   localparam u1_2 = 256'h330833935322332335603753332337533360331333205023332038223308075b;
   localparam u1_3 = 256'h50235023680a33193320580a3388331b361c630a530a43135000335833233908;
   localparam u1_4 = 256'h35623320531b332393068a6335608a63731e331e356233233320582235600a63;
   localparam u1_5 = 256'h731e1122631a33193320531a331b38e233223322731e6822731e1122731e1b0a;
   localparam u1_6 = 256'h3560331b531b3323b323331a33223308731c730736203323a5625562361133a3;
   localparam u1_7 = 256'h5000331c500033193320730335e233181d223c205000500050003321731e6822;
   localparam u1_8 = 256'h35223320c3a2332335c838e23308a3a3500034cb112233233362331350000063;
   localparam u1_9 = 256'h33078327a3a3a3a35000d35a3320331b731c531a35e2d31a331e331ed5d8d31d;
   localparam u1_A = 256'h3560332353a33323331e33a2d55aa3a233603a22356150233308332235e2075b;
   localparam u1_B = 256'h1322132243133319631a33213523331b356335e233205000500045d3d35835e2;
   localparam u1_C = 256'h36213320c3a23323d31d3ea333613ea3331c031f33203313a5625562331a3623;
   localparam u1_D = 256'h1d123c10731e33197558332233a3331b731e33203320d558731e682233113560;
   localparam u1_E = 256'h45d3332053a3332333213323356333a3731e44d335e2332338e258223320331a;
   localparam u1_F = 256'h3320332033203319332035623553331b731c35e0731e735733203320731e6822;
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
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d45(.O(d[45]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0100110011011000001000001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h2f9f)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2a90)) cmb_d27(.O(d[27]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0012)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2200)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0911)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0900)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d44(.O(d[44]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;        bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));assign d[30] = d[18];
endmodule
