#!/bin/bash
build_Apache_Thrift()
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

    cd /tmp
    curl http://ftp.twaren.net/Unix/Web/apache/thrift/0.9.2/thrift-0.9.2.tar.gz | tar zx
    cd thrift-0.9.2/ 
    ./configure 
    make -j16 
    sudo checkinstall
    thrift --help 
}
build_line()
{
    cd /tmp
    git clone http://altrepo.eu/git/purple-line.git/ purple-line
    git clone http://altrepo.eu/git/line-protocol.git/ line-protocol
    cp line-protocol/line_main.thrift purple-line/
    cp line-protocol/line.thrift purple-line/

    cd purple-line
    make

    sudo make install
}

build_Apache_Thrift
build_line
