function cb --argument mode_setting
  # change background to the given mode. If mode is missing,
  # we try to deduct it from the system settings.

  set -l mode "light" # default value
  if test -z $mode_setting
    set -l val (defaults read -g AppleInterfaceStyle) >/dev/null
    if test $status -eq 0
      set mode "dark"
    end
  else
    switch $mode_setting
      case light
        osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false" >/dev/null
        set mode "light"
      case dark
        osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true" >/dev/null
        set mode "dark"
    end
  end

  for tms in  (/opt/homebrew/bin/tmux list-sessions -F '#{session_name}')
    for wix in (/opt/homebrew/bin/tmux list-windows -t $tms -F "$tms:#{window_index}")
      for pix in (/opt/homebrew/bin/tmux list-panes -F "$tms:#{window_index}.#{pane_index}" -t $wix)
        set -l is_vim "ps -o state= -o comm= -t '#{pane_tty}'  | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?\$'"
        /opt/homebrew/bin/tmux if-shell -t "$pix" "$is_vim" "send-keys -t $pix escape ENTER"
        /opt/homebrew/bin/tmux if-shell -t "$pix" "$is_vim" "send-keys -t $pix ':call ChangeBackground()' ENTER"
      end
    end
  end

  # change alacritty
  switch $mode
    case dark
      alacritty-theme gruvbox_dark
    case light
      alacritty-theme gruvbox_light
  end

  # change lazygit
  switch $mode
    case dark
      lazygit_theme dark
    case light
      lazygit_theme light
  end
end
