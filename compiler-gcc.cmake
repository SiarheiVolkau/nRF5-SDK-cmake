#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(CMAKE_SYSTEM_NAME "Nordic nRF5x")
set(CMAKE_SYSTEM_VERSION "SDK 14.2.0")
set(CMAKE_SYSTEM_PROCESSOR "Cortex M")

set(ARM_GCC_COMPILER "arm-none-eabi-gcc${CMAKE_EXECUTABLE_SUFFIX}")

#
# Find toolchain path
#
if (NOT DEFINED TOOLCHAIN_PATH)
  # Check if GCC is reachable.
  find_path(TOOLCHAIN_PATH ${ARM_GCC_COMPILER})

  if (NOT TOOLCHAIN_PATH)
    # Set default path.
    set(TOOLCHAIN_PATH "/usr/bin")
    message(WARNING "GCC not found, trying to use default path /usr/bin")
  endif ()
endif ()

# Specify target's environment
set(CMAKE_FIND_ROOT_PATH "${TOOLCHAIN_PATH}/arm-none-eabi/")

set(CMAKE_C_COMPILER   "${TOOLCHAIN_PATH}/arm-none-eabi-gcc${CMAKE_EXECUTABLE_SUFFIX}")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PATH}/arm-none-eabi-g++${CMAKE_EXECUTABLE_SUFFIX}")
set(CMAKE_C_LINKER     "${TOOLCHAIN_PATH}/arm-none-eabi-ld${CMAKE_EXECUTABLE_SUFFIX}")
set(CMAKE_CXX_LINKER   "${TOOLCHAIN_PATH}/arm-none-eabi-ld${CMAKE_EXECUTABLE_SUFFIX}")
set(CMAKE_OBJCOPY
        "${TOOLCHAIN_PATH}/arm-none-eabi-objcopy${CMAKE_EXECUTABLE_SUFFIX}"
        CACHE STRING "Objcopy" FORCE)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS)    # remove -rdynamic
set(CMAKE_EXE_LINK_DYNAMIC_C_FLAGS)       # remove -Wl,-Bdynamic

set(CMAKE_C_LINK_EXECUTABLE "${CMAKE_C_LINKER} --gc-sections -o <TARGET> <OBJECTS> <LINK_LIBRARIES>")
