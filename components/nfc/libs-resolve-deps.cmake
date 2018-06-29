#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-nfc-ndef-name "Nordic NFC Data Exchange Format library")
set(nrf-nfc-t2t-name "Nordic NFC Type 2 Tag HAL library")
set(nrf-nfc-t4t-name "Nordic NFC Type 4 Tag HAL library")
set(nrf-nfc-t2t-parser-name "Nordic NFC Type 2 Tag parser")
set(nrf-nfc-t4t-parser-name "Nordic NFC Type 4 Tag parser")
set(nrf-nfc-ble-pair-name "Nordic BLE pairing via NFC library")

list(APPEND NRF5_LIB_LIST
	nrf-nfc-ndef
	nrf-nfc-t2t
	nrf-nfc-t4t
	nrf-nfc-t2t-parser
	nrf-nfc-t4t-parser
	nrf-nfc-ble-pair
)


conflicts(nrf-nfc-t2t nrf-nfc-t4t)

check_dependency(nrf-nfc-t2t nrf-drv-clock)
check_dependency(nrf-nfc-t4t nrf-drv-clock)
check_dependency(nrf-nfc-ble-pair nrf-ble-advertising)
check_dependency(nrf-nfc-ble-pair nrf-ble-peer-manager)
check_dependency(nrf-nfc-ble-pair nrf-ecc)
