#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# locale
export LC_ALL="en_US.UTF-8"

# Set the default editor
export PATH=$PATH:$HOME/usr/script
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/usr/bin
export PATH=$PATH:$HOME/usr/nand2tetris/tools
export PATH=$PATH:$HOME/usr/phantomjs/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.npm-global/bin
# added by Anaconda3 4.0.0 installer
export PATH=$PATH:$HOME/anaconda3/bin
export PATH=$PATH:/usr/lib/libreoffice/share/xdg


# JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

# ccache
export CCACHE_PATH="/usr/bin" 

# LS_COLOR
# https://github.com/trapd00r/LS_COLORS
[ -f $HOME/LS_COLORS ] && eval $( dircolors -b $HOME/LS_COLORS )


# export GOROOT=/usr/bin/go
export GOPATH=$HOME/go

#export CLASSPATH="$HOME.local/bin/js.jar"
export EDITOR=vim
export BROWSER="firefox"

#Some path for daily use
export STARDICT_DATA_DIR=$HOME/stardict/dic/
export UVA_PATH=$HOME/github/codeSet/c/Uva/

#Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

#-------------------------------------------------------------------------------
#                Enviroment variables
#-------------------------------------------------------------------------------
export DOTFILE="${HOME}/github/dotfile"
export XDG_CONFIG_HOME="${HOME}/.config"
export TIGRC_USER="$XDG_CONFIG_HOME"/tig/tigrc
export BASH_DEBUG="0"

# bc caculator
export BC_ENV_ARGS=~/.bcrc

# Ranger
# export RANGER_LOAD_DEFAULT_RC="FALSE"

export SCRIPT_DIR="$HOME/usr/script"
export UVA_DIR="$HOME/Dropbox/Code/c/Uva"
export BLOG_DIR="$HOME/github/good5dog5.github.com"

_source_files()
{
    [ ! $# -eq 1 ] &&  return

    if [ ! -e "${1}" ]; then 
        # echo "${1} doesn't exist"
        return
    fi

    # -s : True if FILE exists and has a size greater than zero.
    [ -f "${1}" ] && source "${1}" && return

    local files="${1}/*"
    for f in $files
    do
        if [ -f $f ]; then
            . "${f}"
        fi
       # echo "source ${f}"
    done
}

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}
# Source all alias files
_source_files "${HOME}/bash_conf"

_source_files "${HOME}/.xprofile"

# Source all auto_complete files
_source_files "/usr/share/bash-completion/bash_completion"
_source_files "$DOTFILE/bash/bash_complete"
_source_files "/etc/bash_completion"
_source_files "/etc/default/locale"

# Source Powerline to enable bash prompt
_source_files "/usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh" 
_source_files "${HOME}/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh"

# Source to enable Autojump
_source_files "/usr/share/autojump/autojump.bash"

# Source to enable bashmarks
# _source_files "${HOME}/.local/bin/bashmarks.sh"

# Use colors for less, man, etc.
_source_files "${HOME}/.LESS_TERMCAP"

# Load nvm
_source_files "$NVM_DIR/nvm.sh"

# Load bashmarks.sh
# https://github.com/huyng/bashmarks
_source_files "$SCRIPT_DIR/bashmarks.sh"



# Set the PS1 prompt (with color).
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\][ \W ]\[\033[00m\]\$ '


HISTSIZE=1000
HISTFILESIZE=2000


# Turn on some nifty bash features.
#  Add a '**' glob wildcard that matches directory and subdirectory names as well as files.
shopt -s globstar
# Add extended glob operators, which allow repetition, grouping, and alternation.
# e.g.: Match one or more occurrences of 'foo' or 'bar' in a row: +(foo|bar)
shopt -s extglob
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histverify

# Avoid duplicates
# See bash(1) for more options
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# Enable Ctrl-z to toggle vim fg-bg switch
# remap susp to ^o and ~/.inputrc assing ^z to "fg
stty susp ^o


# For git-alias setup
# Ref: https://gist.github.com/mwhite/6887990
for al in `__git_aliases`; do
    alias g$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done


# need to be more elegant
#eval $(gpg-agent --daemon)

### FZF settings
_source_files "${HOME}/.fzf.bash"

_fzf_compgen_path() {
  ag -g --hidden "" "$1"
}
export FZF_DEFAULT_COMMAND='ag --hidden --follow --ignore .git -l -g ""'
# There are also _fzf_path_completion and _fzf_dir_completion
complete -F _fzf_file_completion -o default -o bashdefault doge

# pass completion suggested by @d4ndo (#362)
_fzf_complete_pass() {
  _fzf_complete '+m' "$@" < <(
    pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
    stringsize="${#pwdir}"
    find "$pwdir" -name "*.gpg" -print |
        cut -c "$((stringsize + 1))"-  |
        sed -e 's/\(.*\)\.gpg/\1/'
  )
}

[ -n "$BASH" ] && complete -F _fzf_complete_pass -o default -o bashdefault pass

# added by travis gem
[ -f /home/jordan/.travis/travis.sh ] && source /home/jordan/.travis/travis.sh

if [ "$(tty)" = "/dev/tty1" ]; then
    xinit -- :1 vt1 && exit
fi

export PATH="/home/jordan/.pyenv/bin:$PATH"
if hash pyenv 2>/dev/null; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
export TZ='Asia/Taipei'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

### Pass
PASSWORD_STORE_DIR="$HOME/Dropbox/Personal.data/Account.data/pass"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#### CUDA 7.5 stuff
export CUDA_HOME=/usr/local/cuda-7.5 
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64

PATH=${CUDA_HOME}/bin:${PATH} 
export PATH 
