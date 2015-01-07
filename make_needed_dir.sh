#!/bin/bash

vim_dir=~/.vim/colors/
font_dir=~/.fonts/

if [! -d "$vim_dir"]; then
   mkdir -p $vim_dir && printf "%-35s %6s\n" "Make dir $vim_dir" "[done]"
fi

if [! -d "$font_dir"]; then
   mkdir $font_dir && printf "%-35s %6s\n" "Make dir $font_dir" "[done]"
fi


