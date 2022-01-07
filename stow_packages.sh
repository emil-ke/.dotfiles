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

# rm -rf $CONF/Code\ -\ OSS

rm -rf $CONF/fish

rm ~/.gitconfig

rm -rf $CONF/nvim

rm $CONF/starship.toml

rm ~/.tmux.conf

rm ~/.vimrc


# stow all the dotfiles

stow -v --dotfiles alacritty
stow -v --dotfiles bash
# stow -v --dotfiles Code\ -\ OSS
stow -v --dotfiles fish
stow -v --dotfiles git
stow -v --dotfiles nvim
stow -v --dotfiles starship
stow -v --dotfiles tmux
stow -v --dotfiles vim

# I don't want to stage all the backup files so I didn't use stow for spicetify
rm -rf $CONF/spicetify/config-xpui.ini
rm -rf $CONF/spicetify/Themes/Base
mkdir $CONF/spicetify/Themes/Base

ln -s ./spicetify/.config/spicetify/config-xpui.ini ~/.config/
ln -s ./spicetify/.config/spicetify/Themes/Base


# VSC (code)

if [ -d $CONF/Code\ -\ OSS/User]; then
    rm $CONF/Code\ -\ OSS/User/settings.json
    rm $CONF/Code\ -\ OSS/User/keybindings.json
    ln -s ./Code\ -\ OSS/settings.json $CONF/Code\ -\ OSS/User
    ln -s .Code\ -\ OSS/keybindings.json $CONF/Code\ -\ OSS/User
elif [ -d $CONF/Code/User]; then
    rm $CONF/Code/User/setttings.json
    rm $CONF/Code/User/keybindings.json
    ln -s ./Code\ -\ OSS/settings.json $CONF/Code/User
    ln -s ./Code\ -\ OSS/keybindings.json
else
    mkdir -p ~/.config/Code\ -\ OSS/User
    ln -s ./Code\ -\ OSS/settings.json $CONF/Code\ -\ OSS/User
    ln -s ./Code\ -\ OSS/keybindings.json $CONF/Code\ -\ OSS/User
fi

# spicetify setup
sudo chmod 777 /usr/share/spotify -R
spicetify backup apply
