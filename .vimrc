call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'rhysd/vim-clang-format'
Plug 'justmao945/vim-clang'
Plug 'cohama/lexima.vim'
Plug 'posva/vim-vue'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'jwalton512/vim-blade'
Plug 'ap/vim-css-color'
Plug 'tomasr/molokai'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

"Settings for Plugin.
let g:NERDTreeWinSize=15
"let g:neocomplete#enable_at_startup = 1

set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_completion_start_length = 1

"autocmd vimenter * NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"Setting for Plugin calendar.vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

"Configuration for encoding.
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

"When you start new line, make the same indent in new line with previous one. 
set ai

"When you start new line, make high level auto indentation.
set si

colorscheme molokai
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
" no swap file
set backup
" no backup file(with tilde)
set nobackup

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
set shiftwidth=2
set tabstop=2

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

" s{char}{char} to move to {char}{char}
map <leader>s <Plug>(easymotion-bd-f2)
nmap <leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)

" If there are more than 1 tag matching file, Show the list.(with ctags)
nnoremap <C-]> g<C-]>

" For html tag jump (<div>-></div>)
:runtime macros/matchit.vim

" For html, js, css and so on. Make tabstop=4
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

function! s:python_filetype_settings()
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal cindent
endfunction

autocmd FileType python  call s:python_filetype_settings()
autocmd FileType css  call s:css_filetype_settings()
autocmd FileType sass call s:css_filetype_settings()

" set 256 color
set t_Co=256
