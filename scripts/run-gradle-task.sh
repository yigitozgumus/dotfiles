#!/bin/bash

currentLocation=$(pwd)
projectFolder="Trendyol_v2/"

if [ -z "$GRADLE_RUN_TASK_INSTALLED" ]; then
	echo "Hello! Installing required dependencies..."
	if [ -z "$GRADLE_TASK_PROJECT_DIR" ]; then
		echo "Setting up Project Location for later use"
		echo "Please type in the project location starting with '\$HOME'"
		read -p "Project Location: " tempLocation
		echo "export GRADLE_TASK_PROJECT_DIR=$tempLocation" >>~/.zshrc
		echo "Saved the project directory. ✅"
	fi

	echo "Checking if Homebrew is installed"
	if command -v brew &>/dev/null; then
		echo "HomeBrew is installed ✅"
	else
		echo "Installing HomeBrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		echo "HomeBrew is installed ✅"
	fi

	echo "Checking if FZF is installed"
	if command -v fzf &>/dev/null; then
		echo "FZF is installed ✅"
	else
		echo "Installing FZF..."
		brew install fzf
		echo "FZF is installed ✅"
	fi

	echo "Setup is completed."
	echo "export GRADLE_RUN_TASK_INSTALLED=1" >>~/.zshrc
	echo "run source ~/.zshrc and run this command again"
	exit 1
fi

cd $GRADLE_TASK_PROJECT_DIR
echo "Current directory is $GRADLE_TASK_PROJECT_DIR"
echo "Select the module to work on"

#
# Add folder exceptions here
#

moduleChoice=$(find Trendyol_v2 -mindepth 1 -maxdepth 8 -type d \( \
	-path '*/build' \
	-o -path '*/build/*' \
	-o -path '*/src/*' \
	-o -path '*/src' \
	-o -path '*/.idea' \
	-o -path '*/api' \
	-o -path '*/impl' \
	-o -path '*/gradle' \
	-o -path '*/.gradle' \
	-o -path '*/buildSrc' \
	-o -path '*/configs' \
	-o -path '*/scripts' \
	-o -path '*/.cxx' \
	\) -prune -o -type d -print | fzf --height 40% --layout=reverse --border)

if [ -z $moduleChoice ]; then
	echo "You didn't choose a module."
	exit 1
fi

subModuleChoice=""
choice=""
subModuleList=""
newLine=""

if [ -d "$moduleChoice/api" ]; then
	if [ -n "$subModuleList" ]; then
		newLine="\n"
	fi
	subModuleList="${subModuleList}${newLine}api"
fi

if [ -d "$moduleChoice/impl" ]; then
	if [ -n "$subModuleList" ]; then
		newLine="\n"
	fi
	subModuleList="${subModuleList}${newLine}impl"
fi

if [ -d "$moduleChoice/testing" ]; then
	if [ -n "$subModuleList" ]; then
		newLine="\n"
	fi
	subModuleList="${subModuleList}${newLine}testing"
fi

if [ -n "$subModuleList" ]; then

	echo "Select a submodule:"
	subModuleChoice=$(echo -e $subModuleList | fzf --height 40% --layout=reverse --border)
	if [ -z $subModuleChoice ]; then
		echo "You didn't choose a subModule."
	fi
fi

if [ -z $subModuleChoice ]; then
	choice=$moduleChoice
else
	choice="$moduleChoice/$subModuleChoice"
fi

sanitizedChoice=${choice//$projectFolder/":"}
sanitizedChoice=$(echo $sanitizedChoice | sed "s/\//:/g")

echo "Select a Gradle Task to run:"
#
# Add related commands here
#
selectedCommand=$(echo -e "detektBaseline\n\
detektBaselineDebug\n\
testDebugUnitTest\n\
assertDependencyBreaches\n\
detektDebug\n\
detektKts\n\
assembleDebug\n\
checkPropertyFile\n\
packageDebugAndroidTest" | fzf --height 40% --layout=reverse --border)

if [ -z $selectedCommand ]; then
	echo "You didn't choose a command."
	exit 1
fi

cd $projectFolder

commandToRun="$sanitizedChoice:$selectedCommand"
echo "Running $commandToRun"
echo "./gradlew $commandToRun" | pbcopy
echo "Command is copied to your clipboard."

./gradlew $commandToRun

cd $currentLocation
