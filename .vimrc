
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
Plugin 'cohama/lexima.vim'
Plugin 'posva/vim-vue'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jwalton512/vim-blade'

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
autocmd vimenter * NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"Configuration for encoding.
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

"When you start new line, make the same indent in new line with previous one. 
set ai

"When you start new line, make high level auto indentation.
set si

colorscheme slate
syntax on

" Save 1,000 items in history
set history=1000

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

" Do not make swap file
set noswapfile

" Allocate space key to <leader>
let mapleader = "\<Space>"

" Quickly save your file.
map <leader>w :w!<cr>
" Quickly open the file.
nnoremap <Leader>o :CtrlP<CR>
" Quickly yank and paste with OS clip board. 
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

:imap jk <Esc>
:imap kj <Esc>

" If there are more than 1 tag matching file, Show the list.(with ctags)
nnoremap <C-]> g<C-]>

" For html tag jump (<div>-></div>)
" You can check where the directory is with ":echo $VIMRUNTIME" on vim.
:source /usr/local/share/vim/vim81/macros/matchit.vim


" For html tag jump (<div>-></div>)
:source /usr/local/share/vim/vim81/macros/matchit.vim

" For html, js, css and so on. Make tabstop=2
function! s:javascript_filetype_settings()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal cindent
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

function! s:html_filetype_settings()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal includeexpr=substitute(v:fname,'^\\/','','') |
endfunction
autocmd FileType html call s:html_filetype_settings()

function! s:css_filetype_settings()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal cindent
endfunction
autocmd FileType css  call s:css_filetype_settings()
autocmd FileType sass call s:css_filetype_settings()
