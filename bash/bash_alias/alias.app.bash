# TMUX
alias tmux="tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf"
alias tml="tmux list-sessions"
alias tma="tmux attach-session -t"
alias tmc="clear && tmux clear-history"
alias tmk="tmux kill-session -t"

alias bt="rtorrent -n -o import=${XDG_CONFIG_HOME}/rtorrent/rtorrent.rc"
#alias fm="ranger --choosedir=/tmp/ranger-tmp"
alias ptt="luit -encoding big5 telnet ptt.cc"
alias dic="sdcv"
# function dic () {
#
#   local word=$1
#
#   if command -v dict > /dev/null; then
#     dict $word | colorit | less -R
#   else
#     curl dict://dict.org/d:$word 
#   fi
#
# }
alias M="ncmpcpp -c "$XDG_CONFIG_HOME"/ncmpcpp/config"
alias mp3_download="youtube-dl --output \"/media/jordan/MASS/music/%(title)s.%(ext)s\" \
                                --ignore-errors \
                                --prefer-ffmpeg \
                                --extract-audio \
                                --audio-format mp3  "
alias top="htop"
# alias anki="ipython -i -c \"%run /usr/bin/anki\""

alias gdb="gdb -q"
alias cgdb="cgdb -q"
alias feh="feh --scale-down --auto-zoom --image-bg black"
alias irc="irssi"
alias df="df -h"

pg()
{
    pdfgrep -Rni $1  *.pdf
}

function ppt2pdf()
{
    libreoffice --headless --invisible --convert-to pdf *.ppt[x]
}
# Compatible with ranger 1.4.2 through 1.7.*
# Automatically change the directory in bash after closing ranger
#
# This is a bash function for .bashrc to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.
# This binds Ctrl-O to ranger-cd:
#bind '"\C-o":"ranger-cd\C-m"'

function fm {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

