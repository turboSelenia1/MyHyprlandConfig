#!/bin/bash

# Получаем текущую громкость
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Запускаем wofi со списком значений
value=$(seq 0 5 100 | wofi --dmenu --prompt "Громкость: $volume%" --width 200 --height 300)

# Если что-то выбрано — установить
if [ -n "$value" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ "$value%"
fi
