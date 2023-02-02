#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

title "Setting up Homebrew"

if test ! "$(command -v brew)"; then
	info "Homebrew not installed. Installing."
	# Run as a login shell (non-interactive) so that the script doesn't pause for user input
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login
else
	error "Homebrew is installed"
fi

if [ "$(uname)" == "Linux" ]; then
	test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
	test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
fi

# install brew dependencies from Brewfile
brew bundle

# install fzf
echo -e
info "Installing fzf"
"$(brew --prefix)"/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
