#!/bin/bash

blue=$(tput setaf 4)
normal=$(tput sgr0)

printf "\n\n${blue}stowing packages (stow <package>)${normal} \n\n"

# rm directory/file if it exists (stow won't work properly if there already exists a file)
## rm obiously checks if there exists a file/dir to remove so this is fine
## but could be improved by checking before hand since this (my) approach throws an error if no dir/file exists


CONF=~/.config


rm -rfv $CONF/alacritty

rm -v ~/.bashrc

rm -rfv $CONF/Code\ -\ OSS

rm -rfv $CONF/fish

rm -v ~/.gitconfig

rm -rfv $CONF/nvim

rm -v $CONF/starship.toml

rm -v ~/.tmux.conf

# stow all the dotfiles
stow -v --dotfiles alacritty
stow -v --dotfiles bash
stow -v --dotfiles Code\ -\ OSS
stow -v --dotfiles fish
stow -v --dotfiles git
stow -v --dotfiles nvim
stow -v --dotfiles starship
stow -v --dotfiles tmux

# spicetify setup
sudo chmod 777 /usr/share/spotify -R
spicetify backup apply


