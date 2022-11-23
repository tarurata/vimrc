call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mattn/emmet-vim'
" Complement parentheses
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdcommenter'
Plug 'jwalton512/vim-blade'
Plug 'ap/vim-css-color'
Plug 'tomasr/molokai'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'shun/ddc-vim-lsp'

" https://note.com/dd_techblog/n/n97f2b6ca09d8
" ddc.vim本体
Plug 'Shougo/ddc.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-icons'
" https://zenn.dev/shougo/articles/snippet-plugins-2020
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets' " 大量のスニペット郡
" DenoでVimプラグインを開発するためのプラグイン
Plug 'vim-denops/denops.vim'
" ポップアップウィンドウを表示するプラグイン
Plug 'Shougo/pum.vim'
" カーソル周辺の既出単語を補完するsource
Plug 'Shougo/ddc-around'
" ファイル名を補完するsource
Plug 'LumaKernel/ddc-file'
" 入力中の単語を補完の対象にするfilter
Plug 'Shougo/ddc-matcher_head'
" 補完候補を適切にソートするfilter
Plug 'Shougo/ddc-sorter_rank'
" 補完候補の重複を防ぐためのfilter
Plug 'Shougo/ddc-converter_remove_overlap'
Plug 'matsui54/denops-popup-preview.vim'
call plug#end()
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sourceOptions', {
 \ '_': {
 \   'matchers': ['matcher_head'],
 \   'sorters': ['sorter_rank'],
 \   'converters': ['converter_remove_overlap'],
 \ },
 \ 'vim-lsp': {
 \   'mark': 'LSP', 
 \   'matchers': ['matcher_head'],
 \ },
 \ 'around': {'mark': 'Around'},
 \ 'file': {
 \   'mark': 'file',
 \   'isVolatile': v:true, 
 \   'forceCompletionPattern': '\S/\S*'
 \ }})
call ddc#custom#patch_global('sources', [
 \ 'vim-lsp',
 \ 'around',
 \ 'file'
 \ ])

" Make tab to be confirm key when pum pulldown is visible.
"inoremap <silent><expr> <TAB>
      "\ vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)'   :
      "\ pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' : '<TAB>'
"inoremap <TAB> <Cmd>call pum#map#confirm()<CR>
inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

call ddc#enable()
call popup_preview#enable()
autocmd User PumCompleteDone call vsnip_integ#on_complete_done(g:pum#completed_item)

"Settings for Plugin.
let g:NERDTreeWinSize=15

"For Snippet expand " https://github.com/hrsh7th/vim-vsnip
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" Expand or jump to next inputable attribute or something
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward (#pumのtab complettionと競合するので条件分岐追加 )
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

set completeopt+=noinsert
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_text_edit_enabled = 1

"ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

"autocmd vimenter * NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

set cursorline
set cursorcolumn
set ruler

"Configuration for encoding.
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

"When you start new line, make the same indent in new line with previous one. 
set autoindent

"When you start new line, make high level auto indentation.
set smartindent 

" Save 1,000 items in history
set history=1000

" Display the incomplete commands in the bottom right-hand side of your screen.  
set showcmd

" Display completion matches on your status line
set wildmenu

" Show a few lines of context around the cursor
set scrolloff=5

" Enable incremental searching
set incsearch

" Highlight search matches
set hlsearch

" Ignore case when searching
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase

" Turn on line numbering
set number

" no backup file(with tilde)
set nobackup

" Don't line wrap mid-word.
set linebreak

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

" Quickly open the file with fzf. https://qiita.com/kompiro/items/a09c0b44e7c741724c80
nnoremap <Leader>o :Files
nnoremap <Leader>h :History<CR>

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

" For html tag jump (<div>-></div>)
:runtime macros/matchit.vim

function! s:javascript_filetype_settings()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal cindent
endfunction

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

"autocmd FileType python  call s:python_filetype_settings()
autocmd FileType javascript call s:javascript_filetype_settings()
autocmd FileType css  call s:css_filetype_settings()
autocmd FileType sass call s:css_filetype_settings()

" Color config
colorscheme molokai
syntax on
set t_Co=256
" Need to be below the molokai
hi Search ctermbg=Gray
hi Search ctermfg=Black


set backspace=indent,eol,start
