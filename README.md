# .dotfiles


the install.sh script will only work for arch or arch-based systems since it utilizes pacman (archs package manager)


## Install

```console
./install.sh
```

### Manual Install

#### Dependencies/packages 

> check install_packages.sh whether or not this is up to date

- alacritty
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
- python-pip
- pyenv
- neovim
- stow
- diff-so-fancy
- go
- xsel
- wget
- tmux
- nerd-fonts-fira-code
- nerd-fonts-hack
- nvm
- fisher
- starship
- packer.nvim

> pacman
```console
sudo pacman -S --needed alacritty fzf code exa zoxide fish nodejs npm bat vim python python-pip pyenv neovim stow diff-so-fancy go xsel wget tmux
```

install yay and a nerd font (for alacritty- and starship config)

> nvm


```console
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

> fisher

```console
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

> starship 

```console
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

> pip 

```console
pip install pynvim
```

> npm
 
```console
sudo npm i -g neovim yarn
```

> packer

```console
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

#### stow packages after install (remove directories/files for each before stowing)
```console
stow -v --dotfiles alacritty bash Code\ -\ OSS fish git nvim starship tmux
```
