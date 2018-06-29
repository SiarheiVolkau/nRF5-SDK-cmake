#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
# Cmake build script for ble_app_hrs_freertos example on Nordic nRF52 DK
# type following commands in console for build project
#   mkdir build && cd build
#   cmake -DCMAKE_BUILD_TYPE=<Debug|Release> ..
#   cmake --build .
#
#******************************************************************************

cmake_minimum_required(VERSION 3.3)

# uncomment and edit to use its own compiler tool
#set(TOOLCHAIN_PATH "/usr/local/gcc-arm-none-eabi-5_4-2016q3/bin")

set(NRF5_SDK_ROOT "../../..")

# target chip variant values are nRF52810 nRF52832 nRF52832_XXAB nRF52840
set(NRF5_TARGET "nRF52832" CACHE STRING "Target SoC")
# target board variant
set(NRF5_TARGET_BOARD "PCA10040" CACHE STRING "Target Board")

set(CMAKE_TOOLCHAIN_FILE "${NRF5_SDK_ROOT}/compiler-gcc.cmake")

# name of the final binary files
project(ble_app_hrs_freertos C)
enable_language(ASM)

# newlib variant nano or full
set(NEWLIB "nano")

# used SDK modules
set(NRF5_MODULES
	freertos nrf-bsp-btn nrf-sensorsim
	nrf-ble-peer-manager nrf-ble-gatt nrf-ble-advertising
	nrf-blesvc-battery nrf-blesvc-heart-rate nrf-blesvc-device-info
	nrf-log-rtt nrf-log-uart
)

if (NRF5_TARGET MATCHES "nRF52832")
	set(NRF5_SOFTDEVICE "s132")
	set(NRF5_SOFTDEVICE_RAM_RESERVE 0x2180)
elseif (NRF5_TARGET MATCHES "nRF52840")
	set(NRF5_SOFTDEVICE "s140")
#	set(NRF5_SOFTDEVICE_RAM_RESERVE 0x2000)
endif()

add_definitions(-DNRF_SDH_BLE_OBSERVER_PRIO_LEVELS=4)
add_definitions(-DNRF_SDH_BLE_VS_UUID_COUNT=10)
add_definitions(-DPM_FLASH_BUFFERS=2)
add_definitions(-DNRF_SDH_BLE_SERVICE_CHANGED=1)
add_definitions(-DSWI_DISABLE0)

include("${NRF5_SDK_ROOT}/sdk-gcc.cmake")

#place SDK default redefinitions here
#add_definitions(-DNRF_LOG_USES_COLORS=0)

add_executable(${CMAKE_PROJECT_NAME}
	main.c

# sources resolved automatically depending
# on selected libs above (NRF5_MODULES)
	${NRF5_SOURCES}
)

set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES PREFIX "" SUFFIX ".elf")
target_link_libraries(${CMAKE_PROJECT_NAME} ${NRF5_LINK_LIBRARIES})
