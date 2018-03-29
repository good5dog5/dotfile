#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

# set -o errexit
set -o pipefail

TMPFILE="$(mktemp -t screencast-XXXXXXX).mkv"
OUTPUT="$HOME/Pictures/screencast/$(date +%F-%H-%M-%S)"


read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
ffmpeg -f x11grab -s "$W"x"$H" -i :1.0+$X,$Y  -f alsa -i pulse "$TMPFILE"

notify-send 'generating palette'
ffmpeg -y -i "$TMPFILE"  -vf fps=10,palettegen /tmp/palette.png
notify-send 'generating gif'
ffmpeg -i "$TMPFILE" -i /tmp/palette.png -filter_complex "paletteuse" $OUTPUT.gif
mv $TMPFILE $OUTPUT.mkv

notify-send "size $(du -h $OUTPUT.gif | awk '{print $1}')"

eog $OUTPUT.gif

trap "rm -f '$TMPFILE'" 0

