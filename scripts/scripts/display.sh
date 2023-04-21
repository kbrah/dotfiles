#!/bin/bash

choises="laptop\nhome\nwork"

chosen=$(echo -e "$choises" | dmenu -i)

case "$chosen" in
  laptop) autorandr --load docked-home ;;
  home)
    autorandr --load docked-home ;;
  work)
    xrandr --output eDP-1 --mode "1920x1080" 
    xrandr --output DP-1-3 --mode auto --left-of eDP-1 
    xrandr --output DP-1-3 --mode auto --primary --left-of DP-1-3
esac
