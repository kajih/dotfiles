#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt update
# curl -L https://download.jetbrains.com/fonts/JetBrainsMono-2.221.zip -o /tmp/monofont.zip
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -o /tmp/monofont.zip

pacman -S --noconfirm noto-fonts-emoji noto-fonts-extra bdf-unifont unzip

# unzip /tmp/monofont.zip -d /usr/share/fonts
unzip /tmp/monofont.zip -d /usr/share/fonts/TTF/nerd/
fc-cache -f -v

