#!/bin/zsh

# Formatting helpers
FORMAT_INFO='\e[36m >> \e[39m\e[1m'
FORMAT_DONE='\e[36m >> \e[1m'
FORMAT_INSTALL='\e[36m >> \e[92m\e[1m'
FORMAT_END='\e[0m'

printf "${FORMAT_INFO}Installing terminal requirements.\n${FORMAT_DONE}"
printf "${FORMAT_INSTALL}Running Terminal Configuration script... \n${FORMAT_END}"
# TODO
printf "${FORMAT_INFO}Done.\n${FORMAT_END}"