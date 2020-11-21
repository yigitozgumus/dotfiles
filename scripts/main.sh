#!/bin/zsh

# Formatting helpers
FORMAT_INFO='\e[36m >> \e[39m\e[1m'
FORMAT_DONE='\e[36m >> \e[1m'
FORMAT_INSTALL='\e[36m >> \e[92m\e[1m'
FORMAT_END='\e[0m'

printf "${FORMAT_INFO}Installing main requirements.\n${FORMAT_END}"
printf "${FORMAT_INSTALL}Running main script... ${FORMAT_END}\n"

# Required for programs
# Install xcode select if necessary
os=$(sw_vers -productVersion | awk -F. '{print $1 "." $2}')
if softwareupdate --history | grep --silent "Command Line Tools.*${os}"; then
    echo 'Command-line tools already installed.' 
else
    echo 'Installing Command-line tools...'
    in_progress=/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    touch ${in_progress}
    product=$(softwareupdate --list | awk "/\* Command Line.*${os}/ { sub(/^   \* /, \"\"); print }")
    softwareupdate --verbose --install "${product}" || echo 'Installation failed.' 1>&2 && rm ${in_progress} && exit 1
    rm ${in_progress}
    echo 'Installation succeeded.'
fi

printf "${FORMAT_INFO}Done.\n${FORMAT_END}"