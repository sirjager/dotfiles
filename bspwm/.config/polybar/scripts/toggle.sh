#!/bin/bash
# Toggles polybar and resizes bspwm padding.

LOCK_FILE="$HOME/.cache/bar.lck"

if [[ ! -f "$LOCK_FILE" ]]; then
    touch "$LOCK_FILE"
    polybar-msg cmd hide; sleep 0.4
    bspc config window_gap 0 
    bspc config top_padding 0
    bspc config bottom_padding 0
    bspc config right_padding 0 
    bspc config left_padding 0
    bspc config border_width 0
else
    rm "$LOCK_FILE"
    bspc config window_gap 0 
    bspc config top_padding 25
    bspc config bottom_padding 0
    bspc config right_padding 0 
    bspc config left_padding 0
    bspc config border_width 2

    sleep 0.4; polybar-msg cmd show
fi
