"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Maintainer:
"     yu-Huang <good5dog5@gmail.com>
"
"Version:
"     1.0 - 2014/07/19 17:01
"
"Sections:
"     ->General
"     ->VIM user interface
"     ->Colors and fonts"     ->Texts, tab and indent related
"     ->Visual mode related
"     ->Moving around, tab and buffers
"     ->Status line
"     ->Useful shortcuts
"     ->helper functions
"     ->Tags
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       General                            "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'vim-scripts/L9'
Plugin 'Rip-Rip/Clang_complete'
Plugin 'othree/vim-autocomplpop'
Plugin 'bling/vim-airline'
Plugin 'Townk/vim-autoclose'
Plugin 'xuhdev/SingleCompile' 
Plugin 'scrooloose/nerdtree'
call vundle#end()

filetype indent plugin on
syntax on

set fdm=syntax
set foldnestmax=3
set foldcolumn=3

set fileencodings=utf-8,big5
set encoding=utf-8
set tenc=utf-8 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Vim user interface                 "         
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set hidden
set ignorecase
set hlsearch
set incsearch
set cursorline 
set noswapfile
""Don't redraw while executing macros (good performance config)
set lazyredraw
""source  /etc/vim/Auto_SetTitle.vim

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Colors and Fonts                     "         
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme ir_black
set t_Co=256
set guifont=Monaco\ 12
highlight Pmenu ctermbg=240 ctermfg=48
highlight PmenuSel ctermbg=99
highlight CursorLine   ctermbg=239 ctermfg=NONE

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"Enalbe display buffers with a single tab
let g:airline#extensions#tabline#show_buffers = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Useful shortcuts                   "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set key combination's map leader
let mapleader = ","

nmap  <F4> :!clear <CR> :SCCompile<CR>
nmap  <F5> :!clear <CR> :SCCompileRun<CR>

" open the error console
map <leader>cc :botright cope<CR> 
" " move to next error
map <leader>] :cn<CR>
" " move to the prev error
map <leader>[ :cp<CR>

nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>w :w<CR>
nmap <leader>q :wq<CR>

nmap <leader>t :tabnext<CR>
nmap <leader>T :tabprevious<CR>

let g:SingleCompile_menumode = 2
let g:SingleCompile_split = 'split'
"solve the conflict of supertab and snipmate
let g:SuperTabMappingForward="<tab>" 

set switchbuf=split

set showcmd		" Show (partial) command in status line.
set incsearch		" Incremental search
set tabstop=3
set smartindent
set shiftwidth=3
set expandtab

set wildmode=list:longest,full

"Clang_complete And  Supertab"
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'
"
" " Complete options (disable preview scratch window, longest removed to aways
" " show menu")
set completeopt=menu,menuone
"
" Limit popup menu height
set pumheight=20
""
" SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
"" compile and execute in vim"
