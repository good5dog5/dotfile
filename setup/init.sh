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
_download()
{
    curl -sfLo "$1" --create-dirs "$2"
}

generate_powerline_font()
{
    local DIR="${HOME}/.fonts/"
    echo "Downloading Droid Sans Mono for Powerline.otf..."
    _download $DIR/Droid\ Sans\ Mono\ for\ Powerline.otf \
        https://www.dropbox.com/s/5i025mt90nq80ih/Droid%20Sans%20Mono%20for%20Powerline.otf?dl=0

    # curl -sfLo $DIR/Droid\ Sans\ Mono\ for\ Powerline.otf --create-dirs \
    #     https://www.dropbox.com/s/5i025mt90nq80ih/Droid%20Sans%20Mono%20for%20Powerline.otf?dl=0

    echo "Updating fonts caches..."
    fc-cache -vf $DIR 1>/dev/null 
}

install_startdict_dic()
{
    local DIR="$HOME/stardict/"

    echo "Downloading dictionaries..."
    _download $DIR/dic.tar \
        https://www.dropbox.com/s/qahmqsys175bzww/dic.tar?dl=0
    # curl -sfLo $DIR/dic.tar --create-dirs \
    #     https://www.dropbox.com/s/qahmqsys175bzww/dic.tar?dl=0

    echo "Installing stardict dictionaries..."
    tar -xf $DIR/dic.tar -C $DIR && rm $DIR/dic.tar
}

install_flashplayer_for_firefox()
{
    local DIR="/usr/lib/mozilla/plugins/"

    echo "Installing libflashplayer.so to $DIR ..."
    sudo curl -sfLo $DIR/libflashplayer.so --create-dirs \
        https://www.dropbox.com/s/iic1b7a762tkwr8/libflashplayer.so?dl=0
}
install_dropbox()
{
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd
}
# echo "Change default shell to /bin/bash"
# sudo ln -sf /bin/bash /bin/sh
#
create_directory
generate_powerline_font
install_startdict_dic
install_flashplayer_for_firefox
install_dropbox

