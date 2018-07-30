BASE_DIR=$(dirname $(realpath $0))/..
PACKAGES_DIR=$BASE_DIR/packages
BREWFILE_DIR=$PACKAGES_DIR/brew
BREW_FILE=$BREWFILE_DIR/Brewfile
REQUIREMENTS_DIR=$PACKAGES_DIR/pip
REQUIREMENTS_FILE=$REQUIREMENTS_DIR/requirements.txt
INSTALLER_FILE=$PACKAGES_DIR/install.sh

app_clean() {
  echo "Uninstalling unused apps..."
  brew bundle cleanup --force --file=$BREW_FILE
  echo "Cleaning up packages..."
  brew cleanup
}

app_install() {
  echo "Installing apps..."
  brew bundle --file=$BREW_FILE
  echo "Updating packages..."
  brew upgrade
  echo "Installing python apps..."
  pip3 install --upgrade -r $REQUIREMENTS_FILE
  echo "Installing other packages..."
  sh -c $INSTALLER_FILE
}

app_update() {
  echo "Updating apps..."
  brew bundle --file=$BREW_FILE
  echo "Updating packages..."
  brew upgrade
}
