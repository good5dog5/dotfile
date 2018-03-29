#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

# set -o errexit
set -o pipefail

TMPFILE="$(mktemp -t screencast-XXXXXXX).mkv"
OUTPUT="$HOME/Pictures/screencast/$(date +%F-%H-%M-%S)"
filters="fps=10"
# filters="fps=5,scale=450:-1:flags=lanczos"


read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
ffmpeg -f x11grab -s "$W"x"$H" -i :1.0+$X,$Y  -f alsa -i pulse "$TMPFILE"

# notify-send 'generating palette'
# -y: Overwrite output files without asking.
ffmpeg -y -i "$TMPFILE"  -vf fps=10,palettegen /tmp/palette.png

notify-send 'generating gif'
ffmpeg -i "$TMPFILE" -i /tmp/palette.png \
    -lavfi "$filters,paletteuse=dither=bayer:bayer_scale=5:diff_mode=rectangle" $OUTPUT.gif
    # -filter_complex "paletteuse" \

mv $TMPFILE $OUTPUT.mkv

notify-send "size $(du -h $OUTPUT.gif | awk '{print $1}')"


trap "rm -f '$TMPFILE'" 0

