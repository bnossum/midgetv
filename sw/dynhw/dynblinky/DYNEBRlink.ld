/* Documentme
 */
OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY 
{
  hdr (rwx) : ORIGIN = 0x000000f4, LENGTH = 12
  ebr (rwx) : ORIGIN = 0x00000100, LENGTH = 8K
}

SECTIONS
{
  .header : {
    LONG(0x3f3f3f3f)
    LONG(0x00000100)
    LONG(_payloadend)
  } 
  . = 0x100;
  .theEBRram : {
    *(.EBRram*)
    *(.srodata*)
    *(.rodata*)   
    *(.text*)
    *(.data*)
    *(.bss*)
    *(COMMON)
    _payloadend = . ;
    LONG(0x00000000)
    LONG(_start)
  } >ebr
}

