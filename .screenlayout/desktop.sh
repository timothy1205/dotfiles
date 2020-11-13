#!/bin/sh

if xrandr --listactivemonitors | grep DisplayPort
then
  xrandr --output DisplayPort-0 --primary --mode 2560x1440 --rate 144 --pos 0x0 --rotate normal --output DisplayPort-1 --off --output DisplayPort-2 --mode 2560x1440 --rate 144 --pos 5120x0 --rotate normal --output HDMI-A-0 --mode 2560x1440 --rate 143.97 --pos 2560x0 --rotate normal
else
  xrandr --output DP-1 --primary --mode 2560x1440 --rate 144 --pos 0x0 --rotate normal --output DP-2 --off --output DP-3 --mode 2560x1440 --rate 144 --pos 5120x0 --rotate normal --output HDMI-1 --mode 2560x1440 --rate 143.97 --pos 2560x0 --rotate normal
fi
