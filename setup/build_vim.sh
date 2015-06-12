#!/bin/bash
dir="$HOME/usr/tools/"

clone_vim_repo() {

    # hash use to check program exist
    if hash git 2>/dev/null; then
        git clone https://github.com/b4winckler/vim 
    else
        echo "Please install git first"
        return
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

cd "$dir"
clone_vim_repo
checkout_ver_430
config_and_build
clean_vim_pkg



