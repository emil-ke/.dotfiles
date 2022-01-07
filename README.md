

# .dotfiles


I use arch linux and the install.sh script will only work for arch or arch-based systems since it utilizes pacman (archs package manager)


## Install


```console
./install.sh
```

> Encase you only want to install packages or only stow packages, then you have to chmod +x*<file>*for which ever *file* you'd want to run. (If you for some reason would rather do this you have to do additional setup, look in install.sh script for more info)

### Encase something went wrong

#### Dependencies/packages
- alacritty
- stow
- fzf
- code
- exa
- zoxide
- fish
- nodejs
- bat
- vim
- neovim
- diff-so-fancy
- go
- nerd-fonts-fira-code
- spotify
- ccls
- nvm
- fisher
- starship
- vim-plug

```console
sudo pacman -Sy --needed alacritty fzf code exa zoxide fish nodejs python pyenv bat vim neovim stow diff-so-fancy go
```

```console
yay -S nerd-fonts-fira-code spotify ccls-git
```

Install nvm, fisher, starship and vim-plug via their respective websites/github-repos.
