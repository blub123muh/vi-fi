" Section: Preamble {{{
" A rapidly evolving vimrc file
" Source:       http://github.com/blub123muh/vi-fi.git
" Maintainer:	Lukas Galke <vi-fi@lpag.de>
" Homepage:     http://lpag.de/
set nocompatible "be iMproved
"}}}
" Section: Plugins {{{
call plug#begin('~/.vim/plugged')
" Tpopes plugins are neat.
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vividchalk'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-speeddating'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Git Indicators and fancy statusline
Plug 'airblade/vim-gitgutter'

" Syntax checking and CtrlP
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'

" Filetype specific
Plug 'lervag/vimtex'
" Indentation of pymode
Plug 'hynek/vim-python-pep8-indent'
"This is too heavy considering we have syntastic already
"Plug 'klen/python-mode'
Plug 'raichoo/haskell-vim'
Plug 'chrisbra/csv.vim'
Plug 'wannesm/wmgraphviz.vim'
Plug 'suan/vim-instant-markdown'
Plug 'JuliaLang/julia-vim'

" REST console, sounds very promising for elasticsearch
Plug 'diepm/vim-rest-console'

"Colorscheme
Plug 'sjl/badwolf'
Plug 'jnurmine/Zenburn'
Plug 'KKPMW/moonshine-vim'
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
" always display status line
set laststatus=2
set showtabline=2
" store undos
if exists('+undofile')
  set undofile
end
set history=1000
set backspace=2
set lazyredraw
set title
set virtualedit=block
set linebreak
set breakindent
let &showbreak = '+++ '
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set tabstop=8
set softtabstop=4
set expandtab

" numbers
set number
set relativenumber

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,.*.un~,*.pyc,*.o

" handy for vinegar and so on
set autowrite
set autoread

" colors
syntax on
set background=dark
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
" Section: Plugin options{{{
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

" Try all checkers
let g:syntastic_python_checkers = ["pyflakes", "python"]
let g:syntastic_python_python_exec = '/usr/bin/python3'

" Vimtex
let g:vimtex_latexmk_continuous = 0
let g:vimtex_latexmk_background = 0
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

" ehm, no?
let g:instant_markdown_autostart = 0
" }}}
" Section: Mappings {{{
let mapleader = ","
let maplocalleader = "ü"

" German keyboard layout
" Searching with ß. should feel very natural along with the usual ?
map ß /

nmap ö [
nmap ä ]
omap ö [
omap ä ]
xmap ö [
xmap ä ]

"" for the help files
nmap äh <C-]>
nmap öh <C-T>
"" Section movements
map öö [[
map öä []
map äö ][
map ää ]]

" By T. <the> pope
if exists(":nohls")
  nnoremap <silent> <C-L> :nohls<CR><C-L>
end
inoremap <C-U> <C-G>u<C-U>
inoremap <C-C> <Esc>`^
inoremap <Esc> <nop>

" Netrw toggle
nnoremap <leader>l :17Lex<cr>


"move lines down and up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP

" access files
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<cr>

" make jk, H and L more useful on indented lines and while wrapping
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $

nnoremap <leader>W :%s/\v +$//<cr>
nnoremap <leader>= mqgg=G`q
nnoremap <leader>fl :echom foldlevel('.')<cr>
" Toggle Help/Text Filetypes
nnoremap <leader>ht :let &ft = (&ft==#"help" ? "text" :
      \(&ft==#"text" ? "help" : &ft))<cr>

" end of line semicolon; return
nnoremap <leader>; mqA;<esc>`q
" }}}
" Section: Commands {{{

call vifi#interface('~/.vim/vifi')
" }}}
" Section: Autocmds {{{
if has("autocmd")
  filetype plugin indent on
  augroup flagship_customization
    autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag", {'hl' : 'Todo'})
    " autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag")
  augroup END

  augroup FT_options
    autocmd Filetype vim setlocal textwidth=78
    autocmd Filetype vim setlocal foldmethod=marker

    " I like this idea of tpope/scriptease to remap K for help navigation.
    " I like to use it in helpfiles aswell (just for tag navigation)
    autocmd FileType help nmap <buffer> K <C-]>

    " Modify vim-surround to support vimtex
    autocmd FileType tex call s:latexSurround()

    function! s:latexSurround()
      let b:surround_{char2nr("e")}
            \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
      let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
    endfunction

    " Python PEPs allow a little more textwidth
    autocmd FileType python setlocal textwidth=79
    " i want pythonic prints everywhere. even in java
    " just type print(
    autocmd FileType java iabbrev <buffer> print
          \System.out.println);<left><left>
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
    " csv maps
    autocmd FileType csv nnoremap <buffer> <localleader>ac :%ArrangeColumn<cr>
    autocmd FileType csv nnoremap <buffer> <localleader>uc :%UnarrangeColumn<cr>
    autocmd FileType csv nnoremap <buffer> <localleader>nr :NewRecord<cr>
    " Unfortunately, the instant-markdown plugin requires
    " the npm package instant-markdown-d to be installed
    autocmd FileType markdown
          \nnoremap <buffer> <localleader>li
          \:InstantMarkdownPreview<cr>
  augroup END
  " Rescue curser position and DiffOrig {{{
  " restores curser position
  " fixed version from
  " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
  function! ResCur()
    if line("'\"") <= line("$")
      normal! g`"
      return 1
    endif
  endfunction

  augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur() | normal! zv
  augroup END
endif
"}}}
"}}}
