#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset



system_type=$(uname -s)

is_command() {
    command -v "$1" > /dev/null 2>&1
}

if [ ${system_type} = "Linux" ]; then
    sudo apt-get update -y && sudo apt-get install vim tmux git -y
fi

if [ ${system_type} = "Darwin" ]; then
    if ! is_command zsh; then
        echo "Installing zsh..."
        brew install zsh
        if [ $? -eq 0 ]; then
            echo "All packages are installed."
        else
            echo "Install zsh error."
        fi
    fi
fi

if command -v vim >/dev/null 2>&1; then
      echo "Bootstraping Vim"
        vim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
fi
