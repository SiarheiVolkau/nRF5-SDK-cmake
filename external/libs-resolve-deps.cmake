#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(freertos-name "FreeRTOS")

list(APPEND NRF5_LIB_LIST freertos)

check_dependency(freertos nrf-drv-clock)
check_dependency(freertos nrf-drv-rtc)
