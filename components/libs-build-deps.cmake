#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(dirs_list "")
list(APPEND dirs_list
#	ant
	ble
	drivers_ext
	drivers_nrf
#	experimental_802_15_4
#	iot
	libraries
	nfc
#	proprietary_rf
#	serialization
)

foreach(dir ${dirs_list})
	include(${CMAKE_CURRENT_LIST_DIR}/${dir}/libs-build-deps.cmake)
endforeach(dir)

if (nrf-board IN_LIST NRF5_MODULES)
	print_lib_usage(nrf-board)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/boards/boards.c
	)
endif()

if (cmsis-dsp IN_LIST NRF5_MODULES)
	print_lib_usage(cmsis-dsp)
	if (NRF5_TARGET MATCHES "nRF52832" OR NRF5_TARGET MATCHES "nRF52840")
		add_definitions(-DARM_MATH_CM4)
		set(NRF5_LINK_LIBRARIES ${NRF5_LINK_LIBRARIES} ${NRF5_SDK_ROOT}/components/toolchain/cmsis/dsp/GCC/libarm_cortexM4lf_math.a)
	elseif(NRF5_TARGET MATCHES "nRF52810")
		add_definitions(-DARM_MATH_CM4)
		set(NRF5_LINK_LIBRARIES ${NRF5_LINK_LIBRARIES} ${NRF5_SDK_ROOT}/components/toolchain/cmsis/dsp/GCC/libarm_cortexM4l_math.a)
	else() # nrf51 falls here too
		message(FATAL_ERROR
			"Unsupported NRF5_TARGET."
		)
	endif()
endif()
