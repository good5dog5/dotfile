# TMUX
alias tmux="tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf"
alias tml="tmux list-sessions"
alias tma="tmux attach-session -t"
alias tmc="clear && tmux clear-history"
alias tmk="tmux kill-session -t"

alias bt="rtorrent -n -o import=${XDG_CONFIG_HOME}/rtorrent/rtorrent.rc"
alias fm="ranger"
alias ptt="luit -encoding big5 telnet ptt.cc"
alias dic="sdcv"
alias M="ncmpcpp -c "$XDG_CONFIG_HOME"/ncmpcpp/config"
alias mp3_download="youtube-dl --output \"/media/jordan/MASS/music/%(title)s.%(ext)s\" \
                                --ignore-errors \
                                --prefer-ffmpeg \
                                --extract-audio \
                                --audio-format mp3  "
alias top="htop"
alias anki="ipython -i -c \"%run /usr/bin/anki\""

alias gdb="gdb -q"
alias cgdb="cgdb -q"
alias feh="feh --scale-down --auto-zoom --image-bg black"
alias irc="irssi"

pg()
{
    pdfgrep -Rni $1  *.pdf
}

function ptt2pdf()
{
    libreoffice --headless --invisible --convert-to pdf *.ppt
}
