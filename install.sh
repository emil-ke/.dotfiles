#!/bin/bash

blue=$(tput setaf 4)
normal=$(tput sgr0)

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


# TODO: Automate neovim package install with packer nvim +PackerInstall won't work since you have to comment out
# the require statements before hand ( in init.lua file )

printf "\n\n%40s\n" "${blue}setup finished\n ${normal}"
