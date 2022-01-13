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

# zoxide needs to be initialized
zoxide init fish
