#!/bin/bash

./install_packages.sh

# nvm.fish has an error when you have no folder at ~/.local/share/nvm. 
# But this seems to fix it. (TODO: see if this is up to date and if it's needed or not)
if [ -d "~/.local/share/nvm"]
then
    :
else
    mkdir ~/.local/share/nvm
fi

./stow_packages.sh

# initialize zoxide
zoxide init fish
