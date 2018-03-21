#!/bin/bash
set -eu

# Vim Compiler Script
#
# This script prepares and configures the sources needed to compile VIM 8.* with Python 2.
#
# Python 2 is needed to run XDebugger with VIM.
#
# Information source: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source 
#
# Usage:
#
# 1 - Clone vim repository https://github.com/vim/vim
# 2 - Copy this script inside vim repo's root path.
# 3 - Execute this script.
# 4 - Be preared to be awesome.
#
# @author Alejandro Javalera ajavalera@gmail.com
#

# Un-installing current VIM.
sudo apt remove vim vim-runtime gvim
sudo apt remove vim-tiny vim-common vim-gui-common vim-nox

#Installing dependencies.
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git

#cd src 
make distclean
#cd ..

#Configure sources.
./configure \
    --enable-multibyte \
    --enable-pythoninterp \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
    --with-features=huge \
    --with-x \
    --enable-fontset \
    --enable-largefile \
    --disable-netbeans \
    --with-compiledby="AlejandroJR" \
    --enable-fail-if-missing

make VIMRUNTIMEDIR=/usr/local/share/vim/vim80

#End.
echo "Configuration is done. You can now run"
echo "   sudo make"
echo "   sudo make install"

