#!/bin/bash

core=$(grep -c ^processor /proc/cpuinfo)

function build_Apache_Thrift()
{
    sudo apt-get install -y          \
        pidgin                       \
        libboost-dev                 \
        libboost-test-dev            \
        libboost-program-options-dev \
        libboost-system-dev          \
        libboost-filesystem-dev      \
        libevent-dev                 \
        libpurple-dev                \
        automake                     \
        libtool                      \
        flex                         \
        bison                        \
        pkg-config                   \
        g++                          \
        libssl-dev                   

    cd $HOME/.local/bin/
        curl ftp://ftp.twaren.net/Unix/Web/apache/thrift/0.9.2/thrift-0.9.2.tar.gz  | tar zx

    cd thrift-0.9.2
        ./configure 

    make THRIFT_STATIC=true -j${core}
    sudo checkinstall --install -y
}
function build_line()
{
    cd $HOME/.local/bin/

        [ -d "purple-line"   ] && sudo rm -rf purple-line
        [ -d "line-protocal" ] && sudo rm -rf line-protocal

        git clone http://altrepo.eu/git/purple-line.git/   purple-line   
        git clone http://altrepo.eu/git/line-protocol.git/ line-protocol 
        cp line-protocol/line_main.thrift purple-line/
        cp line-protocol/line.thrift purple-line/

    cd purple-line
        make -j${core}

    sudo checkinstall --install 
}

# build_Apache_Thrift
build_line

