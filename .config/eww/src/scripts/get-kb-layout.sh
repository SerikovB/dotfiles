#!/bin/sh

hyprctl devices | grep -A 3 "at-translated-set-2-keyboard" | grep "active keymap:" | tail -n 1 | awk '{print tolower(substr($3,1,2))}'

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
  stdbuf -o0 awk -F '>>|,' -e '/^activelayout>>/ {print tolower(substr($3, 1, 2))}'
