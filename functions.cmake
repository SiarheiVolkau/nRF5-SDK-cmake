#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

function(check_dependency lib_for lib_dep)
	if (NOT ${FIRST_PASS} AND ${lib_for} IN_LIST NRF5_MODULES AND NOT (${lib_dep} IN_LIST NRF5_MODULES))
		set(lib_for_name ${${lib_for}-name})
		if (NOT lib_for_name)
			set(lib_for_name ${lib_for})
		endif()
		set(lib_dep_name ${${lib_dep}-name})
		if (NOT lib_dep_name)
			set(lib_dep_name ${lib_dep})
		endif()
		message(STATUS "Adding dependency `${lib_dep_name}`, required by `${lib_for_name}`")
		list(APPEND NRF5_MODULES ${lib_dep})
		set(NRF5_MODULES ${NRF5_MODULES} PARENT_SCOPE)
		set(DEP_ADDED 1 PARENT_SCOPE)
	endif()
endfunction(check_dependency)

function(add_dependency lib)
	if (NOT (${lib} IN_LIST NRF5_MODULES))
		list(APPEND NRF5_MODULES ${lib})
		set(NRF5_MODULES ${NRF5_MODULES} PARENT_SCOPE)
		set(DEP_ADDED 1 PARENT_SCOPE)
	endif()
endfunction(add_dependency)

function(conflicts lib other_lib)
	if (NOT ${FIRST_PASS} AND (${lib} IN_LIST NRF5_MODULES) AND (${other_lib} IN_LIST NRF5_MODULES))
		set(lib_name ${${lib}-name})
		if (NOT lib_name)
			set(lib_name ${lib})
		else()
			set(lib_name "${lib_name} (${lib})")
		endif()
		set(other_lib_name ${${other_lib}-name})
		if (NOT other_lib_name)
			set(other_lib_name ${other_lib})
		else()
			set(other_lib_name "${other_lib_name} (${other_lib})")
		endif()
		message(FATAL_ERROR "`${lib_name}` cannot be used with `${other_lib_name}`")
	endif()
endfunction(conflicts)

function(print_lib_usage lib)
	message(STATUS "Using ${${lib}-name} (${lib})")
endfunction(print_lib_usage)
