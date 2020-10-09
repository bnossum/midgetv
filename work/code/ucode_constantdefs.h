/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 */

/* Some analysis of microcode is done easier by
   defining value fields that are in use.
*/

#define I 0b1ull
#define O 0b0ull

#define OO 0b00ull
#define OI 0b01ull
#define IO 0b10ull
#define II 0b11ull

#define OOO 0b000ull
#define OOI 0b001ull
#define OIO 0b010ull
#define OII 0b011ull
#define IOO 0b100ull
#define IOI 0b101ull
#define IIO 0b110ull
#define III 0b111ull

#define OOOO 0b0000ull
#define OOOI 0b0001ull
#define OOIO 0b0010ull
#define OOII 0b0011ull
#define OIOO 0b0100ull
#define OIOI 0b0101ull
#define OIIO 0b0110ull
#define OIII 0b0111ull
#define IOOO 0b1000ull
#define IOOI 0b1001ull
#define IOIO 0b1010ull
#define IOII 0b1011ull
#define IIOO 0b1100ull
#define IIOI 0b1101ull
#define IIIO 0b1110ull
#define IIII 0b1111ull

#define OOOOO 0b00000ull
#define OOOOI 0b00001ull
#define OOOIO 0b00010ull
#define OOOII 0b00011ull
#define OOIOO 0b00100ull
#define OOIOI 0b00101ull
#define OIIOO 0b01100ull
#define IOIOO 0b10100ull
#define IOOOO 0b10000ull
#define IOOOI 0b10001ull
#define IOOII 0b10011ull
#define IOIOI 0b10101ull
#define IOIIO 0b10110ull
#define IOIII 0b10111ull
#define IIOOO 0b11000ull
#define IIOOI 0b11001ull
#define IIOIO 0b11010ull
#define IIOII 0b11011ull
#define IIIOO 0b11100ull
#define IIIOI 0b11101ull
#define IIIIO 0b11110ull
#define IIIII 0b11111ull

#define OOIOOO 0b001000ull
#define OOIOOI 0b001001ull
#define OOIOIO 0b001010ull
#define OIIOOO 0b011000ull
#define IOIOOO 0b101000ull
#define IIIOOO 0b111000ull
#define IIIOII 0b111011ull
#define IIIIIO 0b111110ull

/* To get out don't care values I use some value fields where the 'x'
 * can be changed to 0b0/0b1 at will in the program that uses this include file 
 */
#ifndef x
#define x 0b0ull
#endif

#define xO (0b00ull     | ((x) << 1) )
#define xI (0b01ull     | ((x) << 1) )
#define Ox (0b00ull     | ((x) << 0) )
#define xx (((x)<<1) | (x))

#define xxI (((xx)<<1)| 1ull << 0)

#define xxxx  (((xx)<<2) | (xx))
#define Oxxx  ((0b0000)   | ( ((xx)<<1) | (x)))
#define OOIx  (0b0010ull | (x))
#define OIIx  (0b0110ull | (x))
#define IOIx  (0b1010ull | (x))

#define OOOxx (0b00000ull | (xx))
#define OOIxx (0b00100ull | (xx))     
#define OIOxx (0b01000ull | (xx))     
#define OIIxx (0b01100ull | (xx))
#define xxxxx (((x)<<4) | (xxxx))  
