/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x23000, LENGTH = 0x5d000
  RAM (rwx) :  ORIGIN = 0x20001368, LENGTH = 0xec98
  
}

INCLUDE "nrf52_sd_sections.ld"
INCLUDE "nrf52_common.ld"
