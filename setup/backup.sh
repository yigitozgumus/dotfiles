#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

BACKUP_DIR=$HOME/.backup
echo "Creating backup directory at $BACKUP_DIR"
rm -rf "$BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

for file in $(get_linkables); do
	filename=".$(basename "$file" '.symlink')"
	target="$HOME/$filename"
	if [ -f "$target" ]; then
		echo "backing up $filename"
		cp "$target" "$BACKUP_DIR"
	else
		warning "$filename does not exist at this location or is a symlink"
	fi
done

for filename in "$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc"; do
	if [ ! -L "$filename" ]; then
		echo "backing up $filename"
		cp -rf "$filename" "$BACKUP_DIR"
	else
		warning "$filename does not exist at this location or is a symlink"
	fi
done
