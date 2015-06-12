#!/bin/bash
dir="$HOME/usr/tools/"

clone_tmux_repo() {

    # hash use to check program exist
    if hash git 2>/dev/null; then

        if [ -d "tmux" ]; then
            echo "tmux exist"
            return
        else
            git clone https://github.com/tmux/tmux.git
        fi
    else
        echo "Please install git first"
        return
    fi
}
config_and_build() 
{
    cd "$dir/tmux"

    bash autogen.sh
    ./configure && make
}
clean_tmux_pkg()
{
    local pkg=("tmux")

    for p in ${pkg[@]}; do

        if hash $p 2>/dev/null; then
            sudo apt-get remove -y  $p
        fi
    done

}
install_tmux ()
{
    cd "$dir/tmux"

   echo "Ready to install tmux"
   sudo make install

}

cd "$dir"
clone_tmux_repo
config_and_build
clean_tmux_pkg
install_tmux



