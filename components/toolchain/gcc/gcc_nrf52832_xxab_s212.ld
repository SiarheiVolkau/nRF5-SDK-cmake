/* Linker script to configure memory regions. */

SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x12000, LENGTH = 0x2e000
  RAM (rwx) :  ORIGIN = 0x20000b80, LENGTH = 0x7480
  
}

INCLUDE "nrf52_sd_sections.ld"
INCLUDE "nrf52_common.ld"
