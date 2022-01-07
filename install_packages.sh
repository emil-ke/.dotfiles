#!/bin/bash

blue=$(tput setaf 4)
normal=$(tput sgr0)

printf "\n\n%40s\n" "${blue}Installing Dependencies$(normal)\n\n"

# Install dependencies/packages

sudo pacman -S --needed alacritty fzf code exa zoxide fish nodejs bat vim neovim stow diff-so-fancy go

#install yay

cd ~/Downloads; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si; cd ~/Downloads; rm -rf yay

yay -S \
    nerd-fonts-fira-code \
    spotify \
    ccls-git


# nvm install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# fisher install (Plugin manager for fish)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# starship install
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# vim-plug install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

