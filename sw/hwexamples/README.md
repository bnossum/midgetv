Different small programs to test midgetv. All of these programs are to be compiled to `ice40loaderprog.hv` in respective directories for hardware platforms. The hardware platform verilog code is then to be compiled and uploaded.

### List of programs

| #  | Program       | Description
| -- | ------------- | ------------
| 1  | blinky        | Everyones favorite first program. 
| 2  | morse         | Hello world on a LED
| 3  | eratosthenes  | A first check on RAMs by sieving primes
| 4  | autobaud      | Start of bitbang UART communication
| 5  | midgetv_blast | Upload a new program to midgetv without Verilog recompile
| 6  | xmodemboot    | Simple monitor with xmodem upload capabilities

### What program on what platform?                    
                    
| Platform            | 1 | 2 | 3 | 4 | 5 | 6
| ------------------- | --|---|---|---|---|---
| iceblink40-hx1k     | y | y | n | n | ? | n
| max_iceblink40-hx1k | y | y | y | n | ? | n
| upduino2            | y | y | y | ? | ? | ?
| max_upduino2        | ? | ? | ? | ? | ? | ?

