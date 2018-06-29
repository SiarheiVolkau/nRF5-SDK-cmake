#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

#first pass get all modules names
set(FIRST_PASS ON)
include (${CMAKE_CURRENT_LIST_DIR}/components/libs-resolve-deps.cmake)
include (${CMAKE_CURRENT_LIST_DIR}/external/libs-resolve-deps.cmake)

#cache all libs list since later it will append same entries some times
set(_NRF5_MODULES_LIST ${NRF5_MODULES_LIST})

# other passes check and add dependencies
set(FIRST_PASS OFF)
set(DEP_ADDED 1)
while(DEP_ADDED)
	set(DEP_ADDED 0)
	include (${CMAKE_CURRENT_LIST_DIR}/components/libs-resolve-deps.cmake)
	include (${CMAKE_CURRENT_LIST_DIR}/external/libs-resolve-deps.cmake)
endwhile()

# restore cached all libs list
set(NRF5_MODULES_LIST ${_NRF5_MODULES_LIST})
list(SORT NRF5_MODULES_LIST)
