# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en
export EDITOR=nvim
export TERM=xterm-256color
export TERMINAL=xterm-256color
export KEYTIMEOUT=1 # ZSH VI Mode

if command -v wsl.exe &> /dev/null; then
  export WSL_VERSION=$(wsl.exe -l -v | grep -a '[*]' | sed 's/[^0-9]*//g')
  export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's bin/local if it exists
if [ -d "$HOME/bin/local" ] ; then
  PATH="$HOME/bin/local:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -f "$HOME/.aliases" ] ; then
  source $HOME/.aliases
fi

if [ -f "$HOME/.aliases.local" ] ; then
  source $HOME/.aliases.local
fi

if [ -d "/usr/local/go" ] ; then
  PATH="$PATH:/usr/local/go/bin"
fi

# set PATH so it includes user's private go if it exists
if [ -d "$HOME/go" ] ; then
  GOPATH="$HOME/go"
  PATH="$PATH:$GOPATH/bin"
fi

# RUST
if [ -d "$HOME/.cargo" ] ; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -x $(command -v neofetch) ]
then
  neofetch
fi

