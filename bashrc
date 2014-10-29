# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Set the default editor
export EDITOR=vim
export PATH=$HOME/.local/bin:$PATH

source /etc/default/locale
#Enable programmable completion features.
if [ -f /etc/bash_completion ]; then
   source /etc/bash_completion
fi

#Enable Powerline bash prompt
if [ -f /home/jordan/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
   source /home/jordan/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

# Set the PS1 prompt (with color).
#Enable Powerline
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\][ \W ]\[\033[00m\]\$ '


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize
shopt -s histverify

if [ -f ~/.bash_aliases ]; then
   source ~/.bash_aliases
fi


