# Ensure
MacOS configuration management command line

## How to install
Clone the repository into `$HOME/.ensure` then

    $ ./bootstrap.sh

## Usage
Simply run `ensure` and read the help

    $ ensure

## Managing list of program to be installed
### Across all machines
Simply edit
- `packages/brew/Brewfile`
- `packages/pip/requirements.txt`
### Only on this machine
Add these files (It's already gitignored)
- `packages/brew/Brewfile.local`
- `packages/pip/requirements.txt.local`

## Managing dotfiles
- Any files with `.symlink` suffix in `dotfiles` directory will be linked to `$HOME`
- Any files with `.zsh` suffix in `dotfiles` directory will be sourced in the shell

## Post install setup scripts
Any `.sh` files inside `setup` directory will be triggerd as the last step of the `ensure all` command
