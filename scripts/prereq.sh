#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

pacman -Sy --noconfirm curl nodejs go alacritty neovim zsh ttf-fira-code neofetch python-pip tmux npm
python3 -m pip install --upgrade pynvim
npm install -g neovim
npm install -g yarn


