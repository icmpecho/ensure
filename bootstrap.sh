#!/bin/bash
set -e
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Installing coreutils..."
brew install coreutils
echo "Installing ensure command..."
ln -sf $HOME/.ensure/bin/ensure /usr/local/bin/
echo "Installed $HOME/.ensure/bin/ensure -> /usr/local/bin/ensure"
