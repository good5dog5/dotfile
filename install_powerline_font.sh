#!/bin/bash

dir=~/.fonts/


cp ./bin/Droid Sans Mono for Powerline.otf $dir
fc-cache -vf $dir && printf "%-55s %5s\n" "Update fonts cache\n\n" "[done]"


printf "%50s\n" "finish"


