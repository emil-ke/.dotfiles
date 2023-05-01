#!/bin/bash

# This is not up to date!!!
# TODO: update this

# Install dependencies/packages
sudo pacman -S --needed alacritty fzf code exa zoxide fish nodejs npm bat vim python python-pip pyenv neovim stow diff-so-fancy go xsel wget tmux zathura zathura-djvu zathura-pdf-poppler zathura-ps

# Install yay if not already installed
if pacman -Qs yay > /dev/null ; then
  echo "yay is already installed"
else
  cd ~/Downloads; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si; rm -rf ~/Downloads/yay
fi

# I should probably change this
yay -S \
  nerd-fonts-fira-code \
  nerd-fonts-hack\
  spotify

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# fisher install (Plugin manager for fish)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

pip install pynvim black ipython flake8 numpy sympy pdfcropmargins

# npm
sudo npm i -g neovim yarn

# packer (nvim) install
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
