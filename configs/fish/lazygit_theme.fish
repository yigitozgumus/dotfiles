function lazygit_theme --argument theme
    if ! test -f ~/Library/Application\ Support/lazygit/config.yml
        echo "Lazygit config file doesn't exist"
        return
    end
    rm -f ~/Library/Application\ Support/lazygit/config.yml
    set -l config "$argv[1]"
    switch $config
      case dark
        cp -r ~/.config/lazygit/config-dark.yml ~/Library/Application\ Support/lazygit/config.yml
      case light
        cp -r ~/.config/lazygit/config-light.yml ~/Library/Application\ Support/lazygit/config.yml
      end

end
