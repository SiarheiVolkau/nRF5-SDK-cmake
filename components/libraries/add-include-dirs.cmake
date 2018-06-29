#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

file(GLOB children RELATIVE ${CMAKE_CURRENT_LIST_DIR} ${CMAKE_CURRENT_LIST_DIR}/*)
foreach(child ${children})
	if(IS_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${child})
		include_directories(${CMAKE_CURRENT_LIST_DIR}/${child})
	endif()
endforeach()

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/block_dev/empty
	${CMAKE_CURRENT_LIST_DIR}/block_dev/qspi
	${CMAKE_CURRENT_LIST_DIR}/block_dev/ram
	${CMAKE_CURRENT_LIST_DIR}/block_dev/sdc

	${CMAKE_CURRENT_LIST_DIR}/bootloader/ble_dfu
	${CMAKE_CURRENT_LIST_DIR}/bootloader/dfu
	${CMAKE_CURRENT_LIST_DIR}/bootloader/serial_dfu
	${CMAKE_CURRENT_LIST_DIR}/bootloader/usb_dfu

	${CMAKE_CURRENT_LIST_DIR}/cli/ble_uart
	${CMAKE_CURRENT_LIST_DIR}/cli/cdc_acm
	${CMAKE_CURRENT_LIST_DIR}/cli/rtt
	${CMAKE_CURRENT_LIST_DIR}/cli/uart

	${CMAKE_CURRENT_LIST_DIR}/crypto/backend/cc310_lib
	${CMAKE_CURRENT_LIST_DIR}/crypto/backend/micro_ecc
	${CMAKE_CURRENT_LIST_DIR}/crypto/backend/nrf_crypto_sw

	${CMAKE_CURRENT_LIST_DIR}/ecc
	${CMAKE_CURRENT_LIST_DIR}/experimental_log/src

	${CMAKE_CURRENT_LIST_DIR}/usbd/config
	${CMAKE_CURRENT_LIST_DIR}/usbd/class/audio
	${CMAKE_CURRENT_LIST_DIR}/usbd/class/cdc
	${CMAKE_CURRENT_LIST_DIR}/usbd/class/cdc/acm
	${CMAKE_CURRENT_LIST_DIR}/usbd/class/hid
	${CMAKE_CURRENT_LIST_DIR}/usbd/class/hid/generic
	${CMAKE_CURRENT_LIST_DIR}/usbd/class/hid/kbd
	${CMAKE_CURRENT_LIST_DIR}/usbd/class/hid/mouse
	${CMAKE_CURRENT_LIST_DIR}/usbd/class/msc
)
