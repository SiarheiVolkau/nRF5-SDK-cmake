#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (NRF5_LIBS MATCHES " nrf-ble ")
	print_lib_usage(nrf-ble)
	add_definitions(-DNRF_SDH_BLE_TOTAL_LINK_COUNT=NRF_SDH_BLE_CENTRAL_LINK_COUNT+NRF_SDH_BLE_PERIPHERAL_LINK_COUNT)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/common/ble_advdata.c
		${NRF5_SDK_ROOT}/components/ble/common/ble_conn_state.c
		${NRF5_SDK_ROOT}/components/ble/common/ble_srv_common.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-ble-advertising ")
	print_lib_usage(nrf-ble-advertising)
	add_definitions(-DBLE_ADVERTISING_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_advertising/ble_advertising.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-ble-peripheral ")
	print_lib_usage(nrf-ble-peripheral)
	add_definitions(-DNRF_BLE_CONN_PARAMS_ENABLED=1)
	add_definitions(-DNRF_SDH_BLE_PERIPHERAL_LINK_COUNT=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/common/ble_conn_params.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-ble-central ")
	print_lib_usage(nrf-ble-central)
	add_definitions(-DNRF_SDH_BLE_CENTRAL_LINK_COUNT=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/common/ble_conn_params.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-ble-db-discovery ")
	print_lib_usage(nrf-ble-db-discovery)
	add_definitions(-DBLE_DB_DISCOVERY_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_db_discovery/ble_db_discovery.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-ble-gatt ")
	print_lib_usage(nrf-ble-gatt)
	add_definitions(-DNRF_BLE_GATT_ENABLED=1)
	add_definitions(-DNRF_SDH_BLE_GATT_MAX_MTU_SIZE=23)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/nrf_ble_gatt/nrf_ble_gatt.c
	)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/ble_services/libs-build-deps.cmake)
