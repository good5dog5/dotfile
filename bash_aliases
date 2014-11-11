# Somesier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"

# Fast edit config file
alias evr="vim $HOME/.vimrc"
alias ebr="vim $HOME/.bashrc"
alias sbr="source $HOME/.bashrc"
alias eba="vim $HOME/.bash_aliases"
alias etmr="vim $HOME/.tmux.conf"

#Shortcuts
alias h="history"

alias ll='ls -alhF --color=auto'
alias l.='ls -d .*'  #list hidden files
alias lld='ls -lUd */'  #list directories
# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
 
md () { mkdir -p "$1" && cd "$1"; } #mkdir and go to new dir 
#Aliases toward tmux
alias tmux="tmux -2"
alias tml="tmux list-sessions"
alias tma="tmux attach-session -t"
alias tmc="clear && tmux clear-history"
alias tmk="tmux kill-session"

#Make mount output human readable
alias mount='mount |column -t'
#Network relative
alias inet='ifconfig | grep "inet addr"'
alias ports='netstat -tulanp'

alias telnet_ptt="luit -encoding big5 telnet ptt.cc"
