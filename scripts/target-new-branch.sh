#!/bin/bash

# Update the Repository
git fetch

echo "What will be the source branch?"
sourceBranch=$(git branch -r | fzf --reverse)

if [ -z $sourceBranch ]; then
	echo "Input is empty, exiting..."
	exit 1
fi

# Read targetBranch
read -p "What is the target branch's name?: " targetBranch

if [ -z $targetBranch ]; then
	echo "Input is empty, exiting..."
	exit 1
fi

# Get Commit list

userName=$(git config user.name)
branchName=$(git branch --show-current)
branchPrefix=$(echo $branchName | grep -Eo '^[A-Z0-9\-]+')
commitList=$(git log --author=$userName --grep=$branchPrefix --oneline --no-merges)

# Get commit list inside the branch
commitIDList=$(echo $commitList | awk '{print $1}' | awk '{ lines[NR] = $0 } END { for (i = NR; i >= 1; i--) print lines[i] }  ')

currentBranch=$(git branch --show-current)

git checkout $sourceBranch
git checkout -b $targetBranch
for commit in $commitIDList; do
	if [ -n "$commit" ]; then
		git cherry-pick $commit
	fi
done
