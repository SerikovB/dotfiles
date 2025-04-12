#!/bin/sh

run_eww ()
{
  for screen in $(hyprctl monitors -j | jq '.[] | .id'); 
  do
    eww open bar --screen $screen --id bar_$screen
  done
}

handle () {
  case "$1" in
    monitoraddedv2*)
      run_eww
    ;;
  esac
}

scriptname=$(basename $0)
running_count=$(ps aux | grep -i "${scriptname}" | grep -v "grep" | wc -l)
if [ $running_count -gt 2  ]; then
    run_eww
    echo "Already runnung..."
    exit
fi

run_eww
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | \
  while read -r line; do handle "$line"; done
