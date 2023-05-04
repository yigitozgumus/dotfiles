function lazygit_theme --argument theme
    if ! test -f ~/.config/lazygit/config.yml
        echo "Lazygit config file doesn't exist"
        return
    end
    set -l config "$argv[1]"
    switch $config
      case dark
        cp -r ~/personal/dotfiles/configs/lazygit/config-dark.yml ~/.config/lazygit/config.yml
      case light
        cp -r ~/personal/dotfiles/configs/lazygit/config-light.yml ~/.config/lazygit/config.yml
      end

end
