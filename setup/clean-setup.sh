#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

warning "Removing setup..."

for file in $(get_linkables); do
	filename=".$(basename "$file" '.symlink')"
	target="$HOME/$filename"
	info "Deleting $filename from the setup..."
	rm "$target"
done

for filename in "$HOME/.config/fish" "$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc" "$HOME/.config/alacritty" "$HOME/.config/kitty"; do
	info "Deleting $filename from the setup..."
	rm -rf "$filename"
done
