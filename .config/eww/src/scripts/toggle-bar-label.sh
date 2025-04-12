#!/bin/sh


if $(eww get $1); then
  eww update $1=false
else
  eww update $1=true
fi
