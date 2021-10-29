# begin time profile

# zmodload zsh/datetime
# setopt PROMPT_SUBST
# PS4='+$EPOCHREALTIME %N:%i> '
#
# logfile=$(mktemp zsh_profile.XXXXXXXX)
# echo "Logging to $logfile"
# exec 3>&2 2>$logfile
# setopt XTRACE



# prevent duplicate history 
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
# history sharing between tmux pane/windows
setopt inc_append_history
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=${HOME}/.cache/zsh/history

if [ ! -f ${HISTFILE}  ]; then
	mkdir -p ${HISTFILE}
fi

if [ -f ${HOME}/.zplug/init.zsh ]; then
    source ${HOME}/.zplug/init.zsh
fi


### NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# For ailabs
function update-pipelinehook-docker-img() {
	pipelineHookPath="${HOME}/aiLabs/repo/system/tower-server/pipelinehook"

	cd ${pipelineHookPath}
	DOCKER_BUILDKIT=1 docker build . \
	   	-t 'registry.corp.ailabs.tw/smartcity/system/tower-server/pipelinehook:pipeline-dev' && \
	docker push registry.corp.ailabs.tw/smartcity/system/tower-server/pipelinehook:pipeline-dev

}

# npm build with mem 5120 MB
export NODE_OPTIONS="--max-old-space-size=5120"
export VAULT_ADDR=https://vault.corp.ailabs.tw
export SOPS_VAULT_URIS=$VAULT_ADDR/v1/ailabs/smart-city/transit/keys/minio-backup
alias vaultLogin="vault login -method=ldap username='jordan.huang'"
alias cfz="vim $HOME/.zshrc"
alias scfz="source $HOME/.zshrc"


# Path to your oh-my-zsh installation.
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
plugins=(
  autojump
  docker
  fzf
  osx
  mvn
  kubectl
  terraform
  vagrant
  ssh-agent
  pyenv-lazy
  tmux
)

# AUTO start tmux
ZSH_TMUX_AUTOSTART=false

# AUTO attach tmux if exists
ZSH_TMUX_AUTOCONNECT=false

unsetopt listambiguous
command -v zplug > /dev/null && zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

source "${HOME}/.oh-my-zsh/oh-my-zsh.sh"

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
# https://stackoverflow.com/questions/20327621/calling-ipython-from-a-virtualenv
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias r="sudo bash /Users/$USERNAME/script/ec2-hosts/update_hosts.sh"
alias sftp="sftp -F $HOME/.ssh/config"
# alias mvn8="JAVA_HOME=$(/usr/libexec/java_home -v1.8) && mvn"
case `uname` in
  Darwin)
	alias vi="mvim -v"
	alias vim="mvim -v"
	export ZSH="/Users/$USERNAME/.oh-my-zsh"
  ;;
  Linux)
	alias vi="vim -v"
	alias vim="vim -v"
	export ZSH="$HOME/.oh-my-zsh"
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

# if [ -x "$(command -v bat)" ]; then
# 	alias cat='bat --style=plain'
# fi

if [ -x "$(command -v exa)" ]; then
	alias l='exa'
	alias la='exa -a'
	alias ll='exa -lah'
	alias ls='exa --color=auto'
fi

# if [ -x "$(command -v nnn)" ]; then
# 	alias ll='nnn -de'
# fi

alias typora="open -a typora"
if [ -x "$(command -v leetcode)" ]; then
	alias lc='leetcode'
fi

# K8S
command -v kubectl > /dev/null && alias k=kubectl
command -v ktx > /dev/null && alias ktx=kubectx


# Gnu find instead of Macos find
command -v gfind > /dev/null && alias find=gfind


# IDE
alias pycharm='open -a /Applications/PyCharm.app'
alias intellj='open -a /Applications/IntelliJ\ IDEA.app'
alias ws='open -a /Applications/WebStorm.app'
alias goland='open -a /Applications/GoLand.app'


# for docker-sync https://docker-sync.readthedocs.io/en/latest/getting-started/installation.html
# if which ruby >/dev/null && which gem >/dev/null; then
# 	  PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
# fi


# docker
# drcv [FUZZY PATTERN] - Choose a docker container to remove (and associated volumes)
drcv() {
  docker ps -a | sed '1d' | fzf -m | awk '{print $1}' | xargs docker rm -v
}

# drc [FUZZY PATTERN] - Choose a docker container to remove
drc() {
  docker ps -a | sed '1d' | fzf -m | awk '{print $1}' | xargs docker rm
}


# dri [FUZZY PATTERN] - Choose a docker image to remove
dri() {
  docker images | sed '1d' | fzf -m | awk '{print $3}' | xargs docker rmi
}

# drv [FUZZY PATTERN] - Choose a docker volume to remove
drv() {
  docker volume ls | sed '1d'| fzf -m | awk '{print $2}' | xargs docker volume rm
}


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

function pkg2Daphne() {
	__tmpdir=$(mktemp -d tmp.XXXXXX) 

	# prevent hidden files
	rsync -avC --exclude=".*" $1/* $__tmpdir
	zip -r $1.zip $__tmpdir/*
	rm -rf $__tmpdir
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
            *.zst)     tar -I zstd -xvf "$f" ;;
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
	echo "$PATH" | tr ':' '\n'
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
#
# Key bindings
bindkey "[D" backward-word
bindkey "[C" forward-word]]

function fm {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        builtin cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
bindkey -s '^o' 'fm\n'

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
export GOBIN=$GOPATH/bin

# for tter src 弱測
ADD2PATH "$HOME/aiLabs/task/tter-src-scan"
# Set the default editor
# use user-installed conda!
ADD2PATH "/usr/local/opt/coreutils/libexec/gnubin"
ADD2PATH /usr/local/anaconda3/bin 
ADD2PATH $HOME/bin
ADD2PATH /usr/local/bin
ADD2PATH $HOME/script
ADD2PATH $HOME/.local/bin
ADD2PATH $HOME/usr/bin
ADD2PATH $HOME/usr/nand2tetris/tools
ADD2PATH $HOME/usr/phantomjs/bin
ADD2PATH "$GOROOT/bin"
ADD2PATH "$GOPATH/bin"
ADD2PATH /usr/local/go/bin
ADD2PATH $HOME/.npm-global/bin
ADD2PATH /usr/lib/libreoffice/share/xdg
ADD2PATH $HOME/kkstrem/script
ADD2PATH /opt/local/bin
ADD2PATH /opt/local/sbin
# Postgres
ADD2PATH /Applications/Postgres.app/Contents/Versions/latest/bin
# MySQL
ADD2PATH /usr/local/mysql/bin
# k8s plugin: krew
ADD2PATH "${KREW_ROOT:-$HOME/.krew}/bin"


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

### for autoenv
export AUTOENV_ENV_FILENAME=.autoenv
export AUTOENV_ENABLE_LEAVE=.autoenv.leave
[ -f ~/.fzf.zsh ] && source ~/.autoenv/activate.sh
command -v direnv > /dev/null && eval "$(direnv hook zsh)"

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

bip() {
	### BREW + FZF
	# update multiple packages at once
	# mnemonic [B]rew [U]pdate [P]lugin


	local inst=$(brew search | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[brew:install]'")

	if [[ $inst ]]; then
		for prog in $(echo $inst)
		do brew install $prog
		done
	fi
}

# open jupyter-notebook and load specific csv into pandas
jp() {
	if [[ $# -eq 1 ]]; then
		dir=dirname "$1"
		jupyter-notebook --no-mathjax --autoreload --notebook-dir="$dir"
	fi

	jupyter-notebook --no-mathjax --autoreload 
}

# end time profile

# unsetopt XTRACE
# exec 2>&3 3>&-

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc
