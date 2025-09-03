#!/bin/bash

WS="$1"
ACTIVE_WS=$(hyprctl activeworkspace -j | jq '.id')

if [ "$WS" = "$ACTIVE_WS" ]; then
  echo "{\"text\": \"$WS\", \"class\": \"focused\"}"
else
  echo "{\"text\": \"$WS\"}"
fi
