#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title sync work
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer tools

# @Documentation:
# @raycast.description syncs work vault
# @raycast.author Yigit Ozgumus
# @raycast.authorURL www.twitter.com/yigitozgumus

cd "$HOME/Google Drive/notes/"
./obsidian_sync_work.sh
