#!/bin/env bash

DIR=( "$HOME/.fonts/"
      "$HOME/usr/script/"
      "$HOME/usr/tools/"
      "$HOME/usr/lib/"
      "$HOME/stardict/dic/"
      "$HOME/usr/.local/bin"
      "$HOME/ycm_build"
      "$HOME/ycm_temp/llvm_root_dir"
      )

for d in "${DIR[@]}"; do
    if [ ! -d "$d" ]; then
       #rm -rf $d
       mkdir -p  $d && printf "%-65s %6s\n" "Create $d " "[done]"
    fi
done

