#!/bin/sh

case "$1" in 
  -top)
    notify-send \
      "Top Memory Using Apps" \
      "$(ps axch -o cmd,%mem --sort=-%mem)"
    ;;
  -free)
    free -h | awk '/^Mem:/ {print $3}'
    ;;
    *)
    ;;
esac

