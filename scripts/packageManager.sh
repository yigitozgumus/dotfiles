#!/bin/zsh

# Formatting helpers
FORMAT_INFO='\e[36m >> \e[39m\e[1m'
FORMAT_DONE='\e[36m >> \e[1m'
FORMAT_INSTALL='\e[36m >> \e[92m\e[1m'
FORMAT_END='\e[0m'

printf "${FORMAT_INFO}Installing package manager. \n${FORMAT_END}"
printf "${FORMAT_INSTALL}Running Package Manager script...\n${FORMAT_END}"

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

printf "${FORMAT_INFO}Done.\n${FORMAT_END}"