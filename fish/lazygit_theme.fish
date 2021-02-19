function lazygit_theme --argument theme
    if ! test -f ~/Library/ApplicationSupport/jesseduffield/lazygit/config.yml
        echo "Lazygit config file doesn't exist"
        return
    end
    set -l config_path (realpath ~/Library/ApplicationSupport/jesseduffield/lazygit/config.yml)
    switch theme
        case light
            sed -i '' 's/--dark/--light/g' $config_path
        case dark
            sed -i '' 's/--light/--dark/g' $config_path
        end
end
