#!/bin/env bash

sudo ln -sf /bin/bash /bin/sh


DIR[0]="$HOME/.vim/colors/"
DIR[1]="$HOME/.fonts/"
DIR[2]="$HOME/usr/script/"
DIR[3]="$HOME/stardict/dic/"
#DIR[4]="/tftpboot/scripts/"

for d in "${DIR[@]}"; do
    if [ ! -d "$d" ]; then
       sudo rm -rf $d
       sudo -u $USER mkdir -p  $d && printf "%-35s %6s\n" "Make dir $d " "[done]"
    fi
done

