#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

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
eba() {
   if [ "$#" -eq 0 ]; then
       vim $HOME/bash_conf/alias.common.bash
   else
       vim $HOME/bash_conf/alias.$1.bash
   fi
}

#Shortcuts
alias h="history | tail -100"

# ls -r mean reverse the sort order
alias ll="ls -alrhF --color=auto --group-directories-first"
#list hidden files
alias l.="ls -d .*"
#list directories
alias lld="ls -lrUd */ --color=auto"  
alias ls="ls -r --color=auto  --group-directories-first --sort=extension"
alias grep="grep  --color=auto"
#word grep
alias wg="ag -inru "
#find name
alias fn="find ./ -iname "
alias opend="xdg-open"

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

# todo.txt_cli
export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_CFG_FILE="${HOME}/github/dotfile/setup/todo.txt_cli-2.9/.todo.cfg"
alias t='todo.sh $1'

# Functions ------------------
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
extract () {
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
    [ -f $HOME/.pkglist ] && cat $HOME/.pkglist | xargs sudo apt-get -y install
}
net_interface_down_up()
{
    if [ $# -ne 1 ]
    then
        echo "Error : no interface specified."
        return 1
    fi

    sudo ifconfig "$1" down
    sleep 5
    sudo ifconfig "$1" up
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
