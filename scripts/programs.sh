#!/bin/zsh

# Formatting helpers
FORMAT_INFO='\e[36m >> \e[39m\e[1m'
FORMAT_DONE='\e[36m >> \e[1m'
FORMAT_INSTALL='\e[36m >> \e[92m\e[1m'
FORMAT_END='\e[0m'

printf "${FORMAT_INFO}Installing required programs. \n${FORMAT_END}"
printf "${FORMAT_INSTALL}Running Program installation script... \n${FORMAT_END}"

brew cask install code
brew cask install appcleaner
brew cask install amphetamine
brew cask install flux
brew cask install docker
brew cask install iterm2
brew cask install firefox
brew cask install postman
brew cask install spotify
brew cask install alfred
brew cask install insomnia
brew cask install notion
brew cask install google-backup-and-sync
brew cask install fork
brew cask install coconutbattery
brew cask install obsidian

printf "${FORMAT_INFO}Done.\n${FORMAT_END}"