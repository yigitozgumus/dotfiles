#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

rm -rf ~/.config/nvim
rm -rf  ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
ln -sf "$DOTFILES/astronvim/yigitozgumus/" ~/.config/nvim/lua/user
