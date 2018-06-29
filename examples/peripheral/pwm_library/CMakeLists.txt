#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
# Cmake build script for pwm_library example on Nordic nRF52 DK
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
project(pwm_library C)
enable_language(ASM)

# newlib variant nano or full
set(NEWLIB "nano")

# used SDK modules
set(NRF5_MODULES nrf-pwm nrf-utils)

# variants are s112 s132 s140 s212 s332
#set(NRF5_SOFTDEVICE "s132")

add_definitions(-DTIMER1_ENABLED=1)

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
