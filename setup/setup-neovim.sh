#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

blank_line
info "Deleting current configuration."
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
info "Linking the Neovim Configuration."
ln -sf "$DOTFILES/configs/nvim/" "$HOME/.config/nvim"
