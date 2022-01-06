function ls --wraps='exa --color=always --group-directories-first -lhF' --description 'alias ls exa --color=always --group-directories-first -lhF'
  exa --color=always --group-directories-first -lhF $argv; 
end
