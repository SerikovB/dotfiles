#!/bin/sh

get ()
{
  hyprctl workspaces -j | jq -c 'sort_by(.id)'
}

get
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | \
  while read -r line; do get "$line"; done
