#!/bin/bash

UTILITY="/usr/bin/wpctl"

case $1 in
    up)
        $UTILITY set-volume @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    down)
        $UTILITY set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    mute)
        $UTILITY set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    *)
        exit 1
        ;;
esac

# Get the full volume output (including mute status)
VOLUME=$($UTILITY get-volume @DEFAULT_AUDIO_SINK@)

# Extract just the percentage
PERCENTAGE=$(echo "$VOLUME" | awk '{print $2 * 100}')

# Send notification with category "volume"
notify-send -c volume "$VOLUME" -h "int:value:$PERCENTAGE"
