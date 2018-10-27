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
