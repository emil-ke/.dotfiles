#!/bin/bash

chmod +x install_packages.sh stow_packages

./install_packages

./stow_packages

# Vim/neovim plugin install with vim-plug
nvim --headless +PlugInstall +qall
vim --headless +PlugInstall +qall

printf "\n\nSetup finished"
