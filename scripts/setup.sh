#!/bin/bash
git submodule init
git submodule update

mkdir -p ~/.config/alacritty
mkdir -p ~/go/bin
mkdir -p ~/go/src/github.com
mkdir -p ~/bin

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# -BASHRC
[[ -L ~/.bashrc ]] && rm ~/.bashrc
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.bashrc.bak
ln -s $(pwd)/bashrc ~/.bashrc

# -ZSHRC
[[ -L ~/.zshrc ]] && rm ~/.zshrc
[[ -f ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.bak
ln -s $(pwd)/zshrc ~/.zshrc

# -PROFILE
[[ -L ~/.profile ]] && rm ~/.profile
[[ -f ~/.profile ]] && mv ~/.profile ~/.profile.bak
ln -s $(pwd)/profile ~/.profile
ln -s $(pwd)/profile ~/.zprofile
ln -s $(pwd)/profile ~/.bash_profile

ln -s $(pwd)/aliases ~/.aliases

# -NVIM
[[ ! -f ~/.config/nvim ]] && ln -s $(pwd)/nvim ~/.config/nvim

ln -s $(pwd)/local_bundles.vim ~/.config/nvim/local_bundles.vim

ln -s $(pwd)/tmux/.tmux.conf ~/
ln -s $(pwd)/tmux.conf.local ~/.tmux.conf.local
ln -s $(pwd)/p10k.zsh ~/.p10k.zsh
ln -s $(pwd)/alacritty.yml ~/.config/alacritty/alacritty.yml

