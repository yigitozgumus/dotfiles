# Defined in - @ line 1
function tt --wraps='tmux new-session -s' --description 'alias tt=tmux new-session -s'
  tmux new-session -s $argv;
end
