/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x2d000, LENGTH = 0x53000
  RAM (rwx) :  ORIGIN = 0x20001f30, LENGTH = 0xe0d0
  
}

INCLUDE "nrf52_named_sections.ld"
INCLUDE "nrf52_common.ld"
