# syntax highlighting
set fish_color_normal brcyan
set fish_color_command brcyan
set fish_color_error "#ea6962"
set fish_color_param "#7daea3"
# enable vim mode
set -U fish_key_bindings fish_vi_key_bindings

# alias for neovim
alias nv="nvim"

# starship prompt - see starship.toml
starship init fish | source
