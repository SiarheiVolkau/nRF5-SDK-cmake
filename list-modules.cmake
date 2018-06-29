
add_custom_command(OUTPUT list_all_modules.cmd.header COMMAND true
	COMMENT "Complete list of modules (used modules marked by *):"
)

set(PREV list_all_modules.cmd.header)

set(MAX_LEN 0)
foreach(LOOP_VAR IN LISTS NRF5_LIB_LIST)
	string(LENGTH "${LOOP_VAR}" LEN)
	if (LEN GREATER MAX_LEN)
		set(MAX_LEN ${LEN})
	endif()
endforeach(LOOP_VAR)

math(EXPR MAX_DOTS "${MAX_LEN}+1")

function (gen_tabs str)
	string(LENGTH "${str}" LEN)
	set(_DOTS "")
	set(_TTABS "")
	math(EXPR FROM_DOTS "${LEN}+1")
	foreach(LOOP_VAR RANGE ${FROM_DOTS} ${MAX_DOTS})
		set(_DOTS "${_DOTS}.")
	endforeach(LOOP_VAR)
	set(DOTS "${_DOTS}" PARENT_SCOPE)
endfunction(gen_tabs)

foreach(LOOP_VAR IN LISTS NRF5_LIB_LIST)
	set(DOTS "")
	set(USED "  ")
	if (NRF5_LIBS MATCHES " ${LOOP_VAR} ")
		set(USED "* ")
	endif()
	gen_tabs(${LOOP_VAR})
	add_custom_command(OUTPUT module-desc.${LOOP_VAR} COMMAND true
		COMMENT "${USED}${LOOP_VAR}${DOTS}${${LOOP_VAR}-name}"
		DEPENDS ${PREV}
	)
	set(PREV module-desc.${LOOP_VAR})
	list(APPEND DEPS module-desc.${LOOP_VAR})
endforeach(LOOP_VAR)

add_custom_target(list-all-modules DEPENDS ${DEPS})
