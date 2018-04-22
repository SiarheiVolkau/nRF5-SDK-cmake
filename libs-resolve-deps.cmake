#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

function(check_dependency lib_for lib_dep)
	if (NOT ${FIRST_PASS} AND NRF5_LIBS MATCHES " ${lib_for} " AND NOT (NRF5_LIBS MATCHES " ${lib_dep} "))
		set(lib_for_name ${${lib_for}-name})
		if (NOT lib_for_name)
			set(lib_for_name ${lib_for})
		endif()
		set(lib_dep_name ${${lib_dep}-name})
		if (NOT lib_dep_name)
			set(lib_dep_name ${lib_dep})
		endif()
		message(STATUS "Adding dependency `${lib_dep_name}`, required by `${lib_for_name}`")
		set(NRF5_LIBS "${NRF5_LIBS} ${lib_dep} " PARENT_SCOPE)
		set(DEP_ADDED 1 PARENT_SCOPE)
	endif()
endfunction(check_dependency)

function(check_dependency_silent lib_for lib_dep)
	if (NOT ${FIRST_PASS} NRF5_LIBS MATCHES " ${lib_for} " AND NOT (NRF5_LIBS MATCHES " ${lib_dep} "))
		set(NRF5_LIBS "${NRF5_LIBS} ${lib_dep} " PARENT_SCOPE)
		set(DEP_ADDED 1 PARENT_SCOPE)
	endif()
endfunction(check_dependency_silent)

function(add_dependency lib)
	if (NOT ${FIRST_PASS} AND NOT (NRF5_LIBS MATCHES " ${lib} "))
		set(NRF5_LIBS "${NRF5_LIBS} ${lib} " PARENT_SCOPE)
		set(DEP_ADDED 1 PARENT_SCOPE)
	endif()
endfunction(add_dependency)

#first pass get all modules names
set(FIRST_PASS ON)
include (${CMAKE_CURRENT_LIST_DIR}/components/libs-resolve-deps.cmake)
include (${CMAKE_CURRENT_LIST_DIR}/external/libs-resolve-deps.cmake)

# other passes check and add dependencies
set(FIRST_PASS OFF)
set(DEP_ADDED 1)
while(DEP_ADDED)
	set(DEP_ADDED 0)
	include (${CMAKE_CURRENT_LIST_DIR}/components/libs-resolve-deps.cmake)
	include (${CMAKE_CURRENT_LIST_DIR}/external/libs-resolve-deps.cmake)
endwhile()
