#!/bin/bash
#

if [ -z "$WORKSPACE_DIR" ]; then
	echo "Workspace Dir value is empty. Set using export WORKSPACE_DIR=<target-dir>"
	exit 1
fi

if ! command -v fzf &>/dev/null; then
	echo -e "fzf is not found on your system. install it using \033[0;31m brew install fzf"
	exit 1
fi

# Update the Repository
echo "The Repo is being fetched..."
git fetch -q
# Read the worktree location
read -p "Worktree Path (Without /, base is $WORKSPACE_DIR): " worktree

if [ -z $worktree ]; then
	echo "Input is empty, exiting..."
	exit 1
fi
# Decide on branch type
echo "Branch Type:"
types="Local\nRemote"
branchType=$(echo -e $types | fzf)
# Get source branch from the Repository
sourceBranch=""
case "$branchType" in
"Local")
	echo "What will be the source branch?"
	echo "Listing local branches:"
	sourceBranch=$(git branch | fzf --reverse)
	;;
"Remote")
	echo "What will be the source branch?"
	echo "Listing remote branches:"
	sourceBranch=$(git branch -r | fzf --reverse)
	;;
*)
	echo "Invalid Choice. exiting..."
	exit 1
	;;

esac
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
git worktree add -b $target $WORKSPACE_DIR/$worktree $sourceBranch
