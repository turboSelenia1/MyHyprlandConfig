#!/bin/bash

PERCENT="$1"

# Установить яркость встроенного дисплея
brightnessctl --device=intel_backlight set "${PERCENT}%"

# Установить яркость внешнего монитора (HDMI) через DDC/CI
ddcutil setvcp 10 "$PERCENT" --display 1
