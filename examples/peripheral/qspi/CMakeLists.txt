#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
# Cmake build script for qspi example on Nordic nRF52 DK
# type following commands in console for build project
#   mkdir build && cd build
#   cmake -DCMAKE_BUILD_TYPE=<Debug|Release> ..
#   cmake --build .
#
#******************************************************************************

cmake_minimum_required(VERSION 2.8)

# uncomment and edit to use its own compiler tool
#set(TOOLCHAIN_PATH "/usr/local/gcc-arm-none-eabi-5_4-2016q3/bin")

set(NRF5_SDK_ROOT "../../..")

# target chip variant values are nRF52810 nRF52832 nRF52832_XXAB nRF52840
# qspi present only on nRF52840
set(NRF5_TARGET "nRF52840" CACHE STRING "Target SoC" FORCE)
# target board variant
set(NRF5_TARGET_BOARD "PCA10056" CACHE STRING "Target Board" FORCE)

set(CMAKE_TOOLCHAIN_FILE "${NRF5_SDK_ROOT}/compiler-gcc.cmake")

# name of the final binary files
project(qspi C)
enable_language(ASM)

# newlib variant nano or full
set(NEWLIB "nano")

# used SDK libs
set(NRF5_LIBS "nrf-log-rtt nrf-log-uart nrf-utils nrf-drv-qspi")

# QSPI_CONFIG_SCK_DELAY - tSHSL, tWHSL and tSHWL in number of 16 MHz periods (62.5 ns).  <0-255> 
add_definitions(-DQSPI_CONFIG_SCK_DELAY=1)
# QSPI_CONFIG_READOC - Number of data lines and opcode used for reading.
add_definitions(-DQSPI_CONFIG_READOC=NRF_QSPI_READOC_READ4IO)
# QSPI_CONFIG_WRITEOC - Number of data lines and opcode used for writing.
add_definitions(-DQSPI_CONFIG_WRITEOC=QSPI_IFCONFIG0_WRITEOC_PP4IO)
# QSPI_CONFIG_ADDRMODE - Addressing mode.
add_definitions(-DQSPI_CONFIG_ADDRMODE=QSPI_IFCONFIG0_ADDRMODE_24BIT)
# QSPI_CONFIG_MODE - SPI mode.
add_definitions(-DQSPI_CONFIG_MODE=QSPI_IFCONFIG1_SPIMODE_MODE0)
# QSPI_CONFIG_FREQUENCY - Frequency divider.
add_definitions(-DQSPI_CONFIG_FREQUENCY=NRF_QSPI_FREQ_32MDIV2) # 16 MHz
# QSPI_CONFIG_IRQ_PRIORITY  - Interrupt priority.
add_definitions(-DQSPI_CONFIG_IRQ_PRIORITY=7)

# QSPI Pin configuration.
add_definitions(-DQSPI_PIN_SCK=NRF_QSPI_PIN_NOT_CONNECTED)
add_definitions(-DQSPI_PIN_CSN=NRF_QSPI_PIN_NOT_CONNECTED)
add_definitions(-DQSPI_PIN_IO0=NRF_QSPI_PIN_NOT_CONNECTED)
add_definitions(-DQSPI_PIN_IO1=NRF_QSPI_PIN_NOT_CONNECTED)
add_definitions(-DQSPI_PIN_IO2=NRF_QSPI_PIN_NOT_CONNECTED)
add_definitions(-DQSPI_PIN_IO3=NRF_QSPI_PIN_NOT_CONNECTED)

# variants are s112 s132 s140 s212 s332
#set(NRF5_SOFTDEVICE "s140")

# custom memory layout linker script
# set(LINKER_SCRIPT "ldscript.ld")

include("${NRF5_SDK_ROOT}/sdk-gcc.cmake")

#place SDK default redefinitions here
#add_definitions(-DNRF_LOG_USES_COLORS=0)

add_executable(${CMAKE_PROJECT_NAME}
	main.c

# sources resolved automatically depending
# on selected libs above (NRF5_LIBS)
	${NRF5_SOURCES}
)

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES PREFIX "" SUFFIX ".elf")
