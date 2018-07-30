BASE_DIR=$(dirname $0)/..
BREWFILE_DIR=$BASE_DIR/brew
BREW_FILE=$BREWFILE_DIR/Brewfile

app_clean() {
  echo "Uninstalling unused apps..."
  brew bundle cleanup --force --file=$BREW_FILE
  echo "Cleaning up packages..."
  brew cleanup
}

app_install() {
  echo "Installing apps..."
  brew bundle --no-upgrade --file=$BREW_FILE
}

app_update() {
  echo "Updating apps..."
  brew bundle --file=$BREW_FILE
  echo "Updating packages..."
  brew upgrade
}
