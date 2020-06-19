
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

# Java hack to make applications work with tiling wms
~/.local/java_nonreparenting_wm_hack.sh & 

# Launch wm
exec bspwm
