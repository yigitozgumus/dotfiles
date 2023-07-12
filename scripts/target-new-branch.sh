#!/bin/bash

# Update the Repository
echo "Fetching the latest version..."
git fetch --quiet

echo "What will be the new upstream?"
newUpstream=$(git branch -r | fzf --reverse)

if [ -z $newUpstream ]; then
	echo "Input is empty, exiting..."
	exit 1
fi

echo "New Upstream is $newUpstream"

# Get current branch
branchName=$(git branch --show-current)

echo "What is the current upstream?"
currentUpstream=$(git branch -r | fzf --reverse)

if [ -z $currentUpstream ]; then
	echo "Input is empty, exiting..."
	exit 1
fi

echo "Current Upstream is $currentUpstream"

targetBranch="${branchName}-RC"
echo "New target branch is $targetBranch"

# Get Commit list

userName=$(git config user.name)
branchPrefix=$(echo $branchName | grep -Eo '^[A-Z0-9\-]+')
commitList=$(git log --author="$userName" --grep="$branchPrefix" --oneline --no-merges)

git checkout $currentUpstream
git checkout -b $targetBranch

echo "I created $targetBranch from $currentUpstream"

# Get commit list inside the branch
commitIDList=$(echo "$commitList" | awk '{print $1}' | awk '{ lines[NR] = $0 } END { for (i = NR; i >= 1; i--) print lines[i] } ')

for commit in $commitIDList; do
	if [ -n "$commit" ]; then
		git cherry-pick $commit
	fi
done

echo "Commits are applied."

echo "Rebase operation is started."
git rebase --onto $newUpstream $currentUpstream $targetBranch
