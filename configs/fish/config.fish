if status is-interactive
    #
    # Aliases
    #

    #
    # Abbreviations
    #

    # Copy and paste to the clipboard by piping to these commands.
    # (Inspired by the default behaviour in macOS.)
    abbr --add --global pbcopy 'xsel --clipboard --input'
    abbr --add --global pbpaste 'xsel --clipboard --output'

    # Open files in their associated apps from Terminal.
    abbr --add --global open 'xdg-open &>/dev/null '

    # Git aliases to make git a bit more humane for everyday use.
    abbr --add --global git-log 'git log --graph --decorate --pretty=oneline --abbrev-commit'
    abbr --add --global git-log-dates 'git log --graph --decorate --pretty=format:"%h [%cr] %s'
    abbr --add --global git-tag 'git tag -n'
    abbr --add --global git-undo-last-commit 'git reset HEAD~'

    # Aliases for getting system and app information.
    abbr --add --global system-information neofetch
    abbr --add --global disk-usage dust
    abbr --add --global which-kernel 'apt-cache policy linux-generic'
    abbr --add --global node-v8-version 'node -p process.versions.v8'

    # Make rm a little safer (have it prompt once when deleting
    # more than three files or when deleting recursively).
    abbr --add --global rm 'rm -I'

    # A nicer ls that also shows the git status of files
    abbr --add --global l 'exa -lh --git --all'

    # A nicer ls that also shows the git status of files
    # (but not hidden files)
    abbr --add --global ll 'exa -lh --git'

    # Same nicer ls but in tree view.
    abbr --add --global lt 'exa -lh --git --all --tree'

    # lc = line count
    abbr --add --global lc 'wc -l'

    # Find out what’s running on port X
    abbr --add --global port 'lsof -i'

    # Better find
    abbr --add --global find fd

    # Better ps
    abbr --add --global ps procs

    # Package.json validator
    abbr --add --global validate-package.json 'pjv package.json'

    # Use ripgrep instead of grep
    abbr --add --global grep rg
end

set -x PATH /opt/homebrew/bin $PATH