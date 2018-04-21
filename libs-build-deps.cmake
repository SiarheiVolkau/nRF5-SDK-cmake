#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

function(print_lib_usage lib)
	message(STATUS "Using ${${lib}-name} (${lib})")
endfunction(print_lib_usage)

include(${CMAKE_CURRENT_LIST_DIR}/components/libs-build-deps.cmake)
#include(${CMAKE_CURRENT_LIST_DIR}/external/libs-build-deps.cmake)
