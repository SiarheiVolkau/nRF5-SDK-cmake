#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

cmake_minimum_required(VERSION 3.3 FATAL_ERROR)

set(NRF5_SOURCES "${NRF5_SOURCES}" CACHE INTERNAL "")
set(NRF5_LINK_LIBRARIES "${NRF5_LINK_LIBRARIES}" CACHE INTERNAL "")

set(SUPPORTED_TARGETS "nRF52810" "nRF52832" "nRF52832_XXAB" "nRF52840")

if (NOT (NRF5_TARGET IN_LIST SUPPORTED_TARGETS))
	message(FATAL_ERROR
		"Please set valid NRF5_TARGET. Valid targets are: ${SUPPORTED_TARGETS}."
	)
endif()

if (NRF5_TARGET MATCHES "nRF52")
	set(GCC_ARM_CPU_VARIANT "cortex-m4")
	if (NRF5_TARGET MATCHES "nRF52810")
		set(GCC_ARM_FLOAT_ABI "soft")
	else()
		set(GCC_ARM_FLOAT_ABI "hard")
		set(GCC_ARM_FPU_VARIANT "fpv4-sp-d16")
		add_definitions(-DFLOAT_ABI_HARD)
	endif()
elseif(NRF5_TARGET MATCHES "nRF51")
	add_definitions(-DNRF51)
	message(FATAL_ERROR "nRF51 targets not supported yet.")
endif()

set_property(CACHE NRF5_TARGET PROPERTY STRINGS ${SUPPORTED_TARGETS})

#
# Find nRF5 SDK
#
if (NOT DEFINED NRF5_SDK_ROOT)
  set(NRF5_SDK_ROOT ${CMAKE_CURRENT_LIST_DIR} CACHE INTERNAL "")
endif ()
# absolutize SDK root path
get_filename_component(NRF5_SDK_ROOT "${NRF5_SDK_ROOT}" ABSOLUTE)

#
# set compiler flags depending on target
#
if (DEFINED GCC_ARM_FPU_VARIANT)
	set(FPU_FLAG "-mfpu=${GCC_ARM_FPU_VARIANT}")
else()
	set(FPU_FLAG "")
endif()
set(CPU_FLAGS "-mthumb -mcpu=${GCC_ARM_CPU_VARIANT} -mfloat-abi=${GCC_ARM_FLOAT_ABI} ${FPU_FLAG}")

#
# search corresponding standard libraries and crtX
#
execute_process(
	COMMAND ${CMAKE_C_COMPILER} "-mthumb" "-mcpu=${GCC_ARM_CPU_VARIANT}" "-mfloat-abi=${GCC_ARM_FLOAT_ABI}" "${FPU_FLAG}"
	"-print-file-name=libgcc.a" OUTPUT_VARIABLE LIBGCC_PATH
)

execute_process(
	COMMAND ${CMAKE_C_COMPILER} "-mthumb" "-mcpu=${GCC_ARM_CPU_VARIANT}" "-mfloat-abi=${GCC_ARM_FLOAT_ABI}" "${FPU_FLAG}"
	"-print-file-name=libc.a" OUTPUT_VARIABLE LIBC_PATH
)

execute_process(
	COMMAND ${CMAKE_C_COMPILER} "-mthumb" "-mcpu=${GCC_ARM_CPU_VARIANT}" "-mfloat-abi=${GCC_ARM_FLOAT_ABI}" "${FPU_FLAG}"
	"-print-file-name=libc_nano.a" OUTPUT_VARIABLE LIBC_NANO_PATH
)

execute_process(
	COMMAND ${CMAKE_C_COMPILER} "-mthumb" "-mcpu=${GCC_ARM_CPU_VARIANT}" "-mfloat-abi=${GCC_ARM_FLOAT_ABI}" "${FPU_FLAG}"
	"-print-file-name=libm.a" OUTPUT_VARIABLE LIBM_PATH
)

execute_process(
	COMMAND ${CMAKE_C_COMPILER} "-mthumb" "-mcpu=${GCC_ARM_CPU_VARIANT}" "-mfloat-abi=${GCC_ARM_FLOAT_ABI}" "${FPU_FLAG}"
	"-print-file-name=libnosys.a" OUTPUT_VARIABLE LIBNOSYS_PATH
)

execute_process(
	COMMAND ${CMAKE_C_COMPILER} "-mthumb" "-mcpu=${GCC_ARM_CPU_VARIANT}" "-mfloat-abi=${GCC_ARM_FLOAT_ABI}" "${FPU_FLAG}"
	"-print-file-name=crt0.o" OUTPUT_VARIABLE CRT0_OBJ_PATH
)

execute_process(
	COMMAND ${CMAKE_C_COMPILER} "-mthumb" "-mcpu=${GCC_ARM_CPU_VARIANT}" "-mfloat-abi=${GCC_ARM_FLOAT_ABI}" "${FPU_FLAG}"
	"-print-file-name=crti.o" OUTPUT_VARIABLE CRTI_OBJ_PATH
)

execute_process(
	COMMAND ${CMAKE_C_COMPILER} "-mthumb" "-mcpu=${GCC_ARM_CPU_VARIANT}" "-mfloat-abi=${GCC_ARM_FLOAT_ABI}" "${FPU_FLAG}"
	"-print-file-name=crtn.o" OUTPUT_VARIABLE CRTN_OBJ_PATH
)

string(STRIP "${LIBGCC_PATH}" LIBGCC_PATH)
string(STRIP "${LIBNOSYS_PATH}" LIBNOSYS_PATH)
string(STRIP "${LIBC_NANO_PATH}" LIBC_NANO_PATH)
string(STRIP "${LIBC_PATH}" LIBC_PATH)
string(STRIP "${LIBM_PATH}" LIBM_PATH)
string(STRIP "${CRT0_OBJ_PATH}" CRT0_OBJ_PATH)
string(STRIP "${CRTI_OBJ_PATH}" CRTI_OBJ_PATH)
string(STRIP "${CRTN_OBJ_PATH}" CRTN_OBJ_PATH)

get_filename_component(LIBGCC_DIR ${LIBGCC_PATH} DIRECTORY)
get_filename_component(LIBC_DIR ${LIBC_PATH} DIRECTORY)
set(LINKER_SEARCH_LOCATIONS "${LINKER_SEARCH_LOCATIONS} -L${LIBGCC_DIR} -L${LIBC_DIR}")

set(STDLIBS "'${LIBM_PATH}' '${LIBC_NANO_PATH}' '${LIBGCC_PATH}' '${LIBNOSYS_PATH}'")
set(STARTFILES "'${CRT0_OBJ_PATH}' '${CRTI_OBJ_PATH}' '${CRTN_OBJ_PATH}'")

#
# define volatile compiler flags
# FIXME those flags aren't cached properly
#
set(CMAKE_C_FLAGS "${CPU_FLAGS} -std=c99 -ffunction-sections -fdata-sections -fshort-enums -g3 -Wall")
set(CMAKE_C_FLAGS_DEBUG "-O0 -DDEBUG -DDEBUG_NRF")
set(CMAKE_C_FLAGS_RELEASE "-O2")
set(CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g3")
set(CMAKE_C_FLAGS_MINSIZEREL "-Os")

set(CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS})
set(CMAKE_ASM_FLAGS_DEBUG ${CMAKE_C_FLAGS_DEBUG})
set(CMAKE_ASM_FLAGS_RELEASE ${CMAKE_C_FLAGS_RELEASE})
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO ${CMAKE_C_FLAGS_RELWITHDEBINFO})
set(CMAKE_ASM_FLAGS_MINSIZEREL ${CMAKE_C_FLAGS_MINSIZEREL})

#
# print some debug info
#
message(STATUS "nRF5 SDK path: ${NRF5_SDK_ROOT}")
message(STATUS "Toolchain path: ${TOOLCHAIN_PATH}")

include(${CMAKE_CURRENT_LIST_DIR}/functions.cmake)

set(SUPPORTED_BOARDS
	BOARD_CUSTOM
	PCA10040
	PCA10056
	PCA10000
	PCA10001
	PCA10002
	PCA10003
	PCA10006
	PCA10028
	PCA10031
	PCA10036
	WT51822
	N5DK1
	D52DK1
	ARDUINO_PRIMO
)

#
# board definition
#
if (NRF5_TARGET_BOARD IN_LIST SUPPORTED_BOARDS)
	add_definitions(-DBOARD_${NRF5_TARGET_BOARD})
	add_dependency(nrf-board)
elseif(DEFINED NRF5_TARGET_BOARD AND NOT NRF5_TARGET_BOARD STREQUAL "")
	message(FATAL_ERROR "invalid NRF5_TARGET_BOARD. Valid are ${SUPPORTED_BOARDS}")
else()
	set(NRF5_TARGET_BOARD "" CACHE STRING "Target Board")
endif()
set_property(CACHE NRF5_TARGET_BOARD PROPERTY STRINGS ${SUPPORTED_BOARDS})

set (NRF5_MAIN_STACK_SIZE 0x2000 CACHE STRING "Size of Main Stack Frame")
add_definitions(-D__STACK_SIZE=${NRF5_MAIN_STACK_SIZE})

#
# resolve dependencies
#
include(${CMAKE_CURRENT_LIST_DIR}/libs-resolve-deps.cmake)

#
# add sdk directories to search include paths
#
include(${CMAKE_CURRENT_LIST_DIR}/add-include-dirs.cmake)

#
# check correctness of selected target and softdevice
#
if (DEFINED NRF5_SOFTDEVICE)
	if (NRF5_SOFTDEVICE STREQUAL "s112" AND NOT(NRF5_TARGET MATCHES "nRF52810"))
		message(FATAL_ERROR "Misconfiguration: NRF5_SOFTDEVICE s112 should be used with nRF52810 NRF5_TARGET only.")
	elseif (NRF5_SOFTDEVICE STREQUAL "s132" AND NOT(NRF5_TARGET MATCHES "nRF52832"))
		message(FATAL_ERROR "Misconfiguration: NRF5_SOFTDEVICE s132 should be used with nRF52832 NRF5_TARGET only.")
	elseif (NRF5_SOFTDEVICE STREQUAL "s212" AND NOT(NRF5_TARGET MATCHES "nRF52832"))
		message(FATAL_ERROR "Misconfiguration: NRF5_SOFTDEVICE s212 should be used with nRF52832 NRF5_TARGET only.")
	elseif (NRF5_SOFTDEVICE STREQUAL "s332" AND NOT(NRF5_TARGET MATCHES "nRF52832"))
		message(FATAL_ERROR "Misconfiguration: NRF5_SOFTDEVICE s332 should be used with nRF52832 NRF5_TARGET only.")
	elseif (NRF5_SOFTDEVICE STREQUAL "s140" AND NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(FATAL_ERROR "Misconfiguration: NRF5_SOFTDEVICE s140 should be used with nRF52840 NRF5_TARGET only.")
	endif()
	if (NRF5_SOFTDEVICE STREQUAL "s112")
		add_definitions(-DS112)
	elseif (NRF5_SOFTDEVICE STREQUAL "s132")
		add_definitions(-DS132)
	elseif (NRF5_SOFTDEVICE STREQUAL "s212")
		add_definitions(-DS212)
	elseif (NRF5_SOFTDEVICE STREQUAL "s332")
		add_definitions(-DS332)
	elseif (NRF5_SOFTDEVICE STREQUAL "s140")
		add_definitions(-DS140)
	endif()
	add_definitions(-DSOFTDEVICE_PRESENT)
	add_definitions(-DNRF_SDH_ENABLED=1)
	add_definitions(-DNRF_SDH_SOC_ENABLED=1)

	include_directories(${NRF5_SDK_ROOT}/components/softdevice/${NRF5_SOFTDEVICE}/headers)
	include_directories(${NRF5_SDK_ROOT}/components/softdevice/${NRF5_SOFTDEVICE}/headers/nrf52)

	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/softdevice/common/nrf_sdh.c
		${NRF5_SDK_ROOT}/components/softdevice/common/nrf_sdh_soc.c
	)
	if (NRF5_SOFTDEVICE STREQUAL "s112"
	    OR NRF5_SOFTDEVICE STREQUAL "s132"
	    OR NRF5_SOFTDEVICE STREQUAL "s140"
	    OR NRF5_SOFTDEVICE STREQUAL "s332")
		add_definitions(-DNRF_SDH_BLE_ENABLED=1)
		add_definitions(-DNRF_SD_BLE_API_VERSION=5)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/softdevice/common/nrf_sdh_ble.c
		)
	endif()
	if (NRF5_SOFTDEVICE STREQUAL "s212"
	    OR NRF5_SOFTDEVICE STREQUAL "s332")
		add_definitions(-DNRF_SDH_ANT_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/softdevice/common/nrf_sdh_ant.c
		)
	endif()

	if (freertos IN_LIST NRF5_MODULES)
		add_definitions(-DNRF_SDH_DISPATCH_MODEL=2)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/softdevice/common/nrf_sdh_freertos.c
		)
	elseif(nrf-scheduler IN_LIST NRF5_MODULES)
		add_definitions(-DNRF_SDH_DISPATCH_MODEL=1)
	else()
		add_definitions(-DNRF_SDH_DISPATCH_MODEL=0)
	endif()

	if (nrf-log IN_LIST NRF5_MODULES)
		add_definitions(-DNRF_SDH_SOC_LOG_ENABLED=1)
	endif()
else()
	include_directories(${NRF5_SDK_ROOT}/components/drivers_nrf/nrf_soc_nosd)
endif()

foreach(LOOP_VAR IN LISTS NRF5_MODULES)
	if (NOT (${LOOP_VAR} IN_LIST NRF5_MODULES_LIST))
		message(WARNING "Unknown module ${LOOP_VAR}. Build list-all-modules target to see complete list of available modules.")
	endif()
endforeach(LOOP_VAR)


include(${CMAKE_CURRENT_LIST_DIR}/libs-build-deps.cmake)

#
# adding specific initialization code
#
if (NRF5_TARGET MATCHES "nRF52840")
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/toolchain/system_nrf52840.c
		${NRF5_SDK_ROOT}/components/toolchain/gcc/gcc_startup_nrf52840.S
	)
	set_property(SOURCE ${NRF5_SDK_ROOT}/components/toolchain/gcc/gcc_startup_nrf52840.S PROPERTY LANGUAGE ASM)
	add_definitions(-DNRF52840_XXAA)
	remove_definitions(-DNRF52832_XXAA -DNRF52832_XXAB)
elseif (NRF5_TARGET MATCHES "nRF52832")
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/toolchain/system_nrf52.c
		${NRF5_SDK_ROOT}/components/toolchain/gcc/gcc_startup_nrf52.S
	)
	set_property(SOURCE ${NRF5_SDK_ROOT}/components/toolchain/gcc/gcc_startup_nrf52.S PROPERTY LANGUAGE ASM)
	if (NRF5_TARGET MATCHES "XXAB")
		add_definitions(-DNRF52832_XXAB)
	else()
		add_definitions(-DNRF52832_XXAA)
	endif()
elseif (NRF5_TARGET MATCHES "nRF52810")
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/toolchain/system_nrf52810.c
		${NRF5_SDK_ROOT}/components/toolchain/gcc/gcc_startup_nrf52810.S
	)
	set_property(SOURCE ${NRF5_SDK_ROOT}/components/toolchain/gcc/gcc_startup_nrf52810.S PROPERTY LANGUAGE ASM)
	add_definitions(-DNRF52810_XXAA)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/list-modules.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/link.cmake)

add_custom_command(OUTPUT ${CMAKE_PROJECT_NAME}.hexfile
	COMMAND ${CMAKE_OBJCOPY} -O ihex ${CMAKE_PROJECT_NAME}.elf ${CMAKE_PROJECT_NAME}.hex
	COMMENT "Making hex file ${CMAKE_PROJECT_NAME}.hex"
)

add_custom_target(${CMAKE_PROJECT_NAME}.hex ALL
	DEPENDS ${CMAKE_PROJECT_NAME}.hexfile ${CMAKE_PROJECT_NAME}
)

include(${CMAKE_CURRENT_LIST_DIR}/install.cmake)
