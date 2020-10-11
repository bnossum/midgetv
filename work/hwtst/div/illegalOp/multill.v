module multill
  (
   input [31:0] Op,
   output reg   ill
   );

   always @(/*AS*/Op)
     casez ( {Op[6:2],Op[14:12]} )
       //       111
       // 65432 432   ill  Comment
       8'b00000_00? : ill = 1'b0;
       8'b00000_010 : ill = 1'b0;
       8'b00000_011 : ill = 1'b1; // close to LB
       8'b00000_10? : ill = 1'b0;
       8'b00000_11? : ill = 1'b1; // close to LB       

       8'b00001_??? : ill = 1'b?; // 

       8'b00010_000 : ill = 1'b0;
       8'b00010_001 : ill = 1'b1;  // close to ij   
       8'b00010_01? : ill = 1'b1;  // close to ij   
       8'b00010_1?? : ill = 1'b1;  // close to ij

       8'b00011_00? : ill = 1'b0;
       8'b00011_01? : ill = 1'b1;  // close to FENCE
       8'b00011_1?? : ill = 1'b1;  // close to FENCE

       8'b0010?_??? : ill = 1'b0;
       8'b0011?_??? : ill = 1'b?;

       8'b01000_00? : ill = 1'b0;
       8'b01000_010 : ill = 1'b0;
       8'b01000_011 : ill = 1'b1;  // close to SW   
       8'b01000_1?? : ill = 1'b1;  // close to SW   

       8'b01001_??? : ill = 1'b?;
       8'b0101?_??? : ill = 1'b?;
       8'b0110?_??? : ill = 1'b0;
       8'b0111?_??? : ill = 1'b?;
       8'b10???_??? : ill = 1'b?;

       8'b11000_00? : ill = 1'b0;
       8'b11000_01? : ill = 1'b1;  // close to BEQ
       8'b11000_1?? : ill = 1'b0;

       8'b11011_000 : ill = 1'b0;
       8'b11001_001 : ill = 1'b1;  // close to JALR 
       8'b11001_01? : ill = 1'b1;  // close to JALR 
       8'b11001_1?? : ill = 1'b1;  // close to JALR

       8'b11010_??? : ill = 1'b?;
       8'b11011_??? : ill = 1'b0;

       8'b11100_0?? : ill = 1'b0;
       8'b11100_100 : ill = 1'b1;  // close to CSR
       8'b11100_101 : ill = 1'b0;
       8'b11100_11? : ill = 1'b0;
       
       8'b11101_??? : ill = 1'b?;
       8'b1111?_??? : ill = 1'b?;
     endcase
endmodule

// 22 */Y( 0,     0 , _MULHU_6           , 2, 0x00400000, 0x00000000, 0          ) // illegal at entry. Can get here from OpCode close to "ij"
// 39 */Y( 0,     0 , _MULHU_7           , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR"
// 42 */Y( 0,  0x03 , _MULHU_2           , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
// 43 */Y( 0,  0x03 , _MULHU_4           , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
// 58 */Y( 0,  0x08 , _DIV_A             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "BEQ"
// 59 */Y( 0,  0x08 , _DIV_B             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR"
// 60 */Y( 0,  0x0a , _DIV_14            , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "LW" | Move around to other pair to get 1 location for LAZY_DECODE 2/12
// 62 */Y( 0,  0x0b , _DIV_8             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
// 63 */Y( 0,  0x0b , _DIV_9             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
// 68 */Y( 0,  0x23 , _DIV_12            , 2, 0x00200000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "SW" | Move around to other pair to get 1 location for LAZY_DECODE 3/12
// 6a */Y( 0,     0 , _MULH_1            , 2, 0xffffffff, 0x00000000, 0          ) // illegal as entry. Can get here from OpClde close to "LW" and also "SW"
// 78 */Y( 0,  0x0f , _DIV_4             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "BEQ"
// 79 */Y( 0,  0x0f , _DIV_5             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR"
// 82 */Y( 0,  0x10 , _DIV_1             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
// 83 */Y( 0,  0x10 , _DIV_2             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
// 88 */Y( 0,  0x12 , _DIV_E             , 2, 0x00200000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "SW"  || Move around to get 1 location for LAZY_DECODE 4/12
// 8a */Y( 0,  0x15 , _DIVU_5            , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "SW" 
// 99 */Y( 0,     0 , _ILL_0(_L99)       , 2, 0x00400000, 0x00000000, 0          ) // illegal Can get here from OpCode close to "JALR". Only location I have left to play with
// 9c */Y( 0,  0x14 , _DIV_10            , 2, 0x00001000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "EBREAK/ECALL/CSR" || Move around to get 1 location for LAZY_DECODE 5/12
// a2 */Y( 0,     0 , _MULHU_3           , 2, 0xffffffff, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
// a3 */Y( 0,     0 , _MULHU_1           , 2, 0xffffffff, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
// a8 */Y( 0   ,  0 , _DIV_3             , 2, 0x00200000, 0x00000000, 0          ) // Illegal as entry. Can get here from OpCode close to "SW". DIV_3 must be even ucode adr
// aa */Y( 0,     0 , _DIV_6             , 2, 0xffffffff, 0x00000000, 0          ) // Illegal as entry. Can get here from OpCode close to "SW"
// b9 */Y( 0,     0 , _DIV_e             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR".
// c0 */Y( 0,     0 , _DIV_D             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "LW"
// c2 */Y( 0,  0x18 , _DIVU_3            , 2, 0x00400000, 0x00000000, 0          ) // Illegal as entry. Can get here from OpCode close to "ij"
// c3 */Y( 0,  0x18,  _DIVU_4            , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE. 
// c8 */Y( 0,     0 , _DIV_7             , 2, 0x00200000, 0x00000000, 0          ) // Illegal as entry. Can get here from OpCode close to "SW". DIV_7 must be even ucode adr
// ca */Y( 0,     0 , _DIVU_2            , 2, 0x00200000, 0x00000000, 0          ) // illegal
// d9 */Y( 0,     0 , _MULH_3            , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR".
// e0 */Y( 0,     0 , _DIVU_1            , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "LW"
// e2 */Y( 0,  0x1d , _MUL_1             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "ij"
// e3 */Y( 0,  0x1d , _MUL_3             , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to FENCE
// e8 */Y( 0,     0 , _MUL_2             , 2, 0x00200000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "SW".
// ea */Y( 0,     0 , _MULHU_5           , 2, 0x00200000, 0x00000000, 0          ) //(illegal) May be moved 1/12 needed for LAZY_DECODE
// f9 */Y( 0,     0 , _MULH_2            , 2, 0x00400000, 0x00000000, 0          ) // illegal as entry. Can get here from OpCode close to "JALR".

/* Very strange. Gives a fantazillion luts
  */
//module multill
//  (
//   input [7:0] Op,
//   output reg  ill
//   );
//
//
//   //         reachability
//   //ORIGTAB  | this data.
//   always @(/*AS*/Op)
//     casez ( Op[7:0] ) 
//       8'h01 : ill = 1'b?;
//       8'h06 : ill = 1'b?;
//       8'h07 : ill = 1'b?;
//       8'h09 : ill = 1'b?;
//       8'h0b : ill = 1'b?;
//       8'h10 : ill = 1'b?;
//       8'h11 : ill = 1'b?;
//       8'h12 : ill = 1'b?;
//       8'h13 : ill = 1'b?;
//       8'h14 : ill = 1'b?;
//       8'h15 : ill = 1'b?;
//       8'h16 : ill = 1'b?;
//       8'h17 : ill = 1'b?;
//       8'h1a : ill = 1'b?;
//       8'h1d : ill = 1'b?;
//       8'h1e : ill = 1'b?;
//       8'h1f : ill = 1'b?;
//       8'h21 : ill = 1'b?;
//       8'h22 : ill = 1'b1;
//       8'h26 : ill = 1'b?;
//       8'h27 : ill = 1'b?;
//       8'h29 : ill = 1'b?;
//       8'h2b : ill = 1'b?;
//       8'h2e : ill = 1'b?;
//       8'h30 : ill = 1'b?;
//       8'h31 : ill = 1'b?;
//       8'h32 : ill = 1'b?;
//       8'h33 : ill = 1'b?;
//       8'h34 : ill = 1'b?;
//       8'h35 : ill = 1'b?;
//       8'h36 : ill = 1'b?;
//       8'h37 : ill = 1'b?;
//       8'h39 : ill = 1'b1;
//       8'h3a : ill = 1'b?;
//       8'h3d : ill = 1'b?;
//       8'h3e : ill = 1'b?;
//       8'h3f : ill = 1'b?;
//       8'h41 : ill = 1'b?;
//       8'h42 : ill = 1'b1;
//       8'h43 : ill = 1'b1;
//       8'h45 : ill = 1'b?;
//       8'h46 : ill = 1'b?;
//       8'h47 : ill = 1'b?;
//       8'h49 : ill = 1'b?;
//       8'h4b : ill = 1'b?;
//       8'h4e : ill = 1'b?;
//       8'h4f : ill = 1'b?;
//       8'h50 : ill = 1'b?;
//       8'h51 : ill = 1'b?;
//       8'h52 : ill = 1'b?;
//       8'h53 : ill = 1'b?;
//       8'h54 : ill = 1'b?;
//       8'h55 : ill = 1'b?;
//       8'h56 : ill = 1'b?;
//       8'h57 : ill = 1'b?;
//       8'h58 : ill = 1'b1;
//       8'h59 : ill = 1'b1;
//       8'h5a : ill = 1'b?;
//       8'h5d : ill = 1'b?;
//       8'h5e : ill = 1'b?;
//       8'h5f : ill = 1'b?;
//       8'h60 : ill = 1'b1;
//       8'h61 : ill = 1'b?;
//       8'h62 : ill = 1'b1;
//       8'h63 : ill = 1'b1;
//       8'h65 : ill = 1'b?;
//       8'h66 : ill = 1'b?;
//       8'h67 : ill = 1'b?;
//       8'h68 : ill = 1'b1;
//       8'h69 : ill = 1'b?;
//       8'h6a : ill = 1'b1;
//       8'h6b : ill = 1'b?;
//       8'h6e : ill = 1'b?;
//       8'h6f : ill = 1'b?;
//       8'h70 : ill = 1'b?;
//       8'h71 : ill = 1'b?;
//       8'h72 : ill = 1'b?;
//       8'h73 : ill = 1'b?;
//       8'h74 : ill = 1'b?;
//       8'h75 : ill = 1'b?;
//       8'h76 : ill = 1'b?;
//       8'h77 : ill = 1'b?;
//       8'h78 : ill = 1'b1;
//       8'h79 : ill = 1'b1;
//       8'h7a : ill = 1'b?;
//       8'h7d : ill = 1'b?;
//       8'h7e : ill = 1'b?;
//       8'h7f : ill = 1'b?;
//       8'h81 : ill = 1'b?;
//       8'h82 : ill = 1'b1;
//       8'h83 : ill = 1'b1;
//       8'h85 : ill = 1'b?;
//       8'h86 : ill = 1'b?;
//       8'h87 : ill = 1'b?;
//       8'h88 : ill = 1'b1;
//       8'h89 : ill = 1'b?;
//       8'h8a : ill = 1'b1;
//       8'h8b : ill = 1'b?;
//       8'h8e : ill = 1'b?;
//       8'h8f : ill = 1'b?;
//       8'h90 : ill = 1'b?;
//       8'h91 : ill = 1'b?;
//       8'h92 : ill = 1'b?;
//       8'h93 : ill = 1'b?;
//       8'h94 : ill = 1'b?;
//       8'h95 : ill = 1'b?;
//       8'h96 : ill = 1'b?;
//       8'h97 : ill = 1'b?;
//       8'h99 : ill = 1'b1;
//       8'h9a : ill = 1'b?;
//       8'h9b : ill = 1'b?;
//       8'h9c : ill = 1'b1;
//       8'h9d : ill = 1'b?;
//       8'h9e : ill = 1'b?;
//       8'h9f : ill = 1'b?;
//       8'ha1 : ill = 1'b?;
//       8'ha2 : ill = 1'b1;
//       8'ha3 : ill = 1'b1;
//       8'ha5 : ill = 1'b?;
//       8'ha6 : ill = 1'b?;
//       8'ha7 : ill = 1'b?;
//       8'ha8 : ill = 1'b1;
//       8'ha9 : ill = 1'b?;
//       8'haa : ill = 1'b1;
//       8'hab : ill = 1'b?;
//       8'haf : ill = 1'b?;
//       8'hb0 : ill = 1'b?;
//       8'hb1 : ill = 1'b?;
//       8'hb2 : ill = 1'b?;
//       8'hb3 : ill = 1'b?;
//       8'hb4 : ill = 1'b?;
//       8'hb5 : ill = 1'b?;
//       8'hb6 : ill = 1'b?;
//       8'hb7 : ill = 1'b?;
//       8'hb9 : ill = 1'b1;
//       8'hba : ill = 1'b?;
//       8'hbb : ill = 1'b?;
//       8'hbd : ill = 1'b?;
//       8'hbe : ill = 1'b?;
//       8'hbf : ill = 1'b?;
//       8'hc0 : ill = 1'b1;
//       8'hc1 : ill = 1'b?;
//       8'hc2 : ill = 1'b1;
//       8'hc3 : ill = 1'b1;
//       8'hc5 : ill = 1'b?;
//       8'hc6 : ill = 1'b?;
//       8'hc7 : ill = 1'b?;
//       8'hc8 : ill = 1'b1;
//       8'hc9 : ill = 1'b?;
//       8'hca : ill = 1'b1;
//       8'hcb : ill = 1'b?;
//       8'hce : ill = 1'b?;
//       8'hcf : ill = 1'b?;
//       8'hd0 : ill = 1'b?;
//       8'hd1 : ill = 1'b?;
//       8'hd2 : ill = 1'b?;
//       8'hd3 : ill = 1'b?;
//       8'hd4 : ill = 1'b?;
//       8'hd5 : ill = 1'b?;
//       8'hd6 : ill = 1'b?;
//       8'hd7 : ill = 1'b?;
//       8'hd9 : ill = 1'b1;
//       8'hda : ill = 1'b?;
//       8'hdb : ill = 1'b?;
//       8'hdd : ill = 1'b?;
//       8'hde : ill = 1'b?;
//       8'hdf : ill = 1'b?;
//       8'he0 : ill = 1'b1;
//       8'he1 : ill = 1'b?;
//       8'he2 : ill = 1'b1;
//       8'he3 : ill = 1'b1;
//       8'he5 : ill = 1'b?;
//       8'he6 : ill = 1'b?;
//       8'he7 : ill = 1'b?;
//       8'he8 : ill = 1'b1;
//       8'he9 : ill = 1'b?;
//       8'hea : ill = 1'b1;
//       8'heb : ill = 1'b?;
//       8'hee : ill = 1'b?;
//       8'hef : ill = 1'b?;
//       8'hf0 : ill = 1'b?;
//       8'hf1 : ill = 1'b?;
//       8'hf2 : ill = 1'b?;
//       8'hf3 : ill = 1'b?;
//       8'hf4 : ill = 1'b?;
//       8'hf5 : ill = 1'b?;
//       8'hf6 : ill = 1'b?;
//       8'hf7 : ill = 1'b?;
//       8'hf9 : ill = 1'b1;
//       8'hfa : ill = 1'b?;
//       8'hfb : ill = 1'b1;
//       8'hfe : ill = 1'b1;
//     endcase
//endmodule
//
