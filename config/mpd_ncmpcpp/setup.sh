#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

init() {
    mkdir ~/.mpd
    mkdir -p ~/.mpd/playlists 
    touch ~/.mpd/{tag_cache,sticker.sql,mpd.db,mpd.log,mpd.pid,mpdstate}
}
init

