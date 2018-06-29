#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (nrf-blesvc-bas IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-blesvc-bas)
	add_definitions(-DBLE_BAS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_services/ble_bas/ble_bas.c
	)
endif()

if (nrf-blesvc-dis IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-blesvc-dis)
	add_definitions(-DBLE_DIS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_services/ble_dis/ble_dis.c
	)
endif()

if (nrf-blesvc-hrs IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-blesvc-hrs)
	add_definitions(-DBLE_HRS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_services/ble_hrs/ble_hrs.c
	)
endif()

if (nrf-blesvc-lbs IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-blesvc-lbs)
	add_definitions(-DBLE_LBS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_services/ble_lbs/ble_lbs.c
	)
endif()

if (nrf-blesvc-lbs-client IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-blesvc-lbs-client)
	add_definitions(-DBLE_LBS_C_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_services/ble_lbs_c/ble_lbs_c.c
	)
endif()

if (nrf-blesvc-nus IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-blesvc-nus)
	add_definitions(-DBLE_NUS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_services/ble_nus/ble_nus.c
	)
endif()

if (nrf-blesvc-nus-client IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-blesvc-nus-client)
	add_definitions(-DBLE_NUS_C_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_services/ble_nus_c/ble_nus_c.c
	)
endif()
