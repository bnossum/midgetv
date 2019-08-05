### autobaud

Rudiments of serial communication. The purpose of this program is to be
a starting point for a bootloader for the upduino2 board.

The first transmitted character must be one of
| --- | 
| 0x01        |
| 0x03        |
| 0x07        |
| 0x0f        |
| 0x1f        |
| 0x3f == '?' |
| 0x7f        |


As written in 'C' we __nearly__ get 115200 bps with a 12 MHz clock. Timing for detection
of what bitrate to use succeed up to 115200 bps:

The autobaud character is '?', 0x3F, bitpattern on the line:
```
___------------------______---
S  0  1  2  3  4  5  6  7  F 
   |                       | 
```
The number of cycles needed per bit is known to +/- 2 cycles. 
With a 12 MHz clock, at 115200 bps, each bit should nominally 
need 104 cycles. Normally USART communications succeed when one
is inside a +/- 2.5% frequency limit. 

