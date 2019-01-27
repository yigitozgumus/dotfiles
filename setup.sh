dotfiles=( ".zshrc" ".gitconfig" ".bash_profile")
system=(".alias" ".functions" ".exports" ".env")
dir="${HOME}/dev/dotfiles"
dir_system="${HOME}/dev/dotfiles/system"

# Connect the first level
for dotfile in "${dotfiles[@]}";do
    ln -sf "${HOME}/${dotfile}" "${dir}"
done

# Connect the second level
for sys_file in "${system[@]}";do
    ln -sf "${HOME}/${sys_file}" "${dir_system}"
done
