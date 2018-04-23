#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-blesvc-lbs-name "Nordic BLE LED Button Service")
set(nrf-blesvc-lbs-client-name "Nordic BLE LED Button Service Client")
set(nrf-blesvc-nus-name "Nordic BLE Nordic UART Service")
set(nrf-blesvc-nus-client-name "Nordic BLE Nordic UART Service Client")

list(APPEND NRF5_LIB_LIST
	nrf-blesvc-lbs
	nrf-blesvc-lbs-client
	nrf-blesvc-nus
	nrf-blesvc-nus-client
)

check_dependency(nrf-blesvc-lbs nrf-ble-peripheral)
check_dependency(nrf-blesvc-lbs-client nrf-ble-central)
check_dependency(nrf-blesvc-lbs-client nrf-ble-db-discovery)
check_dependency(nrf-blesvc-nus nrf-ble-peripheral)
check_dependency(nrf-blesvc-nus-client nrf-ble-central)
check_dependency(nrf-blesvc-nus-client nrf-ble-db-discovery)
