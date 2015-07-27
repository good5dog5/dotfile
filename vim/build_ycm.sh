
#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

_make_dirs()
{
    local DIR=( 
        "$HOME/ycm_build"
        "$HOME/ycm_temp/llvm_root_dir"
        "$HOME/usr/lib"
    )

    for d in "${DIR[@]}"; do
        if [ ! -d "$d" ]; then
           mkdir -p  $d && printf "%-65s %6s\n" "Create $d " "[done]"
        fi
    done
}

deploy_clang_by_arch()
{
    local link_clang_32bit="https://copy.com/k8Tiej1c1wkMtI3p"
    local link_clang_64bit="https://copy.com/cLkgu0e2364vR86m"

    local LIBDIR="${HOME}/usr/lib"

    _make_dirs

    if [ $(uname -p) = "x86_64" ]; then
        wget -c  $link_clang_64bit -O "${LIBDIR}/clang.tar.bz2"
    else
        wget -c  $link_clang_32bit -O "${LIBDIR}/clang.tar.bz2"
    fi

    cd $LIBDIR 
    tar xvjf clang.tar.bz2  && rm clang.tar.bz2
    mv clang*/* $HOME/ycm_temp/llvm_root_dir
}
build_ycm_support_libs()
{
    cd $HOME/ycm_build

    cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/ycm_temp/llvm_root_dir . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    make ycm_support_libs -j8

}
deploy_clang_by_arch
build_ycm_support_libs
