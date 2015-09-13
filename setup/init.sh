#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

DIR=( "$HOME/.fonts/"
      "$HOME/usr/script/"
      "$HOME/usr/tools/"
      "$HOME/usr/lib/"
      "$HOME/usr/bin/"
      "$HOME/stardict/dic/"
      "$HOME/usr/.local/bin"
      "$HOME/ycm_build"
      "$HOME/ycm_temp/llvm_root_dir"
      "$HOME/rtorrent/session"
      "$HOME/rtorrent/watch"
      )

for d in "${DIR[@]}"; do
    if [ ! -d "$d" ]; then
       mkdir -p  $d && printf "%-65s %6s\n" "Create $d " "[done]"
    fi
done

