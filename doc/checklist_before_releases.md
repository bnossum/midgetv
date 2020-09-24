### Before releases

This note is a checklist of things I should do before packaging a new release.

 1.  `cd work/objdir; rm -rf *`
     Remove generated files
 2.  `cd work/bin; ./cleanup`
     Remove generated files
 3.  `cd work/util; make`
     Regenerate basic utilities
 4.  `cd work/code; make`
     Regenerate optimized microcode
 5.  `cd work/tst; make; ./runall`
     Regenerate simulation tools and test a number of modules
 6.  `cd work/sw/first; make; less ../../obj_dir/results.txt`
     Regenerate basic instruction tests, visual inspection of result
 7. `cd work/sw/simcompliance;`
     In each of `rv32i`,`rv32Zifencei`, `rv32Zicsr`, `rv32im`, `rv32imc` do
     `make; ./runall; ./compareall | less`
     Regenerate conformance tests, visual inspection of result.
 8. `cd work/sw/hwexamples/midgetv_blast; make`
     Build `ice40loaderprog.hv` of "blast-code" for platforms
     `iceblinker` and more
 9.  `cd work/hwtst/max_iceblink40-hx1k`
     Build `hardware.bin` and upload to `iceblink40-hx1k` board.
 10. `cd work/hwtst/max_upduino2`
     Build `hardware.bin` and upload to `upduino2` board.
 11. `cd work/hwtst/icebreaker`
     Build `hardware.bin` and upload to `icebreaker` board.
 12. `cd work/sw/dynhw/dynblinky; make`
     Build dynamic blinky program.
 13. `cd work/obj_dir; cat dynblinky.bin > /dev/ttyUSB1`
     Upload dynamic blinky program to `icebreaker` board    
 14. `cd work/obj_dir; cat dynblinky.bin > /dev/ttyUSB0`
     Upload dynamic blinky program to `upduino2` board    
 15. `sudo ../bin/iceblinkcom < dynblinky.bin`
     Upload dynamic blinky program to `iceblink40-hx1k` board    
 16. `cd work/compliance`. Run compliance test on `icebreaker`-board

 
When all of this is done without any failures, a new release will
hopefully be reasonably complete and consistent.