#!/bin/sh

# Colors
DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

# Prompts

title() {
    echo "\n${COLOR_PURPLE}$1${COLOR_NONE}"
    echo  "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

error() {
    echo  "${COLOR_RED}Error: ${COLOR_NONE}$1"
    exit 1
}

warning() {
    echo  "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
}

info() {
    echo  "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
}

success() {
    echo  "${COLOR_GREEN}$1${COLOR_NONE}"
}

blank_line() {
  echo ""
}

get_linkables() {
    find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'
}

# clean

clean() {

    warning "Removing setup..."

    for file in $(get_linkables); do
        filename=".$(basename "$file" '.symlink')"
        target="$HOME/$filename"
        info "Deleting $filename from the setup..."
        rm "$target"
    done

    for filename in "$HOME/.config/fish" "$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc" "$HOME/.config/alacritty" "$HOME/.config/kitty"; do
        info "Deleting $filename from the setup..."
        rm -rf "$filename"
    done
}

# backup

backup() {
    BACKUP_DIR=$HOME/.backup
    echo "Creating backup directory at $BACKUP_DIR"
    rm -rf "$BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"

    for file in $(get_linkables); do
        filename=".$(basename "$file" '.symlink')"
        target="$HOME/$filename"
        if [ -f "$target" ]; then
            echo "backing up $filename"
            cp "$target" "$BACKUP_DIR"
        else
            warning "$filename does not exist at this location or is a symlink"
        fi
    done

    for filename in "$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc"; do
        if [ ! -L "$filename" ]; then
            echo "backing up $filename"
            cp -rf "$filename" "$BACKUP_DIR"
        else
            warning "$filename does not exist at this location or is a symlink"
        fi
    done
}

# Symlink setup

setup_symlinks() {
    title "Creating symlinks"

    for file in $(get_linkables); do
        target="$HOME/.$(basename "$file" '.symlink')"
        if [ -e "$target" ]; then
            info "~${target#$HOME} already exists... Skipping."
        else
            info "Creating symlink for $file"
            ln -s "$file" "$target"
        fi
    done

    echo ""
    info "installing to ~/.config"
    if [ ! -d "$HOME/.config" ]; then
        info "Creating ~/.config"
        mkdir -p "$HOME/.config"
    fi

    config_files=$(find "$DOTFILES/configs" -maxdepth 1 2>/dev/null)
    info "Installing Config Files: $config_files\n"
    for config in $config_files; do
        target="$HOME/.config/$(basename "$config")"
        if [ -e "$target" ]; then
            info "~${target#$HOME} already exists... Skipping."
        else
            info "Creating symlink for $config"
            ln -s "$config" "$target"
        fi
    done
}

## setup astronvim

setup_astronvim() {
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    mv ~/.local/state/nvim ~/.local/state/nvim.bak
    mv ~/.cache/nvim ~/.cache/nvim.bak
    git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
    ln -sf "$DOTFILES/astronvim/yigitozgumus/" ~/.config/nvim/lua/user
}

## setup neovim
setup_neovim_lazy() {
    blank_line
    info "Deleting current configuration."
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim
    rm -rf ~/.cache/nvim
    info "Linking the Neovim Configuration."
    ln -sf "$DOTFILES/configs/nvim/" "$HOME/.config/nvim"
}

## setup old neovim
setup_neovim_packer() {
    blank_line
    info "Deleting current configuration."
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim
    rm -rf ~/.cache/nvim
    info "Linking the Neovim Configuration."
    ln -sf "$DOTFILES/configs/nvim-packer/" "$HOME/.config/nvim"
}

# Git setup

setup_git() {
    title "Setting up Git"

    defaultName=$(git config user.name)
    defaultEmail=$(git config user.email)
    defaultGithub=$(git config github.user)

    info "Type your work credentials"
    read -rp "Name [$defaultName] " name
    read -rp "Email [$defaultEmail] " email
    read -rp "Github username [$defaultGithub] " github

    touch "$HOME/.gitconfig-work"
    git config -f ~/.gitconfig-work user.name "${name:-$defaultName}"
    git config -f ~/.gitconfig-work user.email "${email:-$defaultEmail}"
    git config -f ~/.gitconfig-work github.user "${github:-$defaultGithub}"
    info "Work Credentials set"

    git_files=$(find "$DOTFILES/git" -maxdepth 1 2>/dev/null)
    for git_file in $git_files; do
        target="$HOME/.$(basename "$git_file")"
        if [ -e "$target" ]; then
            info "~${target#$HOME} already exists... Skipping."
        else
            info "Creating symlink for $git_file"
            ln -s "$git_file" "$target"
        fi
    done
}

# Homebrew setup

setup_homebrew() {
    title "Setting up Homebrew"

    if test ! "$(command -v brew)"; then
        info "Homebrew not installed. Installing."
        # Run as a login shell (non-interactive) so that the script doesn't pause for user input
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login
    fi

    if [ "$(uname)" == "Linux" ]; then
        test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
        test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
    fi

    # install brew dependencies from Brewfile
    brew bundle

    # install fzf
    echo -e
    info "Installing fzf"
    "$(brew --prefix)"/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
}

# Shell setup

setup_shell() {
    title "Configuring shell"

    [[ -n "$(command -v brew)" ]] && zsh_path="$(brew --prefix)/bin/zsh" || zsh_path="$(which zsh)"
    if ! grep "$zsh_path" /etc/shells; then
        info "adding $zsh_path to /etc/shells"
        echo "$zsh_path" | sudo tee -a /etc/shells
    fi

    if [[ "$SHELL" != "$zsh_path" ]]; then
        chsh -s "$zsh_path"
        info "default shell changed to $zsh_path"
    fi
}

# Term info
function setup_terminfo() {
    title "Configuring terminfo"

    info "adding tmux.terminfo"
    tic -x "$DOTFILES/resources/tmux.terminfo"

    info "adding xterm-256color-italic.terminfo"
    tic -x "$DOTFILES/resources/xterm-256color-italic.terminfo"
}

# macos setup

setup_macos() {
    title "Configuring macOS"
    if [[ "$(uname)" == "Darwin" ]]; then

        echo "Finder: show all filename extensions"
        defaults write NSGlobalDomain AppleShowAllExtensions -bool true

        echo "show hidden files by default"
        defaults write com.apple.Finder AppleShowAllFiles -bool false

        echo "only use UTF-8 in Terminal.app"
        defaults write com.apple.terminal StringEncodings -array 4

        echo "expand save dialog by default"
        defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

        echo "show the ~/Library folder in Finder"
        chflags nohidden ~/Library

        echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
        defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

        echo "Enable subpixel font rendering on non-Apple LCDs"
        defaults write NSGlobalDomain AppleFontSmoothing -int 2

        echo "Use current directory as default search scope in Finder"
        defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

        echo "Show Path bar in Finder"
        defaults write com.apple.finder ShowPathbar -bool true

        echo "Show Status bar in Finder"
        defaults write com.apple.finder ShowStatusBar -bool true

        echo "Disable press-and-hold for keys in favor of key repeat"
        defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

        echo "Set a blazingly fast keyboard repeat rate"
        defaults write NSGlobalDomain KeyRepeat -int 1

        echo "Set a shorter Delay until key repeat"
        defaults write NSGlobalDomain InitialKeyRepeat -int 15

        echo "Enable tap to click (Trackpad)"
        defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

        echo "Enable Safari’s debug menu"
        defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

        echo "Kill affected applications"

        for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
    else
        warning "macOS not detected. Skipping."
    fi
}

case "$1" in
backup)
    backup
    ;;
link)
    setup_symlinks
    ;;
git)
    setup_git
    ;;
nvim)
    setup_neovim_lazy
    ;;
homebrew)
    setup_homebrew
    ;;
astronvim)
    setup_astronvim
    ;;
shell)
    setup_shell
    ;;
terminfo)
    setup_terminfo
    ;;
macos)
    setup_macos
    ;;
purge)
    clean
    ;;
all)
    setup_symlinks
    setup_terminfo
    setup_homebrew
    setup_shell
    setup_git
    setup_macos
    setup_terminfo
    ;;
*)
    echo $"\nUsage: $(basename "$0") {purge|backup|link|git|homebrew|shell|terminfo|macos|all}\n"
    exit 1
    ;;
esac

success "Done."
