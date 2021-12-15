function l --wraps='exa --group-directories-first -F' --description 'alias l exa --group-directories-first -F'
  exa --group-directories-first -F $argv; 
end
