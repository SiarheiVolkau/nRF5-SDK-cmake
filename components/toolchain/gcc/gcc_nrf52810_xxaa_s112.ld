/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x18000, LENGTH = 0x18000
  RAM (rwx) :  ORIGIN = 0x20000eb8, LENGTH = 0x5148
  
}

INCLUDE "nrf52_named_sections.ld"
INCLUDE "nrf52_common.ld"
