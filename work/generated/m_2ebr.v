/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 46 columns
 * Removed:  0000000000000000000000000000000000000000000000 These are treated already, removed from consideration
 * Reserved: 0000000000000000000000000001000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 204 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 
 * 203 203 204 202 204 203 202 203 204 203 204 202 200 203 204 204 204 204   x 204 204 204 203 203 204 203 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 203 204 203  kill col 12  Tbl  44 cols 0000000000000000000000000001000001000000000000 has 200 unique lines.
 * 199 199 200 198 200 199 198 199 200 199 200 198     198 200 200 200 200   x 200 200 200 197 199 200 198 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 199 199 200 199  kill col 22  Tbl  43 cols 0000000000000000000000010001000001000000000000 has 197 unique lines.
 * 195 196 197 195 197 195 194 196 197 196 197 195     195 197 197 197 197   x 197 197 197     196 196 196 197 197 197 197 197 197 197 197 197 197 197 197 197 197 197 197 196 196 197 196  kill col  6  Tbl  42 cols 0000000000000000000000010001000001000001000000 has 194 unique lines.
 * 192 193 193 192 194 192     193 194 193 194 192     192 194 194 194 194   x 194 194 194     193 193 193 194 194 194 194 194 194 194 194 194 194 194 194 194 194 194 194 193 193 194 193  kill col 13  Tbl  41 cols 0000000000000000000000010001000011000001000000 has 192 unique lines.
 * 190 191 191 190 191 190     191 191 191 192 189         192 192 192 192   x 192 192 192     191 191 191 192 192 192 192 192 192 192 192 191 192 192 192 192 192 192 192 191 191 192 191  kill col 11  Tbl  40 cols 0000000000000000000000010001000011100001000000 has 189 unique lines.
 * 187 188 188 187 187 187     188 188 188 189             189 189 189 189   x 189 189 189     188 188 188 189 189 189 189 189 189 189 189 188 189 189 189 189 189 189 189 185 188 189 188  kill col 42  Tbl  39 cols 0001000000000000000000010001000011100001000000 has 185 unique lines.
 * 182 184 184 183 183 183     184 184 184 185             185 185 185 185   x 184 185 185     184 184 184 185 185 185 185 185 185 185 185 184 185 185 185 185 185 185 185     184 185 184  kill col  0  Tbl  38 cols 0001000000000000000000010001000011100001000001 has 182 unique lines.
 *     181 181 178 179 179     180 181 181 182             182 182 182 182   x 181 182 182     181 181 181 182 181 182 182 182 182 182 182 181 182 182 182 182 182 182 182     181 182 181  kill col  3  Tbl  37 cols 0001000000000000000000010001000011100001001001 has 178 unique lines.
 *     174 175     174 173     176 177 177 178             177 178 178 178   x 177 178 178     176 177 177 178 177 178 178 178 178 178 178 176 178 178 178 178 178 178 178     177 178 177  kill col  5  Tbl  36 cols 0001000000000000000000010001000011100001101001 has 173 unique lines.
 *     167 168     167         165 172 172 173             172 173 173 173   x 172 173 173     171 172 171 172 172 173 172 173 173 173 173 171 173 173 173 173 173 173 173     170 173 172  kill col  7  Tbl  35 cols 0001000000000000000000010001000011100011101001 has 165 unique lines.
 *     157 156     155             163 164 165             163 164 165 165   x 164 165 164     163 160 162 164 164 163 164 165 165 165 165 162 165 165 165 165 165 165 165     163 165 164  kill col  4  Tbl  34 cols 0001000000000000000000010001000011100011111001 has 155 unique lines.
 *     139 140                     153 154 155             152 154 154 153   x 154 155 151     151 148 148 153 153 153 153 155 155 155 155 152 155 155 155 155 155 155 155     152 154 154  kill col  1  Tbl  33 cols 0001000000000000000000010001000011100011111011 has 139 unique lines.
 *         117                     134 138 139             136 138 136 137   x 135 139 133     134 130 130 136 137 135 136 139 139 139 138 136 139 139 139 139 139 139 139     132 138 138  kill col  2  Tbl  32 cols 0001000000000000000000010001000011100011111111 has 117 unique lines.
 *                                 112 116 117             112 116 114 114   x 112 117 111     111 107 108 115 116 114 114 117 116 116 116 113 117 117 117 117 117 117 117     110 116 116  kill col 24  Tbl  31 cols 0001000000000000000001010001000011100011111111 has 107 unique lines.
 *                                 101 106 107             102 106 101 104   x 102 107 101     101      99 105 106 105 104 107 106 106 106 103 107 107 106 107 107 107 107     101 105 106  kill col 25  Tbl  30 cols 0001000000000000000011010001000011100011111111 has  99 unique lines.
 *                                  93  98  99              94  98  92  95   x  94  99  93      89          97  98  98  96  99  98  98  98  95  99  99  98  99  99  99  99      93  97  98  kill col 23  Tbl  29 cols 0001000000000000000011110001000011100011111111 has  89 unique lines.
 *                                  83  87  88              85  88  82  84   x  84  89  83                  87  86  87  86  89  87  88  88  85  89  89  88  89  89  89  88      83  87  88  kill col 16  Tbl  28 cols 0001000000000000000011110001010011100011111111 has  82 unique lines.
 *                                  76  80  81              78  81      77   x  75  81  75                  79  79  80  79  81  80  81  81  78  82  82  81  82  82  81  81      76  80  81  kill col 21  Tbl  27 cols 0001000000000000000011111001010011100011111111 has  75 unique lines.
 *                                  70  73  74              71  74      70   x  68  73                      72  72  73  73  74  73  74  74  71  75  75  74  75  75  74  74      69  73  74  kill col 19  Tbl  26 cols 0001000000000000000011111011010011100011111111 has  68 unique lines.
 *                                  64  66  67              65  67      63   x      66                      65  65  66  66  67  66  67  67  64  68  68  67  68  67  67  67      62  66  67  kill col 43  Tbl  25 cols 0011000000000000000011111011010011100011111111 has  62 unique lines.
 *                                  59  60  60              59  61      57   x      60                      59  59  60  60  61  60  61  61  58  62  62  61  62  61  61  61          59  61  kill col 17  Tbl  24 cols 0011000000000000000011111011110011100011111111 has  57 unique lines.
 *                                  54  55  55              54  56           x      55                      54  55  55  53  56  55  56  56  53  57  56  56  57  56  54  56          55  55  kill col 34  Tbl  23 cols 0011000000010000000011111011110011100011111111 has  53 unique lines.
 *                                  51  51  51              50  52           x      51                      50  51  51  50  52  51  52  52      53  52  52  53  52  50  52          51  51  kill col 40  Tbl  22 cols 0011010000010000000011111011110011100011111111 has  50 unique lines.
 *                                  48  48  48              47  49           x      48                      47  48  47  47  49  48  49  49      50  49  49  50  49      49          48  48  kill col 29  Tbl  21 cols 0011010000010000100011111011110011100011111111 has  47 unique lines.
 *                                  45  45  45              44  46           x      45                      43  43  42      46  45  46  45      47  46  46  47  42      46          45  45  kill col 39  Tbl  20 cols 0011011000010000100011111011110011100011111111 has  42 unique lines.
 *                                  40  40  40              40  41           x      40                      38  37  36      41  40  41  40      42  41  41  42          39          40  40  kill col 28  Tbl  19 cols 0011011000010000110011111011110011100011111111 has  36 unique lines.
 *                                  35  34  34              34  35           x      34                      32  32          35  34  35  33      36  34  35  35          33          34  34  kill col 27  Tbl  18 cols 0011011000010000111011111011110011100011111111 has  32 unique lines.
 *                                  31  30  30              30  31           x      30                      28              31  30  31  29      32  30  31  31          29          30  30  kill col 26  Tbl  17 cols 0011011000010000111111111011110011100011111111 has  28 unique lines.
 *                                  27  26  26              27  27           x      26                                      26  26  27  25      28  26  27  27          26          26  26  kill col 33  Tbl  16 cols 0011011000011000111111111011110011100011111111 has  25 unique lines.
 *                                  24  23  23              24  24           x      23                                      23  23  24          24  23  24  24          23          23  24  kill col 44  Tbl  15 cols 0111011000011000111111111011110011100011111111 has  23 unique lines.
 *                                  22  21  21              22  22           x      21                                      21  21  22          22  21  22  22          21              22  kill col 41  Tbl  14 cols 0111111000011000111111111011110011100011111111 has  21 unique lines.
 *                                  20  19  19              20  20           x      19                                      19  19  20          20  19  20  20                          20  kill col 36  Tbl  13 cols 0111111001011000111111111011110011100011111111 has  19 unique lines.
 *                                  18  17  17              18  18           x      17                                      17  17  18          18      17  18                          18  kill col 37  Tbl  12 cols 0111111011011000111111111011110011100011111111 has  17 unique lines.
 *                                  16  15  15              16  16           x      15                                      15  15  16          16          16                          16  kill col 31  Tbl  11 cols 0111111011011010111111111011110011100011111111 has  15 unique lines.
 *
 * Round 1: 1000000100100101000000000100001100011100000000  4 columns for indexes to table representing 11 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 39
 * 202 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 
 * 201 201 202 200 202 201 200 201   x   x   x 200 198 201   x   x 202 202   x 200   x 202 201 201 202 201 202 202 202 202   x 202   x 202 202   x 202 202   x 202 202 202 202 199 202   x  kill col 12  Tbl  33 cols 1000000100100101000000000101001101011100000000 has 198 unique lines.
 * 197 197 198 196 198 197 196 197   x   x   x 196     196   x   x 198 198   x 196   x 198 195 197 198 196 198 198 198 198   x 198   x 198 198   x 198 198   x 198 198 198 197 195 198   x  kill col 43  Tbl  32 cols 1010000100100101000000000101001101011100000000 has 195 unique lines.
 * 194 194 195 193 195 194 193 194   x   x   x 193     193   x   x 195 195   x 192   x 195 192 194 195 193 195 195 195 195   x 195   x 195 195   x 195 195   x 195 195 195 194     195   x  kill col 22  Tbl  31 cols 1010000100100101000000010101001101011100000000 has 192 unique lines.
 * 190 191 192 190 192 190 189 191   x   x   x 190     189   x   x 192 192   x 189   x 192     191 191 191 192 192 192 192   x 192   x 192 192   x 192 192   x 192 192 192 191     192   x  kill col 19  Tbl  30 cols 1010000100100101000000010111001101011100000000 has 189 unique lines.
 * 186 188 189 187 189 187 186 188   x   x   x 187     186   x   x 189 189   x       x 189     188 188 188 189 189 189 189   x 189   x 189 189   x 189 189   x 189 189 189 188     189   x  kill col 13  Tbl  29 cols 1010000100100101000000010111001111011100000000 has 186 unique lines.
 * 183 185 186 184 185 184 183 185   x   x   x 183           x   x 186 186   x       x 186     185 185 185 186 186 186 186   x 186   x 186 186   x 186 186   x 186 186 186 185     186   x  kill col 11  Tbl  28 cols 1010000100100101000000010111001111111100000000 has 183 unique lines.
 * 180 181 183 180 181 180 179 182   x   x   x               x   x 181 183   x       x 183     182 182 182 183 183 183 183   x 183   x 183 183   x 183 183   x 183 183 183 178     183   x  kill col 42  Tbl  27 cols 1011000100100101000000010111001111111100000000 has 178 unique lines.
 * 175 176 177 175 175 173 174 177   x   x   x               x   x 176 178   x       x 178     177 177 177 178 178 178 178   x 178   x 178 178   x 178 178   x 178 178 178         178   x  kill col  5  Tbl  26 cols 1011000100100101000000010111001111111100100000 has 173 unique lines.
 * 169 170 170 168 169     169 164   x   x   x               x   x 170 173   x       x 172     170 171 172 173 173 173 173   x 173   x 173 173   x 173 173   x 173 173 173         172   x  kill col  7  Tbl  25 cols 1011000100100101000000010111001111111110100000 has 164 unique lines.
 * 160 158 160 156 159     160       x   x   x               x   x 161 164   x       x 163     162 156 162 164 164 163 164   x 164   x 163 164   x 164 164   x 164 164 164         163   x  kill col 24  Tbl  24 cols 1011000100100101000001010111001111111110100000 has 156 unique lines.
 * 152 150 150 148 150     151       x   x   x               x   x 153 156   x       x 155     152     152 156 156 154 156   x 156   x 155 156   x 156 156   x 156 156 156         155   x  kill col  3  Tbl  23 cols 1011000100100101000001010111001111111110101000 has 148 unique lines.
 * 141 136 139     137     141       x   x   x               x   x 139 148   x       x 144     144     143 148 148 144 148   x 148   x 147 148   x 148 148   x 148 148 148         146   x  kill col  1  Tbl  22 cols 1011000100100101000001010111001111111110101010 has 136 unique lines.
 * 123     126     124     126       x   x   x               x   x 127 135   x       x 131     131     129 135 136 132 136   x 136   x 135 136   x 136 136   x 136 135 136         133   x  kill col  0  Tbl  21 cols 1011000100100101000001010111001111111110101011 has 123 unique lines.
 *         106     109     109       x   x   x               x   x 112 121   x       x 118     116     112 120 122 120 123   x 123   x 119 122   x 123 123   x 123 122 123         120   x  kill col  2  Tbl  20 cols 1011000100100101000001010111001111111110101111 has 106 unique lines.
 *                  86      84       x   x   x               x   x  96 101   x       x 101      97      94 103 105 103 104   x 106   x 101 102   x 106 106   x 106 105 106         102   x  kill col  6  Tbl  19 cols 1011000100100101000001010111001111111111101111 has  84 unique lines.
 *                  66               x   x   x               x   x  74  80   x       x  79      77      74  80  83  81  82   x  83   x  80  82   x  84  83   x  84  83  84          80   x  kill col  4  Tbl  18 cols 1011000100100101000001010111001111111111111111 has  66 unique lines.
 *                                   x   x   x               x   x  58  61   x       x  61      62      60  62  64  64  63   x  64   x  63  63   x  66  65   x  66  65  66          63   x  kill col 16  Tbl  17 cols 1011000100100101000001010111011111111111111111 has  58 unique lines.
 *                                   x   x   x               x   x      51   x       x  54      54      52  54  56  54  55   x  55   x  56  55   x  58  57   x  58  57  58          54   x  kill col 17  Tbl  16 cols 1011000100100101000001010111111111111111111111 has  51 unique lines.
 *                                   x   x   x               x   x           x       x  48      46      45  47  48  47  47   x  48   x  49  48   x  51  50   x  51  49  51          48   x  kill col 25  Tbl  15 cols 1011000100100101000011010111111111111111111111 has  45 unique lines.
 *                                   x   x   x               x   x           x       x  41      38          40  42  42  40   x  42   x  42  42   x  45  44   x  45  43  45          42   x  kill col 23  Tbl  14 cols 1011000100100101000011110111111111111111111111 has  38 unique lines.
 *                                   x   x   x               x   x           x       x  34                  33  34  34  33   x  35   x  35  35   x  37  37   x  37  35  37          36   x  kill col 29  Tbl  13 cols 1011000100100101100011110111111111111111111111 has  33 unique lines.
 *                                   x   x   x               x   x           x       x  29                  28  29  27       x  30   x  30  31   x  32  32   x  29  30  32          31   x  kill col 28  Tbl  12 cols 1011000100100101110011110111111111111111111111 has  27 unique lines.
 *                                   x   x   x               x   x           x       x  24                  24  25           x  24   x  25  25   x  25  26   x  21  23  26          25   x  kill col 39  Tbl  11 cols 1011001100100101110011110111111111111111111111 has  21 unique lines.
 *                                   x   x   x               x   x           x       x  19                  17  19           x  19   x  20  20   x  19  20   x      18  19          19   x  kill col 26  Tbl  10 cols 1011001100100101110111110111111111111111111111 has  17 unique lines.
 *                                   x   x   x               x   x           x       x  15                      15           x  14   x  16  16   x  15  16   x      15  15          15   x  kill col 31  Tbl   9 cols 1011001100100111110111110111111111111111111111 has  14 unique lines.
 *
 * Round 2: 0100110011011000001000001000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 14 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 201 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 
 * 200 199 200 199 201 200 198 200   x   x   x 199 197 200   x   x 201 201   x 199   x   x 200 199 201 199 200   x 201 201   x 201   x   x   x   x   x   x   x 201   x   x 201 198   x   x  kill col 12  Tbl  24 cols 1100110111111101001000001101001101011100000000 has 197 unique lines.
 * 196 195 196 195 197 196 194 196   x   x   x 195     195   x   x 197 197   x 195   x   x 194 195 197 194 196   x 197 197   x 197   x   x   x   x   x   x   x 197   x   x 196 194   x   x  kill col 43  Tbl  23 cols 1110110111111101001000001101001101011100000000 has 194 unique lines.
 * 193 192 193 192 194 193 191 193   x   x   x 192     192   x   x 194 194   x 191   x   x 191 192 194 191 193   x 194 194   x 194   x   x   x   x   x   x   x 194   x   x 193       x   x  kill col 25  Tbl  22 cols 1110110111111101001010001101001101011100000000 has 191 unique lines.
 * 190 188 190 189 191 190 188 190   x   x   x 189     189   x   x 191 191   x 188   x   x 188 188 191     190   x 191 191   x 191   x   x   x   x   x   x   x 191   x   x 190       x   x  kill col 23  Tbl  21 cols 1110110111111101001010101101001101011100000000 has 188 unique lines.
 * 187 185 187 186 187 187 185 186   x   x   x 186     186   x   x 188 188   x 185   x   x 185     188     187   x 188 188   x 188   x   x   x   x   x   x   x 188   x   x 187       x   x  kill col 22  Tbl  20 cols 1110110111111101001010111101001101011100000000 has 185 unique lines.
 * 183 180 184 182 184 183 181 183   x   x   x 183     182   x   x 185 185   x 182   x   x         184     184   x 185 185   x 185   x   x   x   x   x   x   x 185   x   x 184       x   x  kill col  1  Tbl  19 cols 1110110111111101001010111101001101011100000010 has 180 unique lines.
 * 177     179 174 178 176 173 178   x   x   x 178     177   x   x 180 180   x 177   x   x         178     179   x 180 180   x 180   x   x   x   x   x   x   x 180   x   x 179       x   x  kill col  6  Tbl  18 cols 1110110111111101001010111101001101011101000010 has 173 unique lines.
 * 167     170 164 168 168     171   x   x   x 170     169   x   x 173 173   x 170   x   x         169     171   x 173 173   x 173   x   x   x   x   x   x   x 173   x   x 171       x   x  kill col  3  Tbl  17 cols 1110110111111101001010111101001101011101001010 has 164 unique lines.
 * 151     154     154 153     160   x   x   x 158     159   x   x 164 163   x 160   x   x         156     162   x 164 164   x 164   x   x   x   x   x   x   x 164   x   x 161       x   x  kill col  0  Tbl  16 cols 1110110111111101001010111101001101011101001011 has 151 unique lines.
 *         133     135 137     140   x   x   x 143     144   x   x 150 149   x 145   x   x         139     149   x 149 151   x 150   x   x   x   x   x   x   x 151   x   x 148       x   x  kill col  2  Tbl  15 cols 1110110111111101001010111101001101011101001111 has 133 unique lines.
 *                 113 119     117   x   x   x 124     125   x   x 130 130   x 127   x   x         118     130   x 131 132   x 131   x   x   x   x   x   x   x 133   x   x 128       x   x  kill col  4  Tbl  14 cols 1110110111111101001010111101001101011101011111 has 113 unique lines.
 *                      95      94   x   x   x 104     104   x   x 109 107   x 107   x   x          97     107   x 110 110   x 111   x   x   x   x   x   x   x 113   x   x 106       x   x  kill col  7  Tbl  13 cols 1110110111111101001010111101001101011111011111 has  94 unique lines.
 *                      72           x   x   x  86      84   x   x  87  85   x  88   x   x          80      88   x  90  90   x  90   x   x   x   x   x   x   x  94   x   x  87       x   x  kill col  5  Tbl  12 cols 1110110111111101001010111101001101011111111111 has  72 unique lines.
 *                                   x   x   x  66      62   x   x  63  63   x  67   x   x          59      65   x  67  65   x  69   x   x   x   x   x   x   x  71   x   x  63       x   x  kill col 24  Tbl  11 cols 1110110111111101001011111101001101011111111111 has  59 unique lines.
 *                                   x   x   x  54      50   x   x  47  49   x  55   x   x                  52   x  54  51   x  56   x   x   x   x   x   x   x  58   x   x  52       x   x  kill col 16  Tbl  10 cols 1110110111111101001011111101011101011111111111 has  47 unique lines.
 *                                   x   x   x  40      37   x   x      37   x  42   x   x                  41   x  40  40   x  43   x   x   x   x   x   x   x  45   x   x  41       x   x  kill col 17  Tbl   9 cols 1110110111111101001011111101111101011111111111 has  37 unique lines.
 *                                   x   x   x  30      29   x   x           x  32   x   x                  32   x  30  30   x  33   x   x   x   x   x   x   x  34   x   x  30       x   x  kill col 13  Tbl   8 cols 1110110111111101001011111101111111011111111111 has  29 unique lines.
 *                                   x   x   x  23           x   x           x  24   x   x                  24   x  23  24   x  25   x   x   x   x   x   x   x  26   x   x  22       x   x  kill col 42  Tbl   7 cols 1111110111111101001011111101111111011111111111 has  22 unique lines.
 *                                   x   x   x  17           x   x           x  18   x   x                  17   x  15  17   x  19   x   x   x   x   x   x   x  19   x   x           x   x  kill col 28  Tbl   6 cols 1111110111111101011011111101111111011111111111 has  15 unique lines.
 *
 * Round 3: 0000001000000010100100000010000000100000000000  4 columns for indexes to table representing  6 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0011000000000000010011110001110011000011111111 20 columns
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
    * 00 LB_0     LB_1     0 0 0 01011010111000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 00010110110011010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 2 01011010111010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 FENCE    StdIncPc 3 3 2 0000010010xx11100110| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 4 3 2 01100100101011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   3 3 2 0000000001xx00000100| AUIPC  q = imm20+2 or imm20+4  (copy x/8)
    * 06 LB_3     LB_4     0 3 2 00001100110100000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 2 00001010110100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     5 3 0 01011100111001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 3 2 00001010110010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     5 3 0 01011100111001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    6 3 2 00100100100110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 3 2 00011100110000000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    3 3 2 1001110010xx11100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    3 3 2 0001110010xx00010000| SUB    Subtraction
    * 0f _L0f     StdIncPc 4 3 2 00100100101111100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 3 2 00011110110010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 3 2 00011100110000011010|        RS1^0xffffffff to Q
    * 12 eFetch3  unalignd 7 3 3 01011110111001110100|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * 13 condb_2  condb_3  0 3 2 00011110110000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 4 01011000111000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 3 5 00000000110000010110|        Branch on condition
    * 16 condb_5  StdIncPc 3 3 2 0000010010xx11100110|        Branch not taken.
    * 17 condb_5t Fetch    5 4 2 01011010011011011110|        Branch taken.
    * 18 BEQ      condb_2  5 3 2 00111100101100010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 3 2 01010100101001000001| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 8 3 2 00100100100111100110|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    0 3 2 00000000011100110010| JAL    J-imm is in q.
    * 1c ECAL_BRK ECAL_RET 2 3 2 00010110011110100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 8 3 2 00100100101111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 3 4 11010100111011010100|        Q = 4
    * 1f IJ_2     IJ_3     5 3 2 00110100101110110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     9 0 0 01111010111001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 3 2 00100100100011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  0 3 6 00010100111000111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 FENCEI   StdIncPc 3 3 2 0000010010xx11100110| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   0 5 0 000111100x1100110101| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   3 3 2 0000000001xx00000100| AUIPC  q = imm20+2 or imm20+4  (copy x/8)
    * 26 OR_1     OR_2     5 3 2 00011100100000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 3 2 01000000111000011101|        Q = rs2
    * 28 _L28     SH_1     9 3 0 01011100111010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 3 2 00011100110000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     9 3 0 01011100111010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 4 010xxxx0101000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 3 2 000111000xxx00111110| SLL    Shift left
    * 2d MULH_0   MULH_1   1 5 2 00010100110001101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e EBRKWFI2 EBREAK_1 5 3 5 00001100100111110111| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 4 3 2 00100100101111100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 3 7 00100100101111100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 3 2 00011110110000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    5 3 2 01100100101010000110|        Target adr to yy
    * 33 JAERR_1  Fetch    a 5 0 00xxxxxxxxxx11x1111x|        Not in use
    * 34 JAL_3    Fetch    6 4 2 00011010010011011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   8 5 2 00110110110000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    8 6 2 00110110111000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  b 3 5 001xxxx0100011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 2 00111100101100010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 8 3 2 10100100100011100110|        Last shift.
    * 3a SRxI_1   SRxI_2   8 5 6 00110100110000111101|        Register to shift to Q
    * 3b _L3b     JAL_1    0 3 2 00000000011100110010| JAL    J-imm is in q.
    * 3c CSRRW_0  CSRRW_1  5 3 2 00101100101101001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   FENCE    8 6 6 00110100110000000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 5 0 000111100x0000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 5 0 000111100x0000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     2 0 8 01011010111001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   0 3 4 01000000111000001011|        Q=1
    * 42 MULHU_2  MULHU_3  0 5 6 00010100111010100010|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  0 3 2 00000000010011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  0 3 2 00011110110100101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 4 01010100111001100101|        More check offset
    * 46 ILL_1    ILL_2    b 0 2 00111010110001000111|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    1 1 2 00010110110010001111|        Read until Q is offending instruction
    * 48 _L48     SW_1     2 7 8 01011100111001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 4 01000000111001001011|        Construct PC storage adr
    * 4a _L4a     SW_1     2 7 8 01011100111001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  c 8 2 00010100010010110000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 3 2 0001110010xx00110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  6 5 2 00111100100010100011| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 3 2 000xxxx00xxx11111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 0 3 4 01010100111011100110|        Prep +4
    * 50 LW_1     StdIncPc 8 1 9 00110110100011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   7 9 2 00110100011111011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 00010110110001010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   7 9 2 00110100011111011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     1 6 6 00010100110011101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 7 9 2 00110100101100011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 2 00010000110101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 3 2 00010000110010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 3 6 11010110110010111010|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 2 00111110101110011100|        REM = Q to yy
    * 5a SB_1     SB_2     6 5 2 00110110110001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    0 3 2 00000000011100110010| JAL    J-imm is in q.
    * 5c CSRRS_0  CSRRW_1  5 3 2 00101100101101001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     6 6 2 00110110111011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 00010110110001110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   7 9 2 00110100011111011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 DIV_14   LB_6     0 3 2 00010100110010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * 61 DIV_15   StdIncPc 8 3 2 00100100100011100110|        RS2 < 0, RS1 < 0, yy is true result
    * 62 DIV_8    DIV_7    0 5 4 01010110111011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    0 a 4 01010110111001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  0 3 2 00011110110100101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 3 5 0000010010xx11101111|        Prepare read PC
    * 66 SW_1     SW_2     c 9 2 00011100010011110010|        Write d to a+k until accepted
    * 67 SWE      SW_E2    7 9 2 001001000x1110010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 8 3 2 00100100100011100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     0 3 2 00010100110010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 2 00110100100011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     1 b 2 00011000110001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 3 2 0001110010xx00110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  6 5 2 00111100100010100011| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e LHU_3    ANDI_1   0 3 2 00001110110100011010|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   0 3 4 010xxxx0111011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    1 6 6 00010100110001101110|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 7 9 2 00110100101100011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 3 2 00001100110100011010|        Invert q. Prepare read mask
    * 73 BAERR_1  Fetch    a 5 0 00xxxxxxxxxx11x1111x|       not used
    * 74 unalignd straddle 0 3 2 00000100101101110101|  Fr10u Unaligned pc, prep read high hword
    * 75 straddle Fetchu   d 4 a 11011010011001110110|  Fr10u IncPC, OpFetch
    * 76 Fetchu   Fetch2u  0 3 b 00000110101111010101|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2u  0 1 c 00010110101111010101|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    5 3 2 00100000101110101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    0 3 4 11010100111010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     8 9 2 00011000010011110010|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    0 3 2 00000000011100110010| JAL    J-imm is in q.
    * 7c CSRRC_0  CSRRW_1  5 3 2 00101100101101001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  Fetch    a 5 0 00xxxxxxxxxx11x1111x|       not used
    * 7e NMI_1    NMI_2    b 3 2 001xxxx0100010010000|        Store pc to mepc.
    * 7f JALRE2   Fetch    a 5 0 00xxxxxxxxxx11x1111x|        Not in use
    * 80 LBU_0    LBU_1    0 0 0 01011010111010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  Fetch    a 5 0 00xxxxxxxxxx11x1111x|        Not in use
    * 82 DIV_1    DIV_3    5 3 2 00011100100010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    0 3 2 01010100111010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   0 3 2 00011110110100100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 00010110110011110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    a 3 a 111110000x1000110100|        Return address to TRG
    * 87 JALRE1   Fetch    a 5 0 00xxxxxxxxxx11x1111x|        Not in use
    * 88 DIV_E    DIV_10   3 a 2 100111100xxx10011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 4 3 2 00100100101111100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   3 3 6 1101011010xx00011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 4 3 4 11100100101011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 3 2 0001111010xx00101001| XOR    xor
    * 8d DIV_0    DIV_1    1 c 2 10010110110010000010| DIV    Branch on sign dividend RS1
    * 8e aF_SW_3  LDAF_3   d d 2 011001000x1010010010|        Store 7 to mcause
    * 8f ILL_3    ILL_4    7 9 2 00110100101110101001|        Store illegal instruction to mtval
    * 90 NMI_2    JAL_3    7 d 2 00101000101100110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   d d 4 111001000x1010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    b 3 2 001100100x0000110100|        PC to mepc
    * 93 SW_E2    SW_E3    b 3 2 00110110100010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    6 d 2 001100100x1000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 3 4 11010110111010010100|        Q = 3
    * 96 SH_1     SH_2     6 5 2 00110110110010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    7 9 2 001001000x1110010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 2 00111100101100010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     3 3 2 000xxxx00xxx11111110| Illegal instruction seen
    * 9a ECALL_6  JAL_3    d d 2 011100100x1000110100|        mcause = 11
    * 9b ILL_5    JAL_3    5 d 4 011100100x1000110100|        Store 2 to mcause
    * 9c DIV_10   DIV_12   1 a 2 10011000100001101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   1 a 2 10011000100001100000|        RS2 < 0. Branch on sign of RS1
    * 9e SH_4     SH_5     e 7 2 00011000110010011111|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     c 3 2 00011000010011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    9 0 0 01111010111001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  3 3 4 11010100111011001110|        Q = 4
    * a2 MULHU_3  MULHU_2  1 3 2 10011110110001000010|        Shift Q and rM. Prepare read rs1
    * a3 MULHU_1  MULHU_2  5 3 2 10011110101101000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * a4 SRxI_0   SRxI_1   0 5 0 000111100x1100111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 4 01001100111010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  2 3 8 00010110011111010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 3 2 010xxxx0111000101110| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    0 a 2 10010100110001111000|        Branch on sign divisor RS2
    * a9 ILL_4    ILL_5    0 3 4 01010100111010011011|        Q = 1
    * aa DIV_6    DIV_7    3 3 2 1001011010xx11001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  b 3 2 00110100100010011010|        pc to mepc
    * ac _Lac     SRx_1    3 3 2 000111000xxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   3 5 2 1001110010xx11100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _Lae     SRx_1    3 3 2 000111000xxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 4 010xxxx0111011000101|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  3 3 4 11010100111010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  Fetch    a 5 0 00xxxxxxxxxx11x1111x|        Not in use
    * b2 CSRRW_4  Fetch    d 4 4 11011010011011011110|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1 Fetch    a 5 0 00xxxxxxxxxx11x1111x|        Not in use
    * b4 CSRRWI_2 Fetch    a 5 0 00xxxxxxxxxx11x1111x|        Not in use
    * b5 SH_3     SH_4     0 3 2 00000000101110011110|        Prepare get back address to use 
    * b6 CSRRCI_1 Fetch    a 5 0 00xxxxxxxxxx11x1111x|        Not in use
    * b7 IJ_3     IJ_4     0 3 4 01011000111010111101|        Construct Q = 1
    * b8 BGE      condb_2  5 3 2 00111100101100010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    0 3 4 00011000110011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba DIV_C    DIV_e    6 3 2 00111100010010111001|        rM to yy. Q=ffffffff
    * bb SH_2     SH_3     6 6 2 00110110111010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 2 00101100101101001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    6 4 2 00011010010111011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 1 2 00010110110000011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 1 2 00010110110011000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 3 5 00011100110010001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 2 00110100101111101001|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   0 5 4 01010110111011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   0 a 4 01010110111010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    5 3 2 00011110100111100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 3 2 00000000110101101111|        ~302
    * c6 IJT_4    ILL_2    b 0 2 00111010110101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   b 3 2 001xxxx0100011001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 3 d 10011000111001100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   3 3 2 01001100111010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 3 d 10011000111011000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc 7 d 2 00101000101111100110|        mtval = 0.
    * cc OR_0     OR_1     3 3 2 0001111010xx00100110| OR     or
    * cd REM_0    DIV_1    1 c 2 10010110110010000010| REM    Branch on sign dividend RS1
    * ce ECALL_5  ECALL_6  3 3 4 11010100111010011010|        Q = 8
    * cf MRET_7   MRET_8   3 3 5 0000110010xx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 4 01000100111000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   5 3 2 00001100101111001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     1 6 6 00010100110000000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 7 9 2 00110100101100011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   5 d 4 011001000x1010010010|        Store 5 to mcause
    * d5 Fetch2u           7 9 e 01011111111000000000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * d6 eILL0c   ILLe     3 3 2 000xxxx00xxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  7 9 2 00110100101110100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 2 00111100101100010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  3 3 2 1001111010xx01000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 3 2 0001010010xx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 9 4 011001000x1010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 2 00101100101101001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  7 9 2 00110100101111100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   5 1 c 00010110101111110100|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   5 1 c 00010110101111110100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 2 00110110100011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 2 00000000110000011101|        Q = RS1
    * e2 MUL_1    MUL_2    0 5 6 00010100111011101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 3 6 1101011010xx00011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   0 3 2 00011110110100011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 3 4 11010100111010001110|        Q = 4
    * e6 StdIncPc Fetch    d 4 a 11011010011011011110|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 7 9 2 00110100101100011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 2 10011100110011100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    0 3 4 01011000111011000110|        Construct Q = 1
    * ea MULHU_5  MULHU_6  0 3 2 00011000111000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     0 3 2 00001110110101010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 3 2 0001111010xx00010001| AND    And 
    * ed REMU_0   DIVU_1   3 5 2 1001110010xx11100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 3 2 000xxxx00xxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    d 4 4 11011010011011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    1 6 6 00010100110001110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 7 9 2 00110100101100011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 3 2 0000010010xx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 3 2 000xxxx001xx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  7 9 2 01000011101000010010|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 7 9 2 00110100101111011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 3 4 11000000111011111010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 7 9 2 00100100101110101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 2 00111100101100010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   5 3 4 01011100101011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    0 3 4 01010100111001000101|        Check offset
    * fb SB_3     SB_4     0 3 2 00000000101101101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 2 00101100101101001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 3 2 0000010010xx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 3 2 0000010010xx01000110| Illegal
    * ff QINT_0   QINT_1   3 3 2 0000010010xx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'h4be6c810c8e2cc044986ce5aac8bce5aad09cd0704044ae648e6aebe6cd2ae01;
   localparam u0_1 = 256'h4bb74ed44be667a6073249e64a41cb13a6de48e60c168e15ec14ee74cc1aec8b;
   localparam u0_2 = 256'h4be6c9f74c6ac03e0a30ce96cc21ce960e1dc8270404e33548e64e3948e6ae52;
   localparam u0_3 = 256'he03ae0354c03cb4907324c3d48e6cb1308d76e036c36a4de00de4a86ec2b4be6;
   localparam u0_4 = 256'h4ee600fec8a3c83144b0ce660e4bce666c8fac474e65ed2b04ea4ea20e0bae50;
   localparam u0_5 = 256'h47da6c706efbcb4907326c5deb9c6cba0c8b0d574b1e4ceb47da6c5447da68e6;
   localparam u0_6 = 256'h0ecfed1ac8a3c8318c7a48f94c8b48e64393c4f248efed2b6e586ec848e64c8b;
   localparam u0_7 = 256'h00de089000decb49073284f24ea80baa6bd56bd5a6764b7500decd1a4b1e4c6e;
   localparam u0_8 = 256'h4ba942926c82e8294ae6681a4be6e09c00de82346cf0ed214e82c8a800deae85;
   localparam u0_9 = 256'h84f28c9f886088682234223400fecb1343936cbb6e9422346895203442928b34;
   localparam u0_A = 256'h0ec5c03fc8e0c03f489a68c84e9b4c780e2e67d0ceafe33aeb42ec424eceae5e;
   localparam u0_B = 256'h6cc16c1fa5decb496eb5c4b98cc0cb138ebd00de0b9e00de00dea6de00de4eb2;
   localparam u0_C = 256'hc84f4e9a6c82e8268be68ec2cea58e6208cbad470d6fe9e16e8a6eca4be9cc88;
   localparam u0_D = 256'h6bf46bf44be5cb4942924891e842cb134ba100fefe0042924b1e4c06cbc94e37;
   localparam u0_E = 256'ha6de00fec8e0e811ed568e228ec6cce24b1ea6de4e8eed1a681a4ee80c1d68ca;
   localparam u0_F = 256'h48c74846487ecb490b6b4e45cad9cb134bab0efa4bdb3a1204dd48e64b1e4c72;
   localparam u1_0 = 256'h4322332133291321632253050320530513200320332043263320222511110005;
   localparam u1_1 = 256'h5323334d83222321032083225325532354253320135003450321733503210321;
   localparam u1_2 = 256'h4322535015213321034493050321930503245321332005013320036143229007;
   localparam u1_3 = 256'h150115018663532203208563832a5323b352862385236421a500532603214372;
   localparam u1_4 = 256'h0345332065233321c8212785034427851121b023034503210320056103442085;
   localparam u1_5 = 256'h7923111166235322032065235323136d03211321792316617923111179238193;
   localparam u1_6 = 256'h03440320652333211b215323032183227922c921335003210a45054583220321;
   localparam u1_7 = 256'ha500b322a500532203208921034d532201c103b0d4ad0320a500032079231661;
   localparam u1_8 = 256'h7923dd261c293321434e336d43223a29a500a3af1111032103255321a5000005;
   localparam u1_9 = 256'hc321e7211a291a295d47dd273320532379226523334d6d23b323b323dd4e7d22;
   localparam u1_A = 256'h0344332135293321b323332903450a29032423810344050153291329334d9007;
   localparam u1_B = 256'h112111216421532266236323034153230345a5000320a500a500d44da500334d;
   localparam u1_C = 256'h3350334d1c2933217d2213d9332413d9b322b023032053210a45054553231351;
   localparam u1_D = 256'h51c151c17923532259463321332953237923332079e55d467923166153200344;
   localparam u1_E = 256'hd44d33203529332103200321034513297923d4ad334d0321336d056113205323;
   localparam u1_F = 256'h332033203320532203200345534553237922334c792379243320332079231661;
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
   assign d[12] = indir[8];
   assign d[13] = indir[9];
   assign d[16] = indir[10];
   assign d[17] = indir[11];
   assign d[18] = indir[12];
   assign d[22] = indir[13];
   assign d[23] = indir[14];
   assign d[24] = indir[15];
   assign d[25] = indir[16];
   assign d[28] = indir[17];
   assign d[42] = indir[18];
   assign d[43] = indir[19];
   // replaces = 1000000100100101000000000100001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0042)) cmb_d08(.O(d[8]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0498)) cmb_d09(.O(d[9]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h2418)) cmb_d10(.O(d[10]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1800)) cmb_d15(.O(d[15]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h7ffe)) cmb_d20(.O(d[20]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h4008)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0100)) cmb_d32(.O(d[32]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1002)) cmb_d35(.O(d[35]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1200)) cmb_d38(.O(d[38]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0400)) cmb_d45(.O(d[45]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0100110011011000001000001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h2f9f)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2b10)) cmb_d27(.O(d[27]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0012)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2100)) cmb_d37(.O(d[37]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0891)) cmb_d40(.O(d[40]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0880)) cmb_d41(.O(d[41]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d44(.O(d[44]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000001000000010100100000010000000100000000000
   SB_LUT4 #(.LUT_INIT(16'h5942)) cmb_d11(.O(d[11]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5bf7)) cmb_d19(.O(d[19]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5880)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2ae0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0204)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h400f)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
