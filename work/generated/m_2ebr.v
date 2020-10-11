/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 46 columns
 * Removed:  0000000000000000000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 203 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 202 203 202 203 203 203 203 203 203 203 203 203 203 203 203 203 203 203 203 203 202 203 202 202 203 203 203 203 203 203 203 203 202 200 201 203 202 203 202 202 202 203 203 202 202 202  kill col 12  Tbl  45 cols 0000000000000000000000000000000001000000000000 has 200 unique lines.
 * 199 200 199 199 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 198 200 199 197 200 200 200 200 200 200 200 200 198     198 200 199 200 199 199 199 200 200 199 199 199  kill col 22  Tbl  44 cols 0000000000000000000000010000000001000000000000 has 197 unique lines.
 * 196 197 196 196 197 197 197 197 197 197 197 197 197 197 197 197 197 197 197 197 196 196 196     197 197 197 197 197 197 197 197 195     195 197 196 197 196 195 195 197 197 196 196 195  kill col 13  Tbl  43 cols 0000000000000000000000010000000011000000000000 has 195 unique lines.
 * 194 195 194 194 195 195 195 195 195 195 195 195 195 195 195 195 195 195 195 195 194 194 194     195 195 195 195 195 195 195 195         192 195 194 194 194 193 193 194 195 194 194 193  kill col 11  Tbl  42 cols 0000000000000000000000010000000011100000000000 has 192 unique lines.
 * 191 192 191 188 192 192 192 192 192 192 192 192 192 192 192 192 192 192 192 192 191 191 191     192 192 192 192 192 192 192 192             192 191 191 191 190 190 190 192 191 191 190  kill col 42  Tbl  41 cols 0001000000000000000000010000000011100000000000 has 188 unique lines.
 * 187 188 187     188 188 188 188 188 188 188 188 188 188 188 188 188 188 188 188 187 187 187     188 188 187 188 188 188 188 188             188 187 187 187 186 186 186 188 187 187 186  kill col  6  Tbl  40 cols 0001000000000000000000010000000011100001000000 has 186 unique lines.
 * 185 186 185     186 186 186 186 186 186 186 185 186 186 186 186 186 186 186 186 185 185 185     186 186 185 186 186 186 186 186             186 185 185 185     184 184 186 184 185 184  kill col  5  Tbl  39 cols 0001000000000000000000010000000011100001100000 has 184 unique lines.
 * 183 184 183     184 184 184 184 184 184 184 183 184 184 184 184 183 184 184 184 183 183 183     184 184 183 184 184 184 184 184             184 183 183 179         182 183 181 181 181  kill col  7  Tbl  38 cols 0001000000000000000000010000000011100011100000 has 179 unique lines.
 * 178 179 178     179 179 179 179 179 179 179 178 179 179 179 179 178 178 179 179 178 175 178     179 179 178 179 178 179 179 179             179 178 178             177 174 174 175 176  kill col  3  Tbl  37 cols 0001000000000000000000010000000011100011101000 has 174 unique lines.
 * 173 174 173     174 174 174 174 174 174 174 172 174 174 174 174 173 172 174 174 172 169 173     173 174 173 174 173 174 174 173             174 173 173             169     166 166 169  kill col  2  Tbl  36 cols 0001000000000000000000010000000011100011101100 has 166 unique lines.
 * 165 165 164     166 166 166 166 166 166 166 164 166 166 165 166 165 164 165 165 160 159 162     164 166 164 166 165 165 166 164             166 165 165             157         151 157  kill col  1  Tbl  35 cols 0001000000000000000000010000000011100011101110 has 151 unique lines.
 * 150 150 146     151 151 151 151 151 151 151 149 150 151 150 151 150 149 149 150 144 143 146     148 151 147 151 148 150 151 149             151 150 149             138             136  kill col  0  Tbl  34 cols 0001000000000000000000010000000011100011101111 has 136 unique lines.
 * 135 135 131     136 136 136 136 136 136 136 134 135 136 135 136 134 134 135 134 127 127 131     133 136 131 136 132 133 135 132             136 135 133             119                  kill col  4  Tbl  33 cols 0001000000000000000000010000000011100011111111 has 119 unique lines.
 * 118 118 112     119 119 119 119 119 119 119 115 118 118 118 119 116 116 118 117 110 109 111     113 119 114 119 114 116 118 114             119 118 114                                  kill col 24  Tbl  32 cols 0001000000000000000001010000000011100011111111 has 109 unique lines.
 * 108 107 103     109 109 109 109 108 109 109 105 108 108 108 109 106 107 108 107 100     101     103 109 104 109 104 103 108 104             109 108 103                                  kill col 25  Tbl  31 cols 0001000000000000000011010000000011100011111111 has 100 unique lines.
 *  99  98  94     100 100 100 100  99 100 100  96  99  99  99 100  97  99  98  98          89      94 100  95 100  95  93  99  95             100  99  94                                  kill col 23  Tbl  30 cols 0001000000000000000011110000000011100011111111 has  89 unique lines.
 *  88  87  83      88  89  89  89  88  89  89  85  88  88  87  89  86  88  86  87                  83  89  84  89  84  82  88  85              88  87  83                                  kill col 16  Tbl  29 cols 0001000000000000000011110000010011100011111111 has  82 unique lines.
 *  81  80  76      81  81  82  82  81  82  82  78  81  81  80  81  79  81  79  79                  75  81  75  82  77      81  78              81  80  76                                  kill col 21  Tbl  28 cols 0001000000000000000011111000010011100011111111 has  75 unique lines.
 *  74  73  69      74  74  75  75  74  75  75  71  74  74  73  74  73  74  72  72                      73  68  75  70      74  71              74  73  70                                  kill col 19  Tbl  27 cols 0001000000000000000011111010010011100011111111 has  68 unique lines.
 *  67  66  62      67  67  67  68  67  68  68  64  67  67  66  67  66  67  65  65                      66      68  63      67  65              67  66  64                                  kill col 43  Tbl  26 cols 0011000000000000000011111010010011100011111111 has  62 unique lines.
 *  61  59          61  61  61  62  61  62  62  58  61  61  60  61  60  61  59  59                      60      62  57      61  59              60  60  59                                  kill col 17  Tbl  25 cols 0011000000000000000011111010110011100011111111 has  57 unique lines.
 *  55  55          56  54  56  57  56  56  57  53  56  56  55  56  54  56  55  54                      55      57          56  54              55  55  54                                  kill col 34  Tbl  24 cols 0011000000010000000011111010110011100011111111 has  53 unique lines.
 *  51  51          52  50  52  53  52  52  53      52  52  51  52  51  52  51  50                      51      53          52  50              51  51  51                                  kill col 40  Tbl  23 cols 0011010000010000000011111010110011100011111111 has  50 unique lines.
 *  48  48          49      49  50  49  49  50      49  49  48  49  48  48  48  47                      48      50          49  47              48  48  48                                  kill col 26  Tbl  22 cols 0011010000010000000111111010110011100011111111 has  47 unique lines.
 *  45  45          45      45  47  46  46  47      46  46  45  45  44  43  44                          44      47          46  44              45  45  45                                  kill col 28  Tbl  21 cols 0011010000010000010111111010110011100011111111 has  43 unique lines.
 *  41  41          41      39  43  42  42  43      40  42  41  41  39      39                          40      42          42  41              41  41  41                                  kill col 39  Tbl  20 cols 0011011000010000010111111010110011100011111111 has  39 unique lines.
 *  37  37          36          38  38  38  39      36  38  37  37  33      35                          37      38          38  37              37  37  38                                  kill col 29  Tbl  19 cols 0011011000010000110111111010110011100011111111 has  33 unique lines.
 *  31  31          30          32  32  31  33      30  32  31  31          29                          31      32          32  32              31  31  32                                  kill col 27  Tbl  18 cols 0011011000010000111111111010110011100011111111 has  29 unique lines.
 *  27  27          27          28  28  27  29      26  28  27  27                                      27      28          28  28              27  27  28                                  kill col 33  Tbl  17 cols 0011011000011000111111111010110011100011111111 has  26 unique lines.
 *  25  24          24          25  25  24  25          25  24  24                                      24      25          25  25              24  24  25                                  kill col 44  Tbl  16 cols 0111011000011000111111111010110011100011111111 has  24 unique lines.
 *  23              22          23  23  22  23          23  22  22                                      22      23          23  23              22  22  23                                  kill col 41  Tbl  15 cols 0111111000011000111111111010110011100011111111 has  22 unique lines.
 *  21                          21  21  20  21          21  20  20                                      20      21          21  21              20  20  21                                  kill col 36  Tbl  14 cols 0111111001011000111111111010110011100011111111 has  20 unique lines.
 *  19                          19  18      19          19  18  18                                      18      19          19  19              18  18  19                                  kill col 37  Tbl  13 cols 0111111011011000111111111010110011100011111111 has  18 unique lines.
 *  17                          17          17          17  16  16                                      16      17          17  17              16  16  17                                  kill col 31  Tbl  12 cols 0111111011011010111111111010110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 9 10 14 20 30 
 *
 * Round 1: 1000000100100101000000000101001100011100000000  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 201 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 201 198 201 201 201 201   x 201 201   x 201 201   x 201   x 201 201 201 201 200 201 200 200 201   x 199   x 201 201   x   x 200 198 199   x   x   x 200 200 200 201 201 200 200 200  kill col 43  Tbl  33 cols 1010000100100101000000000101001100011100000000 has 198 unique lines.
 *   x 198     198 198 198 198   x 198 198   x 198 198   x 198   x 198 198 198 198 197 198 197 197 198   x 195   x 198 198   x   x 197 195 196   x   x   x 197 197 197 198 198 197 197 197  kill col 19  Tbl  32 cols 1010000100100101000000000111001100011100000000 has 195 unique lines.
 *   x 195     195 195 195 195   x 195 195   x 195 195   x 195   x 195 195 195 195 194 195 194 194 195   x       x 195 195   x   x 194 192 193   x   x   x 194 194 194 195 195 194 194 194  kill col 12  Tbl  31 cols 1010000100100101000000000111001101011100000000 has 192 unique lines.
 *   x 192     191 192 192 192   x 192 192   x 192 192   x 192   x 192 192 192 192 190 192 191 189 192   x       x 192 192   x   x 190     190   x   x   x 191 191 191 192 192 191 191 191  kill col 22  Tbl  30 cols 1010000100100101000000010111001101011100000000 has 189 unique lines.
 *   x 189     188 189 189 189   x 189 189   x 189 189   x 189   x 189 189 189 189 188 188 188     189   x       x 189 189   x   x 186     187   x   x   x 188 187 187 189 189 188 188 187  kill col 13  Tbl  29 cols 1010000100100101000000010111001111011100000000 has 186 unique lines.
 *   x 186     185 186 186 186   x 186 186   x 186 186   x 186   x 186 186 186 186 185 185 185     186   x       x 186 186   x   x         183   x   x   x 185 184 184 185 186 185 185 184  kill col 11  Tbl  28 cols 1010000100100101000000010111001111111100000000 has 183 unique lines.
 *   x 183     178 183 183 183   x 183 183   x 183 183   x 183   x 183 183 183 183 182 182 182     183   x       x 183 181   x   x               x   x   x 182 180 181 181 183 182 181 181  kill col 42  Tbl  27 cols 1011000100100101000000010111001111111100000000 has 178 unique lines.
 *   x 178         178 178 178   x 178 178   x 178 178   x 178   x 178 178 178 178 177 177 177     178   x       x 178 176   x   x               x   x   x 177 175 174 176 178 176 176 175  kill col  5  Tbl  26 cols 1011000100100101000000010111001111111100100000 has 174 unique lines.
 *   x 174         174 174 174   x 174 174   x 174 174   x 174   x 174 174 174 174 173 172 171     174   x       x 174 170   x   x               x   x   x 167 171     171 172 170 169 170  kill col  7  Tbl  25 cols 1011000100100101000000010111001111111110100000 has 167 unique lines.
 *   x 167         167 167 167   x 167 167   x 167 166   x 167   x 167 166 167 167 165 159 165     167   x       x 166 163   x   x               x   x   x     164     163 159 161 160 163  kill col 24  Tbl  24 cols 1011000100100101000001010111001111111110100000 has 159 unique lines.
 *   x 159         159 159 159   x 159 159   x 159 158   x 159   x 159 157 159 159 155     155     159   x       x 158 153   x   x               x   x   x     155     153 150 151 152 155  kill col  3  Tbl  23 cols 1011000100100101000001010111001111111110101000 has 150 unique lines.
 *   x 149         150 150 150   x 150 150   x 150 149   x 150   x 150 146 150 150 144     146     147   x       x 149 141   x   x               x   x   x     144     142     140 138 144  kill col  1  Tbl  22 cols 1011000100100101000001010111001111111110101010 has 138 unique lines.
 *   x 136         138 137 138   x 138 138   x 138 137   x 138   x 138 134 138 137 130     132     134   x       x 137 128   x   x               x   x   x     127     128     127     125  kill col  0  Tbl  21 cols 1011000100100101000001010111001111111110101011 has 125 unique lines.
 *   x 123         125 124 125   x 125 125   x 124 122   x 125   x 125 122 124 121 113     118     121   x       x 123 113   x   x               x   x   x     111     112     109          kill col  2  Tbl  20 cols 1011000100100101000001010111001111111110101111 has 109 unique lines.
 *   x 106         109 108 109   x 109 109   x 106 105   x 109   x 107 106 108 106  96      99     105   x       x 103  98   x   x               x   x   x      86      89                  kill col  6  Tbl  19 cols 1011000100100101000001010111001111111111101111 has  86 unique lines.
 *   x  82          86  85  86   x  85  86   x  84  82   x  85   x  84  83  85  82  76      79      81   x       x  81  76   x   x               x   x   x              68                  kill col  4  Tbl  18 cols 1011000100100101000001010111001111111111111111 has  68 unique lines.
 *   x  65          68  67  68   x  67  68   x  65  65   x  66   x  65  66  66  64  61      62      63   x       x  61  60   x   x               x   x   x                                  kill col 16  Tbl  17 cols 1011000100100101000001010111011111111111111111 has  60 unique lines.
 *   x  56          60  59  60   x  59  60   x  57  58   x  57   x  57  56  57  55  53      54      56   x       x  51       x   x               x   x   x                                  kill col 17  Tbl  16 cols 1011000100100101000001010111111111111111111111 has  51 unique lines.
 *   x  48          51  49  51   x  50  51   x  48  49   x  48   x  47  47  48  47  45      46      48   x       x           x   x               x   x   x                                  kill col 25  Tbl  15 cols 1011000100100101000011010111111111111111111111 has  45 unique lines.
 *   x  42          45  43  45   x  44  45   x  42  42   x  42   x  40  42  42  40          38      41   x       x           x   x               x   x   x                                  kill col 23  Tbl  14 cols 1011000100100101000011110111111111111111111111 has  38 unique lines.
 *   x  36          37  35  37   x  37  37   x  35  35   x  35   x  33  34  34  33                  34   x       x           x   x               x   x   x                                  kill col 29  Tbl  13 cols 1011000100100101100011110111111111111111111111 has  33 unique lines.
 *   x  31          32  30  29   x  32  32   x  31  30   x  30   x      27  29  28                  29   x       x           x   x               x   x   x                                  kill col 28  Tbl  12 cols 1011000100100101110011110111111111111111111111 has  27 unique lines.
 *   x  25          26  23  21   x  26  25   x  25  25   x  24   x          25  24                  24   x       x           x   x               x   x   x                                  kill col 39  Tbl  11 cols 1011001100100101110011110111111111111111111111 has  21 unique lines.
 *   x  19          19  18       x  20  19   x  20  20   x  19   x          19  17                  19   x       x           x   x               x   x   x                                  kill col 26  Tbl  10 cols 1011001100100101110111110111111111111111111111 has  17 unique lines.
 *   x  15          15  15       x  16  15   x  16  16   x  14   x          15                      15   x       x           x   x               x   x   x                                  kill col 31  Tbl   9 cols 1011001100100111110111110111111111111111111111 has  14 unique lines.
 *
 * Round 2: 0100110011011000001000001000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 14 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 200 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x 197 200   x   x 200   x   x   x   x   x   x   x 200   x 200 200   x 199 198 200 198 199   x   x 198   x 200 200   x   x 199 197 198   x   x   x 199 198 199 200 200 199 198 199  kill col 43  Tbl  24 cols 1110110111111101001000001101001100011100000000 has 197 unique lines.
 *   x   x     197   x   x 197   x   x   x   x   x   x   x 197   x 197 197   x 196 195 197 195 196   x   x 194   x 197 197   x   x 196 194 195   x   x   x 196 195 196 197 197 196 195 196  kill col 19  Tbl  23 cols 1110110111111101001000001111001100011100000000 has 194 unique lines.
 *   x   x     194   x   x 194   x   x   x   x   x   x   x 194   x 194 194   x 193 192 194 192 193   x   x       x 194 194   x   x 193 191 192   x   x   x 193 192 193 194 194 193 192 193  kill col 12  Tbl  22 cols 1110110111111101001000001111001101011100000000 has 191 unique lines.
 *   x   x     190   x   x 191   x   x   x   x   x   x   x 191   x 191 191   x 190 188 191 189 188   x   x       x 191 191   x   x 189     189   x   x   x 190 189 190 191 191 190 189 190  kill col 25  Tbl  21 cols 1110110111111101001010001111001101011100000000 has 188 unique lines.
 *   x   x     187   x   x 188   x   x   x   x   x   x   x 188   x 188 188   x 187     188 185 185   x   x       x 188 188   x   x 186     186   x   x   x 187 186 187 188 188 187 186 187  kill col 23  Tbl  20 cols 1110110111111101001010101111001101011100000000 has 185 unique lines.
 *   x   x     184   x   x 185   x   x   x   x   x   x   x 185   x 185 185   x 184     185     182   x   x       x 185 185   x   x 183     183   x   x   x 183 183 184 184 185 183 183 184  kill col 22  Tbl  19 cols 1110110111111101001010111111001101011100000000 has 182 unique lines.
 *   x   x     181   x   x 182   x   x   x   x   x   x   x 182   x 182 182   x 181     181           x   x       x 182 182   x   x 179     180   x   x   x 180 179 179 180 181 180 178 180  kill col  1  Tbl  18 cols 1110110111111101001010111111001101011100000010 has 178 unique lines.
 *   x   x     177   x   x 178   x   x   x   x   x   x   x 178   x 178 178   x 177     176           x   x       x 178 177   x   x 175     176   x   x   x 176 172 172 175 172 176     174  kill col  6  Tbl  17 cols 1110110111111101001010111111001101011101000010 has 172 unique lines.
 *   x   x     170   x   x 172   x   x   x   x   x   x   x 172   x 172 172   x 170     167           x   x       x 172 169   x   x 168     168   x   x   x 169     165 164 163 167     164  kill col  3  Tbl  16 cols 1110110111111101001010111111001101011101001010 has 163 unique lines.
 *   x   x     161   x   x 163   x   x   x   x   x   x   x 163   x 163 163   x 161     154           x   x       x 162 158   x   x 157     155   x   x   x 157     151 150     152     149  kill col  0  Tbl  15 cols 1110110111111101001010111111001101011101001011 has 149 unique lines.
 *   x   x     146   x   x 149   x   x   x   x   x   x   x 148   x 149 147   x 146     136           x   x       x 147 141   x   x 141     139   x   x   x 135     134 129     130          kill col  4  Tbl  14 cols 1110110111111101001010111111001101011101011011 has 129 unique lines.
 *   x   x     124   x   x 129   x   x   x   x   x   x   x 127   x 128 127   x 124     115           x   x       x 124 118   x   x 118     117   x   x   x 111     112         110          kill col  2  Tbl  13 cols 1110110111111101001010111111001101011101011111 has 110 unique lines.
 *   x   x     104   x   x 109   x   x   x   x   x   x   x 108   x 107 107   x 105      96           x   x       x 103  99   x   x  98      98   x   x   x  90      91                      kill col  7  Tbl  12 cols 1110110111111101001010111111001101011111011111 has  90 unique lines.
 *   x   x      83   x   x  89   x   x   x   x   x   x   x  86   x  86  86   x  85      76           x   x       x  78  77   x   x  77      80   x   x   x          67                      kill col  5  Tbl  11 cols 1110110111111101001010111111001101011111111111 has  67 unique lines.
 *   x   x      58   x   x  66   x   x   x   x   x   x   x  64   x  60  62   x  60      55           x   x       x  58  56   x   x  54      59   x   x   x                                  kill col 13  Tbl  10 cols 1110110111111101001010111111001111011111111111 has  54 unique lines.
 *   x   x      46   x   x  53   x   x   x   x   x   x   x  51   x  49  49   x  46      43           x   x       x  45  45   x   x          44   x   x   x                                  kill col 24  Tbl   9 cols 1110110111111101001011111111001111011111111111 has  43 unique lines.
 *   x   x      37   x   x  42   x   x   x   x   x   x   x  40   x  37  39   x  35                   x   x       x  33  32   x   x          35   x   x   x                                  kill col 16  Tbl   8 cols 1110110111111101001011111111011111011111111111 has  32 unique lines.
 *   x   x      27   x   x  30   x   x   x   x   x   x   x  28   x  27  27   x  26                   x   x       x  24       x   x          24   x   x   x                                  kill col 17  Tbl   7 cols 1110110111111101001011111111111111011111111111 has  24 unique lines.
 *   x   x      18   x   x  21   x   x   x   x   x   x   x  20   x  19  18   x  19                   x   x       x           x   x          17   x   x   x                                  kill col 11  Tbl   6 cols 1110110111111101001011111111111111111111111111 has  17 unique lines.
 *   x   x      12   x   x  15   x   x   x   x   x   x   x  13   x  14  13   x  13                   x   x       x           x   x               x   x   x                                  kill col 42  Tbl   5 cols 1111110111111101001011111111111111111111111111 has  12 unique lines.
 *
 * Round 3: 0000001000000010110100000000000000000000000000  4 columns for indexes to table representing  5 original columns (uses 12 of 16 lines in indirect table).
 * Direct:  0011000000000000000011110010110011100011111111 20 columns
 * Success. Use 2 EBRs, 26 LUTs.
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
    *                      indirect_index 2
    *                      | indirect_index 1
    * inx         next     | | indirect index 0
    * || ucode    ucode    | | | direct representation
    * 00 LB_0     LB_1     0 0 0 01110111110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     0 1 1 00101111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     1 2 2 01110111110010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 3 2 000010x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 2 3 2 01001011010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 3 2 000000x01xxx00000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 3 2 00011011101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 3 2 00010111101100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     3 3 0 01111011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 3 2 00010111100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     3 3 0 01111011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    4 3 2 00001011001110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   0 3 2 00111011100100000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    0 3 2 101110x10xxx11100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    0 3 2 001110x10xxx00010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 2 3 2 00001011011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 3 2 00111111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 3 2 00111011100000011010|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   3 4 3 11110100110001110110|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  0 3 2 00111111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 4 01110011110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  0 3 5 00000011100100010110|        Branch on condition
    * 16 condb_5  StdIncPc 0 3 2 000010x10xxx11100110|        Branch not taken.
    * 17 condb_5t Fetch    3 4 2 01110110110011011110|        Branch taken.
    * 18 BEQ      condb_2  4 3 2 00111011011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   3 3 2 01101011010001000001| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 2 3 2 00001011001111100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    0 3 2 00000010111000110010| JAL    J-imm is in q.
    * 1c ECAL_BRK ECAL_RET 1 3 2 00101110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 2 3 2 00001011011111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 0 3 4 11101001110011010100|        Q = 4
    * 1f IJ_2     IJ_3     4 3 2 00101011011010110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     5 0 0 01110111110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 2 3 2 00001011000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  0 3 6 00101011110000111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 0 3 2 000010x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 5 0 00111110x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 3 2 000000x01xxx00000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     3 3 2 00111011000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 3 2 01000011110000011101|        Q = rs2
    * 28 _L0x28   SH_1     6 3 0 01111011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 3 2 00111011100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     6 3 0 01111011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 4 01xxxx11010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 3 2 001110x0xxxx00111110| SLL    Shift left
    * 2d MULH_0   MULH_1   0 5 2 00101011100101101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  3 3 2 10111111011001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 2 3 2 00001011011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 2 3 7 00001011011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 3 2 00111111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    4 3 2 01001011010010000110|        Target adr to yy
    * 33 unx33             7 5 0 00xxxxxxxxxxxxxxxxxx| 33: Not in use 
    * 34 JAL_3    Fetch    3 4 2 00110110100111011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   2 5 2 00101111100100110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   2 6 2 00101111110100000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  8 3 5 00xxxx11000111010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  4 3 2 00111011011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 2 3 2 10001011000111100110|        Last shift.
    * 3a SRxI_1   SRxI_2   2 5 6 00101011100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    0 3 2 00000010111000110010| JAL    J-imm is in q.
    * 3c CSRRW_0  CSRRW_1  4 3 2 00011011011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   2 6 6 00101011100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   0 5 0 00111110x00100110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   0 5 0 00111110x00100111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     1 0 8 01110111110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   0 3 4 01000011110000001011|        Q=1
    * 42 MULHU_2  MULHU_3  0 5 6 00101011110001100000|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  0 3 2 00000010100011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  0 3 2 00111111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 4 01101011110001100101|        More check offset
    * 46 ILL_1    ILL_2    8 3 2 00101010x00101000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    8 7 2 00101011000110001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     1 8 8 01111011110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 4 01000011110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     1 8 8 01111011110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  9 9 2 00101010100110110000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 3 2 001110x10xxx00110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  4 5 2 00111011000100101110| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     0 3 2 00xxxxx0xxxx11111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 0 3 4 01101011110011100110|        Prep +4
    * 50 LW_1     StdIncPc 2 1 9 00101111000111100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   8 7 2 00101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     0 1 1 00101111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   8 7 2 00101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     0 6 6 00101011100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 8 7 2 00101011011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 3 2 00100011101101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 3 2 00100011100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    0 3 6 11101111100101101110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   4 3 2 00111111011010011100|        REM = Q to yy
    * 5a SB_1     SB_2     4 5 2 00101111100101011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    0 3 2 00000010111000110010| JAL    J-imm is in q.
    * 5c CSRRS_0  CSRRW_1  4 3 2 00011011011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     4 6 2 00101111110111111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    0 1 1 00101111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   8 7 2 00101010111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  0 3 2 10111111100101000010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 3 3 5 00011011001011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 DIV_8    DIV_7    0 5 4 01101111110011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    0 a 4 01101111110001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  0 3 2 00111111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    0 3 5 000010x10xxx11101111|        Prepare read PC
    * 66 SW_1     SW_2     9 7 2 00111010100111110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    8 7 2 00001010x11010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 2 3 2 00001011000111100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     0 3 2 00101011100010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   4 3 2 00101011000011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     0 b 2 00110011100101111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 3 2 001110x10xxx00110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  4 5 2 00111011000100101110| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    4 3 2 00111010100110111001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   0 3 4 01xxxx11110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    0 6 6 00101011100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 8 7 2 00101011011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 3 2 00011011101000011010|        Invert q. Prepare read mask
    * 73 unalignd straddle 0 3 2 00001011011000010010|  Fr10u Unaligned pc, prep read high hword
    * 74 unx74             7 5 0 00xxxxxxxxxxxxxxxxxx| 74: Not in use 
    * 75 unx75             7 5 0 00xxxxxxxxxxxxxxxxxx| 75: Not in use 
    * 76 Fetchu   Fetch2u  0 3 a 00001111011011010101|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2u  0 1 b 00101111011011010101|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    4 3 2 00000011011010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    0 3 4 11101011110010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     7 7 2 00110010100111110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    0 3 2 00000010111000110010| JAL    J-imm is in q.
    * 7c CSRRC_0  CSRRW_1  4 3 2 00011011011001001001| CSRRC  Decoded CSR adr in yy
    * 7d unx7d             7 5 0 00xxxxxxxxxxxxxxxxxx| 7d: Not in use 
    * 7e NMI_1    NMI_2    8 3 2 00xxxx11000110010000|        Store pc to mepc.
    * 7f unx7f             7 5 0 00xxxxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 0 01110111110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             7 5 0 00xxxxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 DIV_1    DIV_3    3 3 2 00111011000010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    0 3 2 01101011110010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   0 3 2 00111111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    0 1 1 00101111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    2 3 3 11110000x10000110100|        Return address to TRG
    * 87 unx87             7 5 0 00xxxxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 DIV_E    DIV_10   0 a 2 101111x0xxxx10011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 2 3 2 00001011011011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   0 3 6 111011x10xxx00011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 2 3 4 11001011010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 3 2 001111x10xxx00101001| XOR    xor
    * 8d DIV_0    DIV_1    0 c 2 10101111100110000010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     0 3 2 00xxxxx0xxxx11111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 3 4 00101011110010101001|        Q = 1
    * 90 NMI_2    JAL_3    8 d 2 00010011011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   4 d 4 11001000x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    8 3 2 00100110x00100110100|        PC to mepc
    * 93 SW_E2    SW_E3    8 3 2 00101111000110010101|        Store address that faulted
    * 94 SW_E4    JAL_3    4 d 2 00100110x10100110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    0 3 4 11101101110010010100|        Q = 3
    * 96 SH_1     SH_2     4 5 2 00101111100110111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    8 7 2 00001010x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  4 3 2 00111011011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 3 2 00xxxxx0xxxx11111110| Illegal instruction seen (at illegal entrypt)
    * 9a ECALL_6  JAL_3    4 d 2 01100100x10000110100|        mcause = 11
    * 9b unx9b             7 5 0 00xxxxxxxxxxxxxxxxxx| 9b: Not in use 
    * 9c DIV_10   DIV_12   0 a 2 10110011000101101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   0 a 2 10110011000110100010|        RS2 < 0. Branch on sign of RS1
    * 9e SH_4     SH_5     a 8 2 00110011100110011111|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     9 3 2 00110010100111110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    5 0 0 01110111110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  0 3 4 11101001110010110110|        Q = 4
    * a2 DIV_14   LB_6     0 3 2 00101011100010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 2 3 2 00001011000111100110|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   0 5 0 00111110x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 4 01011011110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 3 8 00101110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 3 2 01xxxx11110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    0 a 2 10101011100001111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    4 d 4 01100110x10000110100|        Store 2 to mcause
    * aa DIV_6    DIV_7    0 3 2 101011x10xxx11001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  8 3 2 00101011000110011010|        pc to mepc
    * ac _L0xac   SRx_1    0 3 2 001110x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   0 5 2 101110x10xxx11100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    0 3 2 001110x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 4 01xxxx11110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  0 3 4 11101001110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 aF_SW_3  LDAF_3   4 d 2 01001000x10010010010|        Store 7 to mcause
    * b2 CSRRW_4  Fetch    3 4 4 11110100110011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             7 5 0 00xxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3  unalignd b 3 c 01111111110001110011|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     0 3 2 00000011011010011110|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  0 3 4 11101001110010011010|        Q = 8
    * b7 IJ_3     IJ_4     0 3 4 01110011110010111101|        Construct Q = 1
    * b8 BGE      condb_2  4 3 2 00111011011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    0 3 4 00110011100011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   0 3 2 00011111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     4 6 2 00101111110110110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  4 3 2 00011011011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    3 4 2 00110110101111011110|        Mask and use as PC
    * be IJ_1     IJ_2     0 1 2 00101111100100011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    0 1 2 00101111100111000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    0 3 5 00111011100110001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    4 3 2 00101011011011101001|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   0 5 4 01101111110011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   0 a 4 01101111110010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    3 3 2 00111111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 3 2 00000011101001101111|        ~302
    * c6 IJT_4    ILL_2    8 0 2 00110111101101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   8 3 2 00xxxx11000111001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    0 3 d 10110011110101100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   0 3 2 01011001110010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   0 3 d 10110011110111000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc 8 d 2 00010011011011100110|        mtval = 0.
    * cc OR_0     OR_1     0 3 2 001111x10xxx00100110| OR     or
    * cd REM_0    DIV_1    0 c 2 10101111100110000010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     0 3 2 00xxxxx0xxxx11111110| Illegal instruction seen
    * cf MRET_7   MRET_8   0 3 5 000110x10xxx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 4 01001011110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   3 3 2 00011011011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     0 6 6 00101011100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 8 7 2 00101011011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   4 d 4 01001010x10010010010|        Store 5 to mcause
    * d5 Fetch2u           b 7 e 01111111110000000000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * d6 eILL0c   ILLe     0 3 2 00xxxxx0xxxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  8 7 2 00101011011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  4 3 2 00111011011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  0 3 2 101111x10xxx01000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   0 3 2 001010x10xxx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 7 4 01001010x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  4 3 2 00011011011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  8 7 2 00101011011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   3 1 b 00101111011011110100|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   3 1 b 00101111011011110100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   4 3 2 00101111000011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    0 3 2 00000011100100011101|        Q = RS1
    * e2 MUL_1    MUL_2    0 5 6 00101011110011101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   0 3 6 111011x10xxx00011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   0 3 2 00111111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  0 3 4 11101001110010110001|        Q = 4
    * e6 StdIncPc Fetch    3 4 3 11110100110011011110|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 8 7 2 00101011011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    0 3 2 10111011100111100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    0 3 4 01110011110011000110|        Construct Q = 1
    * ea MULHU_5  MULHU_6  0 3 2 00110011110000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     0 3 2 00011111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 3 2 001111x10xxx00010001| AND    And 
    * ed REMU_0   DIVU_1   0 5 2 101110x10xxx11100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     0 3 2 00xxxxx0xxxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    3 4 4 11110100110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    0 6 6 00101011100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 8 7 2 00101011011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 3 2 000010x10xxx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 3 2 00xxxxx01xxx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  b 7 f 01000111010010110100|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 8 7 2 00101011011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    0 3 4 11000001110011111010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 8 7 2 00001011011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  4 3 2 00111011011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   3 3 4 01111011010011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    0 3 4 01101011110001000101|        Check offset
    * fb SB_3     SB_4     0 3 2 00000011011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  4 3 2 00011011011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 3 2 000010x10xxx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    0 3 2 000010x0xxxx01000110| Illegal
    * ff QINT_0   QINT_1   0 3 2 000010x10xxx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'hb6e6901090e2b904b386bc5a788bbc5a7b09ba070804b4e690e67cbef9d27c01;
   localparam u0_1 = 256'hb6b79cd4b7e6eea62e32b3e6b441b6136cde90e639163c15f8144c76b81af88b;
   localparam u0_2 = 256'hb6e6f642b96a803e3430bc96b821bc963c1db0270804e63590e6bc39b0e67c52;
   localparam u0_3 = 256'he13ae135b903b6492e32b93db1e6b61331d7fd03f93669de0000b486f82bb6e6;
   localparam u0_4 = 256'hbce600feb12e9031a9b0bc663c4bbc66b18fa147bc65fa2b28eabc603c0b7c50;
   localparam u0_5 = 256'haedaf970fdfbb6492e32f95df69cf96e388b3b57b61eb9ebaedaf954aedaf1e6;
   localparam u0_6 = 256'h3ccfa9b9b12e9031397ab0f9b88bb1e6a693a9f290effa2bfc58fcc8b2f7f942;
   localparam u0_7 = 256'h000031900000b6492e3229f2bca836aaf6d5f6d500000000b612ba1ab61eb9ba;
   localparam u0_8 = 256'hbca900fef982d029b4e6d01ab6e6c09c00000434f9f0fa21bc82b0a800007c85;
   localparam u0_9 = 256'h29f2399f31a231680000443400feb613a693f9bbdc946534f195613484923634;
   localparam u0_A = 256'h3cc5803f90e0803fb19ad0c86434b8783c61eed0bcafe63ab1e6b88b9cb67c5e;
   localparam u0_B = 256'hf9c1f91f6bdeb649fdb5fa1a38c0b6133cbd9c9a369efc7300004cde84929cb2;
   localparam u0_C = 256'h904f00fef982d02636e63dc29ca53d6231cb7b473a6ff2e1fc8afccab6e9b988;
   localparam u0_D = 256'hf6f4f6f4b6e5b649a4929091d042b613b6a100fefc00a492b61eb906b6c9bc37;
   localparam u0_E = 256'h4cde00fe90e0d011fa563c223cc6b9e2b61e4cde9cb1fa1ad01abce8391df0ca;
   localparam u0_F = 256'h90c78046907eb649366bbc45b4d9b613b6ab1cfab6db74b408dd90e6b61eb972;
   localparam u1_0 = 256'h23200323032b0323432033070321330703210321032023240320122701120007;
   localparam u1_1 = 256'h4322034e23201322032023203326432334270320035003470323343f03230323;
   localparam u1_2 = 256'h2320332b05220323034463070323630703243323032005030320036223205007;
   localparam u1_3 = 256'h0503050326624321032025622328432383502622252234237500432403232370;
   localparam u1_4 = 256'h0346032045230323992218870344188787228322034603230320056203441087;
   localparam u1_5 = 256'h8722011246224321032045224323036e03220322872206628722011287222192;
   localparam u1_6 = 256'h03444323452303230b2343220322232087209723035003230a4605463351032b;
   localparam u1_7 = 256'h750083207500432103207723034e432001b203a0750075000320032187220662;
   localparam u1_8 = 256'h034203200c2a0323234c036e23200a2b7500233f011203230326332375000007;
   localparam u1_9 = 256'h9323a8230a2b0a2b75004d260320432387204522034e4d22832283224d4c8d21;
   localparam u1_A = 256'h03440323052b03238322032a4d460a2a032413820345050323200322034e5007;
   localparam u1_B = 256'h012201223423432146220321034343230347034e0320b3c77500344f4d24034e;
   localparam u1_C = 256'h035103200c2a03238d2103db032503db83208023032033230a46054643220353;
   localparam u1_D = 256'h31b231b28722432147440322032b432387220320b7e74d448722066233210344;
   localparam u1_E = 256'h344f0320052b0323032103230347032b8722343f034e0323036e056203204322;
   localparam u1_F = 256'h032003200320432103200346334743238720034c8722b7f40320032087220662;
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
   assign d[42] = indir[18];
   assign d[43] = indir[19];
   // replaces = 1000000100100101000000000101001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0042)) cmb_d08(.O(d[8]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
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
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d45(.O(d[45]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0100110011011000001000001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h2f9f)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2a90)) cmb_d27(.O(d[27]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0012)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2200)) cmb_d37(.O(d[37]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0911)) cmb_d40(.O(d[40]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0900)) cmb_d41(.O(d[41]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d44(.O(d[44]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000001000000010110100000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h0f00)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0134)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0978)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0062)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0403)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
