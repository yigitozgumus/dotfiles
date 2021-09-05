#!/bin/sh
# Declarations
DOTFILE_DIR=$(pwd)
CONFIG_DIR="configs"
CORE="$DOTFILE_DIR/$CONFIG_DIR/core"
ALACRITTY_DIR="$DOTFILE_DIR/$CONFIG_DIR/alacritty"
TMUX_DIR="$DOTFILE_DIR/$CONFIG_DIR/tmux"
FISH_DIR="$DOTFILE_DIR/$CONFIG_DIR/fish"
LAZYGIT_DIR="$DOTFILE_DIR/$CONFIG_DIR/lazygit"
STARSHIP_DIR="$DOTFILE_DIR/$CONFIG_DIR/starship"
# Get the configuration files
CONFIG_FILES=$(find $CONFIG_DIR/core -type f)

NVIM_CONFIG_FILE="${CORE}/vimrc"

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
    #echo "${HOME}/.${file}"
done

#Nvim
mv "${HOME}/.config/nvim/init.vim" "${HOME}/.backup"

#Alacritty
mv "${HOME}/.config/alacritty" "${HOME}/.backup"

#Tmux
rm -f "${HOME}/.tmux.conf"
rm -f "${HOME}/.tmux/tmux-dark.conf"
rm -f "${HOME}/.tmux/tmux-light.conf"

#Lazygit
mkdir -p "${HOME}/.config/lazygit"
rm -f "${HOME}/.config/lazygit/config.yml"

#Starship
mv "${HOME}/.config/starship.toml" "${HOME}/.backup"

echo "\\nAll old configuration files are backed up.\\n"

for file in $CONFIG_FILES;do
    target_file=`echo $file | sed "s/configs\/core\///g"`
    ln -sv "${DOTFILE_DIR}/${file}" "${HOME}/.${target_file}"
    #echo "${DOTFILE_DIR}/$file"
    #echo $file
done
echo "\\nConfiguration Files are linked.\\n"

# Connect the nvim
mkdir -p "${HOME}/.config/nvim"
cp "${NVIM_CONFIG_FILE}" "${HOME}/.config/nvim/init.vim"
echo "\\nNvim configurations are linked.\\n"

# Connect alacritty
mkdir -p "${HOME}/.config/alacritty"
cp "${ALACRITTY_DIR}/alacritty.yml" "${HOME}/.config/alacritty/alacritty.yml"
cp "${ALACRITTY_DIR}/color.yml" "${HOME}/.config/alacritty/color.yml"

# Tmux
mkdir -p "${HOME}/.tmux"
ln -s "${TMUX_DIR}/tmux-dark.conf" "${HOME}/.tmux"
ln -s "${TMUX_DIR}/tmux-light.conf" "${HOME}/.tmux"
cp -f "${TMUX_DIR}/tmux.conf" "${HOME}/.tmux.conf"

# Fish
cp -r "${FISH_DIR}/." "${HOME}/.config/fish/functions"
cp -R "${CONFIG_DIR}/config.fish" "${HOME}/.config/fish/config.fish"

# Lazygit
cp "${LAZYGIT_DIR}/config-dark.yml" "${HOME}/.config/lazygit/config-dark.yml"
cp "${LAZYGIT_DIR}/config-light.yml" "${HOME}/.config/lazygit/config-light.yml"

# Starship
ln -sv "${STARSHIP_DIR}/starship.toml" "${HOME}/.config/starship.toml"
