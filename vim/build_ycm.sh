#!/bin/bash
sign_download_finish=1

link_clang_32bit="https://copy.com/k8Tiej1c1wkMtI3p"
link_clang_64bit="https://copy.com/cLkgu0e2364vR86m"

deploy_clang_by_arch()
{
    local dir="$HOME/usr/lib"

    if [ $(uname -p) = "x86_64" ]; then
        wget -c  $link_clang_64bit -O $dir/clang.tar.bz2
    else
        wget -c  $link_clang_32bit -O $dir/clang.tar.bz2
    fi

    cd $dir 
    tar xvjf clang.tar.bz2  && rm clang.tar.bz2
    mv clang* $HOME/ycm_temp/llvm_root_dir
}
build_ycm_support_libs()
{
    cd $HOME/ycm_build

    cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/ycm_temp/llvm_root_dir . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    make ycm_support_libs -j8

}
deploy_clang_by_arch
build_ycm_support_libs
