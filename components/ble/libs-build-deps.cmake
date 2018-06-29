#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (nrf-ble IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-ble)
	add_definitions(-DNRF_SDH_BLE_TOTAL_LINK_COUNT=NRF_SDH_BLE_CENTRAL_LINK_COUNT+NRF_SDH_BLE_PERIPHERAL_LINK_COUNT)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/common/ble_advdata.c
		${NRF5_SDK_ROOT}/components/ble/common/ble_conn_state.c
		${NRF5_SDK_ROOT}/components/ble/common/ble_srv_common.c
	)
endif()

if (nrf-ble-advertising IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-ble-advertising)
	add_definitions(-DBLE_ADVERTISING_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_advertising/ble_advertising.c
	)
endif()

if (nrf-ble-central IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-ble-central)
	add_definitions(-DNRF_SDH_BLE_CENTRAL_LINK_COUNT=1)
endif()

if (nrf-ble-conn-params IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-ble-conn-params)
	add_definitions(-DNRF_BLE_CONN_PARAMS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/common/ble_conn_params.c
	)
endif()

if (nrf-ble-db-discovery IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-ble-db-discovery)
	add_definitions(-DBLE_DB_DISCOVERY_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_db_discovery/ble_db_discovery.c
	)
endif()

if (nrf-ble-gatt IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-ble-gatt)
	add_definitions(-DNRF_BLE_GATT_ENABLED=1)
	add_definitions(-DNRF_SDH_BLE_GATT_MAX_MTU_SIZE=23)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/nrf_ble_gatt/nrf_ble_gatt.c
	)
endif()

if (nrf-ble-peer-manager IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-ble-peer-manager)
	add_definitions(-DPEER_MANAGER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/peer_manager/gatt_cache_manager.c
		${NRF5_SDK_ROOT}/components/ble/peer_manager/gatts_cache_manager.c
		${NRF5_SDK_ROOT}/components/ble/peer_manager/id_manager.c
		${NRF5_SDK_ROOT}/components/ble/peer_manager/peer_data_storage.c
		${NRF5_SDK_ROOT}/components/ble/peer_manager/peer_database.c
		${NRF5_SDK_ROOT}/components/ble/peer_manager/peer_id.c
		${NRF5_SDK_ROOT}/components/ble/peer_manager/peer_manager.c
		${NRF5_SDK_ROOT}/components/ble/peer_manager/pm_buffer.c
		${NRF5_SDK_ROOT}/components/ble/peer_manager/pm_mutex.c
		${NRF5_SDK_ROOT}/components/ble/peer_manager/security_dispatcher.c
		${NRF5_SDK_ROOT}/components/ble/peer_manager/security_manager.c
	)
endif()

if (nrf-ble-peripheral IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-ble-peripheral)
	add_definitions(-DNRF_SDH_BLE_PERIPHERAL_LINK_COUNT=1)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/ble_services/libs-build-deps.cmake)
