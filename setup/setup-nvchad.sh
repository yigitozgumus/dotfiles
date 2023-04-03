#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

blank_line

info "Deleting current configuration."
$(rm -rf ~/.config/nvim)
$(rm -rf ~/.local/share/nvim)

info "Downloading nvChad."
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

info "Linking custom files"
 ln -sf "$DOTFILES/nvchad/" "$HOME/.config/nvim/lua/custom"
