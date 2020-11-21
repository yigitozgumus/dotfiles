#!/bin/zsh

# This will be main system installation script
./scripts/main.sh

# install the package manager depending on the OS
./scripts/packageManager.sh

# install the required barebone programs from the package manager
./scripts/programs.sh

# install the terminal requirements
./scripts/terminal.sh

# install Python related setup
./scripts/python.sh

# # install other language and program requirements
./scripts/js.sh
