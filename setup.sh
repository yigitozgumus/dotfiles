#!/bin/sh

source ./setup/util.sh

## setup astronvim

setup_astronvim() {
	mv ~/.config/nvim ~/.config/nvim.bak
	mv ~/.local/share/nvim ~/.local/share/nvim.bak
	mv ~/.local/state/nvim ~/.local/state/nvim.bak
	mv ~/.cache/nvim ~/.cache/nvim.bak
	git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
	ln -sf "$DOTFILES/astronvim/yigitozgumus/" ~/.config/nvim/lua/user
}

case "$1" in
backup)
	source ./setup/backup.sh
	;;
link)
	source ./setup/setup-symlinks.sh
	;;
git)
	source ./setup/setup-git.sh
	;;
nvim)
	source ./setup/setup-neovim.sh
	;;
homebrew)
	souce ./setup/setup-homebrew.sh
	;;
astronvim)
	setup_astronvim
	;;
shell)
	source ./setup/setup-shell.sh
	;;
terminfo)
	source ./setup/setup-terminfo.sh
	;;
macos)
	source ./setup/setup-macos.sh
	;;
purge)
	source ./setup/clean-setup.sh
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
