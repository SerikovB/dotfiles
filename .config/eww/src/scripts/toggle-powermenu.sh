#!/bin/sh

monitor=$(hyprctl monitors -j | jq '.[] | select(.focused) | .id')
id=powermenu_$monitor

if [ -z "$(eww active-windows | grep ^$id:.*)" ]; then
  eww open powermenu --screen $monitor --id $id
elif [ -n "$(eww active-windows | grep ^$id:.*)" ]; then
  eww close $id
fi

