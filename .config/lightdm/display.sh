
# Enable numpad
numlockx &

# xrandr 
if xrandr --listactivemonitors | grep DisplayPort
then
  xrandr \
  --output DisplayPort-0 --mode 2560x1440 --pos 0x0 --rotate normal --rate 120 \
  --output DisplayPort-1 --off \
  --output DisplayPort-2 --mode 2560x1440 --pos 5120x0 --rotate normal --rate 120 \
  --output HDMI-A-0 --primary --mode 2560x1440 --pos 2560x0 --rotate normal --rate 120
else
  xrandr \
  --output DP-1 --mode 2560x1440 --pos 0x0 --rotate normal --rate 120 \
  --output DP-2 --off \
  --output DP-3 --mode 2560x1440 --pos 5120x0 --rotate normal --rate 120 \
  --output HDMI-1 --primary --mode 2560x1440 --pos 2560x0 --rotate normal --rate 120
fi

