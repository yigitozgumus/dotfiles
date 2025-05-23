set -x PATH /opt/homebrew/bin $PATH
# Set up PATH
set -x PATH $HOME/bin /usr/local/bin $PATH
set -x PATH /opt/homebrew/opt/go@1.21/bin $PATH
set -x PATH $PATH $HOME/.maestro/bin
set -x PATH $HOME/.local/bin $PATH

# Homebrew initialization
status --is-interactive; and source (eval (/opt/homebrew/bin/brew shellenv | string join \n))

# Set EDITOR
set -x EDITOR nvim

# Add Cargo to PATH
set -x PATH $PATH $HOME/.cargo/bin

# Go Installation
set -x GO111MODULE on

# Android SDK
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools
set -x PATH $PATH /opt/homebrew/opt/openjdk/bin
set -x PATH $PATH ~/Library/Android/sdk/build-tools/34.0.0

# XDG Config Home
set -x XDG_CONFIG_HOME "$HOME/.config"

# FZF Default Options
set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
set -x FZF_BASE '/opt/homebrew/bin/fzf'

# Local bin
set -x PATH $PATH $HOME/.local/bin

# Conda
set -x PATH $PATH $HOME/miniconda/bin

# Source additional exports if they exist
if test -e "$HOME/.exports.work"
    source "$HOME/.exports.work"
end

if test -e "$HOME/.private-env"
    source "$HOME/.private-env"
end

# OpenJDK 17
# set -x PATH $PATH /opt/homebrew/opt/openjdk@17/bin
set -x JAVA_HOME (eval /usr/libexec/java_home -v21)

# Cocoapods
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x PATH $PATH /opt/homebrew/opt/ruby/bin

# DoomEmacs
set -x PATH $PATH $HOME/.config/emacs/bin

# Fly
set -x FLYCTL_INSTALL "$HOME/.fly"
set -x PATH $PATH $FLYCTL_INSTALL/bin

# MySQL Client
set -x PATH $PATH /opt/homebrew/opt/mysql-client/bin

# Worktrees
set -x WORKSPACE_DIR "$HOME/projects/workspaces"

# Project Locations
set -x PROJECT_PATHS "$HOME/projects:$HOME/trendyol-projects"

set -x GRADLE_TASK_PROJECT_DIR $HOME/trendyol-projects/Android/anroid-phone
set -x GRADLE_RUN_TASK_INSTALLED 1

# Set GPG_TTY
set -x GPG_TTY (tty)

# Behavior settings (equivalents for `setopt`)
# Fish handles case-insensitive tab completions by default.
set -U fish_autocd true  # Automatically change directories
set -U fish_case_sensitive false

# Time shell execution (converted function)
function timefish
    set shell (string join ' ' $argv[1])
    for i in (seq 1 10)
        /usr/bin/time $shell -i -c exit
    end
end

## Functions

# Mac related Functions
function remove-dmg
    cd ~/Downloads/
    rm -rf *.dmg
    cd ~
end

function clean-trash
    cd ~/.Trash
    rm -rf *
    cd ~
end

function hide-desktop-icons
    defaults write com.apple.finder CreateDesktop false
    killall Finder
end

function show-desktop-icons
    defaults write com.apple.finder CreateDesktop true
    killall Finder
end

# Tmux session functions
function open-session
    tmx start $argv[1]
end

function update-repo
    git fetch
    git rebase
end

function stash-all
    git add .
    git stash
end

function what-runs-on
    if test "$argv[1]" = "--help"
        echo "Gets the running app info for port"
        return 0
    end
    lsof -i tcp:$argv[1]
end

function f
    if test "$argv[1]" = "--help"
        echo "Open a file in the Directory with Neovim."
        return 0
    end
    set file (fd --type f --hidden --exclude .git | fzf-tmux -p --height 40% --reverse --info inline --border --preview 'cat {}')
    if test -n "$file"
        nvim $file
    end
end

# Usage: jupy TYPE ENVIRONMENT PORT
function jupy
    set type "lab"
    set environment "root"
    set port "8888"
    if test -z "$argv[1]"
        echo "Environment name should not be empty."
        echo "jupy ENVIRONMENT TYPE(default=lab) PORT(default=8888)."
        return 0
    end
    set environment $argv[1]
    if test (count $argv) -ge 2
        set type $argv[2]
    end
    if test (count $argv) -ge 3
        set port $argv[3]
    end
    load_env $environment
    jupyter $type --no-browser --port=$port | sleep 4 | open -a /Applications/Google\ Chrome.app "http://localhost:$port"
end

# Git based functions
function get-commit-list
    if test "$argv[1]" = "--help"
        echo "Gets the commit list for the current task. Ignores others' commits and merge commits."
        echo "\tRun without any parameters: Lists your commits for the current branch."
        echo "\tPass in gitlab username: Lists target developer's commits for the current branch."
        echo "\tPass in gitlab username and branch: Lists target developer's commits for the target branch."
        return 0
    end
    set userName (git config user.name)
    set branchName (git branch --show-current)
    if test (count $argv) -ge 1
        set userName $argv[1]
    end
    if test (count $argv) -ge 2
        set branchName $argv[2]
    end
    set branchPrefix (echo $branchName | grep -Eo '^[A-Z0-9\-]+')
    git log --author=$userName --grep=$branchPrefix --oneline --no-merges
end

function get-commit-id-list
    if test "$argv[1]" = "--help"
        echo "Gets the commit id list for the current task. Ignores others' commits and merge commits."
        return 0
    end
    set commitList (get-commit-list $argv[1])
    echo $commitList | awk '{print $1}'
end

function get-reversed-commit-id-list
    if test "$argv[1]" = "--help"
        echo "Gets the reversed commit id list for the current task. Ignores others' commits and merge commits."
        return 0
    end
    set commitIDList (get-commit-id-list $argv[1])
    echo $commitIDList | awk '{ lines[NR] = $0 } END { for (i = NR; i >= 1; i--) print lines[i] }'
end

function force-ktlint
    set fileList (git diff --name-only HEAD)
    for file in $fileList
        ktlint -F $file
    end
end

function ptr
    if test "$argv[1]" = "--help"
        echo "Push the changes to the remote."
        return 0
    end
    set branch (git branch --show-current)
    git push -u origin $branch $argv
end

function gtc
    if test "$argv[1]" = "--help"
        echo "Get to the conflict with given branch or develop."
        return 0
    end
    set branchToPull "develop"
    if test -n "$argv[1]"
        set branchToPull $argv[1]
    end
    git pull origin $branchToPull
end

function cbl
    if test "$argv[1]" = "--help"
        echo "Select branch from local list and check out."
        return 0
    end
    
    # Use sed to completely remove leading whitespace, asterisks, and trailing whitespace
    set branch (git branch --color | fzf --height 40% --layout=reverse --border --ansi | sed -E 's/^[[:space:]]*\*?[[:space:]]*//' | sed -E 's/[[:space:]]*$//')
    
    if test -z "$branch"
        echo "Branch selection is empty, exiting..."
        return 0
    end
    
    echo "Checking out branch: '$branch'"
    echo $branch
    git checkout "$branch"
end

function cbr
    if test "$argv[1]" = "--help"
        echo "Select branch from remote list and check out."
        return 0
    end
    
    # Use sed to completely remove leading whitespace and trailing whitespace
    set remote_branch (git branch -r --color | fzf --height 40% --layout=reverse --border --ansi | sed -E 's/^[[:space:]]*//' | sed -E 's/[[:space:]]*$//')
    
    if test -z "$remote_branch"
        echo "Branch selection is empty, exiting..."
        return 0
    end
    
    echo "Checking out remote branch: '$remote_branch'"
    echo $remote_branch
    git checkout --track "$remote_branch"
end

function rebase
    git rebase -i @~$argv[1]
end

function change
    git add .
    git commit --amend
end

function step-forward
    git rebase --continue
end

function ctlv
    change_to_local_version $argv
end

function cdtp
    if test "$argv[1]" = "--help"
        echo "Usage: cdtp"
        echo "Navigate to your project folder from defined PROJECT_PATHS."
        echo "Define PROJECT_PATHS as a colon-separated list of directories to scan."
        return 0
    end

    # Ensure PROJECT_PATHS is defined
    if test -z "$PROJECT_PATHS"
        echo "Error: PROJECT_PATHS is not defined. Please set it in your shell configuration."
        return 1
    end

    # Gather all subdirectories from the paths in PROJECT_PATHS
    set folders (string split : "$PROJECT_PATHS" | xargs -I{} find {} -mindepth 2 -maxdepth 2 -type d ! -name ".*" 2>/dev/null)

    # Ensure there are folders to search
    if test -z "$folders"
        echo "No project folders found in the defined PROJECT_PATHS."
        return 1
    end

    # Map full paths to their basenames
    set selections
    for folder in $folders
        set basename (basename "$folder")
        # echo "Adding: $basename | ($folder"  # Debugging print
        set selections $selections "$basename -> ($folder)"
    end

    # Use fzf to select a directory based on its basename
    set selected (for line in $selections; echo $line; end | fzf --prompt="Select a project: " --height=40% | sed -E 's/.*-> \((.*)\)/\1/' | string trim)
    # Handle no selection
    if test -z "$selected"
        echo "No project selected."
        return 1
    end

    # Navigate to the selected folder
    cd $selected
    echo "Navigated to ($selected)"
end
## Work Functions

# Colors
set -g COLOR_GRAY (set_color  243)  # Bright gray
set -g COLOR_BLUE (set_color blue)             # Blue
set -g COLOR_GREEN (set_color green)           # Green
set -g COLOR_RED (set_color red)               # Red
set -g COLOR_PURPLE (set_color magenta)        # Purple/Magenta
set -g COLOR_YELLOW (set_color yellow)         # Yellow
set -g COLOR_NONE (set_color normal)           # Reset to default

# Print title
function title-echo
    echo
    echo -n $COLOR_PURPLE
    echo -n $argv[1]
    echo $COLOR_NONE
    echo -n $COLOR_GRAY
    echo "=============================="
    echo $COLOR_NONE
end

# Print command name
function command-echo
    echo -n $COLOR_YELLOW
    echo -n "Command: "
    echo -n $COLOR_GREEN
    echo -n $argv[1]
    echo $COLOR_NONE
end

# Print info
function info-echo
    echo -n $COLOR_BLUE
    echo -n "Info: "
    echo -n $COLOR_NONE
    echo $argv[1]
end

# SFX info
function sfx-info
    sfx info --tr tmcpdp --te mproductdetail $argv
end

# List commands
function command-list
    title-echo "Feature Related Commands"

    command-echo "get-commit-list"
    info-echo "Get your commit list in the feature branch"
    command-echo "get-commit-id-list"
    info-echo "Get your commit ID list in the feature branch"
    command-echo "get-reversed-commit-id-list"
    info-echo "Get your reversed commit ID list in the feature branch"

    title-echo "Workflow Related Commands:"

    command-echo "open-mr"
    info-echo "Push to Remote and open MR link in your default browser"
    command-echo "ptr"
    info-echo "Push to Remote"
    command-echo "gtc"
    info-echo "Get to Conflict"
    command-echo "cbl"
    info-echo "Change Branch Local"
    command-echo "cbr"
    info-echo "Change Branch Remote"
    command-echo "kpop"
    info-echo "Kill Process on Port"
    command-echo "update-repo"
    info-echo "Fetch the Latest Changes"

    title-echo "Navigation Related Commands:"

    command-echo "cdtp"
    info-echo "Change Directory to Project"
    command-echo "op"
    info-echo "Open Project in IDE"
end

# Git commands
function get-commit-list
    if test "$argv[1]" = "--help"
        echo "Gets the commit list for the current task. Ignores others' commits and merge commits"
        echo "Run without any parameters: Lists your commits for the current branch you are in."
        echo "Pass in GitLab username: Lists target developer's commits for the current branch."
        echo "Pass in GitLab username and branch: Lists target developer's commits for the target branch."
        return 0
    end
    set userName (git config user.name)
    set branchName (git branch --show-current)
    if test (count $argv) -eq 1
        set userName $argv[1]
    end
    if test (count $argv) -eq 2
        set userName $argv[1]
        set branchName $argv[2]
    end
    set branchPrefix (echo $branchName | grep -Eo '^[A-Z0-9\-]+')
    git log --author=$userName --grep=$branchPrefix --oneline --no-merges
end

function get-commit-id-list
    if test "$argv[1]" = "--help"
        echo "Gets the commit ID list for the current task. Ignores others' commits and merge commits."
        return 0
    end
    set commitList (get-commit-list $argv[1])
    echo $commitList | awk '{print $1}'
end

function get-reversed-commit-id-list
    if test "$argv[1]" = "--help"
        echo "Gets the reversed commit ID list for the current task. Ignores others' commits and merge commits."
        return 0
    end
    set commitIDList (get-commit-id-list $argv[1])
    echo $commitIDList | awk '{ lines[NR] = $0 } END { for (i = NR; i >= 1; i--) print lines[i] }'
end

# Workflow functions
function ptr
    if test "$argv[1]" = "--help"
        echo "Push the changes to the remote."
        return 0
    end
    set branch (git branch --show-current)
    git push -u origin $branch
end

function open-mr
    if test "$argv[1]" = "--help"
        echo "Push the changes to the remote and opens the MR page on your default browser."
        return 0
    end
    set branch (git branch --show-current)
    set output (git push -u origin $branch)
    echo $output | grep -o "https:[^ ]*" | xargs open -u
end

function gtc
    if test "$argv[1]" = "--help"
        echo "Get to the conflict with the given branch or develop."
        return 0
    end
    set branchToPull "develop"
    if test -n "$argv[1]"
        set branchToPull $argv[1]
    end
    git pull origin $branchToPull
end

function kpop
    set port $argv[1]
    set pid (lsof -i tcp:$port -t)
    if test -z "$pid"
        echo "No process found listening on port $port"
        return 1
    else
        echo "Killing process with PID $pid on port $port"
        kill $pid
    end
end

function update-repo
    git fetch
    git rebase
end

# Open project in IDE
function op
    if test "$argv[1]" = "--help"
        echo "Open project with a designated IDE."
        return 0
    end
    if test -f "settings.gradle" -o -f "settings.gradle.kts"
        set choices "Stable\nBeta\nCanary"
        set choice (echo -e $choices | fzf)
        switch $choice
            case "Stable"
                echo "Opening Android Project with Android Stable"
                studio-stable .
            case "Beta"
                echo "Opening Android Project with Android Beta"
                studio-beta .
            case "Canary"
                echo "Opening Android Project with Android Canary"
                studio-canary .
            case '*'
                echo "Not a valid choice. Exiting..."
        end
    else if test -d "Trendyol_v2"
        cd "Trendyol_v2"
        set choices "Stable\nBeta\nCanary"
        set choice (echo -e $choices | fzf)
        switch $choice
            case "Stable"
                echo "Opening Trendyol Android Project with Android Stable"
                studio-stable .
            case "Beta"
                echo "Opening Trendyol Android Project with Android Beta"
                studio-beta .
            case "Canary"
                echo "Opening Trendyol Android Project with Android Canary"
                studio-canary .
            case '*'
                echo "Not a valid choice. Exiting..."
        end
        cd ..
    else
        echo "Opening with Visual Studio Code"
        code .
    end
end

if status is-interactive


    # General
    abbr please 'sudo'
    # abbr v 'fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'
    abbr r 'ranger'
    abbr ranger 'ranger --choosedir=$HOME/.rangerdir; set LASTDIR (cat $HOME/.rangerdir); cd "$LASTDIR"'
    abbr lg 'lazygit'
    abbr ldo 'lazydocker'
    abbr lse 'exa -lhi'
    abbr lvim '~/.local/bin/lvim'
    abbr ll 'exa -lhi'
    abbr vim 'nvim --listen /tmp/nvimsocket'
    abbr rm 'trash'
    abbr emulator "$HOME/Library/Android/sdk/emulator/emulator"

    # Vim
    abbr uv 'nvim ~/projects/personal/dotfiles'
    abbr nvd 'neovide'
    abbr rgt 'run-gradle-task'

    # Command Shortcuts
    abbr tt 'tmux attach -t'
    abbr ttt 'tmux new-session -s'

    function tls
        set target (tmux ls -F "#{session_name}" | fzf-tmux -p --reverse)
        tmux attach -t $target
    end

    abbr tmx 'tmuxinator'
    abbr tkill 'tmux kill-session -t'

    # Configuration
    abbr A 'nvim ~/.alias'
    abbr F 'nvim ~/.functions'
    abbr E 'nvim ~/.exports'
    abbr Z 'nvim ~/.zshrc'
    abbr vim-config 'dotfiles; cd configs/nvim; vim'

    # Shortcuts
    abbr slive 'bundle exec jekyll serve'
    abbr ccd 'cd; exa -i'
    abbr dev 'cd ~/Projects'
    abbr demos 'cd ~/Desktop'

    # Obsidian Vaults
    abbr vault-work 'cd ~/Documents/Notes/Work'
    abbr notes 'cd ~/Documents/Notes/Personal'
    abbr review-notes 'vim $HOME/Documents/Notes/Personal/00-Captures/*.md'
    abbr tasks-repo 'cd ~/Documents/Tasks/task-tracking/'

    # Dev Shortcuts / Personal
    abbr dotfiles 'cd ~/projects/personal/dotfiles'
    abbr android 'cd ~/projects/android'
    abbr notebooks 'cd ~/projects/notebooks'
    abbr see-git-config 'vim ~/.gitconfig'

    # Rust related
    function nrp
        cargo new $argv[1]
        cd $argv[1]
        nvim
    end

    # Work
    abbr activate-doc 'source /Users/yigit.ozgumus/mkdocs/bin/activate'
    abbr demoOn 'sh /Users/(whoami)/.local/bin/adb-demo.sh on'
    abbr demoOff 'sh /Users/(whoami)/.local/bin/adb-demo.sh off'

    abbr wip 'git add -A && git commit -m "WIP" --no-verify'
    abbr btw 'git reset --soft HEAD^' # back to work

    abbr cout 'git branch | fzf | xargs git checkout'
    abbr coutr 'git branch -r | fzf | xargs git checkout'

    # Android Aliases
    abbr screen 'scrcpy --stay-awake --encoder OMX.google.h264.encoder -m 1024 --window-title Android --window-height 800'
    abbr startApp 'adb shell am start -n trendyol.com.stage/com.trendyol.common.splash.impl.ui.SplashActivity'

    # Gradle Aliases
    abbr gw './gradlew $argv'

    # Python
    function select-env
        set target (conda env list | awk '/^[a-z]/ {print $1}' | fzf-tmux -p --reverse)
        conda activate $target
    end

    # Taskwarrior (Uncomment if needed)
    # function tw
    #     ln -sf "$HOME/.taskrc-work" "$HOME/.taskrc"
    #     task $argv
    # end

    # function tp
    #     ln -sf "$HOME/.taskrc-personal" "$HOME/.taskrc"
    #     task $argv
    # end

    abbr tasks-location 'cd $HOME/Documents/Tasks/task-tracking'
    abbr maestro-test '~/projects/personal/maestro/maestro-cli/build/install/maestro/bin/maestro'

    # Atuin initialization
    atuin init fish | source

    # Zoxide initialization
    zoxide init fish | source
end

function build_and_install_debug
    # Check for arguments
    if test (count $argv) -gt 0
        set arg $argv[1]
        set selected_task ""
        
        if test "$arg" = "pdp"
            set selected_task ":trendyol:pdp:app:assembleDebug"
        else if test "$arg" = "full"
            # Show selector as before
            set options "app:assembleDebug" ":trendyol:pdp:app:assembleDebug"
            set selected_task (printf "%s\n" $options | fzf --prompt="Select build task > ")
        else
            # Assume direct task name
            set selected_task $arg
        end
    else
        # No arguments - show selector as before
        set options "app:assembleDebug" ":trendyol:pdp:app:assembleDebug"
        set selected_task (printf "%s\n" $options | fzf --prompt="Select build task > ")
    end
    
    if test -z "$selected_task"
        echo "❌ No task selected. Exiting."
        return
    end

    echo "🏗️  Running: ./gradlew $selected_task ..."
    ./gradlew $selected_task --warning-mode=none --quiet

    # Step 2: Find the APK
    echo "🔍 Searching for APK..."
    set apk_dir app/build/outputs/apk/debug
    if string match -r ":trendyol:pdp:app.*" "$selected_task"
        set apk_dir trendyol/pdp/app/build/outputs/apk/debug
    end

    set apk_path (find $apk_dir -name "*.apk" | head -n 1)

    if test -f "$apk_path"
        echo "✅ APK found: $apk_path"
        echo "📦 Installing on emulator..."
        adb install -r "$apk_path"

        if test $status -eq 0
            echo "✅ APK installed successfully!"
        else
            echo "❌ APK installation failed."
        end
    else
        echo "❌ No APK found under $apk_dir"
    end
end

set -Ux PATH /opt/homebrew/opt/python@3.11/bin $PATH
