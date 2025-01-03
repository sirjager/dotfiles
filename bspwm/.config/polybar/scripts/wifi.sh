#!/bin/sh

MSG_ID="9932"
ROFI_THEME="$HOME/.config/sxhkd/rofi/horizontal.rasi"

PROMPT="Select wifi: "

AVAILABLE_WIFI_NETWORKS=""

notify() {
  dunstify -i "/usr/share/icons/Qogir-dark/32/devices/network-wireless.svg" -a "Wifi" -r "$MSG_ID" "$1"
}

connect_wifi() {
  nmcli device wifi connect "$1"
}

notify "Searching for wifi networks..."
AVAILABLE_WIFI_NETWORKS=$(nmcli -t -f BARS,SSID device wifi list | awk -F ':' '{print $1, $2}')

if [ -z "$AVAILABLE_WIFI_NETWORKS" ]; then
  notify "No wifi network found"
  exit 0
fi

selected_wifi=$(echo "$AVAILABLE_WIFI_NETWORKS" | rofi -dmenu -p "$PROMPT" -theme "$ROFI_THEME")

# Exit if no device selected
[ -z "$selected_wifi" ] && exit 0

wifi_name=$(echo "$selected_wifi" | awk '{$1=""; sub(/^ */, ""); print $0}')

connect_wifi "$wifi_name"

