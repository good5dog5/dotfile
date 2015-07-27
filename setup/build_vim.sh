
#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>
# Reference to https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

set -o errexit
set -o pipefail
set -o nounset

dir="$HOME/usr/tools/"

clone_vim_repo() {

    # hash use to check program exist
    if hash git 2>/dev/null; then
        git clone https://github.com/b4winckler/vim 
    else
        echo "Please install git first"
        exit 1
    fi
}
checkout_ver_430() 
{
    cd vim
    git checkout "4cf30a6d7e71fe464190985641b55a7b8728dce5" 2>/dev/null
}
config_and_build() 
{
    cd "$dir/vim"
    local flag="--with-features=huge 
                --enable-multibyte
                --enable-rubyinterp
                --enable-pythoninterp
                --enable-gui=auto
                --enable-gnome-check
                --enable-cscope
                --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu"
                --prefix=/usr

    ./configure $flag
}
clean_vim_pkg()
{
    local pkg=("vim"
               "vim-tiny"
               "vim-common"
               "vim-gui-common"
              )
    for p in ${pkg[@]}; do

        if hash $p 2>/dev/null; then
            sudo apt-get remove -y  $p
        fi
    done

}
install_vim ()
{
    cd "$dir/vim"

    echo "Ready to install vim"
    sudo make install

}
set_default_editor()
{
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
    sudo update-alternatives --set editor /usr/bin/vim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
    sudo update-alternatives --set vi /usr/bin/vim
}

cd "$dir"
clone_vim_repo
checkout_ver_430
config_and_build
install_vim
clean_vim_pkg



