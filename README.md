# .dotfiles


I use arch linux and the install.sh script will only work for arch or arch-based systems since it utilizes pacman (archs package manager)


## Install

```console
./install.sh
```

> Encase you only want to install packages or only stow packages, then you have to chmod +x*<file>*for which ever *file* you'd want to run. (If you for some reason would rather do this you have to do additional setup, look in install.sh script for more info)

### Encase something went wrong

#### Dependencies/packages 

> check install_packages.sh whether or not this is up to date

- alacritty
- stow
- fzf
- code
- exa
- zoxide
- fish
- nodejs
- npm
- bat
- vim
- python
- pyenv
- neovim
- diff-so-fancy
- go
- nerd-fonts-fira-code
- nerd-fonts-hack
- spotify
- ccls
- nvm
- fisher
- starship
- packer.nvim


- arch packages

```console
sudo pacman -S --needed ccls alacritty fzf code exa zoxide fish nodejs npm bat vim python pyenv neovim stow diff-so-fancy go xsel
```

- packages from aur

```console
yay -S nerd-fonts-fira-code nerd-fonts-hack spotify 
```

- nvm

```console
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

- fisher

```console
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

- starship 

```console
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

- pip 

```console
pip install pynvim
```

- npm
```console
sudo npm i -g neovim yarn
```

- packer

```console
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

#### stow packages after install (remove directories/files for each before stowing)
```console
stow -v --dotfiles alacritty; \
stow -v --dotfiles bash; \
stow -v --dotfiles Code\ -\ OSS; \
stow -v --dotfiles fish; \
stow -v --dotfiles git; \
stow -v --dotfiles nvim; \
stow -v --dotfiles starship; \
stow -v --dotfiles tmux 
```
