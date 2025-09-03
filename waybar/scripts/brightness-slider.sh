#!/bin/bash

current=$(brightnessctl g)
max=$(brightnessctl m)
percent=$((current * 100 / max))

value=$(seq 0 5 100 | wofi --dmenu --prompt "Яркость: ${percent}%" --width 200 --height 300)

if [ -n "$value" ]; then
    brightnessctl set "${value}%"
fi
