#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-blesvc-bas-name "Nordic BLE Battery Service")
set(nrf-blesvc-battery-name "(alias to nrf-blesvc-bas)")
set(nrf-blesvc-dis-name "Nordic BLE Device Information Service")
set(nrf-blesvc-device-info-name "(alias to nrf-blesvc-dis)")
set(nrf-blesvc-heart-rate-name "(alias to nrf-blesvc-hrs)")
set(nrf-blesvc-hrs-name "Nordic BLE Heart Rate Service")
set(nrf-blesvc-lbs-name "Nordic BLE LED Button Service")
set(nrf-blesvc-lbs-client-name "Nordic BLE LED Button Service Client")
set(nrf-blesvc-nus-name "Nordic BLE Nordic UART Service")
set(nrf-blesvc-nus-client-name "Nordic BLE Nordic UART Service Client")

list(APPEND NRF5_MODULES_LIST
	nrf-blesvc-bas
	nrf-blesvc-battery
	nrf-blesvc-dis
	nrf-blesvc-device-info
	nrf-blesvc-hrs
	nrf-blesvc-heart-rate
	nrf-blesvc-lbs
	nrf-blesvc-lbs-client
	nrf-blesvc-nus
	nrf-blesvc-nus-client
)

#synonyms
check_dependency(nrf-blesvc-battery nrf-blesvc-bas)
check_dependency(nrf-blesvc-device-info nrf-blesvc-dis)
check_dependency(nrf-blesvc-heart-rate nrf-blesvc-hrs)

check_dependency(nrf-blesvc-bas nrf-ble-peripheral)
check_dependency(nrf-blesvc-dis nrf-ble-peripheral)
check_dependency(nrf-blesvc-hrs nrf-ble-peripheral)
check_dependency(nrf-blesvc-lbs nrf-ble-peripheral)
check_dependency(nrf-blesvc-lbs-client nrf-ble-central)
check_dependency(nrf-blesvc-lbs-client nrf-ble-db-discovery)
check_dependency(nrf-blesvc-nus nrf-ble-peripheral)
check_dependency(nrf-blesvc-nus-client nrf-ble-central)
check_dependency(nrf-blesvc-nus-client nrf-ble-db-discovery)
