#!/bin/bash

# rm directory/file if it exists (stow won't work properly if there already exists a file)
# rm obiously checks if there exists a file/dir to remove so this is fine
# but could be improved by checking before hand since this (my) approach throws an
# error if no dir/file exists (TODO)
CONF=~/.config

rm -rfv $CONF/alacritty $CONF/Code\ -\ OSS $CONF/fish $CONF/nvim
rm -v ~/.gitconfig ~/.bashrc $CONF/starship.toml ~/.tmux.conf

# stow all the dotfiles
stow -v --dotfiles alacritty bash Code\ -\ OSS fish git nvim starship tmux lvim zathura
