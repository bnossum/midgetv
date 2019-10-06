### Documentation

Alas! Next to Empty. I plan to write some more prose-like on the
architecture of midgetv, For now, here is an extremely incomplete list
of things to do to program `blinky` to an iceboard40-hx1k.


1  Assume you have downloaded `midgetv-x.y.z`. Assume
   you have downloaded a riscv gcc, and programming tools for iceboard40-hx1k.
2  tar -xzf midgetv-2.0.1.tar.gz 
3  cd midgetv-2.0.1/code
4  make  
   (This produces a Verilog file `../obj_dir/m_2ebr.v`)
5  cd ../util/
6  make  
   (This produces an utility `../bin/midgetv_bin2ebr`)
5  mkdir ../obj_dir/first  
   (I need to enhance my make file. This directory must be made by hand now)
5  cd ../sw/hwexamples/blinky/
6  make
   (This produces a verilog include file `../../../hwtst/iceblink40-hx1k/ice40loaderprog.hv`)
7  cd ../../../hwtst/iceblink40-hx1k/
8  apio clean
9  apio build
10 apio upload 


