#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset


dir="${HOME}/.fonts/"

echo "Begin Downloading Powerline font and update font cache"

cp ../bin/Droid\ Sans\ Mono\ for\ Powerline.otf $dir
fc-cache -vf $dir && printf "%-55s %5s\n" "Update fonts cache\n\n" "[done]"

echo "finish"


