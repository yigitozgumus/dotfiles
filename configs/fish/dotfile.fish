# Defined in - @ line 1
function dotfile --wraps='cd ~/cs/dev/dotfiles; ' --description 'alias dotfile=cd ~/cs/dev/dotfiles; '
  cd ~/cs/dev/dotfiles;  $argv;
end
