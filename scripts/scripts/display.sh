#!/bin/bash

choises="laptop\nhome\nwork"

chosen=$(echo -e "$choises" | dmenu -i)

case "$chosen" in
  laptop) autorandr --load docked-home ;;
  home)
    autorandr --load docked-home ;;
  work) 
    xrandr --output eDP-1 --mode "1920x1080" 
    wait
    xrandr --output DP-1-3 --mode "2560x1440" --left-of eDP-1 -r 60
    wait
    xrandr --output DP-1-2 --mode "2560x1440" --primary --left-of DP-1-3 -r 60
    echo Done
esac
