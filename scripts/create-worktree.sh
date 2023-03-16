#!/bin/bash
read -p "Worktree Path (Without /, base is your Home Directory): " worktree
read -p "Source Branch Name: " branch
read -p "Target Branch Name: " target
$(git worktree add -b $target --checkout $HOME/$worktree $branch)
