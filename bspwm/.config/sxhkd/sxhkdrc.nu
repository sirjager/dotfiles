#!/bin/bash

# specailly for nushell
# run-external is needed when using nushell
# else can be removed for normal shells

# Reload sxhkd
ctrl + shift + Escape
  run-external "bash" "-c" 'pkill -usr1 -x sxhkd && dunstify -t 2000 -r 929292 -a "sxhkd" "Simple Hot key Daemon" "Restarted"' &

# Reload bspwm
super + shift + r
  run-external "bash" "-c" 'bspc wm -r && dunstify -t 2000 -r 939393 -a "bspwm" "BSPWM" "Restarted"' &

# Keybindings | Keyboard Shortcuts | Keybinds | SXHKD Keybindings
super + q; k
  ~/.config/sxhkd/scripts/keybinds &

# Logout, quit bspwm
super + alt + q
  bspc quit &

# Power menu
super + ctrl + p
  ~/.config/rofi/applets/bin/powermenu.sh &

# Lockscreen: Locks screen
super + shift + l
  run-external "bash" "-c" "~/.config/sxhkd/scripts/i3lock/i3lock-fancy.sh" 

# Focus next window, Select next window
alt + Tab
  bspc node -f next.local.window &

# Close Active Window, Close All Window in current Desktop
super + {_,shift + }w
  run-external "bash" "-c" { "bspc node -c", "bspc node -k" } &

# Set window private
super + ctrl + z
  bspc node -g private

# Change Windows View | Change Layout | Vertical View | Horizontal View
super + {_,shift + }v
  bspc node @parent -R 90 &

# Window state Fullscreen
super + shift + Num_Lock
  bspc node -t fullscreen &

# Window state Tile
super + shift + KP_Divide
  bspc node -t tiled &

# Window state Floating
super + shift + KP_Subtract
  bspc node -t floating &

# Window state Toggle Floating / Tile
super + f
  run-external "bash" "-c" 'if [ -n "$(bspc query -N -n focused.floating)" ]; then bspc node -t tiled & else bspc node -t floating & fi'

# change workspace, send window to workspace 1-9
super + {_,shift} {1-9,0}
  bspc {desktop -f, node -d} '^{1-9,10}' --follow &

# Windo swap position among other windows in same workspace
super + shift + Tab
  bspc node @/ -C {forward,backward} &

# move floating window 
super + ctrl + {KP_8,KP_4,KP_5,KP_6}
  bspc node -v {0 -30,-30 0,0 30,30 0} &

# Numpad: 4(inc width), 6(dec width), 8(inc height), 5(dec height)
# Controls the size of only the 2nd Window in current workspace
super + shift  + {KP_8,KP_4,KP_5,KP_6}
    bspc node -z {top 0 -30,left -30 0,top 0 30,left 30 0} &

# Disable touchpad
super + shift + braceleft
  run-external "bash" "-c" 'xinput --disable "ELAN1200:00 04F3:30BA Touchpad" && dunstify -t 2000 -r 9178 "Touchpad Disabled"' &

# Enable touchpad
super + shift + braceright
  run-external "bash" "-c" 'xinput --enable "ELAN1200:00 04F3:30BA Touchpad" && dunstify -t 2000 -r 9178 "Touchpad Enabled"' &

# Increase brightness
XF86MonBrightnessUp
  ~/.local/bin/brightness up &

# Increase brightness
super + KP_Add
  ~/.local/bin/brightness up &

# Decrease brightness, Lower brightness
XF86MonBrightnessDown
  ~/.local/bin/brightness down &

# Decrease brightness, Lower brightness
super + KP_Subtract
  ~/.local/bin/brightness down &

# Mute mic, Toggle Mute Mic
XF86AudioMicMute
  ~/.local/bin/volume mic &

# Mute volume
XF86AudioMute
  ~/.local/bin/volume toggle &

# Raise volume, Increase Volume
XF86AudioRaiseVolume
  ~/.local/bin/volume up &

# Raise volume, Increase Volume
alt + KP_Add
  ~/.local/bin/volume up &

# Lower volume, Decrease volume
XF86AudioLowerVolume
  ~/.local/bin/volume down &

# Lower volume, Decrease volume
alt + KP_Subtract
  ~/.local/bin/volume down &

# Copy Window Class To Clipboard
super + shift + z
  xprop | grep WM_CLASS | cut -d'"' -f2 | head -n1 | xclip -selection clipboard &

# Toggle Polybar: Show or Hide Polybar
super + shift + f
  run-external "bash" "-c" "~/.config/sxhkd/scripts/toggle-polybar" &

# Terminal: Kitty Tmux New Session | Kitty Without Tmux
super + {_,shift + } Return
  { kitty sh -c tmux new, kitty } &

# Kitty Terminal with last tmux session
alt + {_,shift + } Return
  kitty sh -c { "tmux attach", "tmux new" } &

# Screenshot
super + Print
  ~/.config/sxhkd/scripts/screenshot &

# Applications Launcher, Start Applicaiton
alt + @space
  rofi -show drun -theme ~/.config/rofi/launchers/type-6/style-9.rasi &

# Browsers: Cromium | Quick App Launch
super + b
  chromium

# File Explorer, File Manager, Nautilus
super + e
  nautilus --new-window &

# Apps: Obsidian, Vscode, OBS | Quick App Launch
super + a; {n, v, o}
  run-external "bash" "-c" { "obsidian", "code --password-store=gnome", "obs" } &


# Wallpapers: Random, Nature, WallHeaven, DeviantArt, Japan, Gruvbox, Nordic, Anime, OSMWall
super + r; {r, n, w, d, j, g, o, a, s}
  ~/.local/bin/wallpaper -tmux -bspwm -polybar -dunst \
    -path=/mnt/storage/wallpaper{/,/nature,/wallheaven,/deviantart,/japan,/gruvbox,/nordic,/anime,/osmwall} &

# Emoji selector
super + q; q
  rofi -show emoji -theme ~/.config/rofi/launchers/type-5/style-4.rasi &

# Browser History Browser
super + q; h; {h, t, c}
  ~/.local/bin/brohistory --chromium {--visit, --type, --copy} &

# Browser Bookmarks
super + q; b; {b, t, c}
  ~/.local/bin/bookman --chromium {--visit, --type, --copy} &

# Quick search | Quick web | search engine | youtube | duckduckgo | google 
super + q; p
  ~/.config/sxhkd/scripts/quickweb &

# Floating Idealogs | Quick Notes | Floating Notes
super + q; {i, d, e}
  ~/.local/bin/floatedit --tmux --zoxide --location northeast \
    { --title Idealogs --path "personal/idealogs", --title dotfiles --path "$HOME/dotfiles", ""} &


# Capture cli | Screen recording | Screenshot 
super + q; c
  ~/.local/bin/capturecli menu &


