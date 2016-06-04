" Section: Preamble {{{
" A rapidly evolving vimrc file
" Source:       http://github.com/blub123muh/vi-fi.git
" Maintainer:	Lukas Galke <vi-fi@lpag.de>
" Homepage:     http://lpag.de/
set nocompatible "be iMproved
"}}}
" Section: vifi connect {{{

"let $MYVIMRC = resolve(expand('<sfile>:p'))
"let s:vifi = call pathogen#join(resolve($MYVIMRC, ':h'), 'vifi')
"call pathogen#surround(s:vifi)
"execute "source " . s:vifi . "/plugged/pathogen/autoload/pathogen.vim"


" Enables sourcing with 'vim -u' with all Plugs
" Retrieve path to _this_ file (with any symlinks resolved)
if !exists('g:vifi_connected')
    " Always be robust to multiple sourcing.
    let g:vifi_connected = 1

    if !exists('g:vifi_relpath')
        " Use something else than vimfiles or .vim,
        " so that we will not clutter someone else's vimfiles directory.
        let g:vifi_relpath = 'vifi'
    end

    if !exists('g:vifi_plugin_manager')
        " The plugin manager, which will be automatically installed
        let g:vifi_plugin_manager = 'vim-plug'
    end

    if !exists('g:vifi_sep')
        " This is your systems seperator in paths.
        let g:vifi_sep = '/'
    end

    if !exists('g:vifi_pathsep')
        " This is the seperator of _multiple_ paths in your runtimepath.
        let g:vifi_pathsep = ','
    end

    " Retrieve (resolved) path to THIS file.
    let g:vifi_vimrc = resolve(expand('<sfile>:p'))
    " Append your desired relative path for your vimfiles.
    let g:vifi_vimfiles = resolve(fnamemodify(g:vifi_vimrc, ':h') . g:vifi_sep . g:vifi_relpath)
    " Also keep track of the after directory, just in case.
    let g:vifi_vimfiles_after = g:vifi_vimfiles . g:vifi_sep . 'after'
    " Finally, we modify the runtimepath.
    let &rtp = g:vifi_vimfiles . g:vifi_pathsep . &rtp . g:vifi_pathsep . g:vifi_vimfiles_after
    " Now, you can call your favorite plugin manager with
    " plug#begin(g:vifi_vimfiles . '/plugged')
    " or access this (out of place) vimrc in a mapping
    " nnoremap <leader>sv :execute "source" . g:vifi_vimrc<cr>
    " But most important: Your vimrc is now properly invokable with 'vim -u'!
    let $MYVIMRC=g:vifi_vimrc
    "TODO maybe extend on this

    " Additionally, support is offered for several plugin managers.
    if g:vifi_plugin_manager ==# 'vim-plug'
        if empty(glob(g:vifi_vimfiles . '/autoload/plug.vim'))
            " Download plug.vim
            silent execute "!curl -fLo " . g:vifi_vimfiles . "/autoload/plug.vim --create-dirs "
                        \. "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
            " Install all the rest
            autocmd VimEnter * PlugInstall | source $MYVIMRC
        endif
    endif
endif
" }}}
" Section: Plugins {{{
call plug#begin(g:vifi_vimfiles . '/plugged')
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

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sjl/badwolf'
" Syntax checking and comments.
" Expensive?
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
" Filetype specific
Plug 'lervag/vimtex'
Plug 'raichoo/haskell-vim'
Plug 'chrisbra/csv.vim'
Plug 'wannesm/wmgraphviz.vim'
Plug 'suan/vim-instant-markdown'
Plug 'JuliaLang/julia-vim'
"endif
call plug#end() "so this calls filetype plugin indent on????
" additional pathogen infection for testing local plugins
"execute pathogen#infect(g:vifi_vimfiles . '/bundle/{}')
" }}}
"Section: Basic Settings {{{
" utf8!
set encoding=utf-8
" We usually have fast terminal connections
set ttyfast
" indenting
set autoindent
set visualbell
" always display status line
set backup
set laststatus=2
" store undos
set undofile
set undoreload=10000
set history=1000
set backspace=indent,eol,start
set lazyredraw
set title

set textwidth=78
set nowrap
set nolist

set linebreak
set breakindent

set splitbelow
set splitright

set tabstop=8
set softtabstop=4
set expandtab

" numbers
set number
set relativenumber

set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,.*.un~,*.pyc


" colors
syntax on
set background=dark
silent! colorscheme vividchalk
set colorcolumn=+1
" statusline
set showcmd " display incomplete commands
set ruler
" no ex mode
map Q <nop>

set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

let g:tex_flavor = 'latex'
"}}}
" Section: Plugin options{{{
" Warning 1: Command terminated with space
" Warning 8: wrong length of dash
let g:syntasic_tex_checker = "chktex"
let g:syntastic_tex_chktex_args = "-n1 -n8"
let g:syntastic_python_python_exec = '/usr/bin/python3'

" no callbacks without +clientserver
let g:vimtex_latex_callback = 0 
" okular is my preferred pdf viewer
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" FOLD ALL THE THINGIES
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_comments = 1

" ehm, no?
let g:instant_markdown_autostart = 0
" }}}
" Section: Mappings {{{
let mapleader = ","
let maplocalleader = "ß"

" German keyboard layout
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
nmap öö [[
nmap öä []
nmap äö ][
nmap ää ]]

"Use Netrw, not NERDTREE
nnoremap <leader>l :17Lex<cr>

" ctrl+c to exit insert mode
inoremap <esc> <nop>
inoremap jk <esc>

"move lines down and up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP

" access THIS vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" make jk, H and L more useful on indented lines and while wrapping
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $


" inside/around next/last parentheses
onoremap in( :<c-u> normal! f(vi(<cr>
onoremap il( :<c-u> normal! F)vi(<cr>
onoremap in{ :<c-u> normal! f{vi{<cr>
onoremap il{ :<c-u> normal! F}vi{<cr>

onoremap an( :<c-u> normal! f(va(<cr>
onoremap al( :<c-u> normal! F)va(<cr>
onoremap an{ :<c-u> normal! f{va{<cr>
onoremap al{ :<c-u> normal! F}va{<cr>

" highlight trailing spaces
" nnoremap <leader>w :match Error /\v +$/<cr>
" nnoremap <leader>W :match<cr>
nnoremap <leader>W :%s/\v +$//<cr>
nnoremap <leader>= mqgg=G`q
nnoremap <leader>fl :echom foldlevel('.')<cr>
" Toggle Help/Text Filetypes
nnoremap <leader>h :let &ft = (&ft==#"help" ? "text" :
            \(&ft==#"text" ? "help" : &ft))<cr>


" end of line semicolon; return
nnoremap <leader>; mqA;<esc>`q

"use very magic regex for searching
nnoremap / /\v
nnoremap ? ?\v
"
"clear searched stuff with leader space
nnoremap <leader><space> :nohlsearch<cr>

"}}}
"Section: Commands {{{
" }}}
"Section: Autocmds {{{
if has("autocmd")
    filetype plugin indent on

    augroup latexSurround
        autocmd!
        autocmd FileType tex call s:latexSurround()
    augroup END

    function! s:latexSurround()
        let b:surround_{char2nr("e")}
                    \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
        let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
    endfunction

    augroup filetype_python
        autocmd!
        autocmd FileType python setlocal textwidth=100
    augroup END
    augroup filetype_java
        autocmd!
        " i want pythonic prints everywhere.
        " just type print(
        autocmd FileType java iabbrev <buffer> print
                    \System.out.println);<left><left>
    augroup END
    augroup filetype_text
        autocmd!
        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78
    augroup END
    augroup filetype_csv
        autocmd!
        autocmd FileType csv nnoremap <buffer> <localleader>ac :%ArrangeColumn<cr>
        autocmd FileType csv nnoremap <buffer> <localleader>uc :%UnarrangeColumn<cr>
        autocmd FileType csv nnoremap <buffer> <localleader>nr :NewRecord<cr>
    augroup END
    augroup ft_markdown
        " Unfortunately, the instant-markdown plugin requires
        " the npm package instant-markdown-d to be installed
        autocmd!
        silent execute "!command -v instant-markdown-d >/dev/null 2>&1"
        if v:shell_error == 0
            autocmd FileType markdown nnoremap <buffer> <localleader>li :InstantMarkdownPreview<cr>
        else
            autocmd FileType markdown nnoremap <buffer> <localleader>li
                        \:echom "Package instant-markdown-d (npm) not installed."<cr>
        endif
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
