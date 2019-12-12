Droodle on a 16-bit instruction set analogue to risc-v.
What I want is to reuse midgetv, but with 16-bits datapath.
I want a compressed instruction set more in line with the
standard riscv than the proposed.

The idea is to use standard riscv to generate assembler to RV32IM, and
then code-translate to this instruction set. Any bit operation for
bits 16 to 31 are disallowed. It is hoped that by using a lot of
uint16_t and int16_t, we may get acceptable results.



//////////////////////////////////////////////////////////
// Complete recode.
Not supported:        fence,fence_i,csr,lw,sw,lhu,wfi,uret,sret
Encoded "somewhere"   ecall, ebreak, mret

  111111           t>s  
  111111           |  
  5432109876543210 |
0 0000ddddttttssss 0  add   rd,rt,rs         
0 0000ddddttttssss 1  xor   rd,rt,rs
0 0001ddddttttssss 0  or    rd,rt,rs
0 0001ddddttttssss 1  and   rd,rt,rs
0 0010ddddttttssss x  sub   rd,rt,rs
0 0011ddddttttssss x  slt   rd,rt,rs
0 0100ddddttttssss x  sltu  rd,rt,rs
0 0101ddddttttssss x  sll   rd,rt,rs
0 0110ddddttttssss x  srl   rd,rt,rs
0 0111ddddttttssss x  sra   rd,rt,rs
0 1000ddddttttKkkk x  addi  rd,rt,k
0 1001ddddttttKkkk x  xori  rd,rt,k
0 1010ddddttttKkkk x  ori   rd,rt,k
0 1011ddddttttKkkk x  andi  rd,rt,k
0 1100ddddttttKkkk x  slti  rd,rt,k
0 1101ddddttttKkkk x  sltiu rd,rt,k
0 1110ddddttttKkkk x  slli  rd,rt,k
0 1111ddddttttKkkk x  srli  rd,rt,k
                      
1 0000ddddttttKkkk x  srai  rd,rt,k
1 0001ddddttttKkkk x  lb    rd,ofs(rt)
1 0010ddddttttKkkk x  lbu   rd,ofs(rt)
1 0011ddddttttKkkk x  lh    rd,ofs(rt)
1 0100ddddttttKkkk x  sb    rd,ofs(rt)
1 0101ddddttttKkkk x  sh    rd,ofs(rt)
1 0110ddddttttKkkk x  beq   rd,rs,ofs
1 0111ddddttttKkkk x  bne   rd,rs,ofs
1 1000ddddttttKkkk x  blt   rd,rs,ofs
1 1001ddddttttKkkk x  bge   rd,rs,ofs
1 1010ddddttttKkkk x  bltu  rd,rs,ofs
1 1011ddddttttKkkk x  bgeu  rd,rs,ofs
1 1100ddddttttKkkk x  jalr  rd,rs1+ofs
1 1101ddddkkkkKkkk x  jal   rd,k
1 1110aaaaaaaaaaaa x  pfxpc takes the place of auipc
1 1111kkkkkkkkkkkk x  pfx   take the place of lui

These opcodes are 17 bits. That is a no-go. 


         
Alternative (not good)
------------


0000 dddd ttt kkkkk lb       (k)
0001 dddd ttt kkkkk lh       (k)
0010 dddd ttt kkkkk lbu      (k)
0011 dddd ttt kkkkk sb       (k)
0100 dddd ttt kkkkk sh       (k)
0101 dddd ttt kkkkk beq      (k)
0110 dddd ttt kkkkk bne      (k)
0111 dddd ttt kkkkk blt      (k)
1000 dddd ttt kkkkk bge      (k)
1001 dddd ttt kkkkk bltu     (k)
1010 dddd ttt kkkkk bgeu     (k)

1011 000 ddd kkkkkk addi     (k)
1011 001 ddd kkkkkk slli     (k)
1011 010 ddd kkkkkk slti     (k)
1011 011 ddd kkkkkk sltiu    (k)
1011 100 ddd kkkkkk xori     (k)
1011 101 ddd kkkkkk andi     (k)
1011 110 ddd kkkkkk ori      (k)
1011 111 ddd 00kkkk srli     (k)
1011 111 ddd 01kkkk srai     (k)
1011 111 xxx 1xxxxx
1011 xxx 000 xxxxxx

1100 0000 dddd tttt add      (a)
1100 0001 dddd tttt sub      (a)
1100 0010 dddd tttt sll      (a)
1100 0011 dddd tttt slt      (a)
1100 0100 dddd tttt sltu     (a)
1100 0101 dddd tttt xor      (a)
1100 0110 dddd tttt srl      (a)
1100 0111 dddd tttt sra      (a)
1100 1000 dddd tttt or       (a)
1100 1001 dddd tttt and      (a)
1100 xxxx 0000 xxxx

1101t kkk kkkk kkkk luip     In front of (k), completes constant and give missing bit of reg. In front of (a) gives reg ssss
1110t kkk kkkk kkkk auipcp   As lwip, but also adds in PC
11110 ddd kkkk kkkk jal
11111 ddd tttt kkkk jalr
        
mul     
mulh    
mulhsu  
mulhu   
div     
divu    
rem     
remu    


///////////////////////////////////////////

Registers. riscv16 has 16 registers.
r0 is hardcoded to 0
r1 is conventionally used as the link register
r2 us conventionally used as the stack index
r3 to r7 are mapped from some of the most often used RV32E registers


Register mapping:
r0  = x0  = 0
r1  = x1  = link reg
r2  = x2  = stack reg
r3  = x11
r4  = x12
r5  = x13
r6  = x14
r7  = x15
r8  = x8
r9  = x9
r10 = x10
r11 = x3
r12 = x4
r13 = x5
r14 = x6
r15 = x7

  111111             
  5432109876543210
  0kkkd000kkkkkkkk        auipc in front of (k). Extend constant. PC also added. s == 0
  10000dddtttsss00 t>s    add   rd,rt,rs     (a)  
  10000dddtttsss00 t<s    or    rd,rt,rs     (a)
  10000dddtttsss01 t>s    and   rd,rt,rs     (a)                                                 
  10000dddtttsss01 t<s    xor   rd,rt,rs     (a)  
  10000dddtttsss10        sub   rd,rt,rs     (a)  
  10000dddtttsss11        slt   rd,rt,rs     (a)  
  10001dddtttsss00        sltu  rd,rt,rs     (a)
  10001dddtttsss01        sll   rd,rt,rs     (a)  
  10001dddtttsss10        srl   rd,rt,rs     (a)  
  10001dddtttsss11        sra   rd,rt,rs     (a)
  10010xxxxxxxxxxx
  10011dddtttkkkkk        addi  rd,rt,k      (k)  
  10100dddtttkkkkk        xori  rd,rt,k      (k)  
  10101dddtttkkkkk        ori   rd,rt,k      (k)  
  10110dddtttkkkkk        andi  rd,rt,k      (k)  
  10111dddtttkkkkk        slti  rd,rt,k      (k)  
  11000dddtttkkkkk        sltiu rd,rt,k      (k)                    
  11001dddtttkkkkk        slli  rd,rt,k      (k)  
  11010dddttt0kkkk        srli  rd,rt,k      (k)  
  11010dddttt1kkkk        srai  rd,rt,k      (k)  
  11011dddtttkkkkk        lb    rd,ofs(rt)   (k)  
  11100dddtttkkkkk        lbu   rd,ofs(rt)   (k)  
  11101dddtttkkkkk        lh    rd,ofs(rt)   (k)  
  11110dddtttkkkkk        sb    rd,ofs(rt)   (k)  
  11111dddtttkkkkk        sh    rd,ofs(rt)   (k)  
  00000dddtttkkkkk        beq   rd,rs,ofs    (k)  
  00001dddtttkkkkk        bne   rd,rs,ofs    (k)  
  00010dddtttkkkkk        blt   rd,rs,ofs    (k)  
  00011dddtttkkkkk        bge   rd,rs,ofs    (k)  
  00100dddtttkkkkk        bltu  rd,rs,ofs    (k)  
  00101dddtttkkkkk        bgeu  rd,rs,ofs    (k)  
  00110dddtttkkkkk        jalr  rd,rs1+ofs   (k)  
  0100Kdddkkkkkkkk        jal   rd,k         (k)
  0101dkkkkkkkkkkk        auipc in front of (k). Extend constant. PC also added. s == 1
  011tdkkkkkkkkkkk        pfxk  in front of (k). Extends constant, extend register spec.
  011tds.........0        pfxf  in front of (a). Extends register spec
  
          mul                                           
          mulh                                
          mulhu                               
          mulhsu                              
          div                             
          divu                                
          rem                               
          remu                                
