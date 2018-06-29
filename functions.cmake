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

function(conflicts lib other_lib)
	if (NOT ${FIRST_PASS} AND (NRF5_LIBS MATCHES " ${lib} ") AND (NRF5_LIBS MATCHES " ${other_lib} "))
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
