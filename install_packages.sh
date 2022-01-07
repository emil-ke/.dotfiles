#!/bin/bash

blue=$(tput setaf 4)
normal=$(tput sgr0)

printf "\n\n%40s\n" "${blue}Installing Dependencies \n\n ${normal}"


# Install dependencies/packages

sudo pacman -S --needed alacritty fzf code exa zoxide fish nodejs bat vim python pyenv neovim stow diff-so-fancy go

#install yay

cd ~/Downloads; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si; rm -rf ~/Downloads/yay

yay -S \
    nerd-fonts-fira-code \
    spotify \
    ccls-git


# nvm install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# fisher install (Plugin manager for fish)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

fisher update

# starship install
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# vim-plug install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
