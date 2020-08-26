### User guide

##### Common to all files
* `make` in directory [`midgetvblast`](./../hwexamples/midgetv_blast) to get the loader program compiled to `ice40loaderprog.hv`.
* Compile and upload to `upduino2` board. You will probably use the project in [directory](../../../hwtst/max_upduino2/).
  Midgetv is now ready to load an image from the bit-bang UART.

##### For dynblinky
* `make` in directory `dynblinky` to generate `dynblinky.bin`.
* Ensure your `ttyUSB0` (or similar) serial device is *no quicker* than 115200 bps
* `cat dynblinky.bin > /dev/ttyUSB`. The program should repeat: Blink twice on green led, then a longer pause.

##### For verify_maxupduino
* `make` in directory `verify_maxupduino` to generate `verify_maxupduino.bin`.
* Continue as above.


