#!/bin/bash

./install_packages.sh

# nvm.fish has an error when you have no folder in ~/.local/share/nvm. But this seems to fix it.
if [ -d "~/.local/share/nvm"]
then
    :
else
    mkdir ~/.local/share/nvm
fi

./stow_packages.sh

# initialize zoxide
zoxide init fish

# TODO: update install script to autoinstall everything for neovim
