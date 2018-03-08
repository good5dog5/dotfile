#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

intern="LVDS-1"
extern="VGA-1"

# Use toggle file to check status
TOGGLE_FILE=$HOME/.display_toggle

if  [ "$(xrandr | grep -c "$extern connected")" -ge 0 ] && [ -f "$TOGGLE_FILE" ]; then
    xrandr --output "$extern" --auto --output "$intern" --off
    rm "$TOGGLE_FILE"
    echo "1"
else
    xrandr --output "$intern" --auto --output "$extern" --off
    touch "$TOGGLE_FILE"
    echo "2"
fi
