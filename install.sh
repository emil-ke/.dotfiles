#!/bin/bash

echo "\n\nInstalling Dependencies\n\n"

# Install dependencies/packages
sudo pacman -S --needed \
    git \
    base-devel \
    alacritty \
    stow \
    fzf \
    code \
    exa \
    zoxide \
    fish \
    bat \
    vim \
    neovim \
    stow \
    diff-so-fancy \
    node \
    go

#install yay

cd ~/Downloads && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay

yay -S --needed \
    nerd-fonts-fira-code \
    spotify \


# nvm install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# fisher install (Plugin manager for fish)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# starship install
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# vim-plug install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


printf "\n\nstowing packages (stow <package>)\n\n"

stow alacritty
stow bash
stow Code\ -\ OSS
stow fish
stow git
stow nvim
stow spicetify
stow starship
stow tmux
stow vim

# Installing vim/nvim plugins

# Vim plugin install with vim-plug
nvim --headless +PlugInstall +qall
vim --headless +PlugInstall +qall

echo "\n\nSetup finished"
