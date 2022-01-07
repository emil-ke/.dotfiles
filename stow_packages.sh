#!/bin/bash

blue=$(tput setaf 4)
normal=$(tput sgr0)

printf "\n\n$(blue)stowing packages (stow <package>)$(normal)\n\n"

# rm directory/file if it exists (stow won't work properly if there already exists a file)
## rm obiously checks if there exists a file/dir to remove so this is fine
## but could be improved by checking before hand since this (my) approach throws an error if no dir/file exists


CONF=~/.config


rm -rf $CONF/alacritty

rm ~/.bashrc

rm -rf $CONF/Code\ -\ OSS

rm -rf $CONF/fish

rm ~/.gitconfig

rm -rf $CONF/nvim

rm -rf $CONF/spicetify

rm $CONF/starship.toml

rm ~/.tmux.conf

rm ~/.vimrc


# stow all the dotfiles

stow alacritty
stow bash
stow Code\ -\ OSS
stow fish
stow git
stow nvim
stow spicetify
stow starship
stow tmux
stow vim

# Installing vim/nvim plugins

printf "\n\n installing vim/nvim plugins \n\n"

# Vim plugin install with vim-plug
nvim --headless +PlugInstall +qall
vim --headless +PlugInstall +qall

spicetify apply

printf "\n\nSetup finished"
