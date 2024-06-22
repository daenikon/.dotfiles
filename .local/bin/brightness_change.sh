#!/bin/bash

UTILITY="/usr/bin/brightnessctl"

case $1 in
    up)
        $UTILITY --quiet --device intel_backlight set +5%
        ;;
    down)
        $UTILITY --quiet --device intel_backlight set 5%-
        ;;
    *)
        exit 1
        ;;
esac

# Get intel brightness value (0 - 48000)
BRIGHTNESS=$($UTILITY -d intel_backlight get)

# Get percentage
PERCENTAGE=$((BRIGHTNESS / 480))

# Send notification with category "brightness"
notify-send -c brightness "Brightness: $PERCENTAGE%" -h "int:value:$PERCENTAGE"

