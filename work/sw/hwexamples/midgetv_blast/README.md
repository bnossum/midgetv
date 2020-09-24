Upload programs to boards without verilog recompile. Actually,
*dynamically* upload programs. The purpose is to allow for rapid
prototyping and debugging. The same file format is valid through all
platforms.

### mb.S

This program is compiled to an `ice40loaderprog.hv` and then the
compiled Verilog is uploaded to platforms that have access to a serial
bit-bang UART. With the platform thus configured, new programs for
midgetv are uploaded by streaming to the serial port:

`cat uploadimage.bin > /dev/ttyUSB0` or similar.

The maximum bitrate depends on the clock of the platform.

### mb2.S

As above, but for the iceblink-hx1k based platforms. Here there is no
serial bit-bang UART available, so uploading is done via a dedicated
loader program, and the Verilog code of the iceblink-hx1k platform has
a corresponding interface, see `m_digilent.v`. Usage:

`sudo iceblinkcom < dynblinky.bin` or similar.

### Format of the program to upload
This is chunk based. There are one header word, and two chunk types.

:----------- | :------------------------------- 
Header word  | `0x01071f3f`                     
Data chunk:  | `uint32_t loadadr`<br>`uint32_t endloadadr`<br>`endloadadr-loadadr bytes of data` 
Exec chunk   | `0x00000000`<br>Startadr         


The loaded program can be 0 to any number of data chunks,
and is ended with an exec chunk. uint32_t variables are stored
little-endian. Granularity is byte-based.


The most used scenario will perhaps be a file compiled for SRAM,
starting execution at _start. In that case the file will be:

    0x01071f3f 
    0x80000000 
    dataendadr 
    [data]     
    0x00000000 
    _start     

For platforms with no SRAM:

               
    ---------- 
    0x01071f3f 
    0x00000100 
    dataendadr 
    [data]     
    0x00000000 
    _start     

### Locations that can be loaded:

Care has been taken to minimize the size of `mb.S` and `mb2.S`. They
execute mostly in space normally occupied by registers, and has a
small footprint. The entire SRAM space can be loaded, implemented IO
registers can be written and EBR can be loaded from address 0x100
upwards (for the exact limits see comments in `mb.S` and `mb2.S`).

