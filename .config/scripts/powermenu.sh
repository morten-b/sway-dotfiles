#!/bin/bash

entries="' Logout Suspend Reboot Shutdown Lock"

#selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/config.power --style=$HOME/.config/wofi/style.widgets.css | awk '{print tolower($1)}')
selected=$(printf '%b\n' $entries | rofi -dmenu | awk '{print tolower($1)}')

case $selected in
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
  lock)
    exec $HOME/.config/scripts/lock.sh;;
esac
