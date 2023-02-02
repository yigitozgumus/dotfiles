#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/util.sh

title "Configuring terminfo"

info "adding tmux.terminfo"
tic -x "$DOTFILES/resources/tmux.terminfo"

info "adding xterm-256color-italic.terminfo"
tic -x "$DOTFILES/resources/xterm-256color-italic.terminfo"
