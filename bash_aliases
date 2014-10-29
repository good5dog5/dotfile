# somesier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"

#Shortcuts
alias h="history"
alias j="jobs"

alias ll='ls -alhF --color=auto'
# List only directories
 alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
 
function lll ()
{
       command grep --color -E -- "$(ls -rtl $@ | tail -n3)|$" <(ls -l $@)
}

alias tmux='tmux -2'
