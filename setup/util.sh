#!/bin/bash

# Colors
DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

# Prompts

title() {
	printf "\n${COLOR_PURPLE}$1${COLOR_NONE}\n"
	printf "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

error() {
	printf "${COLOR_RED}Error: ${COLOR_NONE}$1\n"
	exit 1
}

warning() {
	printf "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1\n"
}

info() {
	printf "${COLOR_BLUE}Info: ${COLOR_NONE}$1\n"
}

success() {
	printf "${COLOR_GREEN}$1${COLOR_NONE}\n"
}

blank_line() {
	echo ""
}

get_linkables() {
	find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'
}

get_scripts() {
	find -H "$DOTFILES/scripts" -maxdepth 1 -name "*.sh"
}
