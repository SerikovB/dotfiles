#!/bin/sh

case "$1" in
  up)
    hyprctl dispatch workspace m+1
  ;;
  down) 
    hyprctl dispatch workspace m-1
  ;;
esac

