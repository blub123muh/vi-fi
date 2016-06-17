" Section: Preamble {{{
" A rapidly evolving vimrc file
" Source:       http://github.com/blub123muh/vi-fi.git
" Maintainer:   Lukas Galke <vi-fi@lpag.de>
" Homepage:     http://lpag.de/
set nocompatible "be iMproved
"}}}
" Section: Plugins {{{
call plug#begin('~/.vim/plugged')
" Tpopes plugins are neat.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-vividchalk'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-dispatch'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'shumphrey/fugitive-gitlab.vim'

" Git Indicators and fancy statusline
Plug 'airblade/vim-gitgutter'

" Syntax checking and CtrlP
Plug 'scrooloose/syntastic'
" Hit Ctrl P for all the navigation
Plug 'ctrlpvim/ctrlp.vim'
" REST console, very useful for elasticsearch and other REST APIs
Plug 'diepm/vim-rest-console'

" Filetype specific
Plug 'lervag/vimtex'
" Indentation of pymode
Plug 'hynek/vim-python-pep8-indent'
"This is too heavy considering we have syntastic already
"Plug 'klen/python-mode'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/erlang-motions.vim'
Plug 'raichoo/haskell-vim'
Plug 'chrisbra/csv.vim'
Plug 'wannesm/wmgraphviz.vim'
Plug 'suan/vim-instant-markdown'
Plug 'JuliaLang/julia-vim'
Plug 'tmux-plugins/vim-tmux'


"Colorscheme
Plug 'sjl/badwolf'
Plug 'jnurmine/Zenburn'
Plug 'KKPMW/moonshine-vim'
Plug 'tomasr/molokai'
"endif
call plug#end() "so this calls filetype plugin indent on????
" }}}
"Section: Basic Settings {{{
" utf8!
set encoding=utf-8
set visualbell
" indenting
set autoindent
set shiftround
set smarttab
set tabstop=8
" Note that shiftwidth is handled by sleuth
set softtabstop=4
set expandtab
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
set complete-=i
set tabpagemax=25
set nrformats-=octal
set foldopen+=jump
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
set linebreak
if exists('+breakindent')
  set breakindent
  let &showbreak = '+++ '
endif

"display options
set laststatus=2
set showtabline=2
set title
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" scrolling
set scrolloff=1
set sidescrolloff=5

" numbers
set number
set relativenumber

" wild menu is cool
set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,.*.un~,*.pyc,*.o,*.hi

" handy for vinegar and so on
set autowrite
set autoread

" chco
syntax on
set background=light
silent! colorscheme vividchalk
set colorcolumn=+1

" statusline
set showcmd " display incomplete commands
set ruler

set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
let g:tex_flavor = 'latex'
"}}}
filetype off
" vifi not sourced atm
call vifi#interface('~/.vim/vifi')
execute pathogen#infect('src/{}')
" Section: Plugin Options{{{
" Builtin Python syntax highlighting
let g:python_highlight_all = 1
" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" experimental
let g:syntastic_always_populate_loc_list = 0
" loc list just clutters...
" let g:syntastic_auto_loc_list = 1

" Warning 1: Command terminated with space
" Warning 8: wrong length of dash
let g:syntastic_tex_checkers = ["chktex"]
let g:syntastic_tex_chktex_args = "-n1 -n8"

" Python Checkers
let g:syntastic_python_checkers = ["pyflakes", "python"]
let g:syntastic_python_python_exec = '/usr/bin/python3'

" Vimtex
let g:vimtex_latexmk_continuous = 1
let g:vimtex_latexmk_background = 1
let g:vimtex_latexmk_callback = 0

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_comments = 1
let g:vimtex_indent_enabled = 1
let g:vimtex_indent_bib_enabled = 1

" VRC
let g:vrc_allow_get_request_body = 1
" let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
"
let g:fugitive_gitlab_domains = ['git.informatik.uni-kiel.de']

" ehm, no?
let g:instant_markdown_autostart = 0
" }}}
" Section: Mappings {{{
let mapleader = ","
let maplocalleader = "\\"

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
" we can safely remap +
" but to what :<

" By T. <the> Pope
if exists(":nohls")
  nnoremap <silent> <C-L> :nohls<CR><C-L>
end
inoremap <C-U> <C-G>u<C-U>
inoremap <C-C> <Esc>`^
inoremap <Esc> <nop>

nnoremap <F9> :Dispatch<CR>

" access files
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ea :Vsplit after/plugin/abolish.vim<CR>
nnoremap <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<CR>

" make jk, H and L more useful on indented lines and while wrapping
" nnoremap j gj
" nnoremap k gk
" nnoremap H ^
" nnoremap L $
" Splitjoin seems to make sense:
" map S to split and J to join?
"
nnoremap S :SplitjoinSplit<CR>
nnoremap J :SplitjoinJoin<CR>

" IN CSV FILES: Why does :Tabularize open fold column?
"               It does not, csv.vim does it. evil evil
" nnoremap cof :let &foldcolumn = (&foldcolumn ? 0 : 4)<CR>

nnoremap <leader>dt :%s/\v +$//<CR>
nnoremap <leader>= mqgg=G`q
nnoremap <leader>fc :echom foldlevel('.')<CR>
" Toggle Help/Text Filetypes;
nnoremap <leader>ht :let &ft = (&ft==#"help" ? "text" :
      \(&ft==#"text" ? "help" : &ft))<CR>

" end of line semicolon; return
nnoremap <leader>; mqA;<esc>`q
" }}}
" Section: Commands {{{
function! s:or_else(fun, default) abort
  if exists(a:fun)
    return a:fun
  else
    return a:default
  endif
endfunction
" }}}
" Section: Autocmds {{{
if has("autocmd")
  filetype plugin indent on
  augroup my_flagship
    autocmd!
    autocmd User Flags call Hoist("window", {'hl':'Todo'}, "SyntasticStatuslineFlag")
  augroup END
  augroup auto_scanning
    autocmd!
    autocmd BufReadPost * if getline(1) =~# '^#!'
          \ | let b:dispatch = getline(1)[2:-1] . ' %'
          \ | let b:start = b:dispatch
          \ | endif
  augroup END

  augroup ft_options
    autocmd!
    autocmd FileType vim setlocal tw=78 fdm=marker

    autocmd FileType zsh let b:dispatch = "source %"

    " I like this idea of tpope/scriptease to remap K for help navigation.
    " I like to use it in helpfiles aswell (just for tag navigation)
    autocmd FileType help nmap <buffer> K <C-]>

    " Modify vim-surround to support vimtex
    autocmd FileType tex
          \ let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
          \| let b:surround_{char2nr("e")} =
          \ "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"

    " Python PEPs allow a little more textwidth
    autocmd FileType python setlocal textwidth=100
    " i want pythonic prints everywhere. even in java
    " just type print(
    autocmd FileType java iabbrev <buffer> print System.out.println);<left><left>
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
    " csv maps
    autocmd FileType csv nnoremap <buffer> <localleader>ac :%ArrangeColumn<CR>
          \| nnoremap <buffer> <localleader>uc :%UnArrangeColumn<CR>
          \| nnoremap <buffer> o :CSVNewRecord<CR>
    " Unfortunately, the instant-markdown plugin requires
    " the npm package instant-markdown-d to be installed
    autocmd FileType markdown
          \nnoremap <buffer> <localleader>ll
          \:InstantMarkdownPreview<CR>
    autocmd FileType erlang let b:dispatch="erlc %"
    autocmd FileType haskell let b:dispatch="ghc %"
  augroup END
endif
"}}}
