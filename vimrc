" File: .vimrc
" Author: Lukas Galke
" Email: vim@lpag.de
" Description: A rapidly evolving vimrc file

" Section: Plugins {{{
set nocompatible "be iMproved
set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Tpopes plugins are neat. {{{
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-scriptease'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-vividchalk'
Plugin 'tpope/vim-flagship'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-afterimage'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-ragtag'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'shumphrey/fugitive-gitlab.vim'
" }}}
" Essentials {{{
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'godlygeek/tabular'
" }}}
" <Tab>, Completion, and Snippets {{{ "
" Plugin 'ervandew/supertab'

" if has("lua")
  " Plugin 'Shougo/neocomplete.vim'
 " else
" Plugin 'ajh17/VimCompletesMe'
Plugin 'ervandew/supertab'
"maybe Supertab!?
" endif

if has("python") || has("python3")
  Plugin 'SirVer/ultisnips'
else
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
endif
Plugin 'honza/vim-snippets'
" }}} Completion and Snippets "
" Extras {{{
Plugin 'PeterRincker/vim-argumentative'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mtth/Scratch.vim'
Plugin 'mileszs/ack.vim'
Plugin 'sjl/gundo.vim'
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" Plugin 'vim-scripts/SyntaxComplete'

Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'fmoralesc/vim-pad'
" }}}
" Special {{{
Plugin 'diepm/vim-rest-console'
Plugin 'JalaiAmitahl/maven-compiler.vim'
" }}}
" FileType specific {{{

Plugin 'lervag/vimtex'

" Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-skeletons'
Plugin 'vim-erlang/erlang-motions.vim'
Plugin 'raichoo/haskell-vim'
Plugin 'chrisbra/csv.vim'
Plugin 'wannesm/wmgraphviz.vim'
Plugin 'JuliaLang/julia-vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'freitass/todo.txt-vim'
" }}}
" Highly experimental {{{
" Plugin 'jiangmiao/auto-pairs' USE SURROND :S
Plugin 'jceb/vim-orgmode'
" Plugin 'Raimondi/delimitMate'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'szw/vim-tags'
Plugin 'dhruvasagar/vim-dotoo'
" }}}
" Colorschemes {{{
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'fmoralesc/vim-vitamins'
" }}}
call vundle#end()
call vifi#interface('~/.vim/vifi')
execute pathogen#infect('src/{}', 'vifi/{}')
filetype plugin indent on
" }}}
" Section: Basic Settings {{{ "
" utf8!
set encoding=utf-8
set visualbell
" indenting
" always display status line
" store undos
if exists('+undofile')
  set undofile
end
set history=1000
set backspace=2
set lazyredraw
set virtualedit=block
" inspired by sensible.vim, but changeable
set sessionoptions-=options
" set complete-=i
set tabpagemax=25
set nrformats-=octal
set foldopen+=jump
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('conceal')
  " set concealcursor=v
  set conceallevel=2
endif

" Decluttering (thanks sjl)
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Display related {{{ "
set list
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
  let &listchars = "tab:\u21e5\u00b7,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  let &fillchars = "vert:\u259a,fold:\u00b7"
else
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif

set wrap
set linebreak
if exists('+breakindent')
  set breakindent
  let &showbreak = '»'
endif
" }}} Display related "

" scrolling
set scrolloff=1
set sidescrolloff=5

" numbers
set number
set relativenumber

" Spells
set spelllang=en_us

" Wild Menu {{{
set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,.*.un~,*.pyc,*.o,*.hi,*.beam,*.class
set wildignore+=*.aux,*.out,*.toc
" }}}
" {{{ Tabs, Spaces, Basic movement
set autoindent
set smarttab
set tabstop=8
set shiftround
" Note that shiftwidth is handled by sleuth
set softtabstop=4
set expandtab

" make jk, H and L more useful on indented lines and while wrapping
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap H ^
nnoremap L $
" }}}
" handy for vinegar and so on
set autowrite
set autoread

"experimental
set timeoutlen=1200
set ttimeoutlen=50
" Searching {{{ "
set ignorecase
set smartcase
set incsearch
set hlsearch
" }}} Searching "
syntax on
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
" let g:tex_fast = 'bcmMprsSvV'
"}}}
" Section: Statusline and Colors {{{ "
set showcmd " display incomplete commands
set ruler
set laststatus=2
set showtabline=2
" recommended by flagship
set guioptions-=e
set title

set statusline=[%n%M]\ %<%t\ ~=\ %Y\ %([tw=%{&textwidth}\ ts=%{&tabstop}\ sw=%{&shiftwidth}\ %{&expandtab?'et':'noet'}]%)%=%l,%c%V\ %P

augroup lpag_flagship
  au!
  autocmd User Flags call Hoist("buffer", {'hl':['StatusLine','StatusLineNC']}, function('fugitive#statusline'))
  autocmd User Flags call Hoist("window", {'hl':['StatusLine','StatusLineNC']}, "SyntasticStatuslineFlag")
  autocmd User Flags call Hoist("global", "%{&ignorecase ? '[IC]' : ''}")
  " autocmd User Flags call Hoist("buffer", "%{&path}")
augroup END

set background=dark
silent! colorscheme luciddye
set colorcolumn=+1

" }}} Statusline and Colors"
" Section: Mappings {{{
let mapleader = ","
let maplocalleader = "ü"
" German Keyboard Layout {{{ "
" Searching with ß. should feel very natural along with the usual ?
map ß /

" Its not very handy to move around with altgr
map ö [
map ä ]
map Ö {
map Ä }
"" Section movements
map öö [[
map öä []
map äö ][
map ää ]]

" + as : saves shift, mnemonic as in 'vim +{cmd}'
nnoremap + :
vnoremap + :
" }}} German Keyboard Layout "

nmap Q gqip

" forward tick is some of the strongest mappings on the german keyboard
nnoremap <C-S> :%s/
vnoremap <C-S> :s/
cnoremap ´s \(\)<Left><Left>


nnoremap <Space> za
nnoremap z0 zMzv


nnoremap s :w<CR>
" Resizing {{{ "
" y = x*3/2 + 1
" (y-1) * 2/3 = x
nnoremap <silent> <Up> :exe "resize " . (winheight(0) * 3/2 + 1)<CR>
nnoremap <silent> <Down> :exe "resize " . ((winheight(0)-1) * 2/3 - 1)<CR>
nnoremap <silent> <Right> :exe "vertical resize " . (winwidth(0) * 3/2 + 1)<CR>
nnoremap <silent> <Left> :exe "vertical resize " . ((winwidth(0)-1) * 2/3)<CR>
" }}} Resizing "

" By T. <the> Pope
if exists(":nohls")
  nnoremap <silent> <C-L> :nohls<CR><C-L>
end

" Insert mode {{{ "
inoremap <C-R><C-K> <esc>:help digraph-table<cr>
inoremap <C-J> <Down>
inoremap <C-K><C-K> <Up>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-E> <Esc>A
inoremap <C-C> <Esc>`^
" }}} Insert mode "

" F Keys {{{ "
noremap <F2> :NERDTreeToggle<CR>
" F3 is ft specific TOC
nnoremap <F4> :TagbarToggle<CR>
noremap <F5> :GundoToggle<CR>
nmap <F6> :if &previewwindow<Bar>pclose<Bar>elseif exists(':Gstatus')<Bar>exe 'Gstatus'<Bar>else<Bar>ls<Bar>endif<CR>
" include ProjectCD from eclim?
map <silent> <F7> :if exists(':Lcd')<Bar>exe 'Lcd'<Bar>elseif exists(':Cd')<Bar>exe 'Cd'<Bar>else<Bar>lcd %:h<Bar>endif<CR>
noremap <F8> :Make<CR>
noremap <F9> :Dispatch<CR>
noremap <F10> :Start<CR>
" }}} F Keys "

" Quick Access {{{ "
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>:filetype detect<CR>zv
nnoremap <leader>ep :vsplit ~/.plan/README.markdown<CR>
nnoremap <leader>et :vsplit ~/.tmux.conf<CR>
nnoremap <leader>ea :Vsplit after/plugin/abolish.vim<CR>
nnoremap <leader>eq :split ~/.config/qutebrowser/keys.conf<CR>
nnoremap <leader>ec :Vvsplit colors/luciddye.vim<CR>
" }}} Quick Access "
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>pu :PluginUpdate<CR>
nnoremap <leader>pc :PluginClean<CR>
nnoremap <leader>ps :PluginSearch

nnoremap <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<CR>

" Sorting {{{ "
nnoremap <leader>ss vip:sort<cr>
vnoremap <leader>ss :sort<cr>
nnoremap <leader>s. vip:sort! rf /\.\d*/<cr>
vnoremap <leader>s. :sort! rf /\.\d*/<cr>
" }}} Sorting "

nnoremap <leader>tf :TableFormat<CR>
vnoremap <leader>tf :TableFormat<CR>

" find double (nested) brackets
nnoremap <leader>nb /([^)]\{-}([^)]\{-})[^)]\{-})<CR>

" view pdf
nnoremap <leader>vp :!okular %:r.pdf<cr>



nnoremap <leader>dt mq:%s/\v +$//<CR>`q
nnoremap <leader>. :<Up><CR>
nnoremap <leader>= mqgg=G`q

nnoremap <leader>fc :echom foldlevel('.')<CR>
" Toggle Help/Text FileType;
nnoremap <leader>ht :let &ft = (&ft==#"help" ? "text" :
      \(&ft==#"text" ? "help" : &ft))<CR>

nnoremap <leader>; mqA;<esc>`q
" }}}
" Section: Autocmds {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" function! s:resize_min(...) abort
"   if a:0
"     echom "Store cws"
"     let w:stored_width = winwidth(0)
"     let w:stored_height = winheight(0)
"     if a:0 >= 1 && winwidth(0) < a:1
"       execute "vertical resize " . a:1
"     endif
"     if a:0 >= 2 && winheight(0) < a:2
"       execute "resize " . a:2
"     endif
"   else
"     if exists('w:stored_width')
"       execute "vertical resize " . w:stored_width
"     endif
"     if exists('w:stored_width')
"       execute "resize " . w:stored_height
"     endif
"   endif
" endfunction

" augroup winenter_resize
"   au!
"   au WinEnter * call s:resize_min(80, 24)
"   au WinLeave * call s:resize_min()
" augroup END


augroup guess_dispatch
  au!
  autocmd BufReadPost * if getline(1) =~# '^#!'
        \ | let b:dispatch = getline(1)[2:-1] . ' %'
        \ | let b:start = b:dispatch
        \ | endif
augroup END

augroup misc
  autocmd!
  autocmd FileType todo setlocal cursorline
  autocmd FileType help setlocal keywordprg=:help
        \| nnoremap <silent><buffer> q :q<CR>
  " For all text files set 'textwidth' to 78 characters.
  " csv maps
  " autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
augroup END
"}}}
" Section: FileType specific {{{
" Vim {{{
augroup ft_vim
  autocmd!
  autocmd FileType vim setlocal tw=78 fdm=marker
augroup END
"}}}
" Python {{{
let g:python_highlight_all = 1
augroup ft_python
  autocmd!
  autocmd FileType python setlocal textwidth=79
  autocmd FileType python nmap <silent> <buffer> <leader>ds <Plug>(pydocstring)
augroup END
" }}}
" Tex {{{
let g:tex_flavor = 'latex'
augroup ft_tex
  autocmd!
  autocmd FileType tex
        \ let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
        \| let b:surround_{char2nr("e")} =
        \ "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
  autocmd FileType tex inoremap <buffer> & &<Esc>:Tabularize /&<CR>f&a
  autocmd FileType tex setlocal tw=100
  autocmd FileType tex iabbrev w2v <buffer> \emph{word2vec}
  autocmd FileType tex iabbrev d2v <buffer> \emph{doc2vec}
  autocmd FileType tex iabbrev ... <buffer> \dots
  autocmd FileType tex nnoremap <buffer> <leader>eb :vs %:r.bib<CR>
  " TODO investigate how to dynamically enter textwidth
augroup END
" }}}
" Markdown {{{
let g:markdown_fenced_languages = ['python', 'java']
let g:markdown_syntax_conceal = 1
let g:markdown_folding = 1
augroup ft_markdown
  autocmd!
  au FileType markdown setlocal makeprg=mdl\ %
  au FileType markdown let b:dispatch="pandoc -f markdown -t latex -o %:p:r.pdf %"
  au FileType markdown inoremap <buffer> <Bar> <Bar><Esc>:Tabularize/<Bar>/l1<CR>a
augroup END
" }}}
" Pandoc {{{
augroup ft_pandoc
  autocmd!
  au FileType pandoc iabbrev <buffer> -> $\rightarrow$
  au FileType pandoc iabbrev <buffer> phi $\phi$
  au FileType pandoc iabbrev <buffer> psi $\psi$
  au FileType pandoc iabbrev <buffer> Phi $\phi$
  au FileType pandoc iabbrev <buffer> Psi $\psi$
  au FileType pandoc nnoremap <buffer> <F3> :TOC<CR>
  au FileType pandoc setlocal makeprg=pandoc\ %\ -o\ %:r.pdf\ -sN
  au FileType pandoc setlocal textwidth=78
augroup end
" }}}
" Julia {{{
augroup ft_julia
  autocmd!
  autocmd FileType julia let b:endwise_addition = 'end'
        \ | let b:endwise_words =  'if,for,function'
        \ | let b:endwise_syngroups = 'juliaConditional,juliaConditionalBlock,juliaRepeat,JuliaRepeatBlock,juliaBlKeyword,juliaFunctionBlock'
augroup END
" }}}
" Quickfix {{{
augroup ft_quickfix
  autocmd!
  au FileType qf setlocal colorcolumn=0 nolist cursorline
augroup END
" }}}
" {{{ Java
let java_highlight_java_lang_ids = 1
" let java_highlight_all = 1 "requires javaid.vim
" let java_highlight_functions = "style"
let java_highlight_debug = 1
let java_minlines = 50
augroup ft_java
  autocmd!
  autocmd FileType java iabbrev <buffer> print System.out.println);<left><left>
  " autocmd FileType java setlocal foldmethod=marker foldmarker={,}
  autocmd FileType java setlocal foldmethod=syntax foldlevel=1
  " from help=includeexpr
  autocmd FileType java setlocal includeexpr=substitute(v:fname,'\\.','/','g')
  autocmd FileType java let b:surround_101 = "\r\n}"
  " autocmd FileType java let formatprg=:JavaFormat
"}}}
" Haskell {{{
augroup ft_haskell
  autocmd!
  autocmd FileType haskell let b:dispatch="ghc %"
augroup END
" }}}
" Erlang {{{
augroup ft_erlang
  autocmd!
  autocmd FileType erlang let b:endwise_addition = 'end'
        \ | let  b:endwise_words = 'fun,receive'
        \ | let b:endwise_syngroups = 'erlangKeyword'
  autocmd FileType erlang let b:dispatch = "erlc %"
  autocmd FileType erlang setlocal makeprg=erlc\ %
augroup END
" }}}
" csv {{{
augroup csv_mappings
  autocmd!
  autocmd FileType csv nnoremap <buffer> <localleader>ac :%ArrangeColumn!<CR>
  autocmd FileType csv nnoremap <buffer> <localleader>uc :%UnArrangeColumn<CR>
  autocmd FileType csv nnoremap <buffer> o
        \ :<C-U>execute "CSVNewRecord ". v:count1<CR>
  autocmd FileType csv setlocal cursorline equalprg=":ArrangeColumn"
augroup END
" }}}
" scala {{{ "
augroup ft_scala
  " this one is which you're most likely to use?
  autocmd BufRead,BufNewFile scala setfiletype scala
  autocmd FileType scala setlocal makeprg=scalac\ %
  autocmd FileType scala let b:dispatch = "scala %"
  autocmd FileType scala let b:start = "scala"
augroup end
" }}} scala "
" dot {{{ "
augroup ft_dot
  " this one is which you're most likely to use?
  autocmd FileType dot setlocal commentstring=//\ %s
augroup end
" }}} dot "
" ft_bib {{{ "
augroup ft_bib
  " this one is which you're most likely to use?
  autocmd FileType bib let b:dispatch="biber %"
augroup end
" }}} ft_bib "
" }}}
" Section: Plugin settings {{{
" Fugitive {{{
let g:fugitive_gitlab_domains = ['git.informatik.uni-kiel.de']
" }}}
" Splitjoin {{{
let g:splitjoin_normalize_whitespace = 1
let g:splitjoin_align = 1
let g:splitjoin_split_mapping = ""
let g:splitjoin_join_mapping = ""
let g:splitjoin_python_brackets_on_separate_lines = 0
" Thanks Mr. Pope
function! s:or_else(cmd, default, ...) abort
  let result = a:cmd
  if exists(":" . a:cmd) && !v:count
    let tick = b:changedtick
    exe a:cmd
    if tick == b:changedtick
      execute 'normal! ' . a:default
      let result = a:default
    endif
  else
    execute 'normal!' . v:count . a:default
    let result = a:default
  endif
  if !a:0
    echom result
  endif
endfunction
nnoremap S :call <SID>or_else("SplitjoinSplit","gqq")<CR>
nnoremap J :call <SID>or_else("SplitjoinJoin","J")<CR>
" }}}
" CtrlP {{{ "
nnoremap <leader>ts :CtrlPTag<CR>
let g:ctrlp_types = ['mru', 'fil']
let g:ctrlp_extensions = ['tag']
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" }}} CtrlP "
" VimCompletesMe{{{
augroup VimCompletesMeTex
  autocmd!
  " See vimtex help
  autocmd FileType tex let b:vcm_omni_pattern =
        \ '\v\\%('
        \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
        \ . '|hyperref\s*\[[^]]*'
        \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|%(include%(only)?|input)\s*\{[^}]*'
        \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . ')'
augroup END
" }}}
" UltiSnips {{{
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsListSnippets = '<C-R><Tab>'
let g:UltiSnipsJumpForwardTrigger= '<C-J>'
let g:UltiSnipsJumpBackwardTrigger= '<C-K>'
" }}}
" Snipmate {{{
" let g:snipMate = get(g:, 'snipMate', {}) " allow vimrc resourcing
" let g:snips_author = "Lukas Galke"
" imap <C-J> <Plug>snipMateNextOrTrigger
" imap <C-K> <Plug>snipMateBack
" imap <C-R><C-J> <Plug>snipMateShow
" vmap <C-J> <Plug>snipMateVisual
" }}}
" {{{ XPTemplate
let g:xptemplate_vars='$author=Lukas Galke&$email=vim@lpag.de'
let g:xptemplate_key='´'
let g:xptemplate_key_visual = '´'
let g:xptemplate_nav_next = '<C-j>'
let g:xptemplate_nav_prev = '<C-k>'
" }}}
" {{{ Nerdtree
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeRespectWildIgnore = 1
" }}}
" Syntastic {{{
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "active_filetypes" : [],
      \ "passive_filetypes": ["pandoc"]}
let g:syntastic_auto_jump = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_aggregate_errors = 1
let g:syntastic_id_checkers = 1
" let g:syntastic_error_symbol = "\u2717"
" let g:syntastic_warning_symbol = "\u26A0"
let g:syntastic_auto_loc_list = 0

" Warning 1: Command terminated with space
" Warning 8: wrong length of dash
let g:syntastic_tex_checkers = ["chktex", "lacheck"]
"n1 commands ending in nothing are ok sometimes
"n8 I KNOW WHAT TYPE OF DASHES I USE
let g:syntastic_tex_chktex_args = "-n1 -n8"

" Python Checkers
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_flake8_exec = '/usr/bin/python3'
let g:syntastic_python_flake8_args = '-m flake8'
" }}}
" Eclim {{{ "
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimBrowser = 'qutebrowser'
" }}} Eclim "
" Pandoc {{{
" let g:pandoc#command#autoexec_on_writes = 1
" let g:pandoc#command#autoexec_command = "Pandoc! pdf -sN"

let g:pandoc#folding#fold_yaml = 1
let g:pandoc#folding#fold_fenced_codeblocks = 1

let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#filetypes#handled = ["pandoc"]

let g:pandoc#folding#fdc = 1
let g:pandoc#formatting#mode = "ha"
let g:pandoc#formatting#equalprg = ''

let g:pandoc#toc#position = "right"
let g:pandoc#toc#close_after_navigating = 1

let g:pandoc#modules#disabled = ["menu"]

let g:pandoc#syntax#conceal#urls = 1
"}}}
" Vimtex {{{
let g:vimtex_latexmk_continuous = 0
let g:vimtex_latexmk_background = 1
let g:vimtex_latexmk_callback = 0

" glory of the german keyboard
" let g:vimtex_imaps_leader = '`'

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_preamble = 1
let g:vimtex_fold_comments = 1
let g:vimtex_indent_enabled = 1
let g:vimtex_indent_bib_enabled = 1
let g:vimtex_format_enabled = 0
augroup vimtex_mappings
  au!
  au User VimtexEventInitPost nmap <F3> <plug>(vimtex-toc-toggle)
  au User VimtexEventInitPost nmap ´ <plug>(vimtex-cmd-create)
  au User VimtexEventInitPost imap ´ <plug>(vimtex-cmd-create)
augroup END
" }}} VRC {{{
let g:vrc_allow_get_request_body = 1
let g:vrc_trigger = '<C-j>'
" }}}
" vim-tags {{{ "
let vim_tags_use_vim_dispatch = 1
let vim_tags_cache_dir = fnamemodify('~/.vim/tmp', ':p')
" }}} vim-tags "
" Pad {{{
let g:pad#dir = '~/Notes'
let g:pad#local_dir = 'notes'
let g:pad#default_format = 'pandoc'
" }}}
" Python-mode {{{
" let g:pymode_python = 'python3'
" the following are the defaults
" let g:pymode_indent = []
" let g:pymode_folding = 1
" let g:pymode_motion = 1
" let g:pymode_doc = 1
" let g:pymode_doc_bind = 'K'
" let g:pymode_virtualenv = 1
" }}}
" todo.txt {{{ "
" moved to colors luciddye
" hi! link TodoPriorityA Statement
" hi! link TodoPriorityB Identifier
" hi! link TodoPriorityC Constant
" hi! link TodoContext String
" hi! link TodoProject Type
" }}} todo.txt "
" csv {{{
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024 * 1024

" }}}
" ragtag {{{ "
let g:ragtag_global_maps = 1
" }}} ragtag "
" supertab {{{ "
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-p>"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<c-x><c-o>"]
" autocmd FileType * 
"       \ if &omnifunc != '' |
"       \ call SuperTabChain(&omnifunc, "<c-p>") |
"       " \ call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"       \ endif
" }}} supertab "
" delimitmate {{{ "
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
" }}} delimitmate "
" }}}
