#!/bin/bash

MAX_BRIGHTNESS=40000
MIN_BRIGHTNESS=0

if [ -z "$1" ]; then
    echo "Usage: $0 <percentage>"
    exit 1
fi

PERCENTAGE=$1
if ! [[ "$PERCENTAGE" =~ ^[0-9]+$ ]] || [ "$PERCENTAGE" -gt 100 ] || [ "$PERCENTAGE" -lt 0 ]; then
    echo "Error: Percentage must be a number between 0 and 100."
    exit 1
fi

BRIGHTNESS=$(( (PERCENTAGE * MAX_BRIGHTNESS) / 100 ))

doas sh -c "echo $BRIGHTNESS > /sys/class/backlight/intel_backlight/brightness"

