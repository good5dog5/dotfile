#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset
_check_arch()
{
    ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
    if [ -f /etc/lsb-release ]; then

        . /etc/lsb-release
        OS="$DISTRIB_ID"
        VER="$DISTRIB_RELEASE"
        DIR="ubuntu"

    else

        OS=$(uname -s)
        VER=$(uname -r)

    fi
}

deploy()
{
    _check_arch
    mkdir -p $HOME/.package

    
    for f in "$DIR/*"; 
    do
        ln -sfr $f $HOME/.package
    done
}

deploy

