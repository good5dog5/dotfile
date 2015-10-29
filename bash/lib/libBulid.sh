#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset


_check_git()
{
    # hash use to check program exist
    if ! hash git 2>/dev/null; then
        echo "Please install git first"
        exit 1
    fi
}

_clone_git_repo()
{
    if [ $# -ne 2 ]; then
        echo "Error : Please give the github repo and directory to clone to"
        return 1
    fi

    _check_git

    local repo="$1"
    local dir="$2"
    local repodir="${repo##*/}"

    if [[ ! -d $dir/$repodir ]]; then
        git clone $repo $dir 
    else
        echo "$dir/$repodir eixst, clone not process!"
    fi

}
