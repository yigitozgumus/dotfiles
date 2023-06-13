#!/bin/bash

if ! command -v fzf &>/dev/null; then
	echo "fzf is not found on your system. install it using \033[0;31m brew install fzf"
	exit 1
fi

# Update the Repository
echo "The Repo is being fetched..."
git fetch
# Read the worktree location
read -p "Worktree Path (Without /, base is your Home Directory): " worktree

if [ -z $worktree ]; then
	echo "Input is empty, exiting..."
	exit 1
fi
# Get source branch from the Repository
echo "What will be the source branch?"
sourceBranch=$(git branch -r | fzf --reverse)
if [ -z $sourceBranch ]; then
	echo "Input is empty, exiting..."
	exit 1
fi
echo "Source Branch is $sourceBranch"
#read -p "Source Branch Name: " branch
read -p "Target Branch Name: " target

if [ -z $target ]; then
	echo "Input is empty, exiting..."
	exit 1
fi
# Create the worktree
$(git worktree add -b $target --checkout $HOME/$worktree $sourceBranch)
