function lazygit_theme --argument theme
    if ! test -f ~/Library/ApplicationSupport/jesseduffield/lazygit/config.yml
        echo "Lazygit config file doesn't exist"
        return
    end
    set -l config_path (~/Library/ApplicationSupport/jesseduffield/lazygit/config.yml)
    echo $config_path
    switch theme
      case light
        sed   "s/--dark/--light/g" $config_path
      case dark
        sed   "s/--light/--dark/g" $config_path
    end
end
