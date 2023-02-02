#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

title "Linking scripts"

for file in $(get_scripts); do
	postfix=".sh"
	target="$HOME/.local/bin/$(basename "$file")"
	name="${target%$postfix}"

	if [ -e "$name" ]; then
		info "~${name#$HOME} already exists... Skipping."
	else
		info "Creating symlink for $file"
		chmod +x "$file"
		ln -sf "$file" "$name"
	fi
done
