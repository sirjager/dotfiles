#!/bin/sh

updates=$(checkupdates)

if [ -z "$updates" ]
then
  count=0
else
  printf '%s\n' "$updates" > /tmp/bspwm-eos-polybar-updates
  count=$(wc -l "/tmp/bspwm-eos-polybar-updates" | awk '{print $1}')
fi

icon=""

echo "%{T1}$icon%{T-} %{T2}$count%{T-}"

