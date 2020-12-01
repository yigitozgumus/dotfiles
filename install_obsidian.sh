#!/bin/bash

OBSIDIAN_CONFIG="obsidian_sync"

# Obsidian repo sync
ln -sv "./${OBSIDIAN_CONFIG}" "${HOME}/.local/bin"
crontab -l
echo "*/60 * * * * ${HOME}/.local/bin/${OBSIDIAN_CONFIG}" | sort - | uniq - | crontab -
echo "\\nCronjob is added.\\n"