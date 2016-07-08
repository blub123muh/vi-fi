" File: .vimrc
" Author: Lukas Galke
" Description: A rapidly evolving vimrc file

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
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-afterimage'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-sexp-mappings-for-regular-people' | Plug 'guns/vim-sexp'
Plug 'shumphrey/fugitive-gitlab.vim' | Plug 'tpope/vim-fugitive'

" Essentials
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/SyntaxComplete'

" Syntax checking
Plug 'scrooloose/syntastic'
" Plug 'klen/python-mode'

" Fuzzy Finder
Plug 'ctrlpvim/ctrlp.vim'

" Snippets
" Breaks Ctrl P and conflicts with flagship
" Plug 'drmingdrmer/xptemplate'
if has("python") || has("python3")
  Plug 'SirVer/ultisnips'
else
  Plug 'garbas/vim-snipmate'
endif
Plug 'honza/vim-snippets'

Plug 'mhinz/vim-signify'

" Document Conversion and Notes
if has("python")
  if v:version >= 704
    Plug 'vim-pandoc/vim-pandoc' | Plug 'vim-pandoc/vim-pandoc-syntax'
  endif
  if has("conceal")
    Plug 'fmoralesc/vim-pad'
  endif
endif


Plug 'dhruvasagar/vim-table-mode'
" I dont need any orgmode for document conversion as i use markdown+pandoc
" Plug 'jceb/vim-orgmode'
" Instead i try this
" Plug 'dhruvasagar/vim-dotoo'
" ok did not work

" Filetype specific
Plug 'diepm/vim-rest-console'
Plug 'lervag/vimtex'
" Indentation of pymode
Plug 'hynek/vim-python-pep8-indent'
Plug 'tmhedberg/SimpylFold'
Plug 'heavenshell/vim-pydocstring'

Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-skeletons'
Plug 'vim-erlang/erlang-motions.vim'
Plug 'raichoo/haskell-vim'
Plug 'chrisbra/csv.vim'
Plug 'wannesm/wmgraphviz.vim'
Plug 'JuliaLang/julia-vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'freitass/todo.txt-vim'

"Colschemes
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
call plug#end() "so this calls filetype plugin indent on????
filetype off
" vifi not sourced atm
call vifi#interface('~/.vim/vifi')
execute pathogen#infect('src/{}', 'vifi/{}')
" }}}
" Section: Basic Settings {{{ "
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
set foldmethod=marker
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

" Check if this works if not
set backupdir=/tmp/vim//,.
set directory=/tmp/vim//,.

set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" scrolling
set scrolloff=1
set sidescrolloff=5

" numbers
set nonumber
set norelativenumber

" Spells
set spelllang=en_us,de_de

" wild menu is cool
set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,.*.un~,*.pyc,*.o,*.hi,*.beam
set wildignore+=*.aux,*.out,*.toc

" handy for vinegar and so on
set autowrite
set autoread

"experimental
set timeoutlen=1200
set ttimeoutlen=50

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

set statusline=[%n%M\ %t\ ~=\ %Y]%([tw=%{&textwidth}\ sw=%{&shiftwidth}]%)%=%l,%c%V\ %P

augroup lpag_flagship
  autocmd User Flags call Hoist("buffer", {'hl':['StatusLine','StatusLineNC']}, function('fugitive#statusline'))
  autocmd User Flags call Hoist("window", {'hl':['StatusLine','StatusLineNC']}, "SyntasticStatuslineFlag")
  autocmd User Flags call Hoist("global", "%{&ignorecase ? '[IC]' : ''}")
augroup END
" I am the evil squirrel, I steal colors from the bad wolf
" :redir @a | :hi StatusLine | :redir END | :put a

function! Fancy_Statusline(...) abort
  "a:1 normal mode bg
  "a:2 insert mode bg
  "a:3 inactive bg
  "a:4 (in-) active fg
  "if no argument given, resets autocmds
  augroup fancy_statusline
    autocmd!
    if a:0 >= 4
      exe 'highlight StatusLine ctermfg='.a:4
      exe 'highlight StatusLineNC ctermfg='.a:4
    endif
    if a:0 >= 3
      exe 'highlight StatusLineNC ctermbg='.a:3
    endif
    if a:0 >= 2
      exe 'highlight StatusLine ctermfg=16 ctermbg='.a:1
      exe 'highlight StatusLineNC ctermfg=16 ctermbg='.a:3
      exe 'autocmd InsertLeave * hi StatusLine ctermbg='.a:1
      exe 'autocmd InsertEnter * hi StatusLine ctermbg='.a:2
    endif
  augroup END
endfunction

if &t_Co == 256 && !has('gui_running')
  " 15 fancy white
  " 82 vividchalk string
  " 208 vividchalk statement
  " 220 vividchalk identifier
  " 92 vividchalk comment
  if has('autocmd')
    augroup colorscheme_extensions
      autocmd!
      " clear fancy_statusline autocommands
      autocmd ColorScheme * call Fancy_Statusline()
      " make statusline fancier
      autocmd ColorScheme vividchalk call Fancy_Statusline(82, 208, 92, 16)
    augroup END
  endif
endif

set background=dark
silent! colorscheme badwolf
set colorcolumn=+1

" }}} Statusline and Colors"
" Section: Plugin Options{{{

let g:UltiSnipsListSnippets = '<C-k>'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
" let g:UltiSnipsUsePythonVersion = 3

let g:pandoc#folding#fdc = 0
let g:pandoc#formatting#mode = 'ha'
" Markdown compat
let g:table_mode_corner        = '|'
" let g:table_mode_corner_corner = '+'
" let g:table_mode_seperator     = '|'
" let g:table_mode_fillchar      = '='

highlight default link TodoPriorityD Type

"Testing
let g:pad#dir = '~/Documents'
let g:pad#local_dir = 'notes'

if v:version >= 704 && has("python")
  let g:pad#default_format = 'pandoc'
else
  let g:pad#default_format = 'markdown'
endif

" Builtin Python syntax highlighting
let g:python_highlight_all = 1

" Splitjoin
let g:splitjoin_normalize_whitespace = 1
let g:splitjoin_align = 1
let g:splitjoin_split_mapping = "gS"
let g:splitjoin_join_mapping = "gJ"

" Syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" experimental
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 1

" Warning 1: Command terminated with space
" Warning 8: wrong length of dash
let g:syntastic_tex_checkers = ["chktex"]
let g:syntastic_tex_chktex_args = "-n1 -n8"

" Python Checkers
let g:syntastic_python_checkers = ['python', 'pyflakes']
let g:syntastic_python_python_exec = '/usr/bin/python3'

" python-mode
" let g:pymode_python = 'python3'
" let g:pymode_indent = []
" let g:pymode_folding = 1
" let g:pymode_motion = 1
" let g:pymode_doc = 1
" let g:pymode_doc_bind = 'K'
" let g:pymode_virtualenv = 1

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

let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024 * 1024

" let g:jellybeans_use_lowcolor_black = 0

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
nnoremap <Space> za
nmap <C-I> <Plug>(pydocstring)

" By T. <the> Pope
if exists(":nohls")
  nnoremap <silent> <C-L> :nohls<CR><C-L>
end

inoremap <C-U> <C-G>u<C-U>
inoremap <C-C> <Esc>`^
inoremap <Esc> <nop>

nnoremap <F7> :lcd %:h<CR>
nnoremap <F8> :Make<CR>
nnoremap <F9> :Dispatch<CR>
nnoremap <F10> :Start<CR>

" access files
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ea :Vsplit after/plugin/abolish.vim<CR>
nnoremap <leader>eq :split ~/.config/qutebrowser/keys.conf<CR>
nnoremap <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<CR>


" make jk, H and L more useful on indented lines and while wrapping
" nnoremap j gj
" nnoremap k gk
nnoremap H ^
nnoremap L $

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
function! s:or_else(cmd, default) abort
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
" }}}
" Section: Autocmds {{{
if has("autocmd")
  filetype plugin indent on

  augroup guess_dispatch
    autocmd!
    autocmd BufReadPost * if getline(1) =~# '^#!'
          \ | let b:dispatch = getline(1)[2:-1] . ' %'
          \ | let b:start = b:dispatch
          \ | endif
  augroup END

  augroup ft_options
    autocmd!
    autocmd FileType todo setlocal cursorline
    autocmd FileType erlang let b:endwise_addition = 'end'
          \ | let  b:endwise_words = 'fun,receive'
          \ | let b:endwise_syngroups = 'erlangKeyword'
    autocmd FileType erlang let b:dispatch="erlc %"

    autocmd FileType julia let b:endwise_addition = 'end'
          \ | let b:endwise_words =  'if,for,function'
          \ | let b:endwise_syngroups = 'juliaConditional,juliaConditionalBlock,juliaRepeat,JuliaRepeatBlock,juliaBlKeyword,juliaFunctionBlock'

    autocmd FileType vim setlocal tw=78 fdm=marker

    autocmd FileType zsh,sh let b:dispatch = "source %"

    autocmd FileType help setlocal keywordprg=:help
          \| nnoremap <silent><buffer> q :q<CR>

    " Modify vim-surround to support vimtex
    autocmd FileType tex
          \ let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
          \| let b:surround_{char2nr("e")} =
          \ "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"

    autocmd FileType python setlocal textwidth=79
    " i want pythonic prints everywhere. even in java
    " just type print(
    autocmd FileType java iabbrev <buffer> print System.out.println);<left><left>
    autocmd FileType java setlocal foldmethod=syntax
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
    " csv maps
    autocmd FileType csv nnoremap <buffer> <localleader>ac :%ArrangeColumn!<CR>
    autocmd FileType csv nnoremap <buffer> <localleader>uc :%UnArrangeColumn<CR>
    autocmd FileType csv nnoremap <buffer> o :<C-U>execute "CSVNewRecord ". v:count1<CR>
    autocmd FileType csv setlocal cursorline equalprg=":ArrangeColumn"
    autocmd FileType haskell let b:dispatch="ghc %"
    autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
  augroup END
endif
"}}}
