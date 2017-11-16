#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

intern="LVDS-1"
extern="VGA-1"

if xrandr | grep "$extern connected"; then
    xrandr --output "$extern" --auto --output "$intern" --off
elif xrandr | grep "$intern connected"; then
    echo "B"
    xrandr --output "$intern" --off --output "$extern" --auto
fi
