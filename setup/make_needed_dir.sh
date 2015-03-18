#!/bin/bash

DIR[0]="$HOME/.vim/colors/"
DIR[1]="$HOME/.fonts/"
DIR[2]="$HOME/usr/script/"
DIR[3]="$HOME/stardict/dic/"


for d in "${DIR[@]}"; do
    if [ ! -d "$d" ]; then
       mkdir -p $d && printf "%-35s %6s\n" "Make dir $d " "[done]"
    fi
done

