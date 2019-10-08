### Documentation

Alas! Next to Empty. I plan to write some more prose-like on the
architecture of midgetv, For now, here is an extremely incomplete list
of things to do to program `blinky` to an iceboard40-hx1k.

### First time programming in "13 easy steps"

To program `blinky` we need to:
 - assemble blinky.S to blinky.bin
 - transform `blinky.bin` to a format that can be included easily in Verilog, 
   the result file is `ice40loaderprog.hv`, a file containing
   `localparam`. This is done by an utility `midgetv_bin2ebr`.  
 - Compile the Verilog code, and
 - Upload the Verilog code.

When this is the very first time any instance of midgetv is compiled,
there are some additional steps.  Midgetv depends on microcode, the
file `ucode.h` must be transformed to Verilog. This is done by an
utility `midgetv_indirectEBR`. That utility must itself be
compiled. Also, the utility `midgetv_bin2ebr` mentioned above must be
compiled.  Performing these steps linearly may look like this:


 1.  Assume you have downloaded `midgetv-x.y.z`. Assume
     you have downloaded a riscv gcc, and programming tools for iceboard40-hx1k.
 2.  tar -xzf midgetv-2.0.1.tar.gz
     (unpack)
 3.  cd midgetv-2.0.1/code
 4.  make  
     (This produces a Verilog file `../obj_dir/m_2ebr.v`)
 5.  cd ../util/
 6.  make  
     (This produces the utility `../bin/midgetv_bin2ebr`)
 7.  mkdir ../obj_dir/first  
     (I need to enhance my make file. This directory must be made by hand now)
 8.  cd ../sw/hwexamples/blinky/
 9.  make  
     (This produces a verilog include file `../../../hwtst/iceblink40-hx1k/ice40loaderprog.hv`)
10.  cd ../../../hwtst/iceblink40-hx1k/
11.  apio clean
12.  apio build
     (Compile the Verilog code)
130. apio upload


