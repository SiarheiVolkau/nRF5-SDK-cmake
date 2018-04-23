#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (NRF5_LIBS MATCHES " nrf-blesvc-lbs-client ")
	print_lib_usage(nrf-blesvc-lbs-client)
	add_definitions(-DBLE_LBS_C_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_services/ble_lbs_c/ble_lbs_c.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-blesvc-lbs ")
	print_lib_usage(nrf-blesvc-lbs)
	add_definitions(-DBLE_LBS_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/ble/ble_services/ble_lbs/ble_lbs.c
	)
endif()
