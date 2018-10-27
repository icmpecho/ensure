BASE_DIR=$(realpath $(dirname $(realpath $0))/..)
DOTFILES_ROOT=$BASE_DIR/dotfiles

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_file () {
  ln -sf "$1" "$2"
  success "linked $1 -> $2"
}

dot_link() {
  info "Linking dotfiles..."
  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

dot_nvim_link() {
  info 'Linking nvim init.vim'
  NVIM_CONFIG_DIR="$HOME/.config/nvim"
  mkdir -p "$NVIM_CONFIG_DIR"
  link_file "$DOTFILES_ROOT/init.vim" "$NVIM_CONFIG_DIR/init.vim"
}