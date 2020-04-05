#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt update
curl -L https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip -o /tmp/monofont.zip

apt install -y fonts-noto-color-emoji unifont
dpkg-reconfigure fontconfig-config
rm /etc/fonts/conf.d/70-no-bitmaps.conf

unzip /tmp/monofont.zip -d /usr/share/fonts
fc-cache -f -v

