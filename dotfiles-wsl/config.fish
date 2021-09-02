# config.fish - add this to the ~/.config/fish directory

# enable vim mode
set -U fish_key_bindings fish_vi_key_bindings

# alias for neovim
alias nv="nvim"

# starship prompt - see starship.toml
starship init fish | source
