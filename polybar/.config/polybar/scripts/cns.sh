#!/usr/bin/env bash

# xset -q | grep "Scroll"
# 00: Caps Lock:   off    01: Num Lock:    off    02: Scroll Lock: off
# Caps: $4
# Numlock $8
# Scroll $12

is_key_locked() {
  printcmd=""
  case "$1" in
    Caps) printcmd="{print \$4}" ;;
    Num) printcmd="{print \$8}" ;;
    Scroll) printcmd="{print \$12}" ;;
    *) echo "Error: not a valid options: Caps|Num|Scroll" && exit 0 ;;
  esac
  value=$(xset -q | grep "$1" | awk "$printcmd")
  if [ "$value" != "off" ]; then 
    return 0
  else
    return 1
  fi
}

case "$1" in 

 num-ison|numlock-isactive) is_key_locked Num;;
 caps-ison|capslock-isactive) is_key_locked Caps;;
 scroll-ison|scrolllock-isactive) is_key_locked Scroll;;

 num-icon|numlock-icon) is_key_locked Num && echo "" || echo "";;
 caps-icon|capslock-icon) is_key_locked Caps && echo "" || echo "" ;;
 scroll-icon|scrolllock-icon) is_key_locked Scroll && echo ""|| echo "";;

 num-state|numlock-state) is_key_locked Num && echo "on" || echo "off";;
 caps-state|capslock-state) is_key_locked Caps && echo "on" || echo "off" ;;
 scroll-state|scrolllock-state) is_key_locked Scroll && echo "on"|| echo "off";;

 *) echo "'$1' is not valid command" ;;
esac
