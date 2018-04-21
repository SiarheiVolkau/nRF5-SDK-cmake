#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(dirs_list "")
list(APPEND dirs_list
	ant
	ble
	drivers_ext
	drivers_nrf
	experimental_802_15_4
	iot
	libraries
	nfc
	serialization
)

foreach(dir ${dirs_list})
	include(${CMAKE_CURRENT_LIST_DIR}/${dir}/add-include-dirs.cmake)
endforeach(dir)

include_directories(
	${CMAKE_CURRENT_LIST_DIR}
	${CMAKE_CURRENT_LIST_DIR}/boards
	${CMAKE_CURRENT_LIST_DIR}/device
	${CMAKE_CURRENT_LIST_DIR}/softdevice/common
	${CMAKE_CURRENT_LIST_DIR}/toolchain
	${CMAKE_CURRENT_LIST_DIR}/toolchain/cmsis/include

	${CMAKE_CURRENT_LIST_DIR}/proprietary_rf/esb
	${CMAKE_CURRENT_LIST_DIR}/proprietary_rf/gzll
	${CMAKE_CURRENT_LIST_DIR}/proprietary_rf/gzll/config
)
