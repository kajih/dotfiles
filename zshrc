
# source $HOME/.profile
source ~/.aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=5000

# End of lines configured by zsh-newuser-install
source "${HOME}/.dotfiles/zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen load chrissicool/zsh-256color
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load romkatv/powerlevel10k powerlevel10k

    # theme
    zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

bindkey -v

[[ $(command -v zoxide) ]] && eval "$(zoxide init zsh)"


