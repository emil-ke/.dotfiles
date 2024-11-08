function epy_font
    # Ensure Alacritty config directory exists
    if not test -d ~/.config/alacritty
        mkdir -p ~/.config/alacritty
    end

    # Backup and restore logic for main config file
    if test -f ~/.config/alacritty/alacritty.toml
        mv ~/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty_main.toml
    end

    # Create temporary, empty config file
    touch ~/.config/alacritty/alacritty.toml

    # Noob warning 
    echo '
[bell]
animation = "EaseOutExpo"
duration = 0

[colors]
draw_bold_text_with_bright_colors = true

[colors.bright]
black = "0x444b6a"
blue = "0x7da6ff"
cyan = "0x56aed6"
green = "0xb9f27c"
magenta = "0xbb9af7"
red = "0xff7a93"
white = "0xebf4ff"
yellow = "0xff9e64"

[colors.normal]
black = "0x32344a"
blue = "0x7aa2f7"
cyan = "0x40a2e3"
green = "0x9ece6a"
magenta = "0xad8ee6"
red = "0xf7768e"
white = "0xc0caf5"
yellow = "0xe0af68"

[colors.primary]
background = "0x071013"
foreground = "0xc9c4b5"

[cursor]
style = "Block"
unfocused_hollow = true

[env]
TERM = "xterm-256color"

[font]
size = 14

[font.italic]
family = "iA Writer Mono S"
style = "Italic"

[font.normal]
family = "iA Writer Mono S"
style = "normal"

[font.offset]
x = 0
y = 7

[terminal.shell]
program = "/usr/bin/fish"

[window]
decorations = "None"
dynamic_padding = true

[terminal]

' >>~/.config/alacritty/alacritty.toml

    # Launch epy with optional command line arguments
    epy $argv

    # Restore default Alacritty configuration
    rm ~/.config/alacritty/alacritty.toml
    if test -f ~/.config/alacritty/alacritty_main.toml
        mv ~/.config/alacritty/alacritty_main.toml ~/.config/alacritty/alacritty.toml
    end
end
