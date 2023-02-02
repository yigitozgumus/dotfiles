#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

title "Setting up Git"

defaultName=$(git config user.name)
defaultEmail=$(git config user.email)
defaultGithub=$(git config github.user)

info "Type your work credentials"
read -rp "Name [$defaultName] " name
read -rp "Email [$defaultEmail] " email
read -rp "Github username [$defaultGithub] " github

touch "$HOME/.gitconfig-work"
git config -f ~/.gitconfig-work user.name "${name:-$defaultName}"
git config -f ~/.gitconfig-work user.email "${email:-$defaultEmail}"
git config -f ~/.gitconfig-work github.user "${github:-$defaultGithub}"
info "Work Credentials set"

git_files=$(find "$DOTFILES/git" -maxdepth 1 2>/dev/null)
for git_file in $git_files; do
	target="$HOME/.$(basename "$git_file")"
	if [ -e "$target" ]; then
		info "~${target#$HOME} already exists... Skipping."
	else
		info "Creating symlink for $git_file"
		ln -s "$git_file" "$target"
	fi
done
