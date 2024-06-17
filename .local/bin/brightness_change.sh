#!/bin/bash

UTILITY="/usr/bin/xbacklight"

case $1 in
    up)
        $UTILITY -ctrl intel_backlight -inc 5
        ;;
    down)
        $UTILITY -ctrl intel_backlight -dec 5
        ;;
    *)
        exit 1
        ;;
esac

BRIGHTNESS=$($UTILITY -ctrl intel_backlight -get)

# Send notification with category "brightness"
notify-send -c brightness "Brightness: $BRIGHTNESS%" -h "int:value:$BRIGHTNESS"

