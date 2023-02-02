#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

title "Configuring shell"

[[ -n "$(command -v brew)" ]] && zsh_path="$(brew --prefix)/bin/zsh" || zsh_path="$(which zsh)"
if ! grep "$zsh_path" /etc/shells; then
	info "adding $zsh_path to /etc/shells"
	echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
	chsh -s "$zsh_path"
	info "default shell changed to $zsh_path"
fi
