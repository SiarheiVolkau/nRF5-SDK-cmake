/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x00012000, LENGTH = 0x6e000
  RAM (rwx) :  ORIGIN = 0x20002000, LENGTH = 0x0e000
  
}

INCLUDE "nrf52_named_sections.ld"
INCLUDE "nrf52_common.ld"
