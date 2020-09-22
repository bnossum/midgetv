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
 * 203 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 203 202 203 201 199 202 203 203 203 203   x 203 203 203 202 202 203 202 203 203 203 203 203 203 203 203 203 203 203 203 203 203 203 203 203 202 203 202 202 202 203 202 203 202 201 202  kill col  4  Tbl  44 cols 0000000000000000000000000000000000010000010000 has 199 unique lines.
 * 199 198 199 197     197 199 199 199 199   x 199 199 199 196 198 199 197 199 199 199 199 199 199 199 199 199 199 199 199 199 199 199 199 198 198 199 198 198 198 199 198 199 198 197 198  kill col 14  Tbl  43 cols 0000000000000000000000000000000100010000010000 has 196 unique lines.
 * 196 195 196 194     194 196 196 196 196   x 196 196 196     195 195 195 196 196 196 196 196 196 196 196 196 196 196 196 196 196 196 196 195 195 196 195 194 195 196 195 196 194 193 195  kill col 44  Tbl  42 cols 0100000000000000000000000000000100010000010000 has 193 unique lines.
 * 193 192 193 191     191 193 193 193 193   x 193 193 193     192 192 192 193 193 193 193 193 193 193 193 193 193 193 193 193 193 193 193 192 192 193 192 191 192 192 192 193 191     192  kill col 43  Tbl  41 cols 0110000000000000000000000000000100010000010000 has 191 unique lines.
 * 191 190 191 189     189 191 191 191 191   x 191 191 191     190 190 190 191 191 191 189 191 191 191 191 191 191 191 191 191 191 191 191 190 190 191 190 188 189 188 189 191         186  kill col 45  Tbl  40 cols 1110000000000000000000000000000100010000010000 has 186 unique lines.
 * 186 185 186 184     184 186 186 186 186   x 186 186 186     185 183 185 186 186 185 184 186 186 186 186 186 186 186 186 186 186 186 186 185 185 186 185 183 183 181 181 185              kill col 41  Tbl  39 cols 1110100000000000000000000000000100010000010000 has 181 unique lines.
 * 181 180 181 179     179 180 181 181 181   x 181 181 181     180 178 180 181 181 180 179 181 181 181 181 181 181 181 181 181 181 181 181 180 180 181 180 177 177 174     177              kill col 40  Tbl  38 cols 1110110000000000000000000000000100010000010000 has 174 unique lines.
 * 174 173 174 172     172 172 174 174 174   x 174 174 173     171 169 171 174 174 173 171 174 173 174 174 174 174 174 174 174 174 174 174 173 172 173 173 167 165         168              kill col 39  Tbl  37 cols 1110111000000000000000000000000100010000010000 has 165 unique lines.
 * 165 164 165 162     162 163 164 165 163   x 163 165 162     162 159 160 165 165 164 162 165 164 165 165 165 165 165 165 165 165 165 165 164 161 164 164 152             154              kill col 38  Tbl  36 cols 1110111100000000000000000000000100010000010000 has 152 unique lines.
 * 151 151 152 148     148 148 151 151 150   x 150 152 149     149 146 146 152 152 151 148 152 151 152 152 152 152 152 152 152 152 152 152 151 148 151 151                 132              kill col 42  Tbl  35 cols 1111111100000000000000000000000100010000010000 has 132 unique lines.
 * 131 131 132 126     128 128 131 130 129   x 130 132 129     128 124 125 132 132 131 128 132 131 131 132 131 132 132 132 132 132 132 132 131 127 131 131                                  kill col 16  Tbl  34 cols 1111111100000000000000000000010100010000010000 has 124 unique lines.
 * 123 123 124 119     119 120 122 121 121   x 122 124 120     117     116 124 124 122 119 124 123 123 123 123 124 124 123 124 124 124 124 122 120 123 123                                  kill col 17  Tbl  33 cols 1111111100000000000000000000110100010000010000 has 116 unique lines.
 * 115 115 116 111     110 111 114 111 111   x 113 116 111     104         115 116 113 110 116 115 115 115 115 116 116 115 116 116 116 116 112 111 115 115                                  kill col 15  Tbl  32 cols 1111111100000000000000000000111100010000010000 has 104 unique lines.
 * 102 103 104 100      98 100 102  99  99   x 101 104  99                 102 103 101  98 104 102 103 103 103 104 104 103 104 104 104 103 100  99 103 103                                  kill col 21  Tbl  31 cols 1111111100000000000000001000111100010000010000 has  98 unique lines.
 *  96  97  98  95      93  94  96  93  93   x  95  98  93                  96  97  95      98  96  97  97  97  98  98  97  98  94  98  97  95  93  97  97                                  kill col 35  Tbl  30 cols 1111111100100000000000001000111100010000010000 has  93 unique lines.
 *  91  92  93  90      88  89  91  88  88   x  89  93  88                  91  92  89      93  91  92  92  92  93  93  92  93  89  93  92  90      89  92                                  kill col 13  Tbl  29 cols 1111111100100000000000001000111110010000010000 has  88 unique lines.
 *  86  87  88  84      83  84  86  82  82   x  84  88                      86  87  84      88  86  87  87  87  88  88  87  88  84  88  87  85      84  87                                  kill col  9  Tbl  28 cols 1111111100100000000000001000111110011000010000 has  82 unique lines.
 *  80  81  82  78      78  78  80  76       x  78  81                      80  80  78      82  80  81  81  81  82  82  81  82  78  82  81  79      78  81                                  kill col  8  Tbl  27 cols 1111111100100000000000001000111110011100010000 has  76 unique lines.
 *  74  75  76  72      72  72  74           x  71  73                      74  74  71      76  74  75  75  74  76  76  75  76  70  75  75  73      72  75                                  kill col 31  Tbl  26 cols 1111111100100010000000001000111110011100010000 has  70 unique lines.
 *  68  69  70  65      67  66  69           x  64  66                      67  67  63      70  68  69  69  68  70  70  69  70      68  69  67      66  69                                  kill col 20  Tbl  25 cols 1111111100100010000000001100111110011100010000 has  63 unique lines.
 *  61  62  62  59      61  59  62           x  57  59                      60  60          63  60  62  62  61  63  63  62  62      60  61  60      59  61                                  kill col 11  Tbl  24 cols 1111111100100010000000001100111110111100010000 has  57 unique lines.
 *  55  56  56  51      54  54  56           x      53                      54  54          57  54  56  56  55  57  57  56  56      54  55  54      54  55                                  kill col  3  Tbl  23 cols 1111111100100010000000001100111110111100011000 has  51 unique lines.
 *  49  50  50          47  49  50           x      48                      47  48          51  48  50  50  49  51  51  50  50      48  49  47      49  49                                  kill col 34  Tbl  22 cols 1111111100110010000000001100111110111100011000 has  47 unique lines.
 *  45  45  45          41  45  46           x      44                      43  44          46  44  46  46  45  47  46  46  46      43  45          45  45                                  kill col  5  Tbl  21 cols 1111111100110010000000001100111110111100111000 has  41 unique lines.
 *  39  39  39              39  40           x      39                      37  38          40  38  40  40  39  41  39  40  40      37  39          39  39                                  kill col 32  Tbl  20 cols 1111111100110110000000001100111110111100111000 has  37 unique lines.
 *  35  35  35              35  36           x      35                      33  33          36  35  36  34  35  37  35  36  36          34          35  35                                  kill col 19  Tbl  19 cols 1111111100110110000000001110111110111100111000 has  33 unique lines.
 *  31  31  31              31  32           x      31                      29              32  31  32  30  31  33  31  32  32          30          31  31                                  kill col 18  Tbl  18 cols 1111111100110110000000001111111110111100111000 has  29 unique lines.
 *  27  27  27              28  28           x      27                                      28  27  28  26  27  29  27  28  28          27          27  27                                  kill col 25  Tbl  17 cols 1111111100110110000010001111111110111100111000 has  26 unique lines.
 *  24  24  24              25  25           x      24                                      25  24  25      24  25  24  25  25          24          24  25                                  kill col 36  Tbl  16 cols 1111111101110110000010001111111110111100111000 has  24 unique lines.
 *  22  22  22              23  23           x      22                                      23  22  23      22  23  22  23  23          22              23                                  kill col 33  Tbl  15 cols 1111111101111110000010001111111110111100111000 has  22 unique lines.
 *  20  20  20              21  21           x      20                                      21  20  21      20  21  20  21  21                          21                                  kill col 28  Tbl  14 cols 1111111101111110010010001111111110111100111000 has  20 unique lines.
 *  18  18  18              19  19           x      18                                      19  18  19      18  19      18  19                          19                                  kill col 29  Tbl  13 cols 1111111101111110110010001111111110111100111000 has  18 unique lines.
 *  16  16  16              17  17           x      16                                      17  16  17      16  17          17                          17                                  kill col 26  Tbl  12 cols 1111111101111110110110001111111110111100111000 has  16 unique lines.
 *
 * Round 1: 0000000010000001001001110000000001000011000111  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 201 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x   x 199 197 200   x   x 201 201   x 199   x 201 200 200 201 200 201 201 201 201   x   x   x 201 201   x 201 201   x 201 201 201 201 198 201   x 200 200 201 200 201 200 199 200  kill col  4  Tbl  32 cols 0000000010000001001001110000000001010011010111 has 197 unique lines.
 *   x   x   x 195     195   x   x 197 197   x 195   x 197 194 196 197 195 197 197 197 197   x   x   x 197 197   x 197 197   x 197 197 197 196 194 197   x 196 196 197 196 197 196 195 196  kill col 35  Tbl  31 cols 0000000010100001001001110000000001010011010111 has 194 unique lines.
 *   x   x   x 192     192   x   x 194 194   x 191   x 194 191 193 194 192 194 194 194 194   x   x   x 194 194   x 194 194   x 194 194 194 193     194   x 193 193 194 193 194 193 192 193  kill col 14  Tbl  30 cols 0000000010100001001001110000000101010011010111 has 191 unique lines.
 *   x   x   x 189     188   x   x 191 191   x 188   x 191     190 190 190 191 191 191 191   x   x   x 191 191   x 191 191   x 191 191 191 190     191   x 189 190 191 190 191 189 188 190  kill col 44  Tbl  29 cols 0100000010100001001001110000000101010011010111 has 188 unique lines.
 *   x   x   x 185     185   x   x 188 188   x 185   x 188     187 187 187 188 188 188 188   x   x   x 188 188   x 188 188   x 188 188 188 187     188   x 186 187 187 187 188 186     187  kill col 11  Tbl  28 cols 0100000010100001001001110000000101110011010111 has 185 unique lines.
 *   x   x   x 182     182   x   x 185 185   x       x 185     184 184 184 185 185 185 185   x   x   x 185 185   x 185 185   x 185 185 185 184     185   x 183 183 184 184 185 183     184  kill col  5  Tbl  27 cols 0100000010100001001001110000000101110011110111 has 182 unique lines.
 *   x   x   x 177           x   x 182 182   x       x 182     181 181 181 182 182 182 182   x   x   x 182 182   x 182 182   x 182 182 182 181     182   x 180 180 181 181 181 180     181  kill col  3  Tbl  26 cols 0100000010100001001001110000000101110011111111 has 177 unique lines.
 *   x   x   x               x   x 175 177   x       x 177     176 176 176 177 177 177 177   x   x   x 177 177   x 177 177   x 177 177 177 172     177   x 174 174 176 175 174 175     176  kill col 34  Tbl  25 cols 0100000010110001001001110000000101110011111111 has 172 unique lines.
 *   x   x   x               x   x 170 171   x       x 171     171 171 171 172 172 172 172   x   x   x 172 172   x 172 172   x 172 172 172         172   x 168 169 170 170 169 168     171  kill col 43  Tbl  24 cols 0110000010110001001001110000000101110011111111 has 168 unique lines.
 *   x   x   x               x   x 164 166   x       x 165     165 165 167 167 167 168 166   x   x   x 167 168   x 168 168   x 168 168 168         167   x 161 164 161 161 164         162  kill col 41  Tbl  23 cols 0110100010110001001001110000000101110011111111 has 161 unique lines.
 *   x   x   x               x   x 155 159   x       x 158     157 158 158 160 160 161 159   x   x   x 160 161   x 161 161   x 161 161 161         159   x 153 153 152     153         151  kill col 45  Tbl  22 cols 1110100010110001001001110000000101110011111111 has 151 unique lines.
 *   x   x   x               x   x 142 147   x       x 147     147 142 147 150 150 149 149   x   x   x 149 150   x 151 151   x 151 151 151         149   x 143 140 138     140              kill col 40  Tbl  21 cols 1110110010110001001001110000000101110011111111 has 138 unique lines.
 *   x   x   x               x   x 127 132   x       x 133     130 126 131 136 137 136 135   x   x   x 134 136   x 138 138   x 138 138 138         135   x 124 119         121              kill col 39  Tbl  20 cols 1110111010110001001001110000000101110011111111 has 119 unique lines.
 *   x   x   x               x   x 108 111   x       x 112     112 108 107 116 117 116 116   x   x   x 115 117   x 119 119   x 119 119 119         115   x  97              97              kill col 42  Tbl  19 cols 1111111010110001001001110000000101110011111111 has  97 unique lines.
 *   x   x   x               x   x  86  89   x       x  90      90  86  85  94  95  92  93   x   x   x  94  92   x  96  97   x  97  95  97          94   x  72                              kill col 38  Tbl  18 cols 1111111110110001001001110000000101110011111111 has  72 unique lines.
 *   x   x   x               x   x  64  66   x       x  67      66  62  61  68  71  68  69   x   x   x  69  69   x  71  72   x  72  71  72          69   x                                  kill col 17  Tbl  17 cols 1111111110110001001001110000100101110011111111 has  61 unique lines.
 *   x   x   x               x   x  54  54   x       x  56      54  56      57  60  59  58   x   x   x  57  58   x  60  61   x  61  60  61          58   x                                  kill col 15  Tbl  16 cols 1111111110110001001001110000101101110011111111 has  54 unique lines.
 *   x   x   x               x   x  48  47   x       x  49          49      49  50  52  51   x   x   x  50  51   x  53  54   x  54  53  53          50   x                                  kill col  9  Tbl  15 cols 1111111110110001001001110000101101111011111111 has  47 unique lines.
 *   x   x   x               x   x  41       x       x  43          42      42  43  44  42   x   x   x  43  44   x  46  47   x  47  45  46          44   x                                  kill col  8  Tbl  14 cols 1111111110110001001001110000101101111111111111 has  41 unique lines.
 *   x   x   x               x   x           x       x  35          34      36  37  38  36   x   x   x  38  38   x  40  41   x  40  39  40          38   x                                  kill col 16  Tbl  13 cols 1111111110110001001001110000111101111111111111 has  34 unique lines.
 *   x   x   x               x   x           x       x  30                  28  30  31  30   x   x   x  31  31   x  33  33   x  33  31  33          32   x                                  kill col 18  Tbl  12 cols 1111111110110001001001110001111101111111111111 has  28 unique lines.
 *   x   x   x               x   x           x       x  23                      24  24  23   x   x   x  25  25   x  27  27   x  26  26  27          26   x                                  kill col 21  Tbl  11 cols 1111111110110001001001111001111101111111111111 has  23 unique lines.
 *   x   x   x               x   x           x       x  19                      20  19       x   x   x  20  21   x  22  22   x  20  21  22          21   x                                  kill col 20  Tbl  10 cols 1111111110110001001001111101111101111111111111 has  19 unique lines.
 *   x   x   x               x   x           x       x  16                      17           x   x   x  17  17   x  17  18   x  14  17  18          17   x                                  kill col 31  Tbl   9 cols 1111111110110011001001111101111101111111111111 has  14 unique lines.
 *
 * Round 2: 0000000001001100110110000010000010000000000000  4 columns for indexes to table representing  9 original columns (uses 14 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 200 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x   x 198 196 199   x   x 200 200   x 198   x   x 199 198 200 197 199   x 200 200   x   x   x   x   x   x   x   x   x 200   x   x 200 197   x   x 199 198 200 199 199 199 198 199  kill col  4  Tbl  23 cols 0000000011001101111111110010000011010011010111 has 196 unique lines.
 *   x   x   x 194     194   x   x 196 196   x 194   x   x 193 194 196 192 195   x 196 196   x   x   x   x   x   x   x   x   x 196   x   x 195 193   x   x 195 194 196 195 195 195 194 195  kill col 17  Tbl  22 cols 0000000011001101111111110010100011010011010111 has 192 unique lines.
 *   x   x   x 190     190   x   x 192 192   x 190   x   x 189 189 192     191   x 192 192   x   x   x   x   x   x   x   x   x 192   x   x 191 189   x   x 191 190 192 191 191 191 190 191  kill col 35  Tbl  21 cols 0000000011101101111111110010100011010011010111 has 189 unique lines.
 *   x   x   x 187     187   x   x 189 189   x 186   x   x 186 186 189     188   x 189 189   x   x   x   x   x   x   x   x   x 189   x   x 188       x   x 188 187 189 188 188 188 187 188  kill col 15  Tbl  20 cols 0000000011101101111111110010101011010011010111 has 186 unique lines.
 *   x   x   x 184     184   x   x 186 186   x 183   x   x 183     186     185   x 186 186   x   x   x   x   x   x   x   x   x 186   x   x 185       x   x 185 184 186 185 184 185 183 183  kill col 45  Tbl  19 cols 1000000011101101111111110010101011010011010111 has 183 unique lines.
 *   x   x   x 181     180   x   x 183 182   x 180   x   x 180     182     182   x 182 183   x   x   x   x   x   x   x   x   x 183   x   x 182       x   x 181 179 181 181 179 179 180      kill col 43  Tbl  18 cols 1010000011101101111111110010101011010011010111 has 179 unique lines.
 *   x   x   x 177     176   x   x 179 178   x 175   x   x 171     174     178   x 178 179   x   x   x   x   x   x   x   x   x 178   x   x 178       x   x 175 174 175 174 175     176      kill col 14  Tbl  17 cols 1010000011101101111111110010101111010011010111 has 171 unique lines.
 *   x   x   x 169     167   x   x 171 170   x 166   x   x         165     170   x 170 171   x   x   x   x   x   x   x   x   x 170   x   x 169       x   x 165 164 165 166 166     166      kill col 39  Tbl  16 cols 1010001011101101111111110010101111010011010111 has 164 unique lines.
 *   x   x   x 160     160   x   x 163 163   x 157   x   x         156     162   x 163 164   x   x   x   x   x   x   x   x   x 163   x   x 161       x   x 154     154 153 158     155      kill col 41  Tbl  15 cols 1010101011101101111111110010101111010011010111 has 153 unique lines.
 *   x   x   x 148     148   x   x 152 152   x 145   x   x         140     150   x 151 153   x   x   x   x   x   x   x   x   x 152   x   x 150       x   x 138     135     140     138      kill col 40  Tbl  14 cols 1010111011101101111111110010101111010011010111 has 135 unique lines.
 *   x   x   x 127     130   x   x 134 130   x 129   x   x         119     130   x 133 132   x   x   x   x   x   x   x   x   x 134   x   x 130       x   x 114             112     114      kill col 42  Tbl  13 cols 1011111011101101111111110010101111010011010111 has 112 unique lines.
 *   x   x   x 104     102   x   x 108 103   x 107   x   x          96     106   x 110 108   x   x   x   x   x   x   x   x   x 111   x   x 105       x   x  90                      91      kill col 38  Tbl  12 cols 1011111111101101111111110010101111010011010111 has  90 unique lines.
 *   x   x   x  84      78   x   x  83  81   x  84   x   x          73      82   x  87  85   x   x   x   x   x   x   x   x   x  89   x   x  80       x   x                          68      kill col 44  Tbl  11 cols 1111111111101101111111110010101111010011010111 has  68 unique lines.
 *   x   x   x  62      58   x   x  59  59   x  63   x   x          55      62   x  63  61   x   x   x   x   x   x   x   x   x  67   x   x  59       x   x                                  kill col 16  Tbl  10 cols 1111111111101101111111110010111111010011010111 has  55 unique lines.
 *   x   x   x  50      46   x   x  43  45   x  51   x   x                  49   x  50  47   x   x   x   x   x   x   x   x   x  54   x   x  48       x   x                                  kill col  8  Tbl   9 cols 1111111111101101111111110010111111010111010111 has  43 unique lines.
 *   x   x   x  36      33   x   x      33   x  38   x   x                  37   x  37  36   x   x   x   x   x   x   x   x   x  41   x   x  37       x   x                                  kill col  9  Tbl   8 cols 1111111111101101111111110010111111011111010111 has  33 unique lines.
 *   x   x   x  26      25   x   x           x  28   x   x                  28   x  27  26   x   x   x   x   x   x   x   x   x  30   x   x  27       x   x                                  kill col  5  Tbl   7 cols 1111111111101101111111110010111111011111110111 has  25 unique lines.
 *   x   x   x  19           x   x           x  20   x   x                  20   x  20  20   x   x   x   x   x   x   x   x   x  22   x   x  19       x   x                                  kill col 34  Tbl   6 cols 1111111111111101111111110010111111011111110111 has  19 unique lines.
 *   x   x   x  14           x   x           x  15   x   x                  14   x  13  14   x   x   x   x   x   x   x   x   x  16   x   x           x   x                                  kill col 20  Tbl   5 cols 1111111111111101111111110110111111011111110111 has  13 unique lines.
 *
 * Round 3: 0000000000000010000000001001000000100000001000  4 columns for indexes to table representing  5 original columns (uses 13 of 16 lines in indirect table).
 * Direct:  1111111100110000000000000100111100011100110000 20 columns
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
    * 00 LB_0     LB_1     0 0 0 00000001010110101110| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 11010010000101101100|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     0 2 2 10111110010110101110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 FENCE    StdIncPc 2 3 3 111001100000010010xx| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 3 3 3 11100110011001001010| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   2 3 3 000001000000000001xx| AUIPC  q = imm20+2 or imm20+4  (copy x/8)
    * 06 LB_3     LB_4     0 3 3 00000111000011001101|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 3 00001001000010101101|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     4 3 0 01011010010111001110| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 3 3 10100011000010101100|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     4 3 0 01011010010111001110| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    5 3 3 10000110001001001001|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 3 3 00000100000111001100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    2 3 3 111000101001110010xx| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    2 3 3 000100000001110010xx| SUB    Subtraction
    * 0f _L0f     StdIncPc 3 3 3 11100110001001001011| LUI    q = imm20
    * 10 SUB_1    LB_6     0 3 3 10100011000111101100|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 3 3 00011010000111001100|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   6 4 4 01110110110110100110|  Fr00u IncPC, OpFetch
    * 13 condb_2  condb_3  0 3 3 00010100000111101100|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 5 00010101010110001110|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 3 6 00010110000000001100|        Branch on condition
    * 16 condb_5  StdIncPc 2 3 3 111001100000010010xx|        Branch not taken.
    * 17 condb_5t Fetch    4 4 3 11011110010110100110|        Branch taken.
    * 18 BEQ      condb_2  4 3 3 00010011001111001011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 3 3 01000001010101001010| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 7 3 3 11100110001001001001|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    0 3 3 00110010000000000111| JAL    J-imm is in q.
    * 1c ECAL_BRK ECAL_RET 0 3 2 10100110000101100111| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 7 3 3 11100110001001001011|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 2 3 5 11010100110101001110|        Q = 4
    * 1f IJ_2     IJ_3     4 3 3 10110111001101001011|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     4 0 7 01010010011110101110| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 3 11100110001001001000|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  0 3 8 00111001000101001110|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 FENCEI   StdIncPc 2 3 3 111001100000010010xx| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   0 5 0 00110101000111100x11| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   2 3 3 000001000000000001xx| AUIPC  q = imm20+2 or imm20+4  (copy x/8)
    * 26 OR_1     OR_2     4 3 3 00100111000111001000|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 3 3 00011101010000001110|        Q = rs2
    * 28 _L28     SH_1     4 3 7 10010110010111001110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 3 3 00100001000111001100|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     4 3 7 10010110010111001110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 5 00110000010xxxx01010|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    2 3 3 00111110000111000xxx| SLL    Shift left
    * 2d MULH_0   MULH_1   1 5 3 11111011000101001100| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e EBRKWFI2 EBREAK_1 4 3 6 11110111000011001001| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 3 3 3 11100110001001001011| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 3 9 11100110001001001011|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 3 3 00101011000111101100|        ~rs2 to Q
    * 32 JAL_1    JAL_2    4 3 3 10000110011001001010|        Target adr to yy
    * 33 JAERR_1  Fetch    8 5 0 1101111000xxxxxxxxxx|        Not in use
    * 34 JAL_3    Fetch    5 4 3 11011110000110100100|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   7 5 3 00110110001101101100|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    7 6 3 00000011001101101110|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  9 3 6 11010111001xxxx01000|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  4 3 3 00010011001111001011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 7 3 3 11100110101001001000|        Last shift.
    * 3a SRxI_1   SRxI_2   7 5 8 00111101001101001100|        Register to shift to Q
    * 3b _L3b     JAL_1    0 3 3 00110010000000000111| JAL    J-imm is in q.
    * 3c CSRRW_0  CSRRW_1  4 3 3 01001001001011001011| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   FENCE    7 6 8 00000011001101001100|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 5 0 00110101000111100x00|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 5 0 00111010000111100x00|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 0 a 01010000010110101110| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   0 3 5 00001011010000001110|        Q=1
    * 42 MULHU_2  MULHU_3  0 5 8 10111011000101001110|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  0 3 3 11101010000000000100|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  0 3 3 00101011000111101101| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 5 01100101010101001110|        More check offset
    * 46 ILL_1    ILL_2    9 0 3 01000111001110101100|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    1 1 3 10001111000101101100|        Read until Q is offending instruction
    * 48 _L48     SW_1     0 7 a 01100110010111001110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 5 01001011010000001110|        Construct PC storage adr
    * 4a _L4a     SW_1     0 7 a 01100110010111001110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 8 3 10110000000101000100|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   2 3 3 001100010001110010xx| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  5 5 3 10011011001111001000| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     2 3 3 11111110000xxxx00xxx| Illegal instruction seen
    * 4f MRET_8   StdIncPc 0 3 5 11100110010101001110|        Prep +4
    * 50 LW_1     StdIncPc 7 1 b 11100110001101101000|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   b 9 3 11011010001101000111|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 01010100000101101100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   b 9 3 11011010001101000111|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     1 6 8 11101011000101001100|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 b 9 3 00011110001101001011|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 3 01010111000100001101|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 3 3 10100011000100001100|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 3 8 10111010110101101100|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   4 3 3 10011100001111101011|        REM = Q to yy
    * 5a SB_1     SB_2     5 5 3 01011101001101101100|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    0 3 3 00110010000000000111| JAL    J-imm is in q.
    * 5c CSRRS_0  CSRRW_1  4 3 3 01001001001011001011| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     5 6 3 01101010001101101110|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 01110000000101101100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   b 9 3 11011010001101000111|  err   LD AlignFault. Faulting adr to mtval
    * 60 DIV_14   LB_6     0 3 3 10100011000101001100|        RS2 < 0, RS1 >= 0, change sign yy
    * 61 DIV_15   StdIncPc 7 3 3 11100110001001001000|        RS2 < 0, RS1 < 0, yy is true result
    * 62 DIV_8    DIV_7    0 5 5 11001000010101101110|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    0 a 5 01011000010101101110|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  0 3 3 00101011000111101101| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    2 3 6 111011110000010010xx|        Prepare read PC
    * 66 SW_1     SW_2     a 9 3 11110010000111000100|        Write d to a+k until accepted
    * 67 SWE      SW_E2    b 9 3 10010011001001000x11|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 7 3 3 11100110001001001000|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     0 3 3 10100011000101001100|        RS2 > 0, RS1 < 0, change sign yy
    * 6a SB_3     SB_4     0 3 3 01101011000000001011|        Prepare get back address to use 
    * 6b SB_4     SB_5     1 b 3 01111010000110001100|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   2 3 3 001100010001110010xx| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  5 5 3 10011011001111001000| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e LHU_3    ANDI_1   0 3 3 00011010000011101101|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   0 3 5 11001111010xxxx01110|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    1 6 8 01101110000101001100|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 b 9 3 00011110001101001011|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 3 3 00011010000011001101|        Invert q. Prepare read mask
    * 73 BAERR_1  Fetch    8 5 0 1101111000xxxxxxxxxx|       not used
    * 74 BrOpFet  Fetch    8 5 0 1101111000xxxxxxxxxx|       not used
    * 75 BAlignEr Fetch    8 5 0 1101111000xxxxxxxxxx|       not used
    * 76 Fetchu   Fetch2   0 3 c 11110100000001101011|  Fr00u Read and latch instruction
    * 77 eFetchu  Fetch2   0 1 d 11110100000101101011|  Fr00u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    4 3 3 10101001001000001011|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    0 3 5 10101000110101001110|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     7 9 3 11110010000110000100|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    0 3 3 00110010000000000111| JAL    J-imm is in q.
    * 7c CSRRC_0  CSRRW_1  4 3 3 01001001001011001011| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  Fetch    8 5 0 1101111000xxxxxxxxxx|       not used
    * 7e NMI_1    NMI_2    9 3 3 10010000001xxxx01000|        Store pc to mepc.
    * 7f JALRE2   Fetch    8 5 0 1101111000xxxxxxxxxx|        Not in use
    * 80 LBU_0    LBU_1    0 0 0 10000101010110101110| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  Fetch    8 5 0 1101111000xxxxxxxxxx|        Not in use
    * 82 DIV_1    DIV_3    4 3 3 10101000000111001000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    0 3 3 10000010010101001110|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   0 3 3 00100001000111101101| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 11110000000101101100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    8 3 4 00110100111110000x10|        Return address to TRG
    * 87 JALRE1   Fetch    8 5 0 1101111000xxxxxxxxxx|        Not in use
    * 88 DIV_E    DIV_10   2 a 3 10011100100111100xxx|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 3 11100110001001001011|        RS2 == 0, return 0xffffffff
    * 8a ILL_4    ILL_5    0 3 5 10001011010101001110|        Q = 1
    * 8b ILL_5    JAL_3    4 c 5 00110100011100100x10|        Store 2 to mcause
    * 8c XOR_0    XOR_1    2 3 3 001010010001111010xx| XOR    xor
    * 8d DIV_0    DIV_1    1 d 3 10000010100101101100| DIV    Branch on sign dividend RS1
    * 8e aF_SW_3  LDAF_3   6 c 3 10010010011001000x10|        Store 7 to mcause
    * 8f ILL_3    ILL_4    b 9 3 10001010001101001011|        Store illegal instruction to mtval
    * 90 NMI_2    JAL_3    b c 3 00110100001010001011|        mtval = 0.
    * 91 LDAF_2   LDAF_3   6 c 5 10010010111001000x10|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    9 3 3 00110100001100100x00|        PC to mepc
    * 93 SW_E2    SW_E3    9 3 3 10010101001101101000|        Store address that faulted
    * 94 SW_E4    JAL_3    5 c 3 00110100001100100x10|        Store 6 to mcause
    * 95 SW_E3    SW_E4    2 3 5 10010100110101101110|        Q = 3
    * 96 SH_1     SH_2     5 5 3 10011010001101101100|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    b 9 3 10010011001001000x11|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  4 3 3 00010011001111001011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     2 3 3 11111110000xxxx00xxx| Illegal instruction seen
    * 9a SH_2     SH_3     5 6 3 10110101001101101110|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * 9b MULHU_1  MULHU_2  4 3 3 01000010100111101011|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 9c DIV_10   DIV_12   1 a 3 01101000100110001000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   1 a 3 01100000100110001000|        RS2 < 0. Branch on sign of RS1
    * 9e SH_4     SH_5     c 7 3 10011111000110001100|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     a 3 3 11110010000110000100|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    4 0 7 01011110011110101110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  2 3 5 11001110110101001110|        Q = 4
    * a2 DIVU_5   ANDI_1   2 3 8 000110101101011010xx|        Transfer rM to rDee
    * a3 LB_6     StdIncPc 3 3 5 11100110111001001010|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * a4 SRxI_0   SRxI_1   0 5 0 00111010000111100x11| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 5 10101111010011001110|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  0 3 a 11010000000101100111| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 3 3 00101110010xxxx01110| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    0 a 3 01111000100101001100|        Branch on sign divisor RS2
    * a9 DIV_6    DIV_7    2 3 3 110010001001011010xx|        Write M. Prepare shift
    * aa ECALL_6  JAL_3    6 c 3 00110100011100100x10|        mcause = 11
    * ab EBREAK_2 ECALL_6  9 3 3 10101010001101001000|        pc to mepc
    * ac _Lac     SRx_1    2 3 3 00111111000111000xxx| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   2 5 3 111000001001110010xx| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _Lae     SRx_1    2 3 3 00111111000111000xxx| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 5 11000101010xxxx01110|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  2 3 5 10110010110101001110|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  Fetch    8 5 0 1101111000xxxxxxxxxx|        Not in use
    * b2 CSRRW_4  Fetch    6 4 5 11011110110110100110|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1 Fetch    8 5 0 1101111000xxxxxxxxxx|        Not in use
    * b4 CSRRWI_2 Fetch    8 5 0 1101111000xxxxxxxxxx|        Not in use
    * b5 SH_3     SH_4     0 3 3 10011110000000001011|        Prepare get back address to use 
    * b6 CSRRCI_1 Fetch    8 5 0 1101111000xxxxxxxxxx|        Not in use
    * b7 IJ_3     IJ_4     0 3 5 10111101010110001110|        Construct Q = 1
    * b8 BGE      condb_2  4 3 3 00010011001111001011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    0 3 5 11000000000110001100|        Calc carry of RS2+0xFFFFFFFF
    * ba DIV_C    DIV_e    5 3 3 10111001001111000100|        rM to yy. Q=ffffffff
    * bb MULHU_3  MULHU_2  1 3 3 01000010100111101100|        Shift Q and rM. Prepare read rs1
    * bc CSRRWI_0 CSRRW_1  4 3 3 01001001001011001011| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    5 4 3 11011110000110100101|        Mask and use as PC
    * be IJ_1     IJ_2     1 1 3 00011111000101101100|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 1 3 11000001000101101100|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 3 6 10001000000111001100|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    4 3 3 11101001001101001011|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   0 5 5 11001010010101101110|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   0 a 5 10100010010101101110|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    4 3 3 11100001000111101001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 3 3 01101111000000001101|        ~302
    * c6 IJT_4    ILL_2    9 0 3 01000111001110101101|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   9 3 3 11001011001xxxx01000|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 3 e 01100010100110001110|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   2 3 3 10100101010011001110|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 3 e 11000010100110001110|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc b c 3 11100110001010001011|        mtval = 0.
    * cc OR_0     OR_1     2 3 3 001001100001111010xx| OR     or
    * cd REM_0    DIV_1    1 d 3 10000010100101101100| REM    Branch on sign dividend RS1
    * ce ECALL_5  ECALL_6  2 3 5 10101010110101001110|        Q = 8
    * cf MRET_7   MRET_8   2 3 6 010011110000110010xx|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 5 00110111010001001110| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 3 3 11001001000011001011| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     1 6 8 00000110000101001100|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 b 9 3 00011110001101001011|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   4 c 5 10010010011001000x10|        Store 5 to mcause
    * d5 unalignd straddle 0 3 3 00010010000001001011|  Fr00  Unaligned pc, prep read high hword
    * d6 eILL0c   ILLe     2 3 3 11111110000xxxx00xxx| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  b 9 3 10100001001101001011|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  4 3 3 00010011001111001011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  2 3 3 010000101001111010xx|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   2 3 3 100100010001010010xx|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 9 5 10010010011001000x10|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  4 3 3 01001001001011001011| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  b 9 3 11100101001101001011|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 3 c 11110100000001101011|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   4 1 d 11110100000101101011|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   4 3 3 11001010001101101000|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 3 00011101000000001100|        Q = RS1
    * e2 MUL_1    MUL_2    0 5 8 11101000000101001110|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   2 3 8 000110101101011010xx|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   0 3 3 00011010000111101101| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  2 3 5 10001110110101001110|        Q = 4
    * e6 StdIncPc Fetch    6 4 4 11011110110110100110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 b 9 3 00011110001101001011|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 3 11100010100111001100|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    0 3 5 11000110010110001110|        Construct Q = 1
    * ea MULHU_5  MULHU_6  0 3 3 00100010000110001110|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     0 3 3 01010110000011101101|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    2 3 3 000100010001111010xx| AND    And 
    * ed REMU_0   DIVU_1   2 5 3 111000001001110010xx| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     2 3 3 11111110000xxxx00xxx| Illegal instruction seen
    * ef WFI_5    Fetch    6 4 5 11011110110110100110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    1 6 8 01110010000101001100|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 b 9 3 00011110001101001011|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 2 3 3 111001100000010010xx|        Prepare read PC
    * f3 aF_SW    aF_SW_1  2 3 3 11011101000xxxx001xx|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd b 9 f 11010101010111111110|  Fr00  Upd ttime, I. Q=imm Use dinx unless unaligned 
    * f5 jFault   jFault_1 b 9 3 11011011001101001011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    2 3 5 11111010110000001110| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 b 9 3 10101011001001001011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  4 3 3 00010011001111001011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   4 3 5 11011001010111001010|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    0 3 5 01000101010101001110|        Check offset
    * fb MULH_1   MULH_2   4 3 3 11111001001101001000|        Store ~rs1 to Ryy. Prep construct 1.
    * fc CSRRCI_0 CSRRW_1  4 3 3 01001001001011001011| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    2 3 3 011111100000010010xx| NMI    Get current PC
    * fe ILLe     ILL_1    2 3 3 010001100000010010xx| Illegal
    * ff QINT_0   QINT_1   2 3 3 110001110000010010xx| INT    Get current PC
    */
   localparam u0_0 = 256'h624b01c829c841cc6249a5ce30aca5ce90ad70cd4004664a6048e5ae216c15ae;
   localparam u0_1 = 256'h734b4d4e624b616720076249154a33cbe5a66048600c558e41ec6da6a1cc31ec;
   localparam u0_2 = 256'h624b70c9b14ce1c0040a65ce11cc65ced40e71c8400451e36048914e624827ae;
   localparam u0_3 = 256'ha1e051e0334c92cb2007d34c6a4833cb7208336e636ce1a4e000664ab1ec624b;
   localparam u0_4 = 256'h654ee000b3c811c8014465ceb40e65cef16c73ac554eb1eda004b14eb40e05ae;
   localparam u0_5 = 256'ha347016ca36e92cb2007d36cc3ebad6c310c710de34bb14ca347416ca3476368;
   localparam u0_6 = 256'hf40ea0edb3c811c8a18cb00b314c6248324321c4f048b1ed856e856e6248314c;
   localparam u0_7 = 256'he0000208e00092cb200721848d4e920b416b406be000e000e000a0cde34be14c;
   localparam u0_8 = 256'ha34b2642296c91e84722b54e624bc9e0e0004f82016c11ed254e81c8e00055ae;
   localparam u0_9 = 256'h2184f18c0988898829eb536ee00033cb3243a36c4d6e4322536843202e42428b;
   localparam u0_A = 256'h540ef1c009c8f1c0a34847228968894ce40e0167f4cea1e36e4aad68ed4ee7ae;
   localparam u0_B = 256'h116cf16ce1a592cb29ec93c4018c33cbd58ee000e00be000e000eda6e0002d4e;
   localparam u0_C = 256'hf0c8ad4e296c61e8628b298e54ce298eb20873adf00d11e9256ea56e934b81cc;
   localparam u0_D = 256'h416b406b534b92cb2642114829e833cb134be000204b2642e34b614c90cb744e;
   localparam u0_E = 256'heda6e00009c811e860ed218e658e29cce34beda6ed4ea1edad68814ed00ca368;
   localparam u0_F = 256'h70486048e04892cb9348554e95ca33cbb24bac0eb34b55fed0046048e34b214c;
   localparam u1_0 = 256'h333e2331233e133053384305033a4305133003302330333e233e022b111d0000;
   localparam u1_1 = 256'h433b235d733e032a0333733e43344331443d233e13610351033164470331033a;
   localparam u1_2 = 256'h333e436f153f233303534379033243790331433223300503233e0383333e4075;
   localparam u1_3 = 256'h150315037680433403337583733e4331936d76307533543d850d43380332339e;
   localparam u1_4 = 256'h035e233f55392333a83b07a6035407a61138903403560332033e058b035000a5;
   localparam u1_5 = 256'hb93d111756364334033355354339138b033a1335b931168eb93d1115b93d71be;
   localparam u1_6 = 256'h035c0331553923331b370336033a733eb939a93f236e03320a55055c733e033a;
   localparam u1_7 = 256'h850d9339850d43340333793f035a433a01df03cf850d850d850d0331b9311686;
   localparam u1_8 = 256'hb9386c391d3823324c530358333e2a39850d8343111f03320338433a850d0008;
   localparam u1_9 = 256'ha33fc7391a361a364334563b233f4331b939553923595c33933993336c59bc33;
   localparam u1_A = 256'h035c2333253e2333933a6c33233c0a37033203ad035a0503335e2381235c4075;
   localparam u1_B = 256'h113c1131543d43341334533b035c4331035b850d0339850d850d645d850d235b;
   localparam u1_C = 256'h2364235a1d382332bc3e13ec233a13e6933c90340336433e0a5a055c433e1368;
   localparam u1_D = 256'h41df43cfb93e43344959233923344331b93a233f03314c59b9311680433c0353;
   localparam u1_E = 256'h645d233f253e233103350332035c133eb931644d235803312381058e1331433c;
   localparam u1_F = 256'h233c233423374334433f0354435d4331b93a235fb93db9fd233d233eb9311687;
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

   assign d[4] = indir[0];
   assign d[5] = indir[1];
   assign d[8] = indir[2];
   assign d[9] = indir[3];
   assign d[10] = indir[4];
   assign d[14] = indir[5];
   assign d[15] = indir[6];
   assign d[16] = indir[7];
   assign d[17] = indir[8];
   assign d[20] = indir[9];
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
   SB_LUT4 #(.LUT_INIT(16'h0230)) cmb_d01(.O(d[1]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h4030)) cmb_d02(.O(d[2]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d06(.O(d[6]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d07(.O(d[7]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hff7e)) cmb_d12(.O(d[12]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h8000)) cmb_d22(.O(d[22]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0484)) cmb_d23(.O(d[23]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0400)) cmb_d24(.O(d[24]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d27(.O(d[27]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h2800)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d37(.O(d[37]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0000000001001100110110000010000010000000000000
   SB_LUT4 #(.LUT_INIT(16'h1f9f)) cmb_d13(.O(d[13]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1b10)) cmb_d19(.O(d[19]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0012)) cmb_d25(.O(d[25]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d26(.O(d[26]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1004)) cmb_d28(.O(d[28]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1100)) cmb_d29(.O(d[29]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0891)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0880)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2400)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000000000000010000000001001000000100000001000
   SB_LUT4 #(.LUT_INIT(16'h16a2)) cmb_d03(.O(d[3]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1ebb)) cmb_d11(.O(d[11]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1e00)) cmb_d18(.O(d[18]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0a70)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1007)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
