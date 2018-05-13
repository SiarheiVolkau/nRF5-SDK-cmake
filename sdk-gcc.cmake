#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(NRF5_SOURCES "" CACHE INTERNAL "")
set(NRF5_LINK_LIBRARIES "" CACHE INTERNAL "")

if (NRF5_TARGET MATCHES "nRF52")
	set(GCC_ARM_CPU_VARIANT "cortex-m4")
	if (NRF5_TARGET MATCHES "nRF52832" OR NRF5_TARGET MATCHES "nRF52840")
		set(GCC_ARM_FLOAT_ABI "hard")
		set(GCC_ARM_FPU_VARIANT "fpv4-sp-d16")
	elseif(NRF5_TARGET MATCHES "nRF52810")
		set(GCC_ARM_FLOAT_ABI "soft")
	else()
		message(FATAL_ERROR
			"Please set valid NRF5_TARGET."
			"For now valid targets are: nRF52810 nRF52832 nRF52840."
		)
	endif()
elseif(NRF5_TARGET MATCHES "nRF51")
	message(FATAL_ERROR "nRF51 targets not supported yet.")
else()
	message(FATAL_ERROR
		"Please set valid NRF5_TARGET.
		For now valid targets are: nRF52810 nRF52832 and nRF52840."
	)
endif()

#
# Find nRF5 SDK
#
if (NOT DEFINED NRF5_SDK_ROOT)
  set(NRF5_SDK_ROOT ${CMAKE_CURRENT_LIST_DIR} CACHE INTERNAL "")
endif ()
# absolutize SDK root path
get_filename_component(NRF5_SDK_ROOT "${NRF5_SDK_ROOT}" ABSOLUTE)

#
# add sdk directories to search include paths
#
include(${CMAKE_CURRENT_LIST_DIR}/add-include-dirs.cmake)

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
#
set(CMAKE_C_FLAGS "${CPU_FLAGS} -std=c99 -ffunction-sections -fdata-sections -g3 -Wall")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} -O0 -DDEBUG -DDEBUG_NRF" CACHE STRING "Debug compiler flags" FORCE)
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} -Os" CACHE STRING "Release compiler flags" FORCE)
set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS} -Os")
set(CMAKE_C_FLAGS_MINSIZEREL "${CMAKE_C_FLAGS} -Os")

#
# print some debug info
#
message(STATUS "nRF5 SDK path: ${NRF5_SDK_ROOT}")
message(STATUS "Toolchain path: ${TOOLCHAIN_PATH}")

set(NRF5_LIBS " ${NRF5_LIBS} ")

#
# board definition
#
if (NRF5_TARGET_BOARD STREQUAL NRF6310
    OR NRF5_TARGET_BOARD STREQUAL PCA10000
    OR NRF5_TARGET_BOARD STREQUAL PCA10001
    OR NRF5_TARGET_BOARD STREQUAL PCA10002
    OR NRF5_TARGET_BOARD STREQUAL PCA10003
    OR NRF5_TARGET_BOARD STREQUAL PCA10006
    OR NRF5_TARGET_BOARD STREQUAL PCA10028
    OR NRF5_TARGET_BOARD STREQUAL PCA10031
    OR NRF5_TARGET_BOARD STREQUAL PCA10036
    OR NRF5_TARGET_BOARD STREQUAL PCA10040
    OR NRF5_TARGET_BOARD STREQUAL PCA10056
    OR NRF5_TARGET_BOARD STREQUAL WT51822
    OR NRF5_TARGET_BOARD STREQUAL N5DK1
    OR NRF5_TARGET_BOARD STREQUAL D52DK1
    OR NRF5_TARGET_BOARD STREQUAL ARDUINO_PRIMO)
	add_definitions(-DBOARD_${NRF5_TARGET_BOARD})
	if (NOT (NRF5_LIBS MATCHES " nrf-board "))
		set(NRF5_LIBS "${NRF5_LIBS} nrf-board ")
	endif()
elseif (DEFINED CUSTOM_BOARD_INCLUDE)
	add_definitions(-DCUSTOM_BOARD_INC="${CUSTOM_BOARD_INCLUDE}")
	if (NOT (NRF5_LIBS MATCHES " nrf-board "))
		set(NRF5_LIBS "${NRF5_LIBS} nrf-board ")
	endif()
else()
	message(FATAL_ERROR "NRF5_TARGET_BOARD not found, define it or define CUSTOM_BOARD_INCLUDE header file.\n"
		"valid boards are: NRF6310, PCA10000, PCA10001, PCA10002, PCA10003, PCA10006, PCA10028, PCA10031, "
		"PCA10036, PCA10040, PCA10056, PCA20020, WT51822, ARDUINO_PRIMO, N5DK1 and D52DK1.")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/libs-resolve-deps.cmake)

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

	if (NRF5_LIBS MATCHES " freertos ")
		add_definitions(-DNRF_SDH_DISPATCH_MODEL=2)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/softdevice/common/nrf_sdh_freertos.c
		)
	elseif(NRF5_LIBS MATCHES " nrf-scheduler ")
		add_definitions(-DNRF_SDH_DISPATCH_MODEL=1)
	else()
		add_definitions(-DNRF_SDH_DISPATCH_MODEL=0)
	endif()

	if (NRF5_LIBS MATCHES " nrf-log ")
		add_definitions(-DNRF_SDH_SOC_LOG_ENABLED=1)
	endif()
else()
	include_directories(${NRF5_SDK_ROOT}/components/drivers_nrf/nrf_soc_nosd)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/libs-build-deps.cmake)

#
# use specific linker script
# default the script depends on softdevice used
#
if (NOT DEFINED LINKER_SCRIPT)
	if (NRF5_SOFTDEVICE STREQUAL "s112")
		set(NRF5_LDSCRIPT_SD "s112")
		add_definitions(-DS112)
	elseif (NRF5_SOFTDEVICE STREQUAL "s132")
		set(NRF5_LDSCRIPT_SD "s132")
		add_definitions(-DS132)
	elseif (NRF5_SOFTDEVICE STREQUAL "s140")
		set(NRF5_LDSCRIPT_SD "s140")
		add_definitions(-DS140)
	elseif (NRF5_SOFTDEVICE STREQUAL "s212")
		set(NRF5_LDSCRIPT_SD "s212")
		add_definitions(-DS212)
	elseif (NRF5_SOFTDEVICE STREQUAL "s332")
		set(NRF5_LDSCRIPT_SD "s332")
		add_definitions(-DS332)
	elseif (NOT DEFINED NRF5_SOFTDEVICE)
		set(NRF5_LDSCRIPT_SD "nosd")
	endif()

	if (NRF5_TARGET MATCHES "nRF52")
		set(LINKER_SEARCH_LOCATIONS "${LINKER_SEARCH_LOCATIONS} -L${NRF5_SDK_ROOT}/components/toolchain/gcc")
		if (NRF5_TARGET MATCHES "nRF52840")
			set(LINKER_SCRIPT ${NRF5_SDK_ROOT}/components/toolchain/gcc/gcc_nrf52840_xxaa_${NRF5_LDSCRIPT_SD}.ld)
		elseif (NRF5_TARGET MATCHES "nRF52832")
			if (NRF5_TARGET MATCHES "XXAB")
				set(LINKER_SCRIPT ${NRF5_SDK_ROOT}/components/toolchain/gcc/gcc_nrf52832_xxab_${NRF5_LDSCRIPT_SD}.ld)
			else()
				set(LINKER_SCRIPT ${NRF5_SDK_ROOT}/components/toolchain/gcc/gcc_nrf52832_xxaa_${NRF5_LDSCRIPT_SD}.ld)
			endif()
		elseif (NRF5_TARGET MATCHES "nRF52810")
			set(LINKER_SCRIPT ${NRF5_SDK_ROOT}/components/toolchain/gcc/gcc_nrf52810_xxaa_${NRF5_LDSCRIPT_SD}.ld)
		endif()
	endif()
endif ()

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

#
# linker commandline
#
set(CMAKE_C_LINK_EXECUTABLE
        "${CMAKE_C_LINKER} ${LINKER_SEARCH_LOCATIONS} -T${LINKER_SCRIPT} -Map <TARGET>.map --gc-sections -o <TARGET> <OBJECTS> ${STARTFILES} <LINK_LIBRARIES> ${STDLIBS}")

set(NRF5_SOURCES ${NRF5_SOURCES} CACHE INTERNAL "")
set(NRF5_LINK_LIBRARIES ${NRF5_LINK_LIBRARIES} CACHE INTERNAL "")
#
# flashing binaries to board
#

# flasher tool
if (NOT DEFINED NRF5_NRFJPROG)
	set(NRF5_NRFJPROG nrfjprog)
endif()

# nRF5 family
if (NRF5_TARGET MATCHES "nRF51")
	set(NRF5_TARGET_FAMILY "nrf51")
else()
	set(NRF5_TARGET_FAMILY "nrf52")
endif()

if (DEFINED NRF5_SOFTDEVICE)
	if (NOT DEFINED NRF5_SOFTDEVICE_FILE)
		if (NRF5_SOFTDEVICE MATCHES "s112")
			set(NRF5_SOFTDEVICE_FILE "${NRF5_SDK_ROOT}/components/softdevice/s112/hex/s112_nrf52810_5.1.0_softdevice.hex")
		elseif (NRF5_SOFTDEVICE MATCHES "s132")
			set(NRF5_SOFTDEVICE_FILE "${NRF5_SDK_ROOT}/components/softdevice/s132/hex/s132_nrf52_5.0.0_softdevice.hex")
		elseif (NRF5_SOFTDEVICE MATCHES "s140")
			set(NRF5_SOFTDEVICE_FILE "${NRF5_SDK_ROOT}/components/softdevice/s140/hex/s140_nrf52840_5.0.0-2.alpha_softdevice.hex")
		else()
			message(FATAL_ERROR "Unknown/Unsupported SoftDevice to flash")
		endif()
	endif()
	add_custom_target(flash_softdevice
		COMMAND ${NRF5_NRFJPROG} -f ${NRF5_TARGET_FAMILY} --program ${NRF5_SOFTDEVICE_FILE} --sectorerase --verify ${NRF5_SOFTDEVICE_FILE}
		COMMENT "Flashing SoftDevice (${NRF5_SOFTDEVICE}) ..."
		DEPENDS build_hex #< prevents flashing if build fails
	)
else()
add_custom_target(flash_softdevice
	# do nothing
	DEPENDS build_hex #< prevents flashing if build fails
)
endif()

add_custom_command(OUTPUT ${CMAKE_PROJECT_NAME}.hex
	COMMAND ${CMAKE_OBJCOPY} -O ihex ${CMAKE_PROJECT_NAME}.elf ${CMAKE_PROJECT_NAME}.hex
	DEPENDS ${CMAKE_PROJECT_NAME}
	COMMENT "Making hex file ${CMAKE_PROJECT_NAME}.hex"
)

add_custom_target(build_hex ALL
	DEPENDS ${CMAKE_PROJECT_NAME}.hex
)

if (FLASH_AFTER_BUILD)
	add_custom_target(flash ALL
		DEPENDS build_hex flash_softdevice
		COMMAND ${NRF5_NRFJPROG} -f ${NRF5_TARGET_FAMILY} --program ${CMAKE_PROJECT_NAME}.hex --sectorerase --verify ${CMAKE_PROJECT_NAME}.hex
		COMMENT "Flashing ${CMAKE_PROJECT_NAME} ..."
	)
else()
	add_custom_target(flash
		DEPENDS build_hex flash_softdevice
		COMMAND ${NRF5_NRFJPROG} -f ${NRF5_TARGET_FAMILY} --program ${CMAKE_PROJECT_NAME}.hex --sectorerase --verify ${CMAKE_PROJECT_NAME}.hex
		COMMENT "Flashing ${CMAKE_PROJECT_NAME} ..."
	)
endif()
