
# fast keypress for fast typing
# xset r rate <delay> <rate>
# Delay (milliseconds before repeat starts)
# Rate (keys per second after repeating starts)
xset r rate 200 50

# mouse pointer
xsetroot -cursor_name left_ptr

# window compositor
picom -f &

# notifications manager
dunst &

# execute bspwm window manager
exec bspwm
