#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

# color definition
COLOR_END='\[\e[m\]'
COLOR_BLACK='\[\e[0;30m\]'
COLOR_RED='\[\e[0;31m\]'
COLOR_GREEN='\[\e[0;32m\]'
COLOR_YELLOW='\[\e[0;33m\]'
COLOR_BLUE='\[\e[0;34m\]'
COLOR_PURPLE='\[\e[0;35m\]'
COLOR_CYAN='\[\e[0;36m\]'
COLOR_WHITE='\[\e[0;37m\]'
COLOR_L_BLACK='\[\e[1;30m\]'
COLOR_L_RED='\[\e[1;31m\]'
COLOR_L_GREEN='\[\e[1;32m\]'
COLOR_L_YELLOW='\[\e[1;33m\]'
COLOR_L_BLUE='\[\e[1;34m\]'
COLOR_L_PURPLE='\[\e[1;35m\]'
COLOR_L_CYAN='\[\e[1;36m\]'
COLOR_L_WHITE='\[\e[1;37m\]'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


# RM
alias rm='rm -r'
alias rmf='rm -rf'
# CP
alias cp='cp -r'

# Fast edit config file
alias evr="vim $HOME/.vimrc"
alias evpr="vim $HOME/.vimperatorrc"
alias ebr="vim $HOME/.bashrc"
alias sbr="source $HOME/.bashrc"
alias etmr="vim $HOME/.tmux.conf"
alias eemr="vim $HOME/.emacs.d/init.el"
alias eplist="vim $HOME/.pkglist"

#Shortcuts
alias h="history | tail -100"

# ls -r mean reverse the sort order
alias ll="ls -alrhF --color=auto --group-directories-first"
#list hidden files
alias l.="ls -d .*"
#list directories
alias lld="ls -lrUd */ --color=auto"  
alias ls="ls -r --color=auto  --group-directories-first --sort=extension"
alias layout="tree -L 3"
alias grep="grep  --color=auto"
#word grep
alias wg="ag --ignore-case --unrestricted --follow"
#find name
alias fn="find ./ -iname "

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
 

#Make mount output human readable
alias mount='mount |column -t'
#Network relative
alias inet='ifconfig | grep "inet addr"'
alias ports='netstat -tulanp'

alias vi="vim"
alias vd="vimdiff"
alias em="emacs -nw"
alias py="python"
alias dd_progress="sudo kill -USR1 $(pgrep ^dd)"

#For delelopment convinient

alias armgcc="arm-linux-gnueabihf-gcc"
alias armobjdump="arm-linux-gnueabihf-objdump"
alias gdb="gdb -q"


alias js="java -jar /home/jordan/.local/bin/js.jar"
alias netok="ping 8.8.8.8"
alias twk="python $HOME/usr/venv/bin/rainbowstream"

alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias wtf="man"
alias gC="git clone "

# todo.txt_cli
export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_CFG_FILE="${HOME}/github/dotfile/setup/todo.txt_cli-2.9/.todo.cfg"
alias t='todo.sh $1'

# Apt-get aliases
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias acs='apt-cache search'

# Functions ------------------
F() 
{
    if  hash thunar 2>/dev/null ; then
        thunar
    else
        xdg-open
    fi
}
eba() {
   if [ "$#" -eq 0 ]; then
       vim $HOME/bash_conf/alias.common.bash
   else
       vim $HOME/bash_conf/alias.$1.bash
   fi
}
md () { mkdir -p "$1"; } #mkdir 
mcd () { mkdir -p "$1" && cd "$1"; } #mkdir and go to new dir 
#bu - Back Up a file. Usage "bu filename.txt" 
bu () { cp $1 ${1}-`date +%Y%m%d%H%M`.backup ; }
# MAKE 
#-------------------------------------
jserv () {
    if [ -d "$HOME/Dropbox/EDIMAX" ];
    then
        cd $HOME/Dropbox/EDIMAX && jekyll serve 
    fi
}
uva() {
    cd "$HOME/github/codeSet/c/Uva/"
    mkdir -p "$1" && cd "$1"
    cp "$HOME/.vim/template/template.c" "./$1.c"

    if [ -f "../Makefile" ];
    then
        ln -sf "../Makefile" "./Makefile"
    fi
}
ext() {
  if [ $# -ne 1 ]
  then
    echo "Error: No file specified."
    return 1
  fi
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xvjf $1   ;;
			*.tar.gz)  tar xvzf $1   ;;
			*.bz2)     bunzip2 $1    ;;
			*.rar)     unrar x $1    ;;
			*.gz)      gunzip $1     ;;
			*.tar)     tar xvf $1    ;;
			*.tbz2)    tar xvjf $1   ;;
			*.tgz)     tar xvzf $1   ;;
			*.zip)     unzip $1      ;;
			*.Z)       uncompress $1 ;;
			*.7z)      7z x $1       ;;
			*)         echo "'$1' cannot be extracted via extract" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

batch_install() {

    # local PKG_DIR="$HOME/.package"
    # if [ -d "$PKG_DIR" ]; then
    #
    #     cd $PKG_DIR
    for f in ./*;
    do
        cat $f | xargs sudo apt-get -y install 
    done
    # fi
}

# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; 
  local _wrn_col='\e[1;31m'; 
  local _trn_col='\e[0;33m'

  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"

  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}

# colorize man pages
man () {
    env LESS_TERMCAP_mb=$'\E[1;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[0;7;32m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[0;33m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    man "$@"
}
