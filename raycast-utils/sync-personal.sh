#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title sync personal
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 💾
# @raycast.packageName Developer tools

# @Documentation:
# @raycast.description syncs personal vault
# @raycast.author Yigit Ozgumus
# @raycast.authorURL www.twitter.com/yigitozgumus

cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
./obsidian_refresh.sh
./obsidian_sync_personal.sh
