#!/bin/sh

case $1 in
  next) 
    direction=next
  ;;
  prev)
    direction=prev
  ;;
esac


hyprctl \
  --batch "$(
    hyprctl devices -j |
      jq -r '.keyboards[] | .name' |
      while IFS= read -r keyboard; do
        printf '%s %s %s;' 'switchxkblayout' "${keyboard}" "${direction}"
      done
  )"
