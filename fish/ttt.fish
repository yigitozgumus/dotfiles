# Defined in - @ line 1
function ttt --wraps='tmux new-session -s' --description 'alias ttt=tmux new-session -s'
  tmux new-session -s $argv;
end
