function send_to_review
  set -l branch (git branch --show-current)
  git push origin HEAD:refs/for/$branch
end
