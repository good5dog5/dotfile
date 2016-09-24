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
alias etmr="vim $HOME/.config/tmux/tmux.conf"
alias eemr="vim $HOME/.emacs.d/init.el"
alias eplist="vim $HOME/.pkglist"

#Shortcuts
alias h="history | tail -100"
alias httpd='python -m SimpleHTTPServer 8001'

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
alias wg="ag --ignore-case  --follow --noheading --hidden --path-to-agignore ~/.agignore"
alias psgrep="ps aux | grep"
#find name
fn()
{
     find ./ -iname "$1" 2>/dev/null
}
fne() 
{
    local PS3="Choose a file to edit: "
    select opt in quit $(find ./ -iname \*$1\*  2>/dev/null)
    do
        if [[ $opt = "quit" ]]
        then
            break
        fi
        ${EDITOR} "$opt"
        break
    done
}
# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
 

#Make mount output human readable
alias mount='mount |column -t'
#Network relative
alias inet='ifconfig | grep "inet addr"'
alias ports='netstat -tulanp'

alias vi="vim"
alias v="vim"
alias vd="vimdiff"
tmp () { scratch=$(mktemp  -t tmp.XXXXXXXXXX); vim $scratch && rm -f $scratch; }
alias em="emacs -nw"
alias py="python"
alias ipy="ipython"
alias ipy3="ipython3"
alias dd_progress="sudo kill -USR1 $(pgrep ^dd)"
alias bc='bc --quiet --mathlib'

#For delelopment convinient

alias armgcc="arm-linux-gnueabihf-gcc"
alias armobjdump="arm-linux-gnueabihf-objdump"


alias js="java -jar /home/jordan/.local/bin/js.jar"
alias netok="ping 8.8.8.8"
alias twk="python $HOME/usr/venv/bin/rainbowstream"

alias setclip='xclip -selection'
alias getclip='xclip -selection clipboard -o'
alias wtf="man"
alias zathura="zathura -d $HOME/Dropbox/.conf/zathura"

# show distrobution information 
alias distro_name="cat /etc/*release"

# todo.txt_cli
export TODOTXT_DEFAULT_ACTION=ls
#alias t='$SCRIPT_DIR/todo.sh -d $HOME/.config/todo/todo.cfg'

# Taskworrior
alias t='task'

alias xup="xrdb ~/.Xresources"
alias inside="tree -L 5"
alias biggest_dir="du -sch .[!.]* * 2>/dev/null | sort -rh | head -10"

Big5toUTF8 () { iconv -f big5 -t utf8 -c $1 -o $1; }

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
md () { mkdir -p "$1"; }
mcd () { mkdir -p "$1" && cd "$1"; }
bu () { cp $1 ${1}-`date +%Y%m%d%H%M`.backup ; }
Uva() {
    cd "$UVA_DIR"

    if [ ! -d "$1" ]
    then
        mkdir -p "$1" && cd "$1"
        cp "$HOME/.vim/template/template.cpp" "./$1.cpp"
    else
        cd "$1"
    fi

    if [ -f "../Makefile" ];
    then
        ln -sf "../Makefile" "./Makefile"
    fi
}
newPost()
{
    [ "$#" -ne 1 ] && return 1

    local post_dir="$BLOG_DIR/source/_posts"
    local newPost=${1}.md
    local template="$BLOG_DIR/scaffolds/template.md"

    cd "$post_dir" &&               \
    cp "$template"  ./"$newPost" && \
    sed -i "2i date: `date +"%Y-%m-%d %T"`" $newPost &&\
    vim "$newPost"
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
            *.xz)      tar xvJf  $1   ;;
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

    for f in ./*;
    do
        cat $f | xargs sudo apt  -y install 
    done
}
gen_ppa_list()
{
# Get all the PPA installed on a system
for APT in `find /etc/apt/ -name \*.list`; do
    grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | while read ENTRY ; do
        HOST=`echo $ENTRY | cut -d/ -f3`
        USER=`echo $ENTRY | cut -d/ -f4`
        PPA=`echo $ENTRY | cut -d/ -f5`
        #echo sudo apt-add-repository ppa:$USER/$PPA
        if [ "ppa.launchpad.net" = "$HOST" ]; then
            echo sudo apt-add-repository ppa:$USER/$PPA -y
        else
            echo sudo apt-add-repository \'${ENTRY}\' -y
        fi
    done
done
}
update-repo() {
    for source in "$@"; do
        sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/${source}" \
        -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"    
    done
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

cp_path()
{
    pwd | head -c -1 | xclip 
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

gcd () { git clone $1 && cd "$(basename "$1")"; }

#################### FZF ########################
how () { grep --line-buffered --no-filename  "" ~/bash_conf/* | fzf; } 
fd() {
  if [ $# -eq 0 ]; then
      local root=~/
  else
      local root=${1:-*}
  fi

  DIR=`find $root -path '*./\.*' -prune -o -type d -print 2> /dev/null | fzf` \
    && cd "$DIR"
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  IFS=' '
  local declare files=($(fzf-tmux --query="$1" --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
  unset IFS
}

# fe [FUZZY PATTERN] - Open the selected configure file with the default editor
fec() {
  pushd $PWD 1>/dev/null
  cd $DOTFILE

  IFS=' '
  local declare files=($(fzf-tmux --query="$1" --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
  unset IFS

  popd 1>/dev/null
}

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}
alias c="a=\`find . -maxdepth 1 -type d  | fzf\`; if [ \$a ]; then cd \$a; fi; unset a"
#################### FZF ########################

#Define a quick calculator function
? () { echo "$*" | bc -l; }

encrypt() { 

    if [ ! -f "$1" ]; then
        echo "Usage: encrypt [fileanme2encrypt]"
        return
    fi

    gpg --cipher-algo AES --symmetric "$1" 
}
decrypt() { 

    if [ "$#" -lt 2 ]; then
        echo "Usage: decrypt outname inputFileName"
        return 
    fi

    if [ ! -f "$2" ]; then
        echo "$2 doesn't exist!"
        return
    fi

    gpg --output "$1"  --decrypt "$2"
}
timer() {
  local N=$1; shift

  (sleep $N && zenity --info --title="Time's Up" --text="${*:-BING}") &
  echo "timer set for $N"
}
ankiCov() {

    if [ "$#" -lt 1 ]; then
        echo "Usage" anki_convert some.pic
        return
    elif [ ! -f "$1" ]; then
        echo "$1 doesn't exist!"
        return
    fi

    convert $1 -resize 200x200 $1
}
