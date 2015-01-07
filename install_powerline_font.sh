#!/bin/bash
dir=~/.fonts/
printf "%50s\n\n" "=>Begin Downloading Powerline font and update font cache"

if [ ! -d "$dir" ]; then
   mkdir $dir && printf "%-55s %5s\n" "Make directory $dir" "[done]"
fi

wget -q -P $dir   https://github.com/powerline/fonts/blob/master/DroidSansMono/Droid%20Sans%20Mono%20for%20Powerline.otf && printf "%-55s %5s\n" "Copy DroidSansMono.oft to $dir" "[done]"
fc-cache -vf && printf "%-55s %5s\n" "Update fonts cache\n\n" "[done]"


printf "%50s\n" "finish"


