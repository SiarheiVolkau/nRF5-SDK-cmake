#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

set(nrf-drv-clock-name "Nordic Clock driver")
set(nrf-drv-common-name "Nordic Common drivers")
set(nrf-drv-gpiote-name "Nordic GPIO driver")
set(nrf-drv-i2s-name "Nordic I2S driver")
set(nrf-drv-lpcomp-name "Nordic Low Power Comparator (LPCOMP) driver")
set(nrf-drv-nvmc-name "Nordic Non-Volatile Memory Controller driver")
set(nrf-drv-power-name "Nordic Power driver")
set(nrf-drv-ppi-name "Nordic Programmable Peripheral Interconnect (PPI) driver")
set(nrf-drv-pwm-name "Nordic PWM driver")
set(nrf-drv-qdec-name "Nordic Quadrature Decoder (QDEC) driver")
set(nrf-drv-qspi-name "Nordic Quad SPI (QSPI) driver")
set(nrf-drv-rng-name "Nordic Random number generator driver")
set(nrf-drv-rtc-name "Nordic RTC driver")
set(nrf-drv-saadc-name "Nordic Successive Approximation ADC (SAADC) driver")
set(nrf-drv-spi-master-name "Nordic SPI Master driver")
set(nrf-drv-systick-name "Nordic System Timer(SysTick) driver")
set(nrf-drv-timer-name "Nordic Timer driver")
set(nrf-drv-uart-name "Nordic UART driver")
set(nrf-drv-usbd-name "Nordic USB Device driver")

list(APPEND NRF5_LIB_LIST
	nrf-drv-clock
	nrf-drv-common
	nrf-drv-gpiote
	nrf-drv-nvmc
	nrf-drv-i2s
	nrf-drv-lpcomp
	nrf-drv-power
	nrf-drv-ppi
	nrf-drv-pwm
	nrf-drv-qdec
	nrf-drv-qspi
	nrf-drv-rng
	nrf-drv-rtc
	nrf-drv-saadc
	nrf-drv-spi-master
	nrf-drv-systick
	nrf-drv-timer
	nrf-drv-uart
	nrf-drv-usbd
)

check_dependency(nrf-drv-clock nrf-drv-common)
check_dependency(nrf-drv-clock nrf-utils)
check_dependency(nrf-drv-gpiote nrf-drv-common)
check_dependency(nrf-drv-i2s nrf-drv-common)
check_dependency(nrf-drv-lpcomp nrf-drv-common)
check_dependency(nrf-drv-power nrf-drv-common)
check_dependency(nrf-drv-ppi nrf-utils)
check_dependency(nrf-drv-pwm nrf-drv-common)
check_dependency(nrf-drv-qdec nrf-drv-common)
check_dependency(nrf-drv-qspi nrf-drv-common)
check_dependency(nrf-drv-rng nrf-drv-common)
check_dependency(nrf-drv-rng nrf-queue)
check_dependency(nrf-drv-rtc nrf-drv-common)
check_dependency(nrf-drv-saadc nrf-drv-common)
check_dependency(nrf-drv-spi-master nrf-drv-common)
check_dependency(nrf-drv-timer nrf-drv-common)
check_dependency(nrf-drv-uart nrf-drv-common)
check_dependency(nrf-drv-usbd nrf-drv-common)
check_dependency(nrf-drv-usbd nrf-drv-systick)

if (NRF5_LIBS MATCHES " nrf-drv-qspi " AND NOT NRF5_TARGET MATCHES "nRF52840")
	message(FATAL_ERROR "${nrf-drv-qspi-name} not available on selected target (${NRF5_TARGET}).")
endif()
if (NRF5_LIBS MATCHES " nrf-drv-usbd " AND NOT NRF5_TARGET MATCHES "nRF52840")
	message(FATAL_ERROR "${nrf-drv-usbd-name} not available on selected target (${NRF5_TARGET}).")
endif()
