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

# Vim/neovim plugin install with vim-plug
nvim --headless +PlugInstall +qall
vim +PlugInstall +qall

printf "\n\n%40s\n" "${blue}setup finished$(normal)\n"
