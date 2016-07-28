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
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'shumphrey/fugitive-gitlab.vim'
" }}}
" Essentials {{{
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'godlygeek/tabular'
" }}}
" Extras {{{
Plugin 'PeterRincker/vim-argumentative'
Plugin 'mtth/Scratch.vim'
Plugin 'mileszs/ack.vim'
Plugin 'sjl/gundo.vim'
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/SyntaxComplete'
if has("python") || has("python3")
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
else
  Plugin 'drmingdrmer/xptemplate'
endif
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'fmoralesc/vim-pad'
" }}}
" Special {{{
Plugin 'diepm/vim-rest-console'
Plugin 'JalaiAmitahl/maven-compiler.vim'
" }}}
" Filetype specific {{{

Plugin 'lervag/vimtex'

Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tmhedberg/SimpylFold'
Plugin 'heavenshell/vim-pydocstring'
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
Plugin 'jceb/vim-orgmode'
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
" if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
"   set t_Co=16
" endif
set linebreak
if exists('+breakindent')
  set breakindent
  let &showbreak = '+++ '
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


set list
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
  let &listchars = "tab:\u21e5\u00b7,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  let &fillchars = "vert:\u259a,fold:\u00b7"
else
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif

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
" {{{ Tabs, spaces, wrapping
set autoindent
set smarttab
set tabstop=8
" Note that shiftwidth is handled by sleuth
set softtabstop=4
set expandtab
set wrap
" }}}
" handy for vinegar and so on
set autowrite
set autoread

"experimental
set timeoutlen=1200
set ttimeoutlen=50

" round indent to multiples of shiftwidth °_ °
set shiftround
set ignorecase
set smartcase
set incsearch
set hlsearch
syntax on
let g:tex_flavor = 'latex'
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
"}}}
" Section: Statusline and Colors {{{ "
set showcmd " display incomplete commands
set ruler
set laststatus=2
set showtabline=2
" recommended by flagship
set guioptions-=e
set title

set statusline=[%n%M]\ %<%t\ ~=\ %Y\ %([tw=%{&textwidth}\ sw=%{&shiftwidth}]%)%=%l,%c%V\ %P

augroup lpag_flagship
  au!
  autocmd User Flags call Hoist("buffer", {'hl':['StatusLine','StatusLineNC']}, function('fugitive#statusline'))
  autocmd User Flags call Hoist("window", {'hl':['StatusLine','StatusLineNC']}, "SyntasticStatuslineFlag")
  autocmd User Flags call Hoist("global", "%{&ignorecase ? '[IC]' : ''}")
  " autocmd User Flags call Hoist("buffer", "%{&path}")
augroup END
" I am the evil squirrel, I steal colors from the bad wolf
" :redir @a | :hi StatusLine | :redir END | :put a

" function! s:Fesch(...) abort
"   "a:1 normal mode bg
"   "a:2 insert mode bg
"   "a:3 inactive bg
"   "a:4 (in-) active fg
"   "if no argument given, resets autocmds
"   " clean this up TODO
"   augroup fancy_statusline
"     autocmd!
"     if a:0 >= 4
"       " Force fg color of Status- and Tabline
"       exe 'highlight StatusLine ctermfg='.a:4
"       exe 'highlight StatusLineNC ctermfg='.a:4
"       exe 'highlight TabLine ctermfg='.a:4
"       exe 'highlight TabLineSel ctermfg='.a:4
"     endif
"     if a:0 >= 3
"       " Set colors of Statusline and Tabline (active and inactive)
"       exe 'highlight StatusLineNC ctermbg='.a:3
"       exe 'highlight TabLine ctermbg='.a:3
"       exe 'highlight TabLineSel ctermbg='.a:1
"     endif
"     if a:0 >= 2
"       " Insert mode color change
"       exe 'highlight StatusLine ctermbg='.a:1
"       exe 'autocmd InsertLeave * hi StatusLine ctermbg='.a:1
"       exe 'autocmd InsertEnter * hi StatusLine ctermbg='.a:2
"     endif
"   augroup END
" endfunction

set background=dark
silent! colorscheme vitamins
set colorcolumn=+1

" }}} Statusline and Colors"
" Section: Mappings {{{
let mapleader = ","
let maplocalleader = "ü"
" German keyboard layout
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

nmap Q gqip

" forward tick is some of the strongest mappings on the german keyboard
map <C-ä> <C-]>
nnoremap ´ :%s/
vnoremap ´ :s/
cnoremap ´s \(\)<Left><Left>

" + as : saves shift mnemonic as in 'vim +{cmd}'
nnoremap + :
vnoremap + :


nnoremap gb :edit #<cr>

nnoremap <Space> za
nnoremap s :w<CR>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


" By T. <the> Pope
if exists(":nohls")
  nnoremap <silent> <C-L> :nohls<CR><C-L>
end

inoremap <C-K><C-K> <esc>:help digraph-table<cr>

" start of line
cnoremap <C-A> <Home>
" back one character
cnoremap <C-B> <Left>
" delete character under cursor
cnoremap <C-D> <Del>
" end of line
cnoremap <C-E> <End>
" forward one character
cnoremap <C-F> <Right>
" recall newer command-line
cnoremap <C-N> <Down>
" recall previous (older) command-line
cnoremap <C-P> <Up>
" back one word
cnoremap <Esc> <C-B><S-Left>
" forward one word
cnoremap <Esc> <C-F><S-Right>


inoremap <C-U> <C-G>u<C-U>
inoremap <C-C> <Esc>`^

noremap <F2> :NERDTreeToggle<CR>
" make this toggling
noremap <F5> :Scratch<CR>
noremap <silent> <F6> :if exists(':Gstatus')<Bar>exe 'Gstatus'<Bar>endif<CR>
noremap <F7> :lcd %:p:h<CR>
noremap <F8> :Make<CR>
noremap <F9> :Dispatch<CR>
noremap <F10> :Start<CR>

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

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>

nnoremap <leader>tf :TableFormat<CR>
vnoremap <leader>tf :TableFormat<CR>

" find double (nested) brackets
nnoremap <leader>nb /([^)]\{-}([^)]\{-})[^)]\{-})<CR>

" open pdf
nnoremap <leader>vp :!okular %:r.pdf<cr>


" make jk, H and L more useful on indented lines and while wrapping
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap H ^
nnoremap L $

nnoremap <leader>dt mq:%s/\v +$//<CR>`q
nnoremap <leader>. :<Up><CR>
nnoremap <leader>= mqgg=G`q

nnoremap <leader>fc :echom foldlevel('.')<CR>
" Toggle Help/Text Filetypes;
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
  autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
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
augroup ft_tex
  autocmd!
  autocmd FileType tex
        \ let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
        \| let b:surround_{char2nr("e")} =
        \ "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
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
augroup END
" }}}
" Pandoc {{{
  au FileType pandoc iabbrev <buffer> -> $\rightarrow$
  au FileType pandoc iabbrev <buffer> phi $\phi$
  au FileType pandoc iabbrev <buffer> psi $\psi$
  au FileType pandoc iabbrev <buffer> Phi $\phi$
  au FileType pandoc iabbrev <buffer> Psi $\psi$
  au FileType pandoc nnoremap <buffer> <F3> :TOC<CR>
  au FileType pandoc setlocal makeprg=pandoc\ %\ -o\ %:r.pdf\ -sN
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
  au FileType qf setlocal colorcolumn=0 nolist
augroup END
" }}}
" {{{ Java
augroup ft_java
  autocmd!
  autocmd FileType java iabbrev <buffer> print System.out.println);<left><left>
  autocmd FileType java setlocal foldmethod=syntax foldlevel=1
  autocmd FileType java setlocal makeprg=javac\ %
  " from help=includeexpr
  autocmd FileType java setlocal includeexpr=substitute(v:fname,'\\.','/','g')
augroup END
" }}}
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
  if exists(":" . a:cmd) && !v:count
    let tick = b:changedtick
    exe a:cmd
    if tick == b:changedtick
      execute 'normal! ' . a:default
    endif
  else
    execute 'normal!' . v:count . a:default
  endif
endfunction
nnoremap S :call <SID>or_else("SplitjoinSplit","gqq")<CR>
nnoremap J :call <SID>or_else("SplitjoinJoin","J")<CR>
" }}}
" UltiSnips {{{
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsListSnippets = '<C-\>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
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
      \ "passive_filetypes": ["pandoc", "java"]}
let g:syntastic_auto_jump = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_aggregate_errors = 1
let g:syntastic_id_checkers = 1
let g:syntastic_error_symbol = "\u2717"
let g:syntastic_warning_symbol = "\u26A0"
let g:syntastic_auto_loc_list = 0

" Warning 1: Command terminated with space
" Warning 8: wrong length of dash
let g:syntastic_tex_checkers = ["chktex"]
"n1 commands ending in nothing are ok sometimes
"n8 I KNOW WHAT TYPE OF DASHES I USE
let g:syntastic_tex_chktex_args = "-n1 -n8"

" Python Checkers
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_flake8_exec = '/usr/bin/python3'
let g:syntastic_python_flake8_args = '-m flake8'
" }}}
" Pandoc {{{
let g:pandoc#command#autoexec_command = "Pandoc! pdf -sN"
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#filetypes#handled = ["pandoc"]
let g:pandoc#folding#fdc = 0
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
let g:vimtex_imaps_leader = '`'

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_comments = 1
let g:vimtex_indent_enabled = 1
let g:vimtex_indent_bib_enabled = 1
let g:vimtex_format_enabled = 1
augroup vimtex_mappings
  au!
  au User VimtexEventInitPost nmap <F3> <plug>(vimtex-toc-toggle)
  au User VimtexEventInitPost nmap ¸ <plug>(vimtex-cmd-create)
  au User VimtexEventInitPost imap ¸ <plug>(vimtex-cmd-create)
augroup END
" }}}
" VRC {{{
let g:vrc_allow_get_request_body = 1
" }}}
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
" csv {{{
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024 * 1024

" }}}
