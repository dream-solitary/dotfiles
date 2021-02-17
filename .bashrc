#!/bin/bash
# bash config file
# Author: dream_solitary
# last update: Feb  3, 2021

# set user executables to PATH
if [ -d "$HOME/.local/bin" ]; then
	export PATH=$HOME/.local/bin:$PATH
fi

if [ -d "$HOME/.local/script" ]; then
	export PATH=$HOME/.local/script:$PATH
fi
export LANG=en_US.UTF-8
export http_proxy="http://localhost:8889/"

# load proxy
if [ -f "$HOME/.proxyrc" ] ;then
  . "$HOME/.proxyrc"
fi
