#!/bin/bash

s="$(playerctl metadata --format '{{ title }} - {{ artist }}' 2>/dev/null)"

# Экранируем спецсимволы: &, <, >
s_escaped=$(echo "$s" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')

# Обрезаем при необходимости
if [ ${#s_escaped} -gt 40 ]; then
  echo "${s_escaped:0:37}..."
else
  echo "$s_escaped"
fi
