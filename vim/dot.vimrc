" [ Maintain info    ] {{{
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
"     ->Colors and fonts     ->Texts, tab and indent related
"     ->Visual mode related
"     ->Moving around, tab and buffers
"     ->Status line
"     ->Useful shortcuts
"     ->helper functions
"     ->Tags
"     ->Plugin configure
"     ->Auto command
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" [ General          ] {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       General                            "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim/
 
    call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    " libraries
    Plugin 'tomtom/tlib_vim'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'vim-scripts/L9'
    Plugin 'Shougo/vimproc.vim'
    " Syntax
    Plugin 'pangloss/vim-javascript'
    Plugin 'good5dog5/arm.vim'
    Plugin 'gabrielelana/vim-markdown'
    Plugin 'hynek/vim-python-pep8-indent'
    " Navagation
    Plugin 'scrooloose/nerdtree'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'steffanc/cscopemaps.vim'
    Plugin 'Valloric/MatchTagAlways'
    Plugin 'majutsushi/tagbar'
    Plugin 'christoomey/vim-tmux-navigator'
    " Good-looking
    Plugin 'bling/vim-airline'
    Plugin 'godlygeek/tabular'
    " Auto-complete
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'marijnh/tern_for_vim'
    Plugin 'Raimondi/delimitMate'
    " Snippets
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    Plugin 'ervandew/supertab'
    Plugin 'rking/ag.vim'
    Plugin 'kien/ctrlp.vim'

    call vundle#end()
 
    filetype  indent plugin on
    syntax on
 
    set fdm=marker
    set foldnestmax=8
    set foldcolumn=3
 
    "retab command can replace all sequence of white-space"
    "contain<bt> with new strings of wihte-space, use the"
    "value of tabstop"'
    "/\t can use for visable <tab> "
 
    set expandtab        
    set tabstop=4        
    set shiftwidth=4     "number of spaces to use for each step of (auto)indent, use for cindent >> << etc"
 
    set backspace=indent,eol,start                       
                         
                         
    set smartindent     
    set autoindent
 
    set fileencodings=utf-8
    set encoding=utf-8
    set tenc=utf-8 
    au FileType javascript call JavaScriptFold()
 
 
    set switchbuf=split
 
    set showcmd      " Show (partial) command in status line.
    set incsearch        " Incremental search
 
 
    set wildmode=list:longest,full
    "Complete options (disable preview scratch window, longest removed to aways show menu
    set completeopt=menu,menuone
    " Limit popup menu height
    set pumheight=20
" }}}
" [ User interface   ] {{{
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
    set ttyfast
" }}}
" [ Colors and Fonts ] {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Colors and Fonts                     "         
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set t_Co=256
    colorscheme jellybeans
    set guifont=Monaco\ 12
    highlight Pmenu ctermbg=240 ctermfg=48
    highlight PmenuSel ctermbg=99
    highlight CursorLine   ctermbg=239 ctermfg=NONE
    
    set laststatus=2
" }}}
" [ Useful shortcuts ] {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Useful shortcuts                   "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " [ General         ] {{{2
    "Set key combination's map leader
    let mapleader = ","

    map <F12> :call Switch_html_javascript()<CR>
 
    "clear highlight after search nnoremap: nmap and no-remap
    nnoremap <CR> :noh<CR><CR>
 
    nmap <leader>v :edit $MYVIMRC<CR>
    nmap <leader>r :source $MYVIMRC<CR>
    nmap <leader>n :NERDTree .<CR>

    " Close current buffer
    nmap <leader>q :bd<CR>
    " Move to the next buffer
    nmap <leader>l :bnext<CR>
    " Move to the previous buffer
    nmap <leader>h :bprevious<CR>

    nmap <leader><Tab> <C-W><C-W>
 
    nmap <F8>      :TagbarToggle<CR>
 
    "Replace word under current cursor"
    nmap <leader>s :%s/\<<C-r><C-w>\>/
    nmap ,d :b#<bar>bd#<CR>
 
    imap jk <Esc>
    imap JK <Esc>
 
    vmap <C-c> "+y
    nmap <C-p> "+p
 
    "}}} 
    "[ Buf switch | tab switch ] {{{2
       nmap <silent> <Left>  :bprevious<CR>
       nmap <silent> <Right> :bprevious<CR>
 
       " Alt + Num to switch to buffer[Num]
       nmap <silent> <M-1> :b1<CR>
       nmap <silent> <M-2> :b2<CR>
       nmap <silent> <M-3> :b3<CR>
       nmap <silent> <M-4> :b4<CR>
       nmap <silent> <M-5> :b5<CR>
       nmap <silent> <M-6> :b6<CR>
       nmap <silent> <M-7> :b7<CR>
       nmap <silent> <M-8> :b8<CR>
       nmap <silent> <M-9> :b9<CR>
    "}}}
    "[ Plugin       ] {{{2
    function! JavaScriptFold()
          setl foldmethod=syntax
          setl foldlevelstart=1
          syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
    endfunction
    "}}}
    
" }}}
" [ Plugin configure ] {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Plugin configure                   "        

    " vim-airline {{{2
        let g:airline_powerline_fonts = 1
        " Enable the list of buffers
        let g:airline#extensions#tabline#enabled = 1
 
        " Show just the filename
        let g:airline#extensions#tabline#fnamemod = ':t'
 
        "Enalbe display buffers with a single tab
        let g:airline#extensions#tabline#show_buffers = 1
 
        let NERDTreeChDirMode=2
        "Automatic close Nerdtree after having file opened
        let NERDTreeQuitOnOpen=1
        "close vim if the only window left open is a NERDTree
 
        let g:javascript_enable_domhtmlcss = 1
    ""}}}
    " cscope {{{2
    if has("cscope")
 
       "Specifies the command to execute cscope
       set csprg=/usr/bin/cscope
 
       "Determine the order in which cstag performs a search, default 0"
       "indicate search cscope first"
       set csto=0
       set cst
 
       "Search and add cscopt.out frim current directory up to root
 
       let db = findfile("cscope.out", ".;")
 
       if (!empty(db))
          let path = strpart(db, 0, match(db, "/cscope.out$"))
          set nocscopeverbose " suppress 'duplicate connection' error
          exe "cs add " . db . " " .  path
       endif
       set csverb
    endif
    "}}}
    "Tabularize {{{2
 
        if exists(":Tabularize")
           nmap <Leader>T= :Tabularize /=<CR>
           vmap <Leader>T= :Tabularize /=<CR>
           nmap <Leader>T: :Tabularize /:\zs<CR>
           vmap <Leader>T: :Tabularize /:\zs<CR>
        endif
     ""}}}
    "YCM {{{2
 
        nmap <leader>gl :YcmCompleter GoToDeclaration<CR>
        nmap <leader>gf :YcmCompleter GoToDefinition<CR>
        nmap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
 
        " Temporily disable ycm (0:enable)
        "let g:loaded_youcompleteme = 0
 
        "location for global configure file
        let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
        let g:ycm_seed_identifiers_with_syntax = 1
 
        "enable completion in comment
        let g:ycm_complete_in_comments = 1            
 
        "start completion while typing first charcter
        let g:ycm_min_num_of_chars_for_completion = 3 
        
        "do not check ycm_extra_conf
        let g:ycm_confirm_extra_conf = 0
        let g:ycm_register_as_syntastic_checker = 0
        let g:ycm_filetype_blacklist={}
     "}}}
    "UltiSnips {{{2
 
         nmap <leader>+ =:set syntax=javascript<CR>
 
         let g:UltiSnipsJumpForwardTrigger="<tab>"
 
         " make YCM compatible with UltiSnips (using supertab)
         let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
         let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
         let g:SuperTabDefaultCompletionType = '<C-n>'
 
         " better key bindings for UltiSnipsExpandTrigger
         let g:UltiSnipsExpandTrigger = "<tab>"
         let g:UltiSnipsJumpForwardTrigger = "<tab>"
         let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
        "let g:UltiSnipsJumpForwardTrigger="<tab>"
     "}}}
    "Tern_for_vim {{{2
 
        nmap _d :TernDef<CR>
        nmap _D :TernDoc<CR>
     "}}}
    "Easy-motion {{{2
 
         let g:EasyMotion_do_mapping = 0 "Disable default mapping
         let g:EasyMotion_smartcase  = 1 "Turn on case insensitive feature
 
         "2-character search motion
         nmap s <Plug>(easymotion-s2)
 
         " JK motions: Line motions
         map <Leader>j <Plug>(easymotion-j)
         map <Leader>k <Plug>(easymotion-k)
     "}}}
    " MatchTagAlways {{{2
 
        nmap <leader>% :MtaJumpToOtherTag<CR>
     "}}}
    " Tagbar {{{2
 
        let g:tagbar_type_make = {
                    \ 'kinds':[
                        \ 'm:macros',
                        \ 't:targets'
                    \ ]
        \}
     "}}}
    " CtrlP {{{2
        
        let g:ctrlp_map = '<leader>f'

        " Setup some default ignores
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
          \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
        \}

        " Use the nearest .git directory as the cwd
        " This makes a lot of sense if you are working on a project that is in version
        " control. It also supports works with .svn, .hg, .bzr.
        let g:ctrlp_working_path_mode = 'r'
    "}}}

    " The Silver Searcher {{{1

    if executable('ag')
        " Use ag over grep
            set grepprg=ag\ --nogroup\ --nocolor

        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
            let g:ctrlp_use_caching = 0
    endif
    "}}}


" }}}
" [ Auto command   ] {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Auto command                       "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    autocmd FileType vim setlocal fdm=marker
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTag,
    autocmd BufNewFile,BufRead *.htm* set filetype=javascript
    autocmd Filetype make setlocal noexpandtab
    autocmd BufNewFile *.py 0put =\"#!/usr/bin/python\<nl>\"|$
    autocmd BufNewFile,BufRead  *.vim*  set filetype=vim
    autocmd BufNewFile,BufRead  *.bash* call SetBashOption()
    autocmd BufNewFile,BufRead  *.sh    call SetBashOption()
 
    "Automatic story folding state while switch between buffers
    autocmd BufWinLeave ?* mkview!
    autocmd BufWinEnter ?* silent loadview
 
    "Auto highlight assembly files depands on extension
    autocmd BufRead,BufNewFile *.s set filetype=arm 
    "Open a default template while open c-family file. "
    autocmd BufNewFile *.c   call LoadCTemplate()
    autocmd BufNewFile *.cpp call LoadCPPTemplate()
    autocmd BufNewFile *.sh  call LoadBashTemplate()
    autocmd BufNewFile *.md  set filetype=markdown 
    autocmd BufNewFile *.md  setlocal nospell 
    autocmd BufNewFile *.md  call LoadMarkdownTemplate()
    autocmd BufNewFile gdb*  set filetype=gdb
    autocmd BufNewFile,BufRead *.py call SetPythonOption() 
" [ My function   ] {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       My function                        "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"C/C++
function! LoadCTemplate() 
    0r ~/.vim/template/template.c
    normal zR5G
endfunction

function! LoadCPPTemplate()
    0r ~/.vim/template/template.cpp
    normal zR5G
endfunction

"bash script"
function! LoadBashTemplate()
    0r ~/.vim/template/template.sh
    normal zRG
endfunction

"markdown"
function! LoadMarkdownTemplate()
     0r ~/.vim/template/template.md
     normal zR2G
endfunction

" Add foldmarker to c and cpp "
function! FoldPreprocessor()
     set foldmarker=#if,#endif
     set foldmethod=marker
endfunction

" SetOption of bash
function! SetBashOption()
     set foldmethod=marker
     set foldmarker={,}
     set filetype=sh
endfunction

function! SetPythonOption()
     set tabstop=4  
     set softtabstop=4
     set shiftwidth=4
     set smarttab
     set expandtab
     set foldmethod=indent
     set foldnestmax=2
endfunction

function! SetupELXEnvironment()
     let l:path = expand('%:p')
     if l:path =~ '/home/jordan/Documents/Edimax/ELX/*'
         set tabstop=8
         set shiftwidth=8
         set softtabstop=8
         set expandtab
 
     endif
endfunction

function! Switch_html_javascript()
    if (&ft=='javascript')
        :set ft=html
        :set foldmethod=manual
    else
        :set ft=javascript
        :set foldmethod=syntax
    end
endfunction
