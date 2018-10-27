BASE_DIR=$(realpath $(dirname $(realpath $0))/..)
SETUP_ROOT=$BASE_DIR/setup

setup() {
  echo "Triggering setup scripts..."
  for src in $(find -H "$SETUP_ROOT" -maxdepth 2 -name '*.sh' -not -path '*.git*')
  do
    sh $src
  done
}
