
"-----------https://github.com/VundleVim/Vundle.Vim#quick-start-----------
"How to use
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Launch vim and run :PluginInstall
"To install from command line: vim +PluginInstall +qall

set nocompatible              " be iMproved, require
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'rhysd/vim-clang-format'
Plugin 'justmao945/vim-clang'
Plugin 'shougo/neocomplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-----------https://github.com/VundleVim/Vundle.Vim#quick-start-----------

"Settings for Plugin.
let g:NERDTreeWinSize=15
let g:neocomplete#enable_at_startup = 1
"Setting for the bug for the missing first character of file or directory name
let NERDTreeNodeDelimiter = "\t"

autocmd vimenter * NERDTree

"Configuration for encoding.
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

"When you start new line, make the same indent in new line with previous one. 
set ai

"When you start new line, make high level auto indentation.
set si

colorscheme slate
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Sample vimrc                                 "
"                                                                              "
"                                 Provided by:                                 "
"                           LinuxTrainingAcademy.com                           "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Save 1,000 items in history
set history=1000

" Show the line and column number of the cursor position
set ruler

" Display the incomplete commands in the bottom right-hand side of your screen.  
set showcmd

" Display completion matches on your status line
set wildmenu

" Show a few lines of context around the cursor
set scrolloff=5

" Highlight search matches
set hlsearch

" Enable incremental searching
set incsearch

" Ignore case when searching
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase

" Turn on line numbering
set number

" Turn on file backups
set backup

" Don't line wrap mid-word.
set lbr

" Copy the indentation from the current line.
set autoindent

" Enable smart autoindenting.
set smartindent

" Use spaces instead of tabs
set expandtab

" Enable smart tabs
set smarttab

" Make a tab equal to 4 spaces
set shiftwidth=4
set tabstop=4

" Specifiy a color scheme.
"colorscheme slate

" Tell vim what background you are using
" set bg=light
" set bg=dark

" Map Y to act like D and C, i.e. yank until EOL, rather than act like yy
" map Y y$

" Remap VIM 0 to first non-blank character
" map 0 ^

" Easily create HTML unorded lists. 
map <F3> i<ul><CR><Space><Space><li></li><CR><Esc>I</ul><Esc>kcit
map <F4> <Esc>o<li></li><Esc>cit

" change the mapleader from \ to ,
" NOTE: This has to be set before <leader> is used.
"let mapleader=","

" Quickly save your file.
map <leader>w :w!<cr>

:imap jk <Esc>
:imap kj <Esc>

