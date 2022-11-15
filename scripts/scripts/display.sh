#!/bin/bash

choises="laptop\nhome\nwork"

chosen=$(echo -e "$choises" | dmenu -i)

case "$chosen" in
  laptop) autorandr --load docked-home ;;
  home)
    autorandr --load docked-home ;;
  work)
    xrandr --output DP-1-2 --pos 1920x0;    # shift it back
    xrandr --output DP-1-2 --pos 1921x0;    # shift one pixel
    autorandr --load docked-work ;;
esac
