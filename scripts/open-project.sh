#!/bin/bash

target=$(find ~/work ~/work/workspaces ~personal -maxdepth 1 | fzf-tmux --reverse --border)
if [ -z $target ]; then
	echo "Nothing is selected. Bye"
	exit 1
fi
if [ -d "$target/Trendyol_V2" ]; then
	echo "Opening Android Project..."
	studio-stable "$target/Trendyol_V2"
	exit 1
fi
echo "No Trendyol Project. Opening..."
studio-stable $target
