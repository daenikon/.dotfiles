# Set the provider output source
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# Set wallpaper
xwallpaper --zoom ~/Desktop/Images/wallpaper.png

# Hide mouse cursor when idle
unclutter --timeout 3 --jitter 50 --start-hidden &

# Load Xresources (Cursor theme)
xrdb -merge ~/.Xresources

# Start PipeWire before DWM to ensure it's in the same D-Bus session
#gentoo-pipewire-launcher &

# Start dwm with dbus-launch
# "exec" means that no subsequent commands in that file will be executed
exec dbus-launch --sh-syntax --exit-with-session dwm
