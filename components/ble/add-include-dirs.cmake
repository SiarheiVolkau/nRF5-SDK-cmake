#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

file(GLOB children RELATIVE ${CMAKE_CURRENT_LIST_DIR}/ble_services ${CMAKE_CURRENT_LIST_DIR}/ble_services/*)
foreach(child ${children})
	if(IS_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/ble_services/${child})
		include_directories(${CMAKE_CURRENT_LIST_DIR}/ble_services/${child})
	endif()
endforeach()

include_directories(
	${CMAKE_CURRENT_LIST_DIR}/ble_advertising
	${CMAKE_CURRENT_LIST_DIR}/ble_db_discovery
	${CMAKE_CURRENT_LIST_DIR}/ble_dtm
	${CMAKE_CURRENT_LIST_DIR}/ble_racp
	${CMAKE_CURRENT_LIST_DIR}/ble_radio_notification
	${CMAKE_CURRENT_LIST_DIR}/common
	${CMAKE_CURRENT_LIST_DIR}/nrf_ble_gatt
	${CMAKE_CURRENT_LIST_DIR}/nrf_ble_qwr
	${CMAKE_CURRENT_LIST_DIR}/peer_manager
)
