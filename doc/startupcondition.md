### Startup conditions

ice40 flip-flops are all 0 at power-up. But the output from EBR is
unknown until the first clock cycle. Because we have control equations
out from EBR, we must analyze the startup sequence.

The state of midgetv is the totality of the flip-flops. As there are
only around 90 of these, I briefly list them all:

| File | FF's | Comment |
| :----| :--- | :---------- |
| m_3ebr.v                   | 0 | |
| m_alu.v                    | 0 | |
| m_alu_carryin.v            | 0 | |
| m_condcode.v               | 1 | `raluF_r` |
| m_cyclecnt.v               | Lowlevel, 1 | `corerunning == rcrun`. |
|                           | Highlevel, 7 | `corerunning == rcrun`.  |
|                           |             | `rcnt[5:0]`|
|m_ebr.v                    | 0 | But this is the registers etc of midgetv. Attention to signal `iwe`|
|m_immexp_zfind_q.v         |32 | Give `ADR_O`|
|m_inputmux.v               |1+IWIDTH  | Pipelined `sa00mod`|
|                           |          | `rDee[IWIDTH-1:0]`|
|m_midgetv_core.v           |0  |  |
|m_opreg.v                  |32 | `OpC`|
|m_progressctrl.v           |12 | `bmask[3:0]`, `SEL_O[3:0]`, `STB_O`, `sram_stb`, `WE_O`, `ctrlreg_we`, `AckM`|
|m_rai.v                    | 0 |   |
|m_ram.v                    | 0 |   |
|m_ram_a16.v/m_ram_a17.v    | 1 | `readack`|
|m_shiftcounter.v           | 1 | `r_issh0_not` |
|m_status_and_interrupts.v  |12 | `mrinstretip, mtimeincip, mtip, msip, mrinstretie, mtimeincie, meie, mtie, msie, mpie, mie, qualint` |
|m_ucode.v                  | 0 |   |
|m_ucodepc.v                | 0 |   |
|m_wai.v                    | 0 |   |

The state of these flipflops must be such that we do not have any
`STB_O`, `sram_stb`, `iwe` or write to `OpC`, `ADR_O`, or any of the
registers in `m_status_and_interrupts`  until
`corerunning` is high. If this is the case, and we also ensure that
`minx == 8'h0`, the first executed instruction will be `lb x0,0(x0)`,
which is innocent, and then a normal OpCode fetch will really start
the program from the value at `mem[pc+4]`. Remaining
flip-flops are don't care.

##### `STB_O` and `sram_stb`
These depends on `badalignment == 0`. 
By setting `badalignment == 1` when `corerunning == 0`, we ensure
`STB_O` and `sram_stb` are inactive.

##### `iwe`
We ensure `iwe` is low if `corerunning == 0`

##### `OpC[31:0]`
We ensure the registers are only updated if `corerunning == 1`.

##### `ADR_O[31:0]`
We ensure the reset signal to these flip-flops is high when
'corerunning == 0'. If the register is updated it is then rewritten to
32'h0.


##### Control registers
Update of these depends on `ctrlreg_we == 1`. But we ensure
`ctrlreg_we` can only be high if `badalignment == 0`, not the case
when `corerunning == 0`.

##### `minx[7:0]`
Here we force `minx == dinx` (`dinx` comes from `OpC[]`) when
`corerunning == 0`.




### How to check?
The above is all very well, but how do we check it really holds? We
can not iterate over all (1<<44) possible startconditions out of the
EBR. 
