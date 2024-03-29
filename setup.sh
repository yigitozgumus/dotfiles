#!/bin/sh

source ./setup/util.sh

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
	source ./setup/setup-homebrew.sh
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
scripts)
	source ./setup/setup-scripts.sh
	;;
all)
	source ./setup/setup-symlinks.sh
	source ./setup/setup-terminfo.sh
	source ./setup/setup-homebrew.sh
	source ./setup/setup-shell.sh
	source ./setup/setup-git.sh
	source ./setup/setup-macos.sh
	source ./setup/setup-scripts.sh
	source ./setup/setup-neovim.sh
	;;
*)
	echo $"\nUsage: $(basename "$0") {backup|link|git|nvim|homebrew|shell|terminfo|macos|scripts|purge|all}\n"
	exit 1
	;;
esac

success "Done."
