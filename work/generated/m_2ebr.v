/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has  46 columns
 * Removed:  0000000000000000000000000000000000000000000000 These are treated already, removed from consideration
 * Reserved: 0000000000000000000000000000000000010000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 209 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 209 208 209 207 205 207 209 209 209 209   x 209 209 209 208 208 209 208 209 208 209 209 209 209 209 209 209 209 209 209 209 209 209 209 209 208 209 209 208 208 209 208 209 208 207 208  kill col  4  Tbl  44 cols 0000000000000000000000000000000000010000010000 has 205 unique lines.
 * 205 204 205 203     202 205 205 205 205   x 205 205 205 202 204 205 203 205 204 205 205 205 205 205 205 205 205 205 205 205 205 205 205 204 204 205 205 204 204 205 204 205 204 203 204  kill col 14  Tbl  43 cols 0000000000000000000000000000000100010000010000 has 202 unique lines.
 * 202 201 202 200     199 202 202 202 202   x 202 202 202     201 201 201 202 201 202 202 202 202 202 202 202 202 202 202 202 202 202 202 201 201 202 202 200 201 202 201 202 200 199 201  kill col 44  Tbl  42 cols 0100000000000000000000000000000100010000010000 has 199 unique lines.
 * 199 198 199 197     196 199 199 199 199   x 199 199 199     198 198 198 199 198 199 199 199 199 199 199 199 199 199 199 199 199 199 199 198 198 199 199 197 198 198 198 199 197     198  kill col  5  Tbl  41 cols 0100000000000000000000000000000100010000110000 has 196 unique lines.
 * 195 195 196 193         196 196 196 196   x 196 196 196     195 195 195 196 195 196 196 196 196 196 196 196 196 196 196 196 196 196 196 195 195 196 196 194 195 195 195 195 194     195  kill col  3  Tbl  40 cols 0100000000000000000000000000000100010000111000 has 193 unique lines.
 * 191 192 193             193 193 193 193   x 193 193 193     192 192 192 193 192 193 193 193 193 193 193 193 193 193 193 193 193 193 193 191 192 193 193 191 192 192 192 191 191     192  kill col 43  Tbl  39 cols 0110000000000000000000000000000100010000111000 has 191 unique lines.
 * 189 190 191             191 191 191 191   x 191 191 191     190 190 190 190 189 191 190 191 191 191 191 191 191 191 191 191 191 191 191 189 190 191 191 188 188 188 189 189         186  kill col 45  Tbl  38 cols 1110000000000000000000000000000100010000111000 has 186 unique lines.
 * 184 185 186             186 186 186 186   x 186 186 186     185 183 185 185 184 185 185 186 186 186 186 186 186 186 186 186 186 186 186 184 185 186 186 183 182 181 183 183              kill col 40  Tbl  37 cols 1110010000000000000000000000000100010000111000 has 181 unique lines.
 * 179 180 181             181 181 180 181   x 181 181 181     179 177 179 180 179 180 180 181 181 181 181 181 181 181 181 181 181 181 181 179 179 180 181 175 175     176 175              kill col 42  Tbl  36 cols 1111010000000000000000000000000100010000111000 has 175 unique lines.
 * 173 174 175             174 175 174 174   x 175 175 175     172 169 170 174 172 172 174 175 175 175 175 173 175 175 175 175 175 175 175 173 173 174 175 166 166     167                  kill col 39  Tbl  35 cols 1111011000000000000000000000000100010000111000 has 166 unique lines.
 * 164 165 166             164 166 165 163   x 165 166 164     162 159 158 163 163 163 164 166 166 165 165 163 166 166 166 166 166 166 166 163 163 165 166 152         150                  kill col 41  Tbl  34 cols 1111111000000000000000000000000100010000111000 has 150 unique lines.
 * 147 149 150             145 150 149 144   x 149 150 144     144 141 139 147 147 147 147 150 149 149 149 145 150 150 150 150 150 150 150 147 145 149 150 130                              kill col 38  Tbl  33 cols 1111111100000000000000000000000100010000111000 has 130 unique lines.
 * 126 129 130             125 130 125 124   x 128 130 124     121 120 119 128 128 128 127 130 129 129 129 126 130 130 130 130 130 130 130 126 124 129 130                                  kill col 17  Tbl  32 cols 1111111100000000000000000000100100010000111000 has 119 unique lines.
 * 115 118 119             113 119 114 113   x 117 119 113     105 110     117 117 117 115 119 118 118 118 115 119 119 119 119 119 119 119 114 113 118 119                                  kill col 15  Tbl  31 cols 1111111100000000000000000000101100010000111000 has 105 unique lines.
 * 101 104 104             100 105 101 100   x 102 105  99          96     103 102 103 101 105 103 104 104 101 105 105 105 105 105 105 104 100  99 104 105                                  kill col 16  Tbl  30 cols 1111111100000000000000000000111100010000111000 has  96 unique lines.
 *  92  95  95              92  95  90  92   x  92  96  90                  94  93  94  92  96  94  95  95  92  96  96  95  96  96  96  95  90  91  94  96                                  kill col 34  Tbl  29 cols 1111111100010000000000000000111100010000111000 has  90 unique lines.
 *  84  88  89              86  89  83  85   x  85  90  84                  88  87  89  87  90  88  89  89  86  90  90  89  90  90  90  89      83  88  90                                  kill col 35  Tbl  28 cols 1111111100110000000000000000111100010000111000 has  83 unique lines.
 *  78  81  81              79  82  76  78   x  77  83  77                  81  80  82  80  83  81  82  82  79  83  83  82  83  83  83  82          78  83                                  kill col  8  Tbl  27 cols 1111111100110000000000000000111100010100111000 has  76 unique lines.
 *  71  74  74              72  75      71   x  68  75  69                  73  73  75  73  76  74  75  75  72  76  76  75  76  76  75  75          72  76                                  kill col 11  Tbl  26 cols 1111111100110000000000000000111100110100111000 has  68 unique lines.
 *  64  66  66              65  67      63   x      67  62                  65  65  67  65  68  66  67  67  64  68  68  67  68  67  67  67          64  68                                  kill col 13  Tbl  25 cols 1111111100110000000000000000111110110100111000 has  62 unique lines.
 *  59  60  60              59  61      57   x      60                      59  59  61  60  62  60  61  61  58  62  62  61  62  61  61  61          59  62                                  kill col  9  Tbl  24 cols 1111111100110000000000000000111110111100111000 has  57 unique lines.
 *  54  55  55              54  56           x      55                      54  55  56  54  57  55  56  56  53  57  56  56  57  56  54  56          55  56                                  kill col 26  Tbl  23 cols 1111111100110000000100000000111110111100111000 has  53 unique lines.
 *  51  51  51              50  52           x      51                      50  51  52  51  53  51  52  52      53  52  52  53  52  50  52          51  52                                  kill col 32  Tbl  22 cols 1111111100110100000100000000111110111100111000 has  50 unique lines.
 *  48  48  48              47  49           x      48                      47  48  48  48  50  48  49  49      50  49  49  50  49      49          48  49                                  kill col 18  Tbl  21 cols 1111111100110100000100000001111110111100111000 has  47 unique lines.
 *  45  45  45              44  46           x      44                          43  42  43  47  45  46  46      47  46  46  47  45      45          45  46                                  kill col 20  Tbl  20 cols 1111111100110100000100000101111110111100111000 has  42 unique lines.
 *  40  40  40              40  41           x      39                          37      38  41  40  41  39      42  41  41  42  38      40          40  41                                  kill col 19  Tbl  19 cols 1111111100110100000100000111111110111100111000 has  37 unique lines.
 *  35  35  35              35  36           x      34                                  34  36  35  36  34      37  36  36  37  33      35          35  36                                  kill col 31  Tbl  18 cols 1111111100110110000100000111111110111100111000 has  33 unique lines.
 *  32  31  31              31  32           x      31                                  26  32  31  32  30      33  32  32  32          31          31  32                                  kill col 21  Tbl  17 cols 1111111100110110000100001111111110111100111000 has  26 unique lines.
 *  25  24  24              25  25           x      24                                      25  24  25  24      26  24  25  25          24          24  25                                  kill col 36  Tbl  16 cols 1111111101110110000100001111111110111100111000 has  24 unique lines.
 *  23  22  22              23  23           x      22                                      23  22  23  22      24  22  23  23          22              23                                  kill col 33  Tbl  15 cols 1111111101111110000100001111111110111100111000 has  22 unique lines.
 *  21  20  20              21  21           x      20                                      21  20  21  20      22  20  21  21                          21                                  kill col 28  Tbl  14 cols 1111111101111110010100001111111110111100111000 has  20 unique lines.
 *  19  18  18              19  19           x      18                                      19  18  19  18      20      18  19                          19                                  kill col 29  Tbl  13 cols 1111111101111110110100001111111110111100111000 has  18 unique lines.
 *  17  16  16              17  17           x      16                                      17  16  17  16      18          17                          17                                  kill col 25  Tbl  12 cols 1111111101111110110110001111111110111100111000 has  16 unique lines.
 *
 * Round 1: 0000000010000001001001110000000001000011000111  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 208 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x   x 206 204 206   x   x 208 208   x 206   x 208 207 207 208 207 208 207 208 208   x   x   x 208 208   x 208 208   x 208 208 208 208 205 208   x 207 207 208 207 208 207 206 207  kill col  4  Tbl  32 cols 0000000010000001001001110000000001010011010111 has 204 unique lines.
 *   x   x   x 202     201   x   x 204 204   x 202   x 204 201 203 204 202 204 203 204 204   x   x   x 204 204   x 204 204   x 204 204 204 203 201 204   x 203 203 204 203 204 203 202 203  kill col 35  Tbl  31 cols 0000000010100001001001110000000001010011010111 has 201 unique lines.
 *   x   x   x 199     198   x   x 201 201   x 199   x 201 198 200 201 199 201 200 201 201   x   x   x 201 201   x 201 201   x 201 201 201 199     201   x 200 200 201 200 201 200 199 200  kill col 14  Tbl  30 cols 0000000010100001001001110000000101010011010111 has 198 unique lines.
 *   x   x   x 196     194   x   x 198 198   x 196   x 198     197 197 197 198 197 198 198   x   x   x 198 198   x 198 198   x 198 198 198 196     198   x 196 197 198 197 198 196 195 197  kill col  5  Tbl  29 cols 0000000010100001001001110000000101010011110111 has 194 unique lines.
 *   x   x   x 191           x   x 194 194   x 192   x 194     193 193 193 194 193 194 194   x   x   x 194 194   x 194 194   x 194 194 194 192     194   x 192 193 194 193 193 192 191 193  kill col 44  Tbl  28 cols 0100000010100001001001110000000101010011110111 has 191 unique lines.
 *   x   x   x 186           x   x 191 191   x 189   x 191     190 190 190 191 190 191 191   x   x   x 191 191   x 191 191   x 191 191 191 188     191   x 189 190 190 190 190 189     190  kill col  3  Tbl  27 cols 0100000010100001001001110000000101010011111111 has 186 unique lines.
 *   x   x   x               x   x 186 186   x 183   x 186     185 185 185 186 185 186 186   x   x   x 186 186   x 186 186   x 186 186 186 179     186   x 183 184 185 185 184 184     185  kill col 34  Tbl  26 cols 0100000010110001001001110000000101010011111111 has 179 unique lines.
 *   x   x   x               x   x 179 178   x 176   x 178     178 178 178 179 178 179 179   x   x   x 179 179   x 179 179   x 179 179 179         179   x 175 177 178 178 177 175     178  kill col 43  Tbl  25 cols 0110000010110001001001110000000101010011111111 has 175 unique lines.
 *   x   x   x               x   x 174 174   x 172   x 173     172 172 174 174 173 175 173   x   x   x 175 175   x 175 175   x 175 175 175         174   x 169 171 169 171 173         169  kill col 45  Tbl  24 cols 1110000010110001001001110000000101010011111111 has 169 unique lines.
 *   x   x   x               x   x 167 168   x 166   x 167     167 161 168 168 167 168 167   x   x   x 169 169   x 169 169   x 169 169 169         168   x 163 164 162 163 166              kill col 16  Tbl  23 cols 1110000010110001001001110000010101010011111111 has 161 unique lines.
 *   x   x   x               x   x 159 160   x 157   x 159     157     157 160 159 159 159   x   x   x 159 161   x 161 161   x 161 161 161         160   x 151 154 152 155 157              kill col 38  Tbl  22 cols 1110000110110001001001110000010101010011111111 has 151 unique lines.
 *   x   x   x               x   x 148 148   x 146   x 147     147     143 149 149 148 149   x   x   x 149 150   x 151 151   x 151 150 151         149   x     139 138 143 139              kill col 40  Tbl  21 cols 1110010110110001001001110000010101010011111111 has 138 unique lines.
 *   x   x   x               x   x 134 132   x 132   x 134     133     127 136 136 135 136   x   x   x 134 137   x 138 138   x 138 137 138         136   x     123     124 121              kill col 42  Tbl  20 cols 1111010110110001001001110000010101010011111111 has 121 unique lines.
 *   x   x   x               x   x 113 114   x 112   x 116     114     106 118 118 117 119   x   x   x 117 118   x 121 121   x 121 120 121         119   x     102     103                  kill col 39  Tbl  19 cols 1111011110110001001001110000010101010011111111 has 102 unique lines.
 *   x   x   x               x   x  90  93   x  92   x  98      94      89  97  99  98  99   x   x   x  99  99   x 102 101   x 102 101 102          99   x              77                  kill col 41  Tbl  18 cols 1111111110110001001001110000010101010011111111 has  77 unique lines.
 *   x   x   x               x   x  68  67   x  68   x  73      67      66  73  75  75  74   x   x   x  75  74   x  76  76   x  77  76  77          74   x                                  kill col 17  Tbl  17 cols 1111111110110001001001110000110101010011111111 has  66 unique lines.
 *   x   x   x               x   x  58  58   x  59   x  62      55          62  63  65  63   x   x   x  63  63   x  65  65   x  66  65  66          62   x                                  kill col 15  Tbl  16 cols 1111111110110001001001110000111101010011111111 has  55 unique lines.
 *   x   x   x               x   x  47  50   x  50   x  51                  50  51  54  52   x   x   x  51  52   x  54  54   x  55  54  54          51   x                                  kill col  8  Tbl  15 cols 1111111110110001001001110000111101010111111111 has  47 unique lines.
 *   x   x   x               x   x      41   x  42   x  41                  41  42  45  44   x   x   x  44  44   x  46  46   x  47  44  46          44   x                                  kill col 18  Tbl  14 cols 1111111110110001001001110001111101010111111111 has  41 unique lines.
 *   x   x   x               x   x      35   x  36   x  35                      36  39  38   x   x   x  38  38   x  40  40   x  40  38  40          38   x                                  kill col 13  Tbl  13 cols 1111111110110001001001110001111111010111111111 has  35 unique lines.
 *   x   x   x               x   x      30   x  30   x                          30  32  33   x   x   x  32  32   x  34  34   x  33  32  34          33   x                                  kill col 19  Tbl  12 cols 1111111110110001001001110011111111010111111111 has  30 unique lines.
 *   x   x   x               x   x      26   x  25   x                              27  28   x   x   x  27  27   x  29  29   x  28  27  29          28   x                                  kill col 11  Tbl  11 cols 1111111110110001001001110011111111110111111111 has  25 unique lines.
 *   x   x   x               x   x      20   x       x                              22  22   x   x   x  22  22   x  24  24   x  24  22  24          23   x                                  kill col  9  Tbl  10 cols 1111111110110001001001110011111111111111111111 has  20 unique lines.
 *   x   x   x               x   x           x       x                              17  17   x   x   x  16  17   x  19  19   x  19  16  19          19   x                                  kill col 32  Tbl   9 cols 1111111110110101001001110011111111111111111111 has  16 unique lines.
 *
 * Round 2: 0000000001001010110110001100000000000000000000  4 columns for indexes to table representing  9 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 207 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x   x 205 203 205   x   x 207 207   x 204   x 207 206 206 207 205 207 206   x   x   x   x   x   x   x   x   x   x   x   x 207   x 207 204   x   x 206 205 207 206 206 206 205 205  kill col  4  Tbl  23 cols 0000000011001011111111111100000001010011010111 has 203 unique lines.
 *   x   x   x 201     200   x   x 203 203   x 200   x 203 200 202 203 200 203 202   x   x   x   x   x   x   x   x   x   x   x   x 203   x 202 200   x   x 202 201 203 202 202 202 201 201  kill col 35  Tbl  22 cols 0000000011101011111111111100000001010011010111 has 200 unique lines.
 *   x   x   x 198     197   x   x 200 200   x 197   x 200 197 199 200 197 200 199   x   x   x   x   x   x   x   x   x   x   x   x 200   x 198       x   x 199 198 200 199 199 199 198 198  kill col 17  Tbl  21 cols 0000000011101011111111111100100001010011010111 has 197 unique lines.
 *   x   x   x 195     194   x   x 196 197   x 194   x 197 194 195 197     197 196   x   x   x   x   x   x   x   x   x   x   x   x 197   x 195       x   x 196 195 197 196 196 196 195 195  kill col 14  Tbl  20 cols 0000000011101011111111111100100101010011010111 has 194 unique lines.
 *   x   x   x 192     190   x   x 193 194   x 191   x 194     192 192     194 193   x   x   x   x   x   x   x   x   x   x   x   x 194   x 192       x   x 192 192 194 193 193 191 191 192  kill col  5  Tbl  19 cols 0000000011101011111111111100100101010011110111 has 190 unique lines.
 *   x   x   x 186           x   x 189 190   x 186   x 190     188 188     190 189   x   x   x   x   x   x   x   x   x   x   x   x 190   x 188       x   x 188 188 189 189 188 187 187 188  kill col 11  Tbl  18 cols 0000000011101011111111111100100101110011110111 has 186 unique lines.
 *   x   x   x 181           x   x 185 185   x       x 186     184 184     186 185   x   x   x   x   x   x   x   x   x   x   x   x 186   x 184       x   x 183 181 185 184 183 183 183 184  kill col 39  Tbl  17 cols 0000001011101011111111111100100101110011110111 has 181 unique lines.
 *   x   x   x 175           x   x 178 180   x       x 179     178 177     181 180   x   x   x   x   x   x   x   x   x   x   x   x 181   x 179       x   x 176     178 175 176 176 177 178  kill col 41  Tbl  16 cols 0000101011101011111111111100100101110011110111 has 175 unique lines.
 *   x   x   x 167           x   x 169 174   x       x 172     171 170     175 174   x   x   x   x   x   x   x   x   x   x   x   x 175   x 173       x   x 166     168     165 167 169 170  kill col 42  Tbl  15 cols 0001101011101011111111111100100101110011110111 has 165 unique lines.
 *   x   x   x 157           x   x 159 162   x       x 161     158 157     165 164   x   x   x   x   x   x   x   x   x   x   x   x 165   x 160       x   x 154     155         155 154 158  kill col 44  Tbl  14 cols 0101101011101011111111111100100101110011110111 has 154 unique lines.
 *   x   x   x 142           x   x 144 149   x       x 146     142 141     154 153   x   x   x   x   x   x   x   x   x   x   x   x 154   x 147       x   x 135     136         137     139  kill col 38  Tbl  13 cols 0101101111101011111111111100100101110011110111 has 135 unique lines.
 *   x   x   x 120           x   x 121 129   x       x 127     116 116     133 134   x   x   x   x   x   x   x   x   x   x   x   x 134   x 123       x   x         112         111     111  kill col 45  Tbl  12 cols 1101101111101011111111111100100101110011110111 has 111 unique lines.
 *   x   x   x  97           x   x  96 102   x       x 104      91  93     109 110   x   x   x   x   x   x   x   x   x   x   x   x 109   x  97       x   x          85          87          kill col 40  Tbl  11 cols 1101111111101011111111111100100101110011110111 has  85 unique lines.
 *   x   x   x  73           x   x  69  75   x       x  79      67  70      82  84   x   x   x   x   x   x   x   x   x   x   x   x  83   x  72       x   x                      65          kill col 43  Tbl  10 cols 1111111111101011111111111100100101110011110111 has  65 unique lines.
 *   x   x   x  52           x   x  52  52   x       x  59      51  54      63  62   x   x   x   x   x   x   x   x   x   x   x   x  62   x  54       x   x                                  kill col 15  Tbl   9 cols 1111111111101011111111111100101101110011110111 has  51 unique lines.
 *   x   x   x  39           x   x  41  40   x       x  44          40      46  46   x   x   x   x   x   x   x   x   x   x   x   x  49   x  42       x   x                                  kill col  3  Tbl   8 cols 1111111111101011111111111100101101110011111111 has  39 unique lines.
 *   x   x   x               x   x  31  29   x       x  34          29      32  32   x   x   x   x   x   x   x   x   x   x   x   x  37   x  28       x   x                                  kill col 34  Tbl   7 cols 1111111111111011111111111100101101110011111111 has  28 unique lines.
 *   x   x   x               x   x  21  19   x       x  24          20      21  22   x   x   x   x   x   x   x   x   x   x   x   x  26   x           x   x                                  kill col  9  Tbl   6 cols 1111111111111011111111111100101101111011111111 has  19 unique lines.
 *   x   x   x               x   x  13       x       x  16          13      13  13   x   x   x   x   x   x   x   x   x   x   x   x  16   x           x   x                                  kill col 19  Tbl   5 cols 1111111111111011111111111110101101111011111111 has  13 unique lines.
 *
 * Round 3: 0000000000000100000000000001010010000100000000  4 columns for indexes to table representing  5 original columns (uses 13 of 16 lines in indirect table).
 * Direct:  1111111100110000000000000010101100111000111000 20 columns
 * Success. Use 2 EBRs, 26 LUTs.
 */

module m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
   output [47:0] d
   );
   /*                      indirect_index 2
    *                      | indirect_index 1
    * inx         next     | | indirect index 0
    * || ucode    ucode    | | | direct representation
    * 00 LB_0     LB_1     0 0 0 00000001010101101100| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 11010010000111101001|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 2 10111110010101101100| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 FENCE    StdIncPc 3 0 3 11100110000010x01xxx| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 3 3 3 11100110010010101100| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   1 0 3 00000100000010x00xxx| AUIPC  q = imm20 (copy x/8)
    * 06 LB_3     LB_4     2 0 3 00000111000010101010|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     2 0 3 00001001000001101011|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     2 4 0 01011010010110101100| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     2 0 3 10100011000001101000|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     2 4 0 01011010010110101100| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    3 5 4 10000110000010101011|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   2 0 3 00000100000110101001| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    4 0 3 11100010100110x01xxx| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    4 0 3 00010000000110x01xxx| SUB    Subtraction
    * 0f _L0f     StdIncPc 3 3 3 11100110000010101110| LUI    q = imm20
    * 10 SUB_1    LB_6     2 0 3 10100011000111101000|        Q = ~RS2
    * 11 AND_1    ANDI_1   2 0 3 00011010000110101000|        RS1^0xffffffff to Q
    * 12 eFetch3  Fetch    5 6 0 1101111000xxxxxxxxxx|  Fr00  Not in use
    * 13 condb_2  condb_3  2 0 3 00010100000111101000|        ~RS2 in Q
    * 14 condb_3  condb_4  1 0 5 00010101010010101100|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  2 0 6 00010110000100101001|        Branch on condition
    * 16 condb_5  Fetch    0 7 5 11011110001101000110|        Branch not taken.
    * 17 condb_5t BrOpFet  0 4 4 01110100011101101100|        Branch taken.
    * 18 BEQ      condb_2  4 5 3 00010011000110101110| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   3 4 3 01000001010110101100| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 3 3 3 11100110000010101011|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    1 0 4 00110010000010100110| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 0 2 10100110000111100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 3 11100110000010101111|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 0 5 11010100110110001100|        Q = 4
    * 1f IJ_2     IJ_3     3 5 3 10110111000110101110|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     0 5 7 01010010010101101100| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 3 11100110000010101000|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  1 0 8 00111001000110101100|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 FENCEI   StdIncPc 3 0 3 11100110000010x01xxx| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   6 0 0 00110101000111100110| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   1 0 3 00000100000010x00xxx| AUIPC  q = imm20 (copy x/8)
    * 26 OR_1     OR_2     4 4 3 00100111000110101000|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 0 3 00011101010000101100|        Q = rs2
    * 28 _L28     SH_1     2 4 7 10010110010110101100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   2 0 3 00100001000110101000|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     2 4 7 10010110010110101100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 0 5 00110000010xxx101100|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    4 0 3 00111110000110x00xxx| SLL    Shift left
    * 2d MULH_0   MULH_1   7 0 3 11111011000110101001| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e EBRKWFI2 EBREAK_1 4 4 6 11110111000010101010| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 3 3 3 11100110000010101110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 3 9 11100110000010101110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  2 0 3 00101011000111101000|        ~rs2 to Q
    * 32 JAL_1    JAL_2    3 5 3 10000110010010101100|        Target adr to yy
    * 33 JAERR_1  JAERR_2  8 5 3 10000001011010100100|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    0 7 3 11011110001101100001|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   7 3 3 00110110000111101001|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    7 8 3 00000011000111101101|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  8 5 6 11010111000xxx101001|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  4 5 3 00010011000110101110| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 3 11100110100010101001|        Last shift.
    * 3a SRxI_1   SRxI_2   7 3 8 00111101000110101001|        Register to shift to Q
    * 3b _L3b     JAL_1    1 0 4 00110010000010100110| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  4 5 3 01001001000010101110| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   FENCE    7 8 8 00000011000110101001|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   6 0 0 00110101000111100001|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   6 0 0 00111010000111100001|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 0 4 01010000010101101100| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 0 5 00001011010000101100|        Q=1
    * 42 MULHU_2  MULHU_3  7 0 8 10111011000110101100|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  1 0 3 11101010000000100000|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  2 0 3 00101011000111101010| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 0 5 01100101010110101100|        More check offset
    * 46 ILL_1    ILL_2    9 5 3 01000111000101101001|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    1 1 3 10001111000111101001|        Read until Q is offending instruction
    * 48 _L48     SW_1     0 9 4 01100110010110101100| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 0 5 01001011010000101100|        Construct PC storage adr
    * 4a _L4a     SW_1     0 9 4 01100110010110101100| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a a 3 10110000001110100001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   4 0 3 00110001000110x01xxx| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  6 5 3 10011011000110101001| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 0 3 11111110000xxxx00xxx| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 0 5 11100110010110101100|        Prep +4
    * 50 LW_1     StdIncPc 3 b a 11100110000111101001|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   a 5 3 11011010001110100110|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 01010100000111101001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   a 5 3 11011010001110100110|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     7 c 8 11101011000110101001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 8 5 3 00011110001110101110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 0 3 01010111000100101011|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 0 3 10100011000100101000|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 0 8 10111010110111101001|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   4 5 3 10011100000111101110|        REM = Q to yy
    * 5a SB_1     SB_2     7 5 3 01011101000111101001|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    1 0 4 00110010000010100110| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  4 5 3 01001001000010101110| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 d 3 01101010000111101101|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 01110000000111101001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   a 5 3 11011010001110100110|  err   LD AlignFault. Faulting adr to mtval
    * 60 DIV_14   LB_6     1 0 3 10100011000110101000|        RS2 < 0, RS1 >= 0, change sign yy
    * 61 DIV_15   StdIncPc 3 3 3 11100110000010101001|        RS2 < 0, RS1 < 0, yy is true result
    * 62 DIV_8    DIV_7    7 0 5 11001000010111101100|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    1 e 5 01011000010111101100|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  2 0 3 00101011000111101010| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 0 6 11101111000010x01xxx|        Prepare read PC
    * 66 SW_1     SW_2     b 6 3 11110010001110100001|        Write d to a+k until accepted
    * 67 SWE      SW_E2    8 5 3 10010011001010100110|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 3 11100110000010101001|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     1 0 3 10100011000110101000|        RS2 > 0, RS1 < 0, change sign yy
    * 6a SB_3     SB_4     3 0 3 01101011000000101110|        Prepare get back address to use 
    * 6b SB_4     SB_5     0 9 3 01111010001100101001|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   4 0 3 00110001000110x01xxx| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  6 5 3 10011011000110101001| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e LHU_3    ANDI_1   2 0 3 00011010000011101010|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   1 0 5 11001111010xxx101100|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    7 c 8 01101110000110101001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 8 5 3 00011110001110101110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   2 0 3 00011010000010101010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  c 5 3 01110110001100101001|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   3 1 b 11110100000111101001| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  3 0 3 01110011000010x00xxx|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 0 3 01110111000010101000|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  8 5 5 01111101010110100100|        origPC to mepc. Prep read 0
    * 78 DIV_4    DIV_6    3 5 3 10101001000000101110|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    1 0 5 10101000110110101100|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     2 6 3 11110010001100100001|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    1 0 4 00110010000010100110| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  4 5 3 01001001000010101110| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    3 f 3 00110100001101100001|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    8 5 3 10010000000xxx101001|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  8 5 3 01111101001110100001|        mtval is target
    * 80 LBU_0    LBU_1    0 0 0 10000101010101101100| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  8 5 3 01111101000110100001|        Store PC to mepc
    * 82 DIV_1    DIV_3    4 4 3 10101000000110101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    1 0 3 10000010010110101100|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   2 0 3 00100001000111101010| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 11110000000111101001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    4 3 c 00110100110100000100|        Return address to TRG
    * 87 JALRE1   JALRE2   c 5 3 01111111000100100001|  err   Store pc to mepc
    * 88 DIV_E    DIV_10   4 e 3 10011100100111x00xxx|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 3 11100110000010101110|        RS2 == 0, return 0xffffffff
    * 8a ILL_4    ILL_5    1 0 5 10001011010110101100|        Q = 1
    * 8b ILL_5    JAL_3    3 f 5 00110100011101100100|        Store 2 to mcause
    * 8c XOR_0    XOR_1    4 0 3 00101001000111x01xxx| XOR    xor
    * 8d DIV_0    DIV_1    7 e 3 10000010100111101001| DIV    Branch on sign dividend RS1
    * 8e aF_SW_3  LDAF_3   3 f 3 10010010011010000100|        Store 7 to mcause
    * 8f ILL_3    ILL_4    8 5 3 10001010001110101110|        Store illegal instruction to mtval
    * 90 NMI_2    JAL_3    c f 3 00110100001000101110|        mtval = 0.
    * 91 LDAF_2   LDAF_3   3 f 5 10010010111010000100|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    8 5 3 00110100000101100001|        PC to mepc
    * 93 SW_E2    SW_E3    8 5 3 10010101000111101001|        Store address that faulted
    * 94 SW_E4    JAL_3    3 f 3 00110100001101100101|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 0 5 10010100110111001100|        Q = 3
    * 96 SH_1     SH_2     7 5 3 10011010000111101001|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    8 5 3 10010011001010100110|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  4 5 3 00010011000110101110| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     3 0 3 11111110000xxxx00xxx| Illegal instruction seen
    * 9a SH_2     SH_3     7 d 3 10110101000111101101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * 9b MULHU_1  MULHU_2  4 4 3 01000010100111101110|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 9c DIV_10   DIV_12   4 e 3 01101000100100101001|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   4 e 3 01100000100100101001|        RS2 < 0. Branch on sign of RS1
    * 9e SH_4     SH_5     9 9 3 10011111000100101001|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     b 6 3 11110010000100100001|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    0 5 7 01011110010101101100| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  1 0 5 11001110110110001100|        Q = 4
    * a2 DIVU_5   ANDI_1   3 0 8 00011010110111x01xxx|        Transfer rM to rDee
    * a3 LB_6     StdIncPc 3 3 5 11100110110010101100|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * a4 SRxI_0   SRxI_1   6 0 0 00111010000111100110| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   2 0 5 10101111010010101100|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 0 4 11010000000111100110| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 0 3 00101110010xxx101100| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    1 e 3 01111000100110101000|        Branch on sign divisor RS2
    * a9 DIV_6    DIV_7    3 0 3 11001000100111x01xxx|        Write M. Prepare shift
    * aa ECALL_6  JAL_3    3 f 3 00110100011101000100|        mcause = 11
    * ab EBREAK_2 ECALL_6  8 5 3 10101010000110101001|        pc to mepc
    * ac _Lac     SRx_1    4 0 3 00111111000110x00xxx| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   6 0 3 11100000100110x01xxx| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _Lae     SRx_1    4 0 3 00111111000110x00xxx| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 0 5 11000101010xxx101100|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  1 0 5 10110010110110001100|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  Fetch    5 6 0 1101111000xxxxxxxxxx|        Not in use
    * b2 CSRRW_4  Fetch    0 7 5 11011110111101000100|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1 Fetch    5 6 0 1101111000xxxxxxxxxx|        Not in use
    * b4 CSRRWI_2 Fetch    5 6 0 1101111000xxxxxxxxxx|        Not in use
    * b5 SH_3     SH_4     3 0 3 10011110000000101110|        Prepare get back address to use 
    * b6 CSRRCI_1 Fetch    5 6 0 1101111000xxxxxxxxxx|        Not in use
    * b7 IJ_3     IJ_4     2 0 3 10111101010100001100|        Construct Q = 3
    * b8 BGE      condb_2  4 5 3 00010011000110101110| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    2 0 5 11000000000100101000|        Calc carry of RS2+0xFFFFFFFF
    * ba DIV_C    DIV_e    2 5 3 10111001000110100001|        rM to yy. Q=ffffffff
    * bb MULHU_3  MULHU_2  2 0 3 01000010100111101001|        Shift Q and rM. Prepare read rs1
    * bc CSRRWI_0 CSRRW_1  4 5 3 01001001000010101110| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    0 7 3 11011110001101100011|        Mask and use as PC
    * be IJ_1     IJ_2     1 1 3 00011111000111101001|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 1 3 11000001000111101001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    2 0 6 10001000000110101001|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    3 5 3 11101001000110101110|        Read word is to be masked with ~3u
    * c2 DIVU_3   DIVU_2   7 0 5 11001010010111101100|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   1 e 5 10100010010111101100|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    4 4 3 11100001000111101010| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 0 3 01101111000000101010|        ~302
    * c6 IJT_4    ILL_2    9 5 3 01000111000101101011|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   8 5 3 11001011000xxx101001|        Store pc to mepc.
    * c8 DIV_7    DIV_8    2 0 d 01100010100100101101|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   2 0 3 10100101010010001100|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   2 0 d 11000010100100101101|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc c f 3 11100110001000101110|        mtval = 0.
    * cc OR_0     OR_1     4 0 3 00100110000111x01xxx| OR     or
    * cd REM_0    DIV_1    7 e 3 10000010100111101001| REM    Branch on sign dividend RS1
    * ce ECALL_5  ECALL_6  1 0 5 10101010110110001100|        Q = 8
    * cf MRET_7   MRET_8   4 0 6 01001111000010x01xxx|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 0 5 00110111010010101100| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 4 3 11001001000010101110| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     7 c 8 00000110000110101001|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 8 5 3 00011110001110101110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   3 f 5 10010010011010100100|        Store 5 to mcause
    * d5 eFetch2  Fetch    5 6 0 1101111000xxxxxxxxxx|  Fr00  Not in use
    * d6 eILL0c   ILLe     3 0 3 11111110000xxxx00xxx| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  8 5 3 10100001001110101110|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  4 5 3 00010011000110101110| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  4 0 3 01000010100111x01xxx|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 0 3 10010001000110x01xxx|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   3 5 5 10010010011010100100|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  4 5 3 01001001000010101110| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  8 5 3 11100101001110101110|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   3 4 e 11110100000011101110|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   3 7 b 11110100000111101110|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   3 5 3 11001010000111101000|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 0 3 00011101000000101001|        Q = RS1
    * e2 MUL_1    MUL_2    7 0 8 11101000000110101100|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 0 8 00011010110111x01xxx|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   2 0 3 00011010000111101010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 0 5 10001110110110001100|        Q = 4
    * e6 StdIncPc Fetch    0 7 5 11011110111101000100|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 8 5 3 00011110001110101110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    2 0 3 11100010100110101001|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    2 0 3 11000110010100001100|        Construct Q = 3
    * ea MULHU_5  MULHU_6  2 0 3 00100010000100101100|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     2 0 3 01010110000011101010|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    4 0 3 00010001000111x01xxx| AND    And 
    * ed REMU_0   DIVU_1   6 0 3 11100000100110x01xxx| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 0 3 11111110000xxxx00xxx| Illegal instruction seen
    * ef WFI_5    Fetch    0 7 5 11011110111101000100|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    7 c 8 01110010000110101001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 8 5 3 00011110001110101110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 0 3 11100110000010x01xxx|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 0 3 11011101000xxxx00xxx|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            b 4 f 00000000011111111100|  Fr00  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 8 5 3 11011011001110101110|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 0 5 11111010110000001100| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 8 5 3 10101011001010101110| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  4 5 3 00010011000110101110| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   4 4 5 11011001010110101100|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    1 0 5 01000101010110101100|        Check offset
    * fb MULH_1   MULH_2   3 5 3 11111001000110101000|        Store ~rs1 to Ryy. Prep construct 1.
    * fc CSRRCI_0 CSRRW_1  4 5 3 01001001000010101110| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 0 3 01111110000010x01xxx| NMI    Get current PC
    * fe ILLe     ILL_1    3 0 3 01000110000010x01xxx| Illegal
    * ff QINT_0   QINT_1   3 0 3 11000111000010x01xxx| INT    Get current PC
    */
   localparam u0_0 = 256'h60ae0188298841a960aba5ac3068a5ac906b70aa408064ac6088e56c21e9156c;
   localparam u0_1 = 256'h71ae4d8c60af61e620a660ab15ac31ae476ce346612954ac41e8e000a1a831e8;
   localparam u0_2 = 256'h60ae70aab1a9e180042c65ac11a865acd42c71a8408051e6608891ac60a8256c;
   localparam u0_3 = 256'ha1e151e131a990ae20a6d1a968a931ae702931ed61e9e36116a464acb1e860ae;
   localparam u0_4 = 256'h65ace000b1a9118803a165acb42c65acf1e9716955acb1eaa020b1acb42c056c;
   localparam u0_5 = 256'ha3a601e9a1ed90ae20a6d1e9c1eeade93128712be3aeb1a9a3a641e9a3a661e9;
   localparam u0_6 = 256'hf42ca0eab1a91188a329b02e31a860a932a623a1f088b1ea85ec85ec60a931a8;
   localparam u0_7 = 256'hd3a10029436190ae20a623218dac902ed5a470a8308041e96329a0aae3aee1a9;
   localparam u0_8 = 256'ha3ae268429e991c84764b5ac60aec9c0f1214d0401e911ea25ac81a8d1a1556c;
   localparam u0_9 = 256'h2121f1290929892929ee51ede00031ae32a6a1e94dcc436551e941612e84422e;
   localparam u0_A = 256'h542cf1800988f180a1a9474489c889a8e42c01e6f4aca1e66cacadc8ed8ce56c;
   localparam u0_B = 256'h11e9f1e9e36390ae29e991a1012831aed50ce000e02ee000e000ef44e0002d8c;
   localparam u0_C = 256'hf088ad8c29e961c8622e292d548c292db029716bf02a11ea25eca5ec91ae81a9;
   localparam u0_D = 256'h41ee40ee53ae90ae26a4118829c831ae13aee000e00026a4e3ae61a990ae74ac;
   localparam u0_E = 256'hef44e000098811c860ea212c650c29a9e3aeef44ed8ca1eaadc881acd029a1e8;
   localparam u0_F = 256'h70886088e08890ae91a855ac95ac31aeb2aeac0cb3ae07fcd0006088e3ae21a9;
   localparam u1_0 = 256'h333e4031403e203035482405203a2405203020301030333e303e222b111d0000;
   localparam u1_1 = 256'h353b105d333e102a1043333e343445310447075d206110512031560d2031203a;
   localparam u1_2 = 256'h333e446f703f403330532479203224791031443210306003303e1083333e0575;
   localparam u1_3 = 256'h600360037880453410437383333e4531856d78307333073d853835382032339e;
   localparam u1_4 = 256'h105e303f65394033aa3b0946105409461138953410562032103e708b10500045;
   localparam u1_5 = 256'ha53d11177d364534104375354539108b103a103585317c8ea53d1115a53d3bae;
   localparam u1_6 = 256'h105c20316539403309373036103a333e8539b63f306e20321e55705c333e103a;
   localparam u1_7 = 256'h853785393f3345341043263f105a353a85571037303731bfc537203185317c86;
   localparam u1_8 = 256'h85383f397e3840323f531058333e4e39c53743c3111f20321038443a85370008;
   localparam u1_9 = 256'hb63f99394e364e3644347d3b303f45318539753910593f33853985333f59cf33;
   localparam u1_A = 256'h105c4033603e4033853a3f33303c1e371032104d205a6003335e3081105c0575;
   localparam u1_B = 256'h113c1131073d45342034253b205c4531203b560d3039560d560d075d560d105b;
   localparam u1_C = 256'h4064105a7e384032cf3e20dc203a20d6853c95341036443e1e5a705c353e2068;
   localparam u1_D = 256'h37bf34ef853e45343559303940344531853a303f560d3f5985317c80443c1053;
   localparam u1_E = 256'h075d303f603e403120352032203c203e8531075d105820313081708e1031353c;
   localparam u1_F = 256'h303c303430374534353f1054445d4531853a105f853db4f0103d303e85317c87;
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

   assign d[3] = indir[0];
   assign d[4] = indir[1];
   assign d[5] = indir[2];
   assign d[9] = indir[3];
   assign d[10] = indir[4];
   assign d[11] = indir[5];
   assign d[14] = indir[6];
   assign d[15] = indir[7];
   assign d[17] = indir[8];
   assign d[19] = indir[9];
   assign d[34] = indir[10];
   assign d[35] = indir[11];
   assign d[38] = indir[12];
   assign d[39] = indir[13];
   assign d[40] = indir[14];
   assign d[41] = indir[15];
   assign d[42] = indir[16];
   assign d[43] = indir[17];
   assign d[44] = indir[18];
   assign d[45] = indir[19];
   // replaces = 0000000010000001001001110000000001000011000111
   SB_LUT4 #(.LUT_INIT(16'h0102)) cmb_d00(.O(d[0]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1220)) cmb_d01(.O(d[1]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h3020)) cmb_d02(.O(d[2]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d06(.O(d[6]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h4800)) cmb_d07(.O(d[7]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hff7e)) cmb_d12(.O(d[12]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h8000)) cmb_d22(.O(d[22]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0094)) cmb_d23(.O(d[23]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d24(.O(d[24]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0802)) cmb_d27(.O(d[27]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0c00)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1000)) cmb_d37(.O(d[37]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0000000001001010110110001100000000000000000000
   SB_LUT4 #(.LUT_INIT(16'ha928)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'ha0b0)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0882)) cmb_d25(.O(d[25]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3100)) cmb_d26(.O(d[26]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d28(.O(d[28]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8400)) cmb_d29(.O(d[29]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5207)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000000000000100000000000001010010000100000000
   SB_LUT4 #(.LUT_INIT(16'h0e87)) cmb_d08(.O(d[8]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1f1f)) cmb_d13(.O(d[13]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1a55)) cmb_d16(.O(d[16]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1f00)) cmb_d18(.O(d[18]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0201)) cmb_d32(.O(d[32]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
