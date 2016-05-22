#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

create_directory() {

    local DIR=( "$HOME/.fonts/"
              "$HOME/usr/script/"
              "$HOME/usr/tools/"
              "$HOME/usr/lib/"
              "$HOME/usr/bin/"
              "$HOME/stardict/dic/"
              "$HOME/usr/.local/bin"
              "$HOME/ycm_build"
              "$HOME/ycm_temp/llvm_root_dir"
              "$HOME/rtorrent/session"
              "$HOME/rtorrent/watch"
              "$HOME/Mail"
              )

    for d in "${DIR[@]}"; do
        if [ ! -d "$d" ]; then
           mkdir -p  $d && printf "%-65s %6s\n" "Create $d " "[done]"
        fi
    done
}

generate_powerline_font()
{
    local DIR="${HOME}/.fonts/"
    echo "Begin Downloading Powerline font and update font cache"

    cp $DOTFILE/bin/Droid\ Sans\ Mono\ for\ Powerline.otf $DIR
    fc-cache -vf $DIR && printf "%-55s %5s\n\n" "Update fonts cache" "[done]"
}
install_vim_plug()
{
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}
sudo ln -sf /bin/bash /bin/sh
create_directory
generate_powerline_font
install_vim_plug

