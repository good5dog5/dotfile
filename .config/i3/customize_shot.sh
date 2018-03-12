#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset


SCREENSHOT_PATH="$HOME/Pictures/screenshot"
PIC_NAME=$(date +%F-%T).png

full_screen_shot()
{
    scrot -u "$SCREENSHOT_PATH"/"$PIC_NAME" && \
        xclip -selection clipboard -t "image/png" < "$SCREENSHOT_PATH"/"$PIC_NAME"
}

region_shot() 
{
    # ref https://github.com/linuxdeepin/deepin-screenshot/issues/8
    scrot -s "$SCREENSHOT_PATH"/"$PIC_NAME" && \
        xclip -selection clipboard -t "image/png" < "$SCREENSHOT_PATH"/"$PIC_NAME"

}

OPT="$1"
case $OPT in 
    --full)
        full_screen_shot
        ;;
    --region)
        region_shot
        ;;
    *)
        full_screen_shot
        ;;
esac
