#!/bin/sh
# Get the configuration files
CONFIG_FILES=$(find . -type f | awk -F"/" '$NF ~ /^\..*$/ {print $NF}')
# Get the configuration directory
DOTFILE_DIR=$(pwd)
NVIM_CONFIG="init.vim"
VIMRC=".vimrc"
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
mv "${HOME}/.config/nvim/${NVIM_CONFIG}" "${HOME}/.backup"

#Alacritty
mv "${HOME}/.config/alacritty" "${HOME}/.backup"

#Tmux
rm -f "${HOME}/.tmux.conf"
rm -f "${HOME}/.tmux-dark.conf"
rm -f "${HOME}/.tmux-light.conf"

#Lazygit
mkdir -p "${HOME}/.config/lazygit"
rm -f "${HOME}/.config/lazygit/config.yml"

echo "\\nAll old configuration files are backed up.\\n"

for file in $CONFIG_FILES;do
    ln -sv "${DOTFILE_DIR}/configs/${file}" "${HOME}"
done
echo "\\nConfiguration Files are linked.\\n"

# Connect the nvim
ln -sv "${DOTFILE_DIR}/configs/init.vim" "${HOME}/.config/nvim"
echo "\\nNvim configurations are linked.\\n"

# Connect alacritty
mkdir -p "${HOME}/.config/alacritty"
cp "${DOTFILE_DIR}/configs/alacritty.yml" "${HOME}/.config/alacritty/alacritty.yml"
cp "${DOTFILE_DIR}/configs/color.yml" "${HOME}/.config/alacritty/color.yml"

# Tmux
mkdir -p "${HOME}/.tmux"
ln -s "${DOTFILE_DIR}/tmux-dark.conf" "${HOME}/.tmux"
ln -s "${DOTFILE_DIR}/tmux-light.conf" "${HOME}/.tmux"
cp -f "tmux.conf" "${HOME}/.tmux.conf"

# Fish
cp -r "${DOTFILE_DIR}/fish/." "${HOME}/.config/fish/functions"

# Lazygit
cp "${DOTFILE_DIR}/config-dark.yml" "${HOME}/.config/lazygit/config-dark.yml"
cp "${DOTFILE_DIR}/config-light.yml" "${HOME}/.config/lazygit/config-light.yml"
