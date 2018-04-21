#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/background_dfu
	${CMAKE_CURRENT_LIST_DIR}/background_dfu/transport
	${CMAKE_CURRENT_LIST_DIR}/background_dfu/tftp

	${CMAKE_CURRENT_LIST_DIR}/ble_6lowpan
	${CMAKE_CURRENT_LIST_DIR}/coap
	${CMAKE_CURRENT_LIST_DIR}/common
	${CMAKE_CURRENT_LIST_DIR}/context_manager
#	${CMAKE_CURRENT_LIST_DIR}/errno

	${CMAKE_CURRENT_LIST_DIR}/iot_dfu/app
	${CMAKE_CURRENT_LIST_DIR}/iot_dfu/bootloader
	${CMAKE_CURRENT_LIST_DIR}/iot_dfu/common

	${CMAKE_CURRENT_LIST_DIR}/iot_file
	${CMAKE_CURRENT_LIST_DIR}/iot_file/static

	${CMAKE_CURRENT_LIST_DIR}/iot_timer
	${CMAKE_CURRENT_LIST_DIR}/ipv6_parse
	${CMAKE_CURRENT_LIST_DIR}/ipv6_stack/include
	${CMAKE_CURRENT_LIST_DIR}/lwm2m

	${CMAKE_CURRENT_LIST_DIR}/medium
	${CMAKE_CURRENT_LIST_DIR}/medium/ble_ncfgs
	${CMAKE_CURRENT_LIST_DIR}/medium/commissioning
	${CMAKE_CURRENT_LIST_DIR}/mqtt

	${CMAKE_CURRENT_LIST_DIR}/socket/api
	${CMAKE_CURRENT_LIST_DIR}/socket/common
	${CMAKE_CURRENT_LIST_DIR}/socket/config
	${CMAKE_CURRENT_LIST_DIR}/socket/libraries/fifo
	${CMAKE_CURRENT_LIST_DIR}/socket/libraries/mbuf
	${CMAKE_CURRENT_LIST_DIR}/socket/libraries/portdb
)
