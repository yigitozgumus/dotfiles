dotfiles=(
    ".vimrc"
    ".gitconfig"
    ".chunkvmrc"
    ".skhdrc"
    ".bash_profile")
system=(
    ".alias"
    ".functions"
    ".exports"
    ".env")
dir="${HOME}/dev/dotfiles"
dir_system="${HOME}/dev/dotfiles/system"

#Get rid of the stock files
mkdir -p "${HOME}/.backup"
for dotfile in "${dotfiles[0]}";do
    mv "${HOME}/${dotfile}" "${HOME}/.backup"
done
# Connect the first level
for dotfile in "${dotfiles[@]}";do
    ln -sv "${dir}/${dotfile}" "${HOME}"
done

# Connect the second level
for sys_file in "${system[@]}";do
    ln -sv "${dir_system}/${sys_file}" "${HOME}"
done

# Connect the nvim
ln -sv "${dir}/init.vim" "${HOME}/.config/nvim"
