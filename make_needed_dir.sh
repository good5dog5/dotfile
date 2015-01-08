#!/bin/bash

vimDir=~/.vim/colors/
fontDir=~/.fonts/
usrDir=~/usr/

if [ ! -d "$vimDir" ]; then
   mkdir -p $vimDir && printf "%-35s %6s\n" "Make dir $vimDir" "[done]"
fi

if [ ! -d "$fontDir" ]; then
   mkdir $fontDir && printf "%-35s %6s\n" "Make dir $fontDir" "[done]"
fi

if [ ! -d "$usrDir" ]; then
   mkdir $usrDir && printf "%-35s %6s\n" "Make dir $usrDir" "[done]"
fi


