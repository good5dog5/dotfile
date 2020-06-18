
source ~/.zplug/init.zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USERNAME/.oh-my-zsh"
export XDG_CONFIG_HOME="${HOME}/.config"
export TIGRC_USER="$XDG_CONFIG_HOME"/tig/tigrc
export EDITOR=vim


# set server locale to en, prevent remote tab completion problem
export LC_ALL="en_US.UTF-8"

ZSH_THEME="simple"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_MODE='nerdfont-complete'
# command line 左邊想顯示的內容
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs) # <= left prompt 設了 "dir"
# # command line 右邊想顯示的內容
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  docker
  fzf
  osx
  pyenv
  mvn
  docker
)
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"
unsetopt listambiguous

source $ZSH/oh-my-zsh.sh

alias tml="tmux list-sessions"
alias tma="tmux attach-session -t"
alias tmc="clear && tmux clear-history"
alias tmk="tmux kill-session -t"
alias dic="sdcv"
alias top="htop"
alias df="df -h"
alias src="source ~/.zshrc"
alias biggest_dir="du -sch .[!.]* * 2>/dev/null | sort -rh | head -10"
alias tmux="tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf"
alias wg="ag  --follow --noheading --ignore-case --hidden --path-to-ignore ~/.agignore"
alias vi="mvim -v"
alias vim="mvim -v"
# https://stackoverflow.com/questions/20327621/calling-ipython-from-a-virtualenv
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias r="sudo bash /Users/$USERNAME/script/ec2-hosts/update_hosts.sh"
alias sftp="sftp -F $HOME/.ssh/config"
alias mvn8="JAVA_HOME=$(/usr/libexec/java_home -v1.8) && mvn"

function ADD2PATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

function wikiup()
{
    script_path="$HOME/Dropbox/mywiki"
    cd $script_path && ./run.sh start 
}
function syncFuData()
{
    #rsync -azP   ubuntu@fu.sis:/opt/fuGlass/python/data/BlankGlass/ /opt/fuGlass/python/data/BlankGlass/
    rsync -azP   ubuntu@fu.sis:/opt/fuGlass/product/ /opt/fuGlass/product/
    rsync -azP   ubuntu@fu.sis:/opt/fuGlass/blankGlass/ /opt/fuGlass/blankGlass/
    rsync -azP   ubuntu@fu.sis:/opt/fuGlass/sheetGlass/ /opt/fuGlass/sheetGlass/
    rsync -azP   ubuntu@fu.sis:/opt/fuGlass/assemblyGlass/ /opt/fuGlass/assemblyGlass/
    # rsync -azP   ubuntu@fu.sis:/opt/fuGlass/commonMaterial/ /opt/fuGlass/commonMaterial/
    rsync -azP   ubuntu@fu.sis:/opt/fuGlass/python/data/BlankGlass/ /opt/fuGlass/python/data/BlankGlass/
    rsync -azP   ubuntu@fu.sis:/opt/fuGlass/python/data/SheetGlass/ /opt/fuGlass/python/data/SheetGlass/
    rsync -azP   ubuntu@fu.sis:/opt/fuGlass/python/data/AssemblyGlass/ /opt/fuGlass/python/data/AssemblyGlass/
    rsync -azP   ubuntu@fu.sis:/opt/fuGlass/python/data/CommonMateral/ /opt/fuGlass/python/data/CommonMateral/
}

function md () { mkdir -p "$1"; }
function mcd () { mkdir -p "$1" && cd "$1"; }
function bu () { cp $1 ${1}-`date +%Y%m%d%H%M`.backup ; }
function swap()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE $2
}

function ext() 
{
  if [ $# -ne 1 ]
  then
    echo "Error: No file specified."
    return 1
  fi
  files=( $@ )
  for f in "${files[@]}" 
  do
	if [ -f "$f" ] ; then
		case "$f" in
			*.tar.bz2) tar xvjf "$f"   ;;
			*.tar.gz)  tar xvzf "$f"   ;;
            *.xz)      tar xvJf  "$f"   ;;
			*.bz2)     bunzip2 "$f"    ;;
			*.rar)     unrar x "$f"    ;;
			*.gz)      gunzip "$f"     ;;
			*.tar)     tar xvf "$f"    ;;
			*.tbz2)    tar xvjf "$f"   ;;
			*.tgz)     tar xvzf "$f"   ;;
			*.zip)     unzip "$f"      ;;
			*.Z)       uncompress "$f" ;;
			*.7z)      7z x "$f"       ;;
			*)         echo "'$f' cannot be extracted via extract" ;;
		esac
	else
		echo "'$f' is not a valid file"
	fi
    done
}
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}
function man () {
    env LESS_TERMCAP_mb=$'\E[1;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[0;7;32m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[0;33m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    man "$@"
}
function tmp() {
  mvim -v +"set buftype=nofile filetype=markdown bufhidden=wipe nobuflisted noswapfile tw=${1:-0}"
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
#

function fm {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        builtin cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

function fn()
{
    find . -type f -iname '*'$*'*' 2>/dev/null ; 
}
function fd() {
	if [ $# -eq 0 ]; then
		local root=~/
	else
		local root=${1:-*}
	fi

	DIR=`find $root -path '*./\.*' -prune -o -type d -print 2> /dev/null | fzf` \
		&& cd "$DIR"
}
function fe() {
  IFS=' '
  local declare files=($(fzf-tmux --query="$1" --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
  unset IFS
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
function fo() {
  local out file key
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

function s3du(){
	bucket=`cut -d/ -f3 <<< $1`
	prefix=`awk -F/ '{for (i=4; i<NF; i++) printf $i"/"; print $NF}' <<< $1`
		aws s3api list-objects --bucket $bucket --prefix=$prefix --output json --query '[sum(Contents[].Size), length(Contents[])]' | jq '. |{ size:.[0],num_objects: .[1]}'
}

#######################
#  aws cli functions  #
#######################


export GOPATH="${HOME}/go"
export GOROOT=/usr/local/opt/go/libexec

# Set the default editor
# use user-installed conda!
ADD2PATH "$(brew --prefix coreutils)/libexec/gnubin"
ADD2PATH /usr/local/anaconda3/bin 
ADD2PATH $HOME/bin
ADD2PATH /usr/local/bin
ADD2PATH $HOME/script
ADD2PATH $HOME/.local/bin
ADD2PATH $HOME/usr/bin
ADD2PATH $HOME/usr/nand2tetris/tools
ADD2PATH $HOME/usr/phantomjs/bin
ADD2PATH "$GOROOT/bin"
ADD2PATH /usr/local/go/bin
ADD2PATH $HOME/.npm-global/bin
ADD2PATH /usr/lib/libreoffice/share/xdg
ADD2PATH $GOROOT/bin                                                                                                              
ADD2PATH $HOME/.npm-global/bin
ADD2PATH $HOME/kkstrem/script
ADD2PATH /opt/local/bin
ADD2PATH /opt/local/sbin

export PATH


gcd () { git clone $1 && cd "$(basename "$1" ".git")"; }
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
export PATH="/usr/local/opt/node@6/bin:$PATH"
source /usr/local/opt/autoenv/activate.sh
eval "$(direnv hook zsh)"
source $(brew --prefix nvm)/nvm.sh

x()
{
    local CC="gcc"


    if [[ "$1" =~ .*.cpp ]]; then
        g++ -std=c++11 -g3 -pthread -o ${1%.*}{.out,.${1##*.}} $2 $3 $4 $5  && time ./${1%.*}.out
    else
        $CC -std=gnu99 -g -fno-builtin -pthread -o ${1%.*}{.out,.${1##*.}} $2 $3 $4 $5 -lm && time ./${1%.*}.out
    fi
}
git-fshow() {
	local g=(
		git log
		--graph
		--format='%C(auto)%h%d %s %C(white)%C(bold)%cr'
		--color=always
		"$@"
	)

	local fzf=(
		fzf
		--ansi
		--reverse
		--tiebreak=index
		--no-sort
		--bind=ctrl-s:toggle-sort
		--preview 'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1; }; f {}'
	)
	$g | $fzf
}
