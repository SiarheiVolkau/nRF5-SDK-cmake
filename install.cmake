#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

#
# flashing binaries to board
#

# flasher tool
if (NOT DEFINED NRF5_NRFJPROG)
	set(NRF5_NRFJPROG nrfjprog)
endif()

# nRF5 family
if (NRF5_TARGET MATCHES "nRF51")
	set(NRF5_TARGET_FAMILY "nrf51")
else()
	set(NRF5_TARGET_FAMILY "nrf52")
endif()

if (DEFINED NRF5_SOFTDEVICE)
	if (NOT DEFINED NRF5_SOFTDEVICE_FILE)
		if (NRF5_SOFTDEVICE MATCHES "s112")
			set(NRF5_SOFTDEVICE_FILE "${NRF5_SDK_ROOT}/components/softdevice/s112/hex/s112_nrf52810_5.1.0_softdevice.hex")
		elseif (NRF5_SOFTDEVICE MATCHES "s132")
			set(NRF5_SOFTDEVICE_FILE "${NRF5_SDK_ROOT}/components/softdevice/s132/hex/s132_nrf52_5.0.0_softdevice.hex")
		elseif (NRF5_SOFTDEVICE MATCHES "s140")
			set(NRF5_SOFTDEVICE_FILE "${NRF5_SDK_ROOT}/components/softdevice/s140/hex/s140_nrf52840_5.0.0-2.alpha_softdevice.hex")
		else()
			message(FATAL_ERROR "Unknown/Unsupported SoftDevice to flash")
		endif()
	endif()
	set(NRF5_INSTALL_CMDS "${NRF5_INSTALL_CMDS}
		message(STATUS \"Flashing ${NRF5_SOFTDEVICE} ...\")
		execute_process(COMMAND
			${NRF5_NRFJPROG} -f ${NRF5_TARGET_FAMILY} --program ${NRF5_SOFTDEVICE_FILE} --sectorerase --verify ${NRF5_SOFTDEVICE_FILE}
		)"
	)
endif()

set(NRF5_INSTALL_CMDS "${NRF5_INSTALL_CMDS}
	message(STATUS \"Flashing ${CMAKE_PROJECT_NAME}.hex ...\")
	execute_process(COMMAND
		${NRF5_NRFJPROG} -f ${NRF5_TARGET_FAMILY} --program ${CMAKE_PROJECT_NAME}.hex --sectorerase --verify ${CMAKE_PROJECT_NAME}.hex -r
	)"
)

install(CODE ${NRF5_INSTALL_CMDS})
