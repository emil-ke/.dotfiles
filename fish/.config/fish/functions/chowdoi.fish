function chowdoi
    function __chowdoi
        howdoi $argv[1] | pygmentize -f terminal256 -O style=material
    end
    __chowdoi $argv
end
