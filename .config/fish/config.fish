set -U fish_greeting

# pyenv path setup
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source


### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

# Go path
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin


### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#95a4ad'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan


# navigation
abbr -a .. cd ..
abbr -a .2 cd ../..
abbr -a .3 cd ../../..
abbr -a .4 cd ../../../..
abbr -a .5 cd ../../../../..


# ls / exa
abbr -a l ls --group-directories-first -F
abbr -a ls exa --color=always --group-directories-first -lhF
abbr -a ll exa -ali --color=always --group-directories-first
abbr -a lt exa -aT --color=always --group-directories-first

# Git commands
abbr -a gita git add -A
abbr -a gs git status
abbr -a gits git status
abbr -a gc git clone
abbr -a gitc git commit -m
abbr -a gitp git push
abbr -a gitl "git log --oneline -n 10"


abbr -a grep grep --color=auto
abbr -a files nautilus
abbr -a c clear
abbr -a tmux tmux -2
abbr -a cat bat

alias vim nvim

# Make directory and cd into it
function mkcd
  mkdir -p $argv; and cd $argv
end

# starship init
starship init fish | source


