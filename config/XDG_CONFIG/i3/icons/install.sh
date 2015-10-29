#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

mkdir ~/.local/share/fonts
cp *.ttf ~/.local/share/fonts
fc-cache -fv

