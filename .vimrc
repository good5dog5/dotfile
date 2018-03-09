" [ Maintain info    ] {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Maintainer:
"     yu-Huang <good5dog5@gmail.com>
"
"Version:
"     1.0 - 2014/07/19 17:01
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" [ General          ] {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       General                            "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    filetype  indent plugin on
    syntax on

    let mapleader = ","

    " Install vim-plug if we don't arlready have it
    " {{{
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif
    " }}}
 
    call plug#begin('~/.vim/plugged')

    " Colorschemes
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'junegunn/seoul256.vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'chriskempson/tomorrow-theme'
    Plug 'zeis/vim-kolor'

    " libraries
    Plug 'tomtom/tlib_vim'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'vim-scripts/L9'

    " Syntax
    Plug 'pangloss/vim-javascript', {'for': 'javascript'}
    Plug 'good5dog5/arm.vim', {'for': 'asm'}
    Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
    Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
    " Plug 'chrisbra/csv.vim', {'for': 'csv'}
    " Plug 'klen/python-mode', {'for' : 'python'}
    "  {{{
    " turn off pymode's autocomplete to prevent conflict with ycm
    let g:pymode_rope_complete_on_dot = 0

    " Pymode could show documentation for current word by `pydoc`.
    let g:pymode_doc = 1
    let g:pymode_rope_show_doc_bind = 'K'
    " ignore 'import but not used error
    let g:pymode_lint_ignore = "W0611,E231"


    " Auto open cwindow (quickfix) if any errors have been found
    let g:pymode_lint_cwindow = 1
    "  }}}
    Plug 'vim-scripts/rtorrent-syntax-file', {'for' : 'rtorrent'}
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'BohrShaw/vim-vimperator-syntax'
    Plug 'xuhdev/vim-latex-live-preview', {'for' : 'tex'}
    Plug 'LaTeX-Box-Team/LaTeX-Box', {'for' : 'tex'}
    Plug 'hrother/offlineimaprc.vim', {'for' : 'offlineimap'}
    Plug 'reedes/vim-pencil', {'for' : 'markdown'}
    "  {{{
       let g:vim_markdown_folding_disabled = 1
    "  }}}

    " Navagation
    Plug 'scrooloose/nerdtree'
    "  {{{
      nmap <leader>n :NERDTree.<CR>
    "  }}}
    Plug 'Lokaltog/vim-easymotion'
    "  {{{
      let g:EasyMotion_do_mapping = 0 "Disable default mapping
      let g:EasyMotion_smartcase  = 1 "Turn on case insensitive feature
 
      "2-character search motion
      nmap s <Plug>(easymotion-s2)
 
      " JK motions: Line motions
      map <Leader>j <Plug>(easymotion-j)
      map <Leader>k <Plug>(easymotion-k)
    "  }}}
    Plug 'good5dog5/cscopemaps.vim'
    Plug 'Valloric/MatchTagAlways'
    Plug 'majutsushi/tagbar'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'terryma/vim-expand-region'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " {{{
      set rtp+=~/.fzf
      nmap  <space><space> :Files<CR>
      nmap  <leader>a :Buffers<CR>
      nmap  <leader>c :Colors<CR>
      nmap  <leader>; :BLines<CR>
      nmap  <leader>. :Lines<CR>
      nmap  <leader>o :BTags<CR>
      nmap  <leader>O :Tags<CR>
      nmap  <leader>? :History<CR>
      " nmap  K :call SearchWordWithAg()<CR>
      " vmap  K :call SearchVisualSelectionWithAg()<CR>
      nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
      nnoremap <silent> <leader>. :AgIn 
      nmap  <leader>gl :Commits<CR>
      nmap  <leader>ga :BCommits<CR>

      imap <C-x><C-f> <plug>(fzf-complete-file-ag)
      imap <C-x><C-l> <plug>(fzf-complete-line)

      function! SearchWordWithAg()
        execute 'Ag' expand('<cword>')
      endfunction

      function! SearchVisualSelectionWithAg() range
        let old_reg = getreg('"')
        let old_regtype = getregtype('"')
        let old_clipboard = &clipboard
        set clipboard&
        normal! ""gvy
        let selection = getreg('"')
        call setreg('"', old_reg, old_regtype)
        let &clipboard = old_clipboard
        execute 'Ag' selection
      endfunction
    " }}}

    " Good-looking
    " ======================================================= 
    Plug 'bling/vim-airline'
    "  {{{
       let g:airline_powerline_fonts = 1
       " Show just the filename
       let g:airline#extensions#tabline#fnamemod = ':t'

       "Tabline
       " Enable the list of buffers
       let g:airline#extensions#tabline#enabled = 1
       "Enalbe display buffers with a single tab
       let g:airline#extensions#tabline#show_buffers = 1
       let g:airline#extensions#tabline#buffer_idx_mode = 1
       let g:airline#extensions#tabline#fnamecollapse = 1
       let g:airline#extensions#tabline#show_close_button = 0
       let g:airline#extensions#tabline#show_tab_type = 0

       nmap <leader>1 <Plug>AirlineSelectTab1
       nmap <leader>2 <Plug>AirlineSelectTab2
       nmap <leader>3 <Plug>AirlineSelectTab3
       nmap <leader>4 <Plug>AirlineSelectTab4
       nmap <leader>5 <Plug>AirlineSelectTab5
       nmap <leader>6 <Plug>AirlineSelectTab6
       nmap <leader>7 <Plug>AirlineSelectTab7
       nmap <leader>8 <Plug>AirlineSelectTab8
       nmap <leader>9 <Plug>AirlineSelectTab9
    "  }}}

    Plug 'junegunn/vim-easy-align'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'chrisbra/Colorizer'
    "『盘古之白』中文排版自动规范化的 Vim 插件 
    " Plug 'hotoo/pangu.vim'
    " {{{
        " autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()
    " }}}

    " Auto-complete
    " ======================================================= 
    Plug 'Valloric/YouCompleteMe'
    " {{{
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
      let g:ycm_filetype_blacklist = { 'markdown': 1 }

      let g:ycm_server_python_interpreter = "/usr/bin/python2.7"
      nmap <leader>gl :YcmCompleter GoToDeclaration<CR>
      nmap <leader>gf :YcmCompleter GoToDefinition<CR>
      nmap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
    " }}}
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    Plug 'marijnh/tern_for_vim'
    Plug 'Raimondi/delimitMate'
    " Snippets
    Plug 'SirVer/ultisnips'
    " {{{
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

      nmap <leader>+ =:set syntax=javascript<CR>
    " }}}
    Plug 'good5dog5/vim-snippets'

    Plug 'ervandew/supertab'
    Plug 'rking/ag.vim'
    "  {{{
        nmap <leader>g :Ag <c-r>=expand("<cword>")<cr><cr>
        nnoremap <space>/ :Ag
    "   }}}
    Plug 'nelstrom/vim-visual-star-search'
    "An extensible & universal comment vim-plugin that also handles embedded filetypes
    Plug 'tomtom/tcomment_vim'
    Plug 'godlygeek/tabular'
    Plug 'tpope/vim-surround'

    "asynchronous build and test dispatcher
    Plug 'tpope/vim-dispatch'
    Plug 'wannesm/wmgraphviz.vim'

    Plug 'thinca/vim-quickrun'
    " {{{
        let g:quickrun_config = {
        \   "_" : {
        \       "outputter" : "message",
        \   },
        \}
        let g:quickrun_no_default_key_mappings = 1
        nmap <Leader>r <Plug>(quickrun)
        map <F10> :QuickRun<CR>
     " }}}
     Plug 'junegunn/goyo.vim'
     Plug 'vimwiki/vimwiki'
     " {{{
        " Vimwiki config
        " see `http://superuser.com/questions/495889/have-vimwiki-set-filetype-only-within-wikihome`

        " stop vimwiki taking over markdown files
        let g:vimwiki_ext2syntax = {}

        " config for default/first wiki
        let s:vimwiki = {}

        let s:vimwiki.syntax = 'markdown'
        let s:vimwiki.ext = '.md'
        let s:vimwiki.diary_rel_path = 'logbook'
        let s:vimwiki.diary_index = 'index'
        let s:vimwiki.diary_header = 'Log Book'
        let s:vimwiki.diary_sort = 'asc'
        let s:vimwiki.path = "$HOME/Dropbox/mywiki/wikidata"

        " Get Vimwiki working with SnipMate
        " Check https://stackoverflow.com/questions/12033273/get-vimwiki-working-with-snipmate-the-vim-plugins
        " 
        let g:vimwiki_table_mappings = 0

        let g:vimwiki_list = [s:vimwiki]
        au! BufWritePost ~/Dropbox/mywiki/wikidata/* silent! execute  '!git add % && git commit -m "Auto commit." &&
                    \ !bash "$HOME/Dropbox/mywiki/run.sh restart" > /dev/null' | redraw!
    " }}}
     Plug 'jamessan/vim-gnupg'
     " {{{
        let g:GPGPreferArmor=1
        let g:GPGDefaultRecipients=["good5dog5@gmail.com"]
     " }}}
     Plug 'tpope/vim-fugitive'


    call plug#end()
 
 
    set fdm=syntax
    set foldnestmax=8
    set foldcolumn=3
    " Automatically refresh any unchanged files
    set autoread
 
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

    "No bells
    set noerrorbells visualbell t_vb=

    set switchbuf+=usetab

    set showcmd          " Show (partial) command in status line.
    set incsearch        " Incremental search


    set wildmode=list:longest,full
    "Complete options (disable preview scratch window, longest removed to aways show menu
    set completeopt=menu,menuone
    " Limit popup menu height
    set pumheight=20


    " undo info
    if !isdirectory($HOME."/.vim")
        call mkdir($HOME."/.vim", "", 0770)
    endif
    if !isdirectory($HOME."/.vim/undo-dir")
        call mkdir($HOME."/.vim/undo-dir", "", 0700)
    endif
    set undodir=~/.vim/undo-dir
    set undofile


    " Backups and swapfile
    set backup
    set backupdir=$HOME/.vim/backup/
    silent execute '!mkdir -p $HOME/.vim/backup'
    set noswapfile
" }}}
" [ User interface   ] {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Vim user interface                    "         
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set modeline
    set modelines=3
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

if has("gui_running")
	set guioptions-=T
	set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 14
endif

    colorscheme kolor
	set background=dark
    " set t_Co=256
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
    nnoremap <CR> :noh<CR>

    nmap <leader>v :edit $MYVIMRC<CR>
    nmap <leader>R :source $MYVIMRC<CR>

    " Quick way to save file
    nnoremap qq        :q<CR>

    " Select all text
    noremap vA ggVG


    "sts the lines matching the word under the cursor from the beginning of the file, and then asks you which match you want to jump to, and finally, jumps to that match.
    "reference http://superuser.com/questions/692548/go-to-lines-matched-by-i-command-to-display-lines-with-word-under-the-cursor
    nmap <leader>F [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Close current buffer
    nmap <leader>q :bn<bar>bd#<CR>
    " Move to the next buffer
    nmap <leader>l :bnext<CR>
    " Move to the previous buffer
    nmap <leader>h :bprevious<CR>

    nmap <leader><Tab> <C-W><C-W>

    nmap <F8>      :TagbarToggle<CR>
    let g:tagbar_autofocus = 1

    "Replace word staring from cursor postion"
    nmap <leader>S :.,$s/\<<C-r><C-w>\>/
    "Replace select word (save in register ")
    "Idea from http://asktherelic.com/2011/04/02/on-easily-replacing-text-in-vim/
    vmap <Leader>s "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/

    nmap ,d :b#<bar>bd#<CR>

    imap jk <Esc>

    vmap <C-c> :!xclip -f -sel clip<CR><CR>
    vmap <C-x> "+d
    nmap <C-p> :r!xclip -o -sel clip<CR><CR>
    " vmap "+y :!xclip -f -sel clip
    " map "+p :r!xclip -o -sel clip
    cmap w! w !sudo tee % >/dev/null

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

    "Turns off Vim’s crazy default regex characters and makes searches use normal regexes
    nnoremap / /\v
    vnoremap / /\v

    "Select the last changed (or pasted) tex
    "reference http://vim.wikia.com/wiki/Selecting_your_pasted_texj 
    " nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

    " Strips whitespace
    nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

    " Save
    noremap  <silent> <C-S> :update<CR>
    vnoremap <silent> <C-S> <C-C>:update<CR>
    inoremap <silent> <C-S> <C-O>:update<CR>

" }}}
" [ Plugin configure ] {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Plugin configure                   "        

    " vim-airline {{{2
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

     "}}}
    "UltiSnips {{{2

     "}}}
    "Tern_for_vim {{{2

        nmap _d :TernDef<CR>
        nmap _D :TernDoc<CR>
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

    " vim-latex-live-preview {{{1
        let g:livepreview_previewer = 'zathura'
        nmap <F12> :LLPStartPreview<cr>
    "}}}
    " vim-markdown {{{1

        let g:vim_markdown_frontmatter=1
    "}}}

" }}}
" [ Auto command   ] {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Auto command                       "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    autocmd FileType {lua\|vim}               setlocal fdm=marker
    autocmd FileType html                     set omnifunc=htmlcomplete#CompleteTag,
    autocmd FileType javascript               call JavaScriptFold()
    autocmd BufNewFile,BufRead  *.{bash\|sh}* call SetBashOption()
    autocmd BufNewFile,BufRead  *.vim*        set filetype=vim
    autocmd BufNewFile,BufRead  *.htm*        set filetype=javascript
    autocmd BufNewFile,BufRead  *.cgi         set filetype=json
    autocmd BufNewFile,BufRead *.{tex\|cls}  setlocal filetype=tex
    autocmd Filetype tex setl updatetime=1

    "Automatic store folding state while switch between buffers (*.* instead of ?* prevent E32 error message)
    autocmd BufWinLeave ?* mkview!
    autocmd BufWinEnter *.* silent loadview

    "Auto highlight assembly files depands on extension
    autocmd BufRead,BufNewFile *.s set filetype=arm 

    "Open a default template while open c-family file. "
    autocmd BufNewFile * silent! 0r ~/.vim/template/template.%:e

    autocmd BufNewFile,BufRead *.md  setlocal filetype=markdown 
    autocmd Filetype make\|markdown  setlocal noexpandtab
    autocmd BufNewFile,BufRead *.md  setlocal nospell 
    autocmd BufNewFile,BufRead *.md  setlocal textwidth=100
    autocmd BufNewFile,BufRead *gdb*  set filetype=gdb
    autocmd BufNewFile,BufRead *.py call SetPythonOption() 

    " For nand2tetris use
    autocmd BufNewFile,BufRead *.hdl set filetype=nandhdl

    " autocmd VimEnter * if !argc() | NERDTree | endif

    " Set scripts to be executable from the shell
    autocmd BufWritePost *.py call Mode_executable()
    augroup pencil
        autocmd!
        autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
    augroup END

    " Workaround for python-mode :PymodeDoc，which rasie E21 modifiable off error
    " ref https://www.bountysource.com/issues/9393603-vim-error-cannot-make-changes-modifiable-is-off?utm_campaign=plugin&utm_content=tracker/42165&utm_medium=issues&utm_source=github
    autocmd FileType qf,rst :setlocal modifiable
    autocmd FileType qf,rst :set modifiable





" [ My function   ] {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       My function                        "        
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
     set foldmethod=indent
     set foldnestmax=2
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


function! Mode_executable()
    if (getline(1) =~ "^#!")
        silent !chmod +x % 
    endif
endfunction

"// vim: set foldmethod=marker:
