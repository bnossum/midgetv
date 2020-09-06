/* I can't really pretend to understand link scrips even though I 
 * have used them for years.
 */
OUTPUT_ARCH( "riscv" )
ENTRY( _start )

MEMORY 
{
  hdr : ORIGIN = 0, LENGTH = 12
  rom : ORIGIN = 12, LENGTH = 128K
  sram (RWX): ORIGIN = 0xfffe0000, LENGTH = 128K
  csrcode (RWX): ORIGIN = 0xb4, LENGTH = 4k
}

SECTIONS
{
  .id_and_header1 : {
    LONG(0x01071f3f)
    LONG(0x000000b4)
    LONG(_ebrloadend)
  } >hdr
  .thecsrcode : {
    *(.magicconstants)
    *(.magicconstants.string)
    _ebrloadend = .;
  } >csrcode AT >rom
  .header2 : {
    LONG(0xfffe0000)
    LONG(_payloadend)
  } >csrcode AT >rom
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

