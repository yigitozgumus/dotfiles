#!/bin/sh
# Declarations
DOTFILE_DIR=$(pwd)
CONFIG_DIR="configs"

CORE="$DOTFILE_DIR/$CONFIG_DIR/core"

NVIM="$DOTFILE_DIR/$CONFIG_DIR/nvim"

ALACRITTY_DIR="$DOTFILE_DIR/$CONFIG_DIR/alacritty"

TMUX_DIR="$DOTFILE_DIR/$CONFIG_DIR/tmux"

TMUXP_DIR="$DOTFILE_DIR/$CONFIG_DIR/tmuxp"

FISH_DIR="$DOTFILE_DIR/$CONFIG_DIR/fish"

LAZYGIT_DIR="$DOTFILE_DIR/$CONFIG_DIR/lazygit"

STARSHIP_DIR="$DOTFILE_DIR/$CONFIG_DIR/starship"

# Get the configuration files
CONFIG_FILES=$(find $CONFIG_DIR/core -type f)

NVIM_CONFIG_FILE="${NVIM}/init.vim"
NVIM_MAPS_FILE="${NVIM}/maps.vim"
NVIM_MACOS_FILE="${NVIM}/macos.vim"
NVIM_PLUG_FILE="${NVIM}/plug.vim"
NVIM_LUA_DIR="${NVIM}/lua/"

# Options
if [[ $1 == '--no-git' ]]; then
    echo "\\nGitconfig file is excluded\\n"
    shopt -s extglob
    CONFIG_FILES=`echo ${CONFIG_FILES//gitconfig}`
fi

# Update the backup

rm -rf "${HOME}/.backup"
mkdir -p "${HOME}/.backup"
echo "\\nThe backup is created."

for file in $CONFIG_FILES;do
    target_file=`echo $file | sed "s/configs\/core\///g"`
    mv "${HOME}/.${target_file}" "${HOME}/.backup"
done

#Nvim
mv "${HOME}/.config/nvim/init.vim" "${HOME}/.backup"
mv "${HOME}/.config/nvim/maps.vim" "${HOME}/.backup"
mv "${HOME}/.config/nvim/macos.vim" "${HOME}/.backup"
mv "${HOME}/.config/nvim/plug.vim" "${HOME}/.backup"
mv "${HOME}/.config/nvim/lua" "${HOME}/.backup/lua"

#Alacritty
mv "${HOME}/.config/alacritty" "${HOME}/.backup"

#Tmux
rm -f "${HOME}/.tmux.conf"

#Tmux
rm -rf "${HOME}/.tmuxp"

#Lazygit
mkdir -p "${HOME}/.config/lazygit"
rm -f "${HOME}/.config/lazygit/config.yml"

echo "\\nAll old configuration files are backed up.\\n"

for file in $CONFIG_FILES;do
    target_file=`echo $file | sed "s/configs\/core\///g"`
    ln -sv "${DOTFILE_DIR}/${file}" "${HOME}/.${target_file}"
done
echo "\\nConfiguration Files are linked.\\n"

# Connect the nvim
mkdir -p "${HOME}/.config/nvim"
cp "${NVIM_CONFIG_FILE}" "${HOME}/.config/nvim/init.vim"
cp "${NVIM_MAPS_FILE}" "${HOME}/.config/nvim/maps.vim"
cp "${NVIM_PLUG_FILE}" "${HOME}/.config/nvim/plug.vim"
cp "${NVIM_MACOS_FILE}" "${HOME}/.config/nvim/macos.vim"
cp -Rv "${NVIM_LUA_DIR}" "${HOME}/.config/nvim/lua"

echo "\\nNvim configurations are linked.\\n"

# Connect alacritty
mkdir -p "${HOME}/.config/alacritty"
cp "${ALACRITTY_DIR}/alacritty.yml" "${HOME}/.config/alacritty/alacritty.yml"
cp "${ALACRITTY_DIR}/color.yml" "${HOME}/.config/alacritty/color.yml"

# Tmux
mkdir -p "${HOME}/.tmux"
cp -f "${TMUX_DIR}/tmux.conf" "${HOME}/.tmux.conf"

# Fish
cp -r "${FISH_DIR}/." "${HOME}/.config/fish/functions"
cp -R "${CONFIG_DIR}/config.fish" "${HOME}/.config/fish/config.fish"

# Lazygit
cp "${LAZYGIT_DIR}/config-dark.yml" "${HOME}/.config/lazygit/config-dark.yml"
cp "${LAZYGIT_DIR}/config-light.yml" "${HOME}/.config/lazygit/config-light.yml"

# Tmuxp
ln -s "${TMUXP_DIR}" "${HOME}/.tmuxp"
