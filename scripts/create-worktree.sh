#!/bin/bash
# Update the Repository
echo "The Repo is being fetched..."
git fetch
# Read the worktree location
read -p "Worktree Path (Without /, base is your Home Directory): " worktree
# Get source branch from the Repository
sourceBranch=$(git branch -r | fzf --reverse)
echo "Source Branch is $sourceBranch"
#read -p "Source Branch Name: " branch
read -p "Target Branch Name: " target
# Create the worktree
$(git worktree add -b $target --checkout $HOME/$worktree $sourceBranch)
