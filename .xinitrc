
# Enable numpad
numlock &

# xrandr 
~/.screenlayout/desktop.sh &

# Redshift coloring
redshift &

# Disable screensaver/screen blanking  
xset s off -dpms &

# Set default cursor
xsetroot -cursor_name left_ptr &

# fn key overrides
xbindkeys &

# Launch wm
exec bspwm
