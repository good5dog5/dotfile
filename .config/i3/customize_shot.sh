#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

## 1. Take screenshot
## 2. rename it 
## 3. copy to wiki direct
## 4. copy the path to clipboard

wiki_pic_dir="$HOME/Dropbox/mywiki/static/img/postImg"
pic_name=$(date +%F-%T).png

scrot -s ~/Dropbox/"$pic_name"

# new_name=$(zenity --entry --text "Name the pic" --entry-text "$pic_name");
# cp ~/Pictures/screenshot/"$pic_name" "$wiki_pic_dir/$new_name"
# echo "/img/postImg/$new_name" | xclip -sel clip
