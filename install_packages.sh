#!/bin/bash


# Install dependencies/packages
sudo pacman -S --needed alacritty fzf code exa zoxide fish nodejs npm bat vim python python-pip pyenv neovim stow diff-so-fancy go xsel wget tmux

# Install yay if not already installed
if pacman -Qs yay > /dev/null ; then
  cd ~/Downloads; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si; rm -rf ~/Downloads/yay
else
  echo "yay is already installed"
fi
  yay -S \
    nerd-fonts-fira-code \
    nerd-fonts-hack\
    spotify

# nvm install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# fisher install (Plugin manager for fish)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# python neovim support
pip install pynvim

# npm
sudo npm i -g neovim yarn

# packer install
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

