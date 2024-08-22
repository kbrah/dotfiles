if status is-interactive
    # Commands to run in interactive sessions can go here
end
zoxide init fish | source
starship init fish | source

alias wezterm 'flatpak run org.wezfurlong.wezterm'

fish_vi_key_bindings

bind  -M insert \cf forward-char
bind  -M normal \cf forward-char

fish_add_path /home/lasse/.local/bin
