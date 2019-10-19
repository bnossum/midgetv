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
 7. `cd work/sw/second; make; ./runall; ./compareall | less`
     Regenerate conformance tests, visual inspection of result
 8. `cd work/sw/hwexamples/midgetv_blast; make`
     Build `ice40loaderprog.hv` of "blast-code" for platforms
     `max_iceblink40-hx1k` and `max_upduino2`
 9.  `cd work/hwtst/max_iceblink40-hx1k`
     Build `hardware.bin` and upload to `iceblink40-hx1k` board.
 10. `cd work/hwtst/max_upduino2`
     Build `hardware.bin` and upload to `upduino2` board.
 11. `cd work/sw/dynhw/dynblinky; make`
     Build dynamic blinky program.
 12. `cd work/obj_dir`; cat dynblinky.bin > /dev/ttyUSB0`
     Upload dynamic blinky program to `upduino2` board    
 13. `sudo ../bin/iceblinkcom < dynblinky.bin`
     Upload dynamic blinky program to `iceblink40-hx1k` board    
 14. `cd work/sw/hwexamples/morse; make`
     Build `ice40loaderprog.hv` of morse for platforms
     `iceblink40-hx1k` and `upduino2`
 15. `cd work/hwtst/iceblink40-hx1k`
     Build `hardware.bin` and upload to `iceblink40-hx1k` board.
 16. `cd work/hwtst/upduino2`
     Build `hardware.bin` and upload to `upduino2` board.

When all of this is done without any failures, a new release will
hopefully be reasonably complete and consistent.