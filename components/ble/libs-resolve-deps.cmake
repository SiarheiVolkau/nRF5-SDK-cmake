#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-ble-name "Nordic BLE library")
set(nrf-ble-central-name "Nordic BLE Central module")
set(nrf-ble-db-discovery-name "Nordic BLE GATT module")
set(nrf-ble-gatt-name "Nordic BLE GATT module")
set(nrf-ble-peripheral-name "Nordic BLE Peripheral module")

list(APPEND NRF5_LIB_LIST
	nrf-ble
	nrf-ble-central
	nrf-ble-db-discovery
	nrf-ble-gatt
	nrf-ble-peripheral
)

if (NOT DEFINED NRF5_SOFTDEVICE AND NRF5_LIBS MATCHES " nrf-ble")
	message(FATAL_ERROR "Enable Softdevice to use nRF BLE stack")
else()
	check_dependency(nrf-ble-central nrf-ble)
	check_dependency(nrf-ble-gatt nrf-ble)
	check_dependency(nrf-ble-db-discovery nrf-ble)
	check_dependency(nrf-ble-peripheral nrf-ble)

	include(${CMAKE_CURRENT_LIST_DIR}/ble_services/libs-resolve-deps.cmake)
endif()
