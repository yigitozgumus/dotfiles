#!/bin/sh
# Get the configuration files
CONFIG_FILES=$(find . -type f | awk -F"/" '$NF ~ /^\..*$/ {print $NF}')
# Get the configuration directory
DOTFILE_DIR=$(pwd)
NVIM_CONFIG="init.vim"
# Options
if [[ $1 == '--no-git' ]]; then
    echo "\\nGitconfig file is excluded\\n"
    shopt -s extglob
    CONFIG_FILES=`echo ${CONFIG_FILES//.gitconfig}`
fi
# Update the backup
rm -rf "${HOME}/.backup"
mkdir -p "${HOME}/.backup"
echo "\\nThe backup is created."

for file in $CONFIG_FILES;do
    mv "${HOME}/${file}" "${HOME}/.backup"
done
#Nvim
mv "${HOME}/.config/nvim/${NVIM_CONFIG}" "${HOME/.backup}"
# Obsidian Sync
mv "${HOME}/.local/bin/${OBSIDIAN_CONFIG}" "${HOME/.backup}"

echo "\\nAll old configuration files are backed up.\\n"

for file in $CONFIG_FILES;do
    ln -sv "${DOTFILE_DIR}/configs/${file}" "${HOME}"
done
echo "\\nConfiguration Files are linked.\\n"

# Connect the nvim
ln -sv "${DOTFILE_DIR}/init.vim" "${HOME}/.config/nvim"
echo "\\nNvim configurations are linked.\\n"
