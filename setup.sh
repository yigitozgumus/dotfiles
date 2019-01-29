dotfiles=(  ".gitconfig" ".bash_profile")
system=(".alias" ".functions" ".exports" ".env")
dir="${HOME}/dev/dotfiles"
dir_system="${HOME}/dev/dotfiles/system"

# Connect the first level
for dotfile in "${dotfiles[@]}";do
    ln -sv "${dir}/${dotfile}" "${HOME}"
done

# Connect the second level
for sys_file in "${system[@]}";do
    ln -sv "${dir_system}/${sys_file}" "${HOME}"
done
