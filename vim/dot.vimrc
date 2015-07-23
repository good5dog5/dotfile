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
    Plugin 'terryma/vim-smooth-scroll'
    Plugin 'terryma/vim-expand-region'

    " Good-looking
    Plugin 'bling/vim-airline'
    Plugin 'junegunn/vim-easy-align'
    Plugin 'nathanaelkane/vim-indent-guides'
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
    Plugin 'nelstrom/vim-visual-star-search'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'wikitopian/hardmode'
    Plugin 'KitN/nand2-vim-syn'

    call vundle#end()
 
    filetype  indent plugin on
    syntax on
 
    set fdm=syntax
    set foldnestmax=8
    set foldcolumn=3
    " Automatically refresh any unchanged files
    "set autoread
 
    "retab command can replace all sequence of white-space"
    "contain<bt> with new strings of wihte-space, use the"
    "value of tabstop"'
    "/\t can use for visable <tab> "
 
    set expandtab        
    set tabstop=4        
    set shiftwidth=4     "number of spaces to use for each step of (auto)indent, use for cindent >> << etc"
 
    set backspace=indent,eol,start                       
    
    " Disable auto-comment 
    "{{{2
    " You can use the 'formatoptions' option  to influence how Vim formats text.
    " 'formatoptions' is a string that can contain any of the letters below.  The
    " default setting is "tcq".  You can separate the option letters with commas for
    " readability.
    " 
    " letter  meaning when present in 'formatoptions'
    " 
    " t       Auto-wrap text using textwidth
    " c       Auto-wrap comments using textwidth, inserting the current comment
    "         leader automatically.
    " r       Automatically insert the current comment leader after hitting
    "         <Enter> in Insert mode.
    " o       Automatically insert the current comment leader after hitting 'o' or
    "         'O' in Normal mode.
    " 
    "}}}
    set formatoptions-=cro
                         
                         
    set smartindent     
    set autoindent
 
    set fileencodings=utf-8
    set encoding=utf-8
    set tenc=utf-8 
    au FileType javascript call JavaScriptFold()
 
    "No bells
    set noerrorbells visualbell t_vb=
 
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
    hi IndentGuidesEven ctermbg=238
    hi IndentGuidesOdd ctermbg=236
    " let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=1
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
    nmap <leader>w :call ShowText()<CR>
    "sts the lines matching the word under the cursor from the beginning of the file, and then asks you which match you want to jump to, and finally, jumps to that match.
    "reference http://superuser.com/questions/692548/go-to-lines-matched-by-i-command-to-display-lines-with-word-under-the-cursor
    nmap <leader>F [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

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
    "Replace select word (save in register ")
    "Idea from http://asktherelic.com/2011/04/02/on-easily-replacing-text-in-vim/
    vmap <Leader>s "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/

    nmap ,d :b#<bar>bd#<CR>
 
    imap jk <Esc>
    imap JK <Esc>
 
    vmap <C-c> "+y
    nmap <C-p> "+p
 
    "}}} 
    "[ Text movement ] {{{2
       " Idea from http://codingfearlessly.com/2012/08/21/vim-putting-arrows-to-use/
       nmap <Left>  <<
       nmap <Right> >>

       " gv reselect the last visual area.
       vmap <Left>  <gv
       vmap <Right> >gv
    "}}}

    "[vimdiff mapping] {{{2
    "do - Get changes from other window into the current window.
    "dp - Put the changes from current window into the other window.
        if &diff
            set nofoldenable
            nnoremap J ]c
            nnoremap K [c
            nnoremap L dp 
            nnoremap H do 
            nnoremap U :diffupdate<CR>
        endif
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
    "Easy-vim-alig {{{2

        " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
        vmap <Enter> <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)

    "}}}
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

        " Use the nearest .git directory as the cwd
        " This makes a lot of sense if you are working on a project that is in version
        " control. It also supports works with .svn, .hg, .bzr.
        let g:ctrlp_working_path_mode = 'r'
        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
        let g:ctrlp_map = '<leader>f'

        if executable('ag')

            set grepprg=ag\ --nogroup\ --nocolor

            " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        else
            let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
            let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
            \ }
        endif

        " Setup some default ignores
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
          \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
        \}

    "}}}
    " hardMode {{{2
        noremap <leader>h <Esc>:call ToggleHardMode()<CR>
    "}}}

    " The Silver Searcher {{{1
    "}}}

    " vim-smooth-scroll {{{1
            noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 1, 2)<CR>
            noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 1, 2)<CR>
            noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
            noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

    "}}}

    " vim-expand-region {{{1
            vmap v     <Plug>(expand_region_expand)
            vmap <C-v> <Plug>(expand_region_shrink)
    "}}}


" }}}
" [ Auto command   ] {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Auto command                       "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    autocmd FileType vim setlocal fdm=marker
    autocmd FileType lua setlocal fdm=marker
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTag,
    autocmd BufNewFile,BufRead *.htm* set filetype=javascript
    autocmd Filetype make setlocal noexpandtab
    autocmd BufNewFile *.py 0put =\"#!/usr/bin/python\<nl>\"|$
    autocmd BufNewFile,BufRead  *.vim*  set filetype=vim
    autocmd BufNewFile,BufRead  *.bash* call SetBashOption()
    autocmd BufNewFile,BufRead  *.sh    call SetBashOption()
    autocmd BufNewFile,BufRead  *.cgi   set filetype=json
 
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
    " For nand2tetris use
    autocmd BufNewFile,BufRead *.hdl set filetype=nandhdl

    " Set scripts to be executable from the shell
    autocmd BufWritePost * call Mode_executable()

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
     set tabstop=8  
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

function! ShowText()

    let l:currentWord = expand('<cword>')+2
    let l:file="/tftpboot/web_elecom/lang/basic/uk.js"

    echomsg system("sed '" . l:currentWord . "!d' " . l:file)
endfunction

function! Mode_executable()
    if (getline(1) =~ "^#!")
        silent !chmod +x % 
    endif
endfunction

