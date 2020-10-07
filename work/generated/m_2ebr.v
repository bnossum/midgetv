/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 45 columns
 * Removed:  000000000000000000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 45
 * 208 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 208 207 208 208 208 208 208 208 208 208 208 208 208 208 208 208 208 207 208 207 208 207 207 208 208 208 208 208 208 208 208 206 205 206 208 207 208 207 207 207 208 208 207 207 207  kill col 12  Tbl  44 cols 000000000000000000000000000000001000000000000 has 205 unique lines.
 * 205 204 204 205 205 205 205 205 205 205 205 205 205 205 205 205 205 204 205 203 205 204 202 205 205 205 205 205 205 205 205 202     203 205 204 205 204 204 204 205 205 204 204 204  kill col 22  Tbl  43 cols 000000000000000000000010000000001000000000000 has 202 unique lines.
 * 202 201 201 202 202 202 202 202 202 202 202 202 202 202 202 202 202 201 202 201 201 201     202 202 202 202 202 202 202 202 199     200 202 201 202 201 200 200 202 202 201 201 200  kill col 13  Tbl  42 cols 000000000000000000000010000000011000000000000 has 199 unique lines.
 * 199 198 198 199 199 199 199 199 199 199 199 199 199 199 199 199 199 198 199 198 198 198     199 199 199 199 199 199 199 199         196 199 198 198 198 197 197 198 199 198 198 197  kill col 11  Tbl  41 cols 000000000000000000000010000000011100000000000 has 196 unique lines.
 * 196 195 194 196 196 196 196 196 196 196 196 196 196 196 196 196 196 195 196 195 195 195     196 196 196 196 196 196 196 196             196 195 195 195 194 194 194 196 195 195 194  kill col 42  Tbl  40 cols 001000000000000000000010000000011100000000000 has 194 unique lines.
 * 194 192     194 194 194 194 194 194 194 194 194 194 194 194 194 194 193 194 193 193 193     194 194 193 194 194 194 194 194             194 193 193 193 192 192 192 194 193 193 192  kill col 43  Tbl  39 cols 011000000000000000000010000000011100000000000 has 192 unique lines.
 * 192         192 192 192 192 192 192 192 192 192 192 192 192 192 192 191 192 191 191 191     192 192 190 192 192 192 192 192             191 191 191 191 190 190 190 192 191 191 189  kill col  0  Tbl  38 cols 011000000000000000000010000000011100000000001 has 189 unique lines.
 * 189         189 189 189 189 189 189 189 189 189 189 189 189 189 189 188 189 188 188 188     189 189 187 189 189 189 189 189             188 188 188 188 187 186 187 188 188 187      kill col  5  Tbl  37 cols 011000000000000000000010000000011100000100001 has 186 unique lines.
 * 186         186 186 186 186 186 186 186 186 186 186 186 186 186 186 185 186 185 184 185     186 186 184 186 186 186 186 186             185 185 185 181 184     183 184 182 180      kill col  1  Tbl  36 cols 011000000000000000000010000000011100000100011 has 180 unique lines.
 * 179         180 180 180 180 180 180 180 179 180 180 180 180 180 180 179 179 178 177 178     179 180 178 180 180 179 180 179             179 178 179 172 177     176 176 177          kill col  7  Tbl  35 cols 011000000000000000000010000000011100010100011 has 172 unique lines.
 * 170         172 172 172 172 172 172 172 171 172 172 172 172 172 171 171 171 170 166 170     171 172 169 172 171 170 172 171             171 170 170     169     167 167 167          kill col 24  Tbl  34 cols 011000000000000000001010000000011100010100011 has 166 unique lines.
 * 164         166 166 166 166 166 166 166 165 165 166 166 166 166 165 165 165 162     163     165 166 163 166 164 164 166 165             165 164 163     162     161 159 160          kill col  3  Tbl  33 cols 011000000000000000001010000000011100010101011 has 159 unique lines.
 * 157         159 159 159 159 159 159 159 158 157 159 159 159 159 157 157 157 152     157     157 159 156 159 155 156 159 157             158 157 154     148     149     145          kill col  2  Tbl  32 cols 011000000000000000001010000000011100010101111 has 145 unique lines.
 * 143         145 145 145 145 145 145 145 142 143 145 145 145 143 143 143 144 136     136     141 145 142 145 138 141 145 143             144 143 139     127     131                  kill col  6  Tbl  31 cols 011000000000000000001010000000011100011101111 has 127 unique lines.
 * 123         127 127 127 127 126 127 127 125 125 127 126 127 125 125 125 125 113     117     122 127 122 127 119 121 127 123             125 125 121             107                  kill col  4  Tbl  30 cols 011000000000000000001010000000011100011111111 has 107 unique lines.
 * 103         107 107 107 107 106 107 107 103 106 106 106 107 104 105 105 105  96      97     101 107 100 107 100 100 106 102             105 105 102                                  kill col 25  Tbl  29 cols 011000000000000000011010000000011100011111111 has  96 unique lines.
 *  91          96  96  96  96  95  96  96  92  95  95  95  96  93  95  93  94          83      90  96  89  96  89  89  95  91              94  94  91                                  kill col 23  Tbl  28 cols 011000000000000000011110000000011100011111111 has  83 unique lines.
 *  78          82  83  83  83  82  83  83  79  82  82  81  83  80  82  80  81                  77  83  77  83  78  76  82  79              81  81  78                                  kill col 16  Tbl  27 cols 011000000000000000011110000010011100011111111 has  76 unique lines.
 *  72          75  75  76  76  75  76  76  72  75  75  74  76  73  75  73  73                  69  75  68  76  71      75  72              74  74  71                                  kill col 19  Tbl  26 cols 011000000000000000011110010010011100011111111 has  68 unique lines.
 *  64          67  67  67  68  67  68  68  64  67  67  66  68  65  67  65  65                  62  67      68  62      67  65              66  66  64                                  kill col 21  Tbl  25 cols 011000000000000000011111010010011100011111111 has  62 unique lines.
 *  59          61  61  61  62  61  62  62  58  61  61  60  62  60  61  59  59                      60      62  56      61  59              60  60  59                                  kill col 17  Tbl  24 cols 011000000000000000011111010110011100011111111 has  56 unique lines.
 *  54          55  53  55  56  55  55  56  52  55  55  54  56  53  55  54  53                      54      56          55  53              54  54  53                                  kill col 34  Tbl  23 cols 011000000010000000011111010110011100011111111 has  52 unique lines.
 *  50          51  49  51  52  51  51  52      51  51  50  52  50  51  50  49                      50      52          51  49              50  50  50                                  kill col 40  Tbl  22 cols 011010000010000000011111010110011100011111111 has  49 unique lines.
 *  47          48      48  49  48  48  49      48  48  47  49  47  47  47  46                      47      49          48  46              47  47  47                                  kill col 26  Tbl  21 cols 011010000010000000111111010110011100011111111 has  46 unique lines.
 *  44          44      44  46  45  45  46      45  45  44  46  42  41  42                          43      46          45  43              44  44  44                                  kill col 28  Tbl  20 cols 011010000010000010111111010110011100011111111 has  41 unique lines.
 *  39          39      37  41  40  40  41      38  40  39  41  37      36                          38      41          40  39              39  39  39                                  kill col 27  Tbl  19 cols 011010000010000011111111010110011100011111111 has  36 unique lines.
 *  34          34      32  36  35  35  36      33  35  34  36  33                                  33      36          35  34              34  34  34                                  kill col 39  Tbl  18 cols 011011000010000011111111010110011100011111111 has  32 unique lines.
 *  30          30          31  31  31  32      29  31  30  32  25                                  30      32          31  30              30  30  31                                  kill col 29  Tbl  17 cols 011011000010000111111111010110011100011111111 has  25 unique lines.
 *  23          23          24  24  23  25      23  24  23  25                                      23      25          24  24              23  23  24                                  kill col 44  Tbl  16 cols 111011000010000111111111010110011100011111111 has  23 unique lines.
 *              21          22  22  21  23      21  22  21  23                                      21      23          22  22              21  21  22                                  kill col 41  Tbl  15 cols 111111000010000111111111010110011100011111111 has  21 unique lines.
 *                          20  20  19  21      19  20  19  21                                      19      21          20  20              19  19  20                                  kill col 36  Tbl  14 cols 111111001010000111111111010110011100011111111 has  19 unique lines.
 *                          18  17      19      17  18  17  19                                      17      19          18  18              17  17  18                                  kill col 37  Tbl  13 cols 111111011010000111111111010110011100011111111 has  17 unique lines.
 *                          16          17      15  16  15  17                                      15      17          16  16              15  15  16                                  kill col 33  Tbl  12 cols 111111011011000111111111010110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 9 10 14 20 31 
 *
 * Round 1: 000000100100111000000000101001100011100000000  4 columns for indexes to table representing 12 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 37
 * 207 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 207 204 207 207 207 207   x 207 207   x 207 207   x   x   x 207 207 206 207 206 207 206 206 207   x 205   x 207 207   x   x 205 204 205   x   x   x 206 206 206 207 207 206 206 206  kill col 43  Tbl  32 cols 010000100100111000000000101001100011100000000 has 204 unique lines.
 * 204     204 204 204 204   x 204 204   x 204 204   x   x   x 204 204 203 204 203 204 203 203 204   x 202   x 204 204   x   x 202 201 202   x   x   x 203 203 203 204 204 203 203 203  kill col 12  Tbl  31 cols 010000100100111000000000101001101011100000000 has 201 unique lines.
 * 201     199 201 201 201   x 201 201   x 201 201   x   x   x 201 201 200 201 199 201 200 198 201   x 199   x 201 201   x   x 198     199   x   x   x 200 200 200 201 201 200 200 200  kill col 22  Tbl  30 cols 010000100100111000000010101001101011100000000 has 198 unique lines.
 * 198     196 198 198 198   x 198 198   x 198 198   x   x   x 198 198 197 198 197 197 197     198   x 196   x 198 198   x   x 194     196   x   x   x 197 196 196 198 198 197 197 196  kill col 13  Tbl  29 cols 010000100100111000000010101001111011100000000 has 194 unique lines.
 * 194     192 194 194 194   x 194 194   x 194 194   x   x   x 194 194 193 194 193 193 193     194   x 192   x 194 194   x   x         191   x   x   x 193 192 192 193 194 193 193 192  kill col 11  Tbl  28 cols 010000100100111000000010101001111111100000000 has 191 unique lines.
 * 191     185 191 191 191   x 191 191   x 191 191   x   x   x 191 191 190 191 190 190 190     191   x 188   x 191 191   x   x               x   x   x 190 188 189 189 191 190 189 189  kill col 42  Tbl  27 cols 011000100100111000000010101001111111100000000 has 185 unique lines.
 * 185         185 185 185   x 185 185   x 185 185   x   x   x 185 185 184 185 184 184 184     185   x 182   x 185 185   x   x               x   x   x 184 181 181 183 185 184 183 182  kill col  6  Tbl  26 cols 011000100100111000000010101001111111101000000 has 181 unique lines.
 * 181         181 181 181   x 181 181   x 180 181   x   x   x 181 181 180 181 180 180 180     180   x 178   x 180 181   x   x               x   x   x 180     177 179 181 179 179 178  kill col  5  Tbl  25 cols 011000100100111000000010101001111111101100000 has 177 unique lines.
 * 177         177 177 177   x 177 177   x 176 177   x   x   x 175 177 176 177 176 174 174     176   x 174   x 176 175   x   x               x   x   x 170         175 175 171 171 173  kill col  7  Tbl  24 cols 011000100100111000000010101001111111111100000 has 170 unique lines.
 * 170         170 170 170   x 170 170   x 169 170   x   x   x 168 169 169 170 168 163 168     169   x 167   x 168 166   x   x               x   x   x             167 164 162 163 166  kill col  2  Tbl  23 cols 011000100100111000000010101001111111111100100 has 162 unique lines.
 * 161         162 162 162   x 162 162   x 161 161   x   x   x 160 161 160 162 157 153 158     160   x 158   x 160 158   x   x               x   x   x             156 151     151 153  kill col  3  Tbl  22 cols 011000100100111000000010101001111111111101100 has 151 unique lines.
 * 149         151 151 151   x 151 150   x 148 150   x   x   x 149 149 149 150 143 141 144     148   x 146   x 148 147   x   x               x   x   x             138         131 138  kill col  1  Tbl  21 cols 011000100100111000000010101001111111111101110 has 131 unique lines.
 * 128         131 130 131   x 131 130   x 129 129   x   x   x 129 128 128 130 117 122 124     128   x 125   x 124 125   x   x               x   x   x             110             113  kill col  4  Tbl  20 cols 011000100100111000000010101001111111111111110 has 110 unique lines.
 * 107         110 109 110   x 110 109   x 107 108   x   x   x 107 105 107 107  97 100 103     106   x 102   x 102 103   x   x               x   x   x                              88  kill col  0  Tbl  19 cols 011000100100111000000010101001111111111111111 has  88 unique lines.
 *  85          88  87  88   x  88  87   x  85  86   x   x   x  85  84  86  84  75  77  79      84   x  79   x  79  80   x   x               x   x   x                                  kill col 25  Tbl  18 cols 011000100100111000010010101001111111111111111 has  75 unique lines.
 *  72          75  74  75   x  75  74   x  72  72   x   x   x  72  73  73  71      66  63      71   x  66   x  66  67   x   x               x   x   x                                  kill col 23  Tbl  17 cols 011000100100111000010110101001111111111111111 has  63 unique lines.
 *  60          62  62  63   x  63  62   x  60  59   x   x   x  60  61  59  58      55          59   x  57   x  57  56   x   x               x   x   x                                  kill col 24  Tbl  16 cols 011000100100111000011110101001111111111111111 has  55 unique lines.
 *  51          54  54  55   x  54  54   x  52  51   x   x   x  52  54  51  50                  51   x  50   x  50  47   x   x               x   x   x                                  kill col 16  Tbl  15 cols 011000100100111000011110101011111111111111111 has  47 unique lines.
 *  44          46  44  47   x  46  46   x  44  44   x   x   x  44  45  42  41                  41   x  42   x  41       x   x               x   x   x                                  kill col 26  Tbl  14 cols 011000100100111000111110101011111111111111111 has  41 unique lines.
 *  38          40  38  40   x  40  40   x  38  38   x   x   x  38  39  36                      35   x  36   x  35       x   x               x   x   x                                  kill col 21  Tbl  13 cols 011000100100111000111111101011111111111111111 has  35 unique lines.
 *  33          34  32  33   x  34  34   x  32  32   x   x   x  33  32  30                           x  30   x  30       x   x               x   x   x                                  kill col 27  Tbl  12 cols 011000100100111001111111101011111111111111111 has  30 unique lines.
 *  28          29  27  28   x  29  29   x  27  27   x   x   x  28  27                               x  25   x  26       x   x               x   x   x                                  kill col 19  Tbl  11 cols 011000100100111001111111111011111111111111111 has  25 unique lines.
 *  23          24  22  24   x  24  24   x  22  22   x   x   x  22  22                               x       x  20       x   x               x   x   x                                  kill col 17  Tbl  10 cols 011000100100111001111111111111111111111111111 has  20 unique lines.
 *  19          19  16  19   x  19  19   x  17  16   x   x   x  17  17                               x       x           x   x               x   x   x                                  kill col 40  Tbl   9 cols 011010100100111001111111111111111111111111111 has  16 unique lines.
Possible good candidates for removal, columns : 33 
 *
 * Round 2: 100101011011000110000000000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  011010000000000001111111010110011100011111111 24 columns
 * Success. Use 2 EBRs, 21 LUTs.
 */

module m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
   output [47:0] d
   );
   /*
   /*                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 011001101111110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 000001011111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 010001101111110010111110| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 3 0000000101x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 3 010000010111010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 3 0000000101x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     0 3 000000110111101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 3 000000101111101100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     4 0 010001110111110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 3 000000101111100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     4 0 010001110111110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    5 4 000000010111001110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   0 3 000001110111100100000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    0 3 1000011101x10xxx11100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    0 3 0000011101x10xxx00010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 3 000000010111011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 3 000001111111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 3 000001110111100000011010|        RS1^0xffffffff to Q
    * 12 eFetch3           6 0 00xxxxxxxxxxxxxxxxxxxxxx|  Fr00  Not in use
    * 13 condb_2  condb_3  0 3 000001111111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  0 5 010000010111110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  0 6 000001100111100100010110|        Branch on condition
    * 16 condb_5  Fetch    7 5 001101101100111011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  4 4 011101101111110001110100|        Branch taken.
    * 18 BEQ      condb_2  5 3 000001110111011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 3 010001010111010001000001| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 3 3 000000010111001111100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    0 4 000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 0 2 000001011110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 000000010111011111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 0 5 110001010101110011010100|        Q = 4
    * 1f IJ_2     IJ_3     5 3 000001010111011010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     5 7 011001101111110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 000000010111000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  0 8 000001010111110000111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 0 3 0000000101x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 0 000001111010x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 3 0000000101x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     4 3 000001110111000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 3 010000000111110000011101|        Q = rs2
    * 28 _L0x28   SH_1     4 7 010001110111110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 3 000001110111100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     4 7 010001110111110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 5 01000xxxx111010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 3 0000011101x0xxxx00111110| SLL    Shift left
    * 2d MULH_0   MULH_1   0 3 000001010011100101101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  4 3 100001111111011001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 3 3 000000010111011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 9 000000010111011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 3 000001111111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    5 3 010000010111010010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  5 3 010110010110x10010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    7 3 001101101110100111011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 3 000001011011100100110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 3 000001011011110100000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  5 6 00001xxxx111000111010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 000001110111011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 100000010111000111100110|        Last shift.
    * 3a SRxI_1   SRxI_2   3 8 000001010011100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    0 4 000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  5 3 000000110111011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 8 000001010011100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   0 0 000001111010x00100110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   0 0 000001111010x00100111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 4 011001101111110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   0 5 010000000111110000001011|        Q=1
    * 42 MULHU_2  MULHU_3  0 8 000001010011110001100000|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  0 3 000000000110100011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  0 3 000001111111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 5 010001010111110001100101|        More check offset
    * 46 ILL_1    ILL_2    5 3 000011010110x00101000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    5 3 000111010111000110001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     9 4 011001110111110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 5 010000000111110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     9 4 011001110111110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 3 000111010110100110110000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 3 0000011101x10xxx00110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  5 3 000001110011000100101110| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     0 3 00000xxxx1x0xxxx11111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 0 5 010001010111110011100110|        Prep +4
    * 50 LW_1     StdIncPc b a 000001011111000111100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   5 3 000111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 000001011111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   5 3 000111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     c 8 000001010011100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 5 3 000111010111011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 3 000001000111101101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 3 000001000111100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    0 8 110001011111100101101110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 000001111111011010011100|        REM = Q to yy
    * 5a SB_1     SB_2     5 3 000001011011100101011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    0 4 000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  5 3 000000110111011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     d 3 000001011011110111111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 000001011111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   5 3 000111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  0 3 100001111111100101000010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 4 6 000000110111001011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 DIV_8    DIV_7    0 5 010001011011110011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    e 5 010001011111110001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  0 3 000001111111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    0 6 0000000101x10xxx11101111|        Prepare read PC
    * 66 SW_1     SW_2     6 3 000111110110100111110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    5 3 000110010110x11010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 000000010111000111100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     0 3 000001010111100010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 000001010111000011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     9 3 001101100111100101111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 3 0000011101x10xxx00110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  5 3 000001110011000100101110| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    5 3 000001110110100110111001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   0 5 01000xxxx111110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    c 8 000001010011100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 5 3 000111010111011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 3 000000110111101000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  5 3 000111100111000101110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   1 b 000001011111000111110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  0 3 0000000101x0xxxx01110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  0 3 000000010111100001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  5 5 010011010110x10001111101|        origPC to mepc. Prep read 0
    * 78 DIV_4    DIV_6    5 3 000000000111011010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    0 5 110001010111110010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     6 3 000101100110100111110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    0 4 000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  5 3 000000110111011001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    f 3 000101001110x00100110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    5 3 00001xxxx111000110010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  5 3 000111010110x00101111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0 011001101111110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  5 3 000011010110x00101111101|        Store PC to mepc
    * 82 DIV_1    DIV_3    4 3 000001110111000010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    0 3 010001010111110010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   0 3 000001111111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 000001011111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    3 5 110001100100x10000110100|        Return address to TRG
    * 87 JALRE1   JALRE2   5 3 000011100110x00101111111|  err   Store pc to mepc
    * 88 DIV_E    DIV_10   e 3 1000011111x0xxxx10011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 000000010111011011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   0 8 1100010111x10xxx00011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 3 5 110000010111010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 3 0000011111x10xxx00101001| XOR    xor
    * 8d DIV_0    DIV_1    e 3 100001011011100110000010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     0 3 00000xxxx1x0xxxx11111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 5 000001010111110010101001|        Q = 1
    * 90 NMI_2    JAL_3    f 3 000110100111011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   f 5 110100010100x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    5 3 000011001110x00100110100|        PC to mepc
    * 93 SW_E2    SW_E3    5 3 000011011111000110010101|        Store address that faulted
    * 94 SW_E4    JAL_3    f 3 000101001110x10100110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    0 5 110001011101110010010100|        Q = 3
    * 96 SH_1     SH_2     5 3 000001011011100110111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    5 3 000110010110x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 000001110111011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 3 00000xxxx1x0xxxx11111110| Illegal instruction seen (at illegal entrypt)
    * 9a ECALL_6  JAL_3    f 3 010101001100x10000110100|        mcause = 11
    * 9b ILL_5             6 0 00xxxxxxxxxxxxxxxxxxxxxx|        Not in use
    * 9c DIV_10   DIV_12   e 3 100001100111000101101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   e 3 100001100111000110100010|        RS2 < 0. Branch on sign of RS1
    * 9e SH_4     SH_5     9 3 001011100111100110011111|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     6 3 000011100110100111110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    5 7 011001101111110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  0 5 110001010101110010110110|        Q = 4
    * a2 DIV_14   LB_6     0 3 000001010111100010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 3 3 000000010111000111100110|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   0 0 000001111010x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 5 010000110111110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  0 4 000001011110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 3 01000xxxx111110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    e 3 100001010111100001111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    f 5 010101001110x10000110100|        Store 2 to mcause
    * aa DIV_6    DIV_7    0 3 1000010111x10xxx11001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  5 3 000011010111000110011010|        pc to mepc
    * ac _L0xac   SRx_1    0 3 0000011101x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   0 3 1000011100x10xxx11100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    0 3 0000011101x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 5 01000xxxx111110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  0 5 110001010101110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 aF_SW_3  LDAF_3   f 3 010100010100x10010010010|        Store 7 to mcause
    * b2 CSRRW_4  Fetch    7 5 111101101100110011011110|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1          6 0 00xxxxxxxxxxxxxxxxxxxxxx|        Not in use
    * b4 LASTINCH          6 0 00xxxxxxxxxxxxxxxxxxxxxx|        Reserved to facilitate manual equation
    * b5 SH_3     SH_4     0 3 000000000111011010011110|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  0 5 110001010101110010011010|        Q = 8
    * b7 IJ_3     IJ_4     0 3 010001100101110010111101|        Construct Q = 3
    * b8 BGE      condb_2  5 3 000001110111011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    0 5 000001100111100011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   0 3 000000111111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     d 3 000001011011110110110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 000000110111011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    7 3 001101101110101111011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 3 000001011111100100011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 3 000001011111100111000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    0 6 000001110111100110001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 000001010111011011101001|        Read word is to be masked with ~3u
    * c2 DIVU_3   DIVU_2   0 5 010001011011110011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   e 5 010001011111110010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    4 3 000001111111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 3 000000000111101001101111|        ~302
    * c6 IJT_4    ILL_2    5 3 001011101111101101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   5 3 00001xxxx111000111001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    0 c 100001100111110101100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   0 3 010000110101110010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   0 c 100001100111110111000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc f 3 000110100111011011100110|        mtval = 0.
    * cc OR_0     OR_1     0 3 0000011111x10xxx00100110| OR     or
    * cd REM_0    DIV_1    e 3 100001011011100110000010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     0 3 00000xxxx1x0xxxx11111110| Illegal instruction seen
    * cf MRET_7   MRET_8   0 6 0000001101x10xxx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 5 010000010111110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 3 000000110111011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     c 8 000001010011100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 5 3 000111010111011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   f 5 010100010110x10010010010|        Store 5 to mcause
    * d5 eFetch2           6 0 00xxxxxxxxxxxxxxxxxxxxxx|  Fr00  Not in use
    * d6 eILL0c   ILLe     0 3 00000xxxx1x0xxxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  5 3 000111010111011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 000001110111011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  0 3 1000011111x10xxx01000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   0 3 0000010101x10xxx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 5 010100010110x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 000000110111011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  5 3 000111010111011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 d 000000011111011011110100|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   7 b 000001011111011011110100|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 000001011111000011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    0 3 000000000111100100011101|        Q = RS1
    * e2 MUL_1    MUL_2    0 8 000001010011110011101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   0 8 1100010111x10xxx00011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   0 3 000001111111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  0 5 110001010101110010110001|        Q = 4
    * e6 StdIncPc Fetch    7 5 111101101100110011011110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 5 3 000111010111011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    0 3 100001110111100111100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    0 3 010001100101110011000110|        Construct Q = 3
    * ea MULHU_5  MULHU_6  0 3 000001100111110000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     0 3 000000111111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 3 0000011111x10xxx00010001| AND    And 
    * ed REMU_0   DIVU_1   0 3 1000011100x10xxx11100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     0 3 00000xxxx1x0xxxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    7 5 111101101100110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    c 8 000001010011100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 5 3 000111010111011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 3 0000000101x10xxx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 3 00000xxxx1x01xxx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            4 e 010111111111110000000000|  Fr00  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 5 3 000111010111011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    0 5 110000000101110011111010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 5 3 000110010111011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 000001110111011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   4 5 010001110111010011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    0 5 010001010111110001000101|        Check offset
    * fb SB_3     SB_4     0 3 000000000111011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 000000110111011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 3 0000000101x10xxx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    0 3 0000000101x0xxxx01000110| Illegal
    * ff QINT_0   QINT_1   0 3 0000000101x10xxx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'h76e6501050e2790473867c5af88b7c5afb097a07480474e650e6fcbef9d2fc01;
   localparam u0_1 = 256'h76b75cd477e6eea66e3273e674417613fc74cede79167c15f8140000781af88b;
   localparam u0_2 = 256'h76e6f642396a403e74307c9678217c967c1d70274804a63550e67c3970e6fc52;
   localparam u0_3 = 256'ha13aa135390376496e32393d71e6761371d7bd03b936e9de64817486f82b76e6;
   localparam u0_4 = 256'h7ce640fe312e503169b07c667c4b7c66718f61477c65fa2b68ea3c607c0bfc50;
   localparam u0_5 = 256'h6edaf970bdfb76496e32b95df69cf96e788b7b57761e39eb6edaf9546edaf1e6;
   localparam u0_6 = 256'h7ccf69b9312e5031797a70f9788b71e6669369f250effa2bfc58bcc872f7f942;
   localparam u0_7 = 256'h617d7190e13476496e3269f27ca876aa647d78774073f1f471767a1a761e39ba;
   localparam u0_8 = 256'h7ca940feb982d02974e6d01a76e6c09c617f4434f9f0fa217c8270a8617dfc85;
   localparam u0_9 = 256'h69f2799f71a271680000c43440fe76136693b9bbdc94e534f195e13444927634;
   localparam u0_A = 256'h7cc5403f10e0403f719ad0c8e43478787c61eed07cafa63a71e6788b5cb6fc5e;
   localparam u0_B = 256'hf9c1f91febde7649bdb5fa1a78c076135cbd5c9a769e00000000ccde44925cb2;
   localparam u0_C = 256'h504f40feb982d02676e67dc25ca57d6271cbfb477a6ff2e1fc8abcca76e97988;
   localparam u0_D = 256'hf6f4f6f476e5764964925091d042761376a140fe00006492761e390676c97c37;
   localparam u0_E = 256'hccde40fe10e0d011fa567c225cc679e2761eccde5cb1fa1ad01a3ce8791df0ca;
   localparam u0_F = 256'h50c74046507e7649766b7c4574d9761376ab5cfa76dbfc0048dd50e6761e3972;
   localparam u1_0 = 256'h3301030703870307540140470302404703020303030133410301224611050066;
   localparam u1_1 = 256'h530505c533010205040133014345530744767536060605410307600003070307;
   localparam u1_2 = 256'h3301438703050307054047470307474703404307030100070301080533015766;
   localparam u1_3 = 256'h0007000788055303040138053381530756088305330573365359534103073901;
   localparam u1_4 = 256'h0545030053070307a31d946705409467531d530d054503070300080505400466;
   localparam u1_5 = 256'h531d1105d305530304015305530708c503040304531dc805531d1105531dba05;
   localparam u1_6 = 256'h054053075307030793365305030533015319631f06010307e545054546030387;
   localparam u1_7 = 256'h531d5308f31453030401631605c55300554d030103011b05531e0303531dc805;
   localparam u1_8 = 256'h05050300e385030735c108c53301e387530e35c61105030703454307530d0066;
   localparam u1_9 = 256'h630e932ee386e3866000f354030053075319530505c5f314530d530cf5d1f31a;
   localparam u1_A = 256'h0540030703870307530d0385f554e38503400405054300073301030505c55766;
   localparam u1_B = 256'h1305130573365303d305030305065307034605c503006000600075f6f35105c5;
   localparam u1_C = 256'h06030300e3850307f31a0c8603430c865308532e03004307e545054553050607;
   localparam u1_D = 256'h7b054d01531d53035551030503875307531d03006000f551531dc80543030541;
   localparam u1_E = 256'h75f60300038703070303030603460387531d75f605c5030708c5080503005305;
   localparam u1_F = 256'h03010301030153030300054545475307531905c0531d4e5f03000301531dc805;
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
   assign d[40] = indir[21];
   assign d[42] = indir[22];
   assign d[43] = indir[23];
   // replaces = 000000100100111000000000101001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0102)) cmb_d08(.O(d[8]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0220)) cmb_d09(.O(d[9]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1020)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2800)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h7f7e)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0094)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0802)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0c00)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 100101011011000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'ha928)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'ha0b0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0882)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h3100)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8400)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5207)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d44(.O(d[44]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
