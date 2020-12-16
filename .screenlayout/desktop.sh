#!/bin/sh
xrandr \
--output DP-1 --mode 2560x1440 --pos 0x0 --rotate normal --rate 120 \
--output DP-2 --off \
--output DP-3 --mode 2560x1440 --pos 5133x0 --rotate normal --rate 120 \
--output HDMI-1 --primary --mode 2560x1440 --pos 2560x0 --rotate normal --rate 120
