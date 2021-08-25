set -x EDITOR "vim"
set -U fish_greeting


### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths


# below line needed in order to execute programs
# set -x GOPATH /user/emil/go
# set -x PATH $PATH /usr/local/go/bin
# set PATH /home/emil/.local/bin $PATH

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin


### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
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


# ls / exa alias
alias ls='exa --color=always --group-directories-first'
alias ll='exa -ali --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'


# Other alias
alias grep='grep --color=auto'
alias gs='git status'
alias gc='git clone'
alias files='nautilus'


starship init fish | source

