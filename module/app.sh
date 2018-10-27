BASE_DIR=$(realpath $(dirname $(realpath $0))/..)
PACKAGES_DIR=$BASE_DIR/packages
BREWFILE_DIR=$PACKAGES_DIR/brew
BREW_FILE=$BREWFILE_DIR/Brewfile
REQUIREMENTS_DIR=$PACKAGES_DIR/pip
REQUIREMENTS_FILE=$REQUIREMENTS_DIR/requirements.txt
INSTALLER_FILE=$PACKAGES_DIR/install.sh

app_runtime_file() {
  FILE=$1
  echo "${FILE}.runtime"
}

app_local_file() {
  FILE=$1
  echo "${FILE}.local"
}

app_merge_file_with_local() {
  FILE=$1
  LOCAL_FILE=$(app_local_file $FILE)
  TARGET_FILE=$(app_runtime_file $FILE)
  cat $FILE > $TARGET_FILE
  if [ -f $LOCAL_FILE ]; then
    echo "" >> $TARGET_FILE
    cat $LOCAL_FILE >> $TARGET_FILE
  fi
}

app_cleanup_runtime_file() {
  FILE=$1
  TMP_FILE=$(app_runtime_file $FILE)
  if [ -f $TMP_FILE ]; then
    rm $TMP_FILE
  fi
}

app_setup() {
  app_merge_file_with_local $BREW_FILE
  app_merge_file_with_local $REQUIREMENTS_FILE
}

app_teardown() {
  app_cleanup_runtime_file $BREW_FILE
  app_cleanup_runtime_file $REQUIREMENTS_FILE
}

app_clean() {
  echo "Uninstalling unused apps..."
  brew bundle cleanup --force --file=$(app_runtime_file $BREW_FILE)
  echo "Cleaning up packages..."
  brew cleanup
}

app_install() {
  echo "Installing apps..."
  brew bundle --file=$(app_runtime_file $BREW_FILE)
  echo "Updating packages..."
  brew upgrade
  echo "Installing python apps..."
  pip3 install --upgrade -r $(app_runtime_file $REQUIREMENTS_FILE)
  echo "Installing other packages..."
  sh -c $INSTALLER_FILE
}

app_update() {
  echo "Updating apps..."
  brew bundle --file=$(app_runtime_file $BREW_FILE)
  echo "Updating packages..."
  brew upgrade
}
