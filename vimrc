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
"     ->Plugin configure
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       General                            "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $MANPAGER=' '
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'vim-scripts/L9'
"Plugin 'Rip-Rip/Clang_complete'
"Plugin 'othree/vim-autocomplpop'
Plugin 'bling/vim-airline'
Plugin 'Townk/vim-autoclose'
Plugin 'xuhdev/SingleCompile' 
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'godlygeek/tabular'
Plugin 'marijnh/tern_for_vim'
call vundle#end()

filetype  indent plugin on
syntax on

set fdm=syntax
set foldnestmax=3
set foldcolumn=3

set fileencodings=utf-8,big5
set encoding=utf-8
set tenc=utf-8 
au FileType javascript call JavaScriptFold()


highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Vim user interface                    "         
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set nowrap
set hidden
set ignorecase
set hlsearch
set incsearch
set cursorline 
set noswapfile
"Let the working dir auto-change to dir that contain current editting file,instead of dir we call vim"
set autochdir
""Don't redraw while executing macros (good performance config)
set lazyredraw
""source  /etc/vim/Auto_SetTitle.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Colors and Fonts                     "         
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
colorscheme ir_black
set guifont=Monaco\ 12
highlight Pmenu ctermbg=240 ctermfg=48
highlight PmenuSel ctermbg=99
highlight CursorLine   ctermbg=239 ctermfg=NONE

set laststatus=2
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
nmap <leader>r :source $MYVIMRC<CR>
nmap <leader>n :NERDTree .<CR>
nmap <leader>w :w<CR>
nmap <leader>wq :w<CR> :bd <CR>
nmap <leader><Tab> <C-W><C-W>

nmap <leader>b :bnext<CR>
nmap <leader>B :bprevious<CR>
nmap <leader>t :tabnext<CR>
nmap <leader>T :tabprevious<CR>

if exists(":Tabularize")
   nmap <Leader><F1>= :Tabularize /=<CR>
   vmap <Leader><F1>= :Tabularize /=<CR>
   nmap <Leader><F1>: :Tabularize /:\zs<CR>
   vmap <Leader><F1>: :Tabularize /:\zs<CR>
endif

nmap <leader>+ =:set syntax=javascript<CR>
set switchbuf=split

set showcmd		" Show (partial) command in status line.
set incsearch		" Incremental search
set tabstop=3
set smartindent
set shiftwidth=3
set expandtab

set wildmode=list:longest,full

"
" " Complete options (disable preview scratch window, longest removed to aways
" " show menu")
set completeopt=menu,menuone
"
" Limit popup menu height
set pumheight=20
function! JavaScriptFold()
      setl foldmethod=syntax
      setl foldlevelstart=1
      syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
endfunction
""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Plugin configure                   "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:SingleCompile_menumode = 2
let g:SingleCompile_split = 'split'
"solve the conflict of supertab and snipmate

"Clang_complete And  Supertab"
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"Enalbe display buffers with a single tab
let g:airline#extensions#tabline#show_buffers = 1

let NERDTreeChDirMode=2
"close vim if the only window left open is a NERDTree

let g:javascript_enable_domhtmlcss = 1


map <c-f> :call JsBeautify()<cr>
let g:ycm_semantic_triggers =  {
         \ 'javascript': ['.'],
      \}

autocmd FileType html set omnifunc=htmlcomplete#CompleteTag,
