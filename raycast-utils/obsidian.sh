#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title obsidian
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🗄
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }
# @raycast.packageName Developer Tools

# @Documentation:
# @raycast.author Yigit Ozgumus
# @raycast.authorURL www.twitter.com/yigitozgumus

OBSIDIAN_PATH="$HOME/Google Drive/notes"
OBSIDIAN="obsidian://open?vault="

WORK="${OBSIDIAN}commencis"
PERSONAL="${OBSIDIAN}secondBrain"

if ! pgrep Obsidian >/dev/null; then
  open -a 'Obsidian'
  sleep 1
fi

if [ $1 == "work" ]; then
  open $WORK
elif [ $1 == "personal" ]; then
  open $PERSONAL
fi

echo "$1 vault is opened"
