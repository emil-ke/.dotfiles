function batfzf
  fzf -i --preview 'bat --color=always --style=numbers --line-range=:500 {}' $argv;
end
