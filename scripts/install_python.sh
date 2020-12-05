#!/bin/bash
echo "Installing Dependencies"
brew install zlib
brew install sqlite
brew install bzip2
brew install libiconv
brew install libzip
echo "Done!"
echo
echo -e "Setting Environment Variables"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/sqlite/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/sqlite/lib/pkgconfig"
echo "Done!"
echo
echo "Installing Python 3.8.5"
pyenv install ${1}
echo "Done!"
exit 0