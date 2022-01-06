#!/bin/bash

chmod +x ./install_packages.sh ./stow_packages.sh

./install_packages.sh

# nvm.fish has an error when you have no folder in ~/.local/share/nvm but this seems to fix it.

if [ -d ~/.local/share/nvm]

then
    :
else
    mkdir ~/.local/share/nvm
fi

./stow_packages.sh

# Vim/neovim plugin install with vim-plug
nvim --headless +PlugInstall +qall
vim --headless +PlugInstall +qall

printf "\n\nSetup finished\n"
