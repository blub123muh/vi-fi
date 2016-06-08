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
        let g:vifi_relpath = 'vim'
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
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-speeddating'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Git Indicators and fancy statusline
Plug 'airblade/vim-gitgutter'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Syntax checking and CtrlP
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'

" Filetype specific
Plug 'lervag/vimtex'
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
"set showbreak=any idea?

set tabstop=8
set softtabstop=4
set expandtab

" numbers
set number
set relativenumber

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
let g:syntastic_always_populate_loc_list = 1
" loc list just clutters...
" let g:syntastic_auto_loc_list = 1

" Warning 1: Command terminated with space
" Warning 8: wrong length of dash
let g:syntastic_tex_checkers = ["chktex"]
let g:syntastic_tex_chktex_args = "-n1 -n8"

" Try all checkers
" let g:syntastic_python_checkers = ["flake8"]
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
inoremap <C-C> <Esc>`^

" Netrw toggle
nnoremap <leader>l :17Lex<cr>

" ctrl+c to exit insert mode
inoremap <esc> <nop>
" inoremap jk <esc>

"move lines down and up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP

" access vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

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
"use very magic regex for searching
" nnoremap / /\v
" nnoremap ? ?\v
" or maybe not
" }}}
" Section: Commands {{{
" let s:vifi_interface = "~/git/vi-fi/vifi/bundle"
function! s:interface(path)
    let s:vifi_interface = resolve(fnamemodify(a:path, ':p'))
    if !isdirectory(s:vifi_interface)
        " call mkdir(s:vifi_interface, p)
    end
endfunction

function! s:connect(...)
    " Maybe provide a bang version for non-github urls at some point
    for url in a:000
        echom "Connecting to " . url
        let l:target = "http://github.com/" . url . ".git"
        let l:result = system('cd ' . s:vifi_interface
                    \. ' && git submodule add -f '
                    \. shellescape(l:target))
        echom l:result
    endfor
endfunction

function! s:netstat(...)
    " We need s:vifi_interface as argument for git submodule status
    " because we dont not want to list any other submodules
    let l:result = systemlist('cd ' . s:vifi_interface .
                \' && git submodule status ' . s:vifi_interface)
    call map(l:result, 'split(v:val)[1]')
    return l:result
endfunction

function! s:reconnect(...)
    let submodules = len(a:000) ? a:000 : s:netstat()
    echon 'Reconnecting...\n'
    for submodule in a:000
        let l:result = system('cd ' . s:vifi_interface
                    \. ' && git submodule update --remote --merge '
                    \. submodule)
        echom l:result
    endfor
endfunction

function! s:disconnect(...)
    for submodule in a:000
        echom 'Disconnecting ' . submodule
        let l:result = system('cd ' . s:vifi_interface
                    \. ' && rm -Rf ' . submodule
                    \. ' && git rm -r ' . submodule)
        echom l:result
    endfor
endfunction

function! s:broadcast(cmd)
    " FIXME this function does not respect the interface
    echon 'Broadcasting ' . shellescape(a:cmd) . '...\n'
    let l:result = systemlist('cd ' . s:vifi_interface
                \. ' && git submodule foreach '
                \. shellescape(a:cmd))
    echon join(l:result, "\n")
endfunction


let $MYVIMRC = resolve(expand('<sfile>:p'))
call <SID>interface(fnamemodify($MYVIMRC, ':h') . '/vifi/bundle/')
command! -bar -nargs=+ VifiConnect :call s:connect(<f-args>)
command! -bar -nargs=0 VifiNetstat :echon join(s:netstat(),"\n")
command! -bar -nargs=+ -complete=customlist,s:netstat VifiDisconnect :call s:disconnect(<f-args>)
command! -bar -nargs=* -complete=customlist,s:netstat VifiReconnect :call s:reconnect(<f-args>)
command! -bar -nargs=1 VifiBroadcast :call s:broadcast(<q-args>)
" }}}
" Section: Autocmds {{{
if has("autocmd")
    filetype plugin indent on

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
