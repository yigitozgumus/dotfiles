#!/bin/zsh

if [ -z "$1" ]; then
  echo "Error: A file name must be set, e.g. on \"the wonderful thing about tiggers\"."
  exit 1
fi

file_name=$(echo "$1" | tr ' ' ' ')
# $(date "+%Y-%m-%d")_
formatted_file_name=${file_name}.md
cd "$HOME/Documents/Notes/Personal" || exit
touch "📬 Inbox/${formatted_file_name}"
nvim "📬 Inbox/${formatted_file_name}"
