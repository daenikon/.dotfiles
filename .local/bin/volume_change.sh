#!/bin/bash

case $1 in
    up)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    *)
        exit 1
        ;;
esac

# Get the full volume output (including mute status)
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

# Extract just the percentage
PERCENTAGE=$(echo "$VOLUME" | awk '{print $2 * 100}')

# Send notification with dunstify using a unique identifier to prevent piling up
#dunstify -h string:x-canonical-private-synchronous:audio "$VOLUME" -h "int:value:$PERCENTAGE" -t 1500
notify-send "$VOLUME" -h "int:value:$PERCENTAGE" -t 1500
