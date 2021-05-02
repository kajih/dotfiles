#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt update
apt install -y curl

curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -

# add-apt-repository -y -n ppa:mmstick76/alacritty
# Hirsuite not having a ppa yet
echo "deb http://ppa.launchpad.net/mmstick76/alacritty/ubuntu groovy main" > /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/mmstick76/alacritty/ubuntu groovy main" > /etc/apt/sources.list

add-apt-repository -y -n ppa:neovim-ppa/unstable
add-apt-repository -y -u ppa:longsleep/golang-backports

apt install -y nodejs alacritty neovim golang-go zsh fonts-firacode \
  tmux neofetch ssh python3-pip 

python3 -m pip install --upgrade pynvim
npm install -g neovim
npm install -g yarn


