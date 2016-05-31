" Preamble {{{
" A rapidly evolving vimrc file
" Source:       http://github.com/blub123muh/vi-fi.git
" Maintainer:	Lukas Galke <vi-fi@lpag.de>
" Homepage:     http://lpag.de/
set nocompatible "be iMproved
"}}}
" vifi connect {{{
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
            autocmd VimEnter * PlugInstall | execute "source " . g:vifi_vimrc
        endif
    endif
endif
" }}}
" vim-plug {{{
call plug#begin(g:vifi_vimfiles . '/plugged')
" Tpopes plugins are neat.
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sleuth'

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sjl/badwolf'
" Syntax checking and comments.
" Expensive?
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
" Replace with tpope/vim-commenter?
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'vim-latex/vim-latex'
" This alternative seems to be more lightweight
Plug 'lervag/vimtex'
" Filetype specific
Plug 'raichoo/haskell-vim'
Plug 'chrisbra/csv.vim'
Plug 'wannesm/wmgraphviz.vim'
Plug 'suan/vim-instant-markdown'
"endif
call plug#end()
" }}}
"Basic Settings {{{
filetype plugin indent on
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
set lazyredraw
set title
set nolist
set linebreak
set backspace=indent,eol,start
set splitbelow
set splitright
 
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" numbers
set number
set relativenumber

" colors
syntax on
set background=dark
silent! colorscheme badwolf
set colorcolumn=+1
" statusline
set showcmd " display incomplete commands
set ruler
" no ex mode
map Q <nop>
"}}}
" Searching and Movement {{{
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10
"}}}
" Plugin specific settings{{{
" vim-latex {{{
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='okular'
" }}}
" instant-markdown {{{
let g:instant_markdown_autostart = 0
augroup markdown
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
augroup end
" }}}
" }}}
"  Autocmds {{{
if has("autocmd")
    augroup filetype_python
        autocmd!
        autocmd FileType python setlocal foldmethod=marker 
        autocmd FileType python setlocal textwidth=100
    augroup END
    augroup filetype_java
        autocmd!
        " i want pythonic prints everywhere.
        autocmd FileType java iabbrev <buffer> print System.out.println);<left><left>
    augroup END
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
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
endif
"}}}
"{{{ Map Leaders, German Keyboard Layout, helptag navigation
let mapleader = ","
let maplocalleader = "ß"
"nmap ö [
"nmap ä ]
"omap ö [
"omap ä ]
"xmap ö [
"xmap ä ]

"" for the help files
"nnoremap ]h <C-]>
"nnoremap [h <C-T>
"nnoremap öö [[
"nnoremap öä []
"nnoremap äö ][
"nnoremap ää ]]
"}}}
"Convenience Mappings {{{
"Use Netrw, not NERDTREE
nnoremap <leader>tn :17Lex<cr>

" ctrl+c to exit insert mode
inoremap <esc> <nop>

"move lines down and up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP

" <c-u> uppercase word
inoremap <leader><c-u> <esc>viwUi
nnoremap <leader><c-u> viwU

" access THIS vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" make jk, H and L more useful
nnoremap j gj
nnoremap k gk
nnoremap H 0
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

" open last buffer in splint
nnoremap <leader>op :execute "rightbelow split " . bufname('#')<cr>

" highlight trailing spaces
nnoremap <leader>w :match Error /\v +$/<cr>
nnoremap <leader>W :match<cr>
" toggle invisible characters
nnoremap <leader>w :set wrap!<cr>
nnoremap <leader>i :set list!<cr>
" toggle line numbers
nnoremap <leader>n :setlocal number! relativenumber!<cr>

" end of line semicolon; return
nnoremap <leader>; mqA;<esc>`q

"use very magic regex for searching
nnoremap / /\v
nnoremap ? ?\v
"
"clear searched stuff with leader space
nnoremap <leader><space> :nohlsearch<cr>

"}}}
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
"}}}
