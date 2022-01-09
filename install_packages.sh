#!/bin/bash

blue=$(tput setaf 4)
normal=$(tput sgr0)

printf "\n\n%40s\n" "${blue}Installing Dependencies \n\n ${normal}"


# Install dependencies/packages

sudo pacman -S --needed ccls alacritty fzf code exa zoxide fish nodejs npm bat vim python pyenv neovim stow diff-so-fancy go xsel

#install yay

cd ~/Downloads; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si; rm -rf ~/Downloads/yay

yay -S \
    nerd-fonts-fira-code \
    nerd-fonts-hack\
    spotify \


# nvm install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# fisher install (Plugin manager for fish)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

fisher update

# starship install
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Pip
pip install pynvim

# Npm install
sudo npm i -g neovim yarn

# packer install
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


