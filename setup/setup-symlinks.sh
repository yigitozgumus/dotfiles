#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

title "Creating symlinks"
for file in $(get_linkables); do
	target="$HOME/.$(basename "$file" '.symlink')"
	if [ -e "$target" ]; then
		info "~${target#$HOME} already exists... Skipping."
	else
		info "Creating symlink for $file"
		ln -s "$file" "$target"
	fi
done

echo ""
info "installing to ~/.config"
if [ ! -d "$HOME/.config" ]; then
	info "Creating ~/.config"
	mkdir -p "$HOME/.config"
fi

config_files=$(find "$DOTFILES/configs" -maxdepth 1 2>/dev/null)
info "Installing Config Files: $config_files\n"
for config in $config_files; do
	target="$HOME/.config/$(basename "$config")"
	if [ -e "$target" ]; then
		info "~${target#$HOME} already exists... Skipping."
	else
		info "Creating symlink for $config"
		ln -s "$config" "$target"
	fi
done
