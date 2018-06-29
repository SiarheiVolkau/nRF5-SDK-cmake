#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/cJSON
	${CMAKE_CURRENT_LIST_DIR}/cifra_AES128-EAX
	${CMAKE_CURRENT_LIST_DIR}/fatfs/port
	${CMAKE_CURRENT_LIST_DIR}/fatfs/src
	${CMAKE_CURRENT_LIST_DIR}/fprintf

#	${CMAKE_CURRENT_LIST_DIR}/freertos/portable/CMSIS/nrf51
	${CMAKE_CURRENT_LIST_DIR}/freertos/portable/CMSIS/nrf52
#	${CMAKE_CURRENT_LIST_DIR}/freertos/portable/GCC/nrf51
	${CMAKE_CURRENT_LIST_DIR}/freertos/portable/GCC/nrf52
	${CMAKE_CURRENT_LIST_DIR}/freertos/source/include

	${CMAKE_CURRENT_LIST_DIR}/infineon/ifx_i2c
	${CMAKE_CURRENT_LIST_DIR}/infineon/ifx_optiga

	${CMAKE_CURRENT_LIST_DIR}/lwip/src/include

	${CMAKE_CURRENT_LIST_DIR}/mbedtls/configs
	${CMAKE_CURRENT_LIST_DIR}/mbedtls/include

	${CMAKE_CURRENT_LIST_DIR}/nano-pb
	${CMAKE_CURRENT_LIST_DIR}/nfc_adafruit_library
	${CMAKE_CURRENT_LIST_DIR}/nrf_cc310/common
	${CMAKE_CURRENT_LIST_DIR}/nrf_cc310/include

	${CMAKE_CURRENT_LIST_DIR}/protothreads
	${CMAKE_CURRENT_LIST_DIR}/protothreads/pt-1.4

	${CMAKE_CURRENT_LIST_DIR}/segger_rtt
	${CMAKE_CURRENT_LIST_DIR}/thedotfactory_fonts
	${CMAKE_CURRENT_LIST_DIR}/tiny-AES128

	${CMAKE_CURRENT_LIST_DIR}/micro-ecc/micro-ecc
)

if (NOT DEFINED FREERTOS_CONFIG_PATH)
	include_directories(${CMAKE_CURRENT_LIST_DIR}/freertos/config)
else()
	include_directories(${FREERTOS_CONFIG_PATH})
endif()
