" Auto install Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Install Plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'bling/vim-bufferline'
Plug '/usr/local/opt/fzf'
Plug 'mileszs/ack.vim'
call plug#end()

" Color Scheme
syntax on
set background=dark
set termguicolors
color solarized8
filetype plugin indent on

" Line number and column limit
set number
set colorcolumn=78
set cursorline

" Character Encodings
set encoding=utf-8
set fileencoding=utf-8

" Indentions
set ts=2 sts=2 sw=2 expandtab
set autoindent

" Whitespaces highlight
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•

" Searching
set hlsearch
set incsearch

" Airline
set laststatus=2

" fzf
noremap <C-p> :FZF<CR>

" ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Others
set noswapfile
set shell=/bin/sh
set backspace=indent,eol,start
imap jk <Esc>
