#!/bin/sh

cd /usr/local/bin
sudo ln -fs /usr/bin/colorgcc  gcc
sudo ln -fs /usr/bin/colorgcc  g++
sudo ln -fs /usr/bin/colorgcc  cc
sudo ln -fs /usr/bin/colorgcc  c++

cd ~/usr
git clone https://github.com/pagekite/Colormake
cd Colormake
sudo cp -fa colormake.pl colormake colormake-short clmake clmake-short /usr/bin/
