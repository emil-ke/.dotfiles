function ll --wraps='exa -ali --color=always --group-directories-first' --description 'alias ll exa -ali --color=always --group-directories-first'
  exa -ali --color=always --group-directories-first $argv; 
end
