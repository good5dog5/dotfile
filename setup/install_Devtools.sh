#!/usr/bin/env bash
# Jordan huang<good5dog5@gmail.com>

set -o errexit
set -o pipefail
set -o nounset

cd "/usr/local/bin"
sudo ln -fs /usr/bin/colorgcc  gcc
sudo ln -fs /usr/bin/colorgcc  g++
sudo ln -fs /usr/bin/colorgcc  cc
sudo ln -fs /usr/bin/colorgcc  c++

cd "${HOME}/usr"
git clone https://github.com/pagekite/Colormake
cd Colormake
sudo cp -fa colormake.pl colormake colormake-short clmake clmake-short /usr/bin/
