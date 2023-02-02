
#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
ln -sf "$DOTFILES/astronvim/yigitozgumus/" ~/.config/nvim/lua/user
