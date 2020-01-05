/* I can't really pretend to understand link scrips even though I 
 * have used them for years.
*   hdr (RWX) : ORIGIN = 0x000000f4, LENGTH = 12
 */
OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY 
{
  hdr : ORIGIN = 0, LENGTH = 12
  rom : ORIGIN = 12, LENGTH = 128K
  sram (RWX): ORIGIN = 0xfffe0000, LENGTH = 128K
}

SECTIONS
{
  .header : {
    LONG(0x01071f3f)
    LONG(0xfffe0000)
    LONG(_payloadend)
  } >hdr
  .thesram : {
    *(.srodata*)
    *(.rodata*)   
    *(.text.startup)
    *(.text)
    *(.text*)
    *(.data*)
    *(.bss*)
    *(COMMON)
    _payloadend = . ;
    LONG(0x00000000)
    LONG(_start)
  } >sram AT >rom
}

