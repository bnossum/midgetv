/* I can't really pretend to understand link scrips even though I 
 * have used them for years.
 */
OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY 
{
  hdr (RWX) : ORIGIN = 0x000000f4, LENGTH = 12
  ebr (RWX) : ORIGIN = 0x00000100, LENGTH = 8K - 0x100
}

SECTIONS
{
  .header : {
    LONG(0x01071f3f)
    LONG(0x00000100)
    LONG(_payloadend)
  } 
  .theEBRram : {
    *(.DYNEBRram*) 
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
  } > ebr
}

