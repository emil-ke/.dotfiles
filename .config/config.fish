set EDITOR "vim"
set TERM "xterm-kitty"
set -U fish_greeting


set -x GOPATH /user/emil/go
# below line needed in order to execute programs
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin 

set PATH /home/emil/.local/bin $PATH

set fish_color_normal brcyan
set fish_color_autosuggestion '#95a4ad'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan


# navigation
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'



# ls / exa
alias ls='exa --color=always --group-directories-first'
alias ll='exa -ali --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'


# Other alias
alias grep='grep --color=auto'
alias gs='git status'


starship init fish | source

