" A rapidly evolving vim.rc file
" Maintainer:	Lukas Galke <git@lpag.de>
" Homepage:     http://lpag.de/ 
" Author:       Lukas Galke <vim@lpag.de>
"Basic Settings {{{
execute pathogen#infect()
set nocompatible
"colors
syntax on
filetype plugin indent on
set bg=dark
"colorscheme solarized
colorscheme molokai

" Don't use Ex mode, use Q for formatting
map Q gq
"set backspace=indent,eol,start "seems useless

"indenting
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

"numbers
set number
set relativenumber

"searching
set hlsearch
set incsearch

"search and replace
set gdefault

" ruler and statusline
set ruler	" show the cursor position all the time
set showcmd	" display incomplete commands
"set laststatus=2 " ALWAYS display status line
set statusline=%f " Path
set statusline+=%= " switch to the right side
set statusline+=%l/%L " display current/max line number
" }}}
" FileType specific settings {{{
" comments {{{
augroup comments
    autocmd!
    autocmd FileType sh,c,python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType tex,erlang nnoremap <buffer> <localleader>c I%<esc>
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
    autocmd FileType java nnoremap <buffer> <localleader>c I//<esc>
augroup END
"}}}
" python {{{
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal foldmethod=marker
    " some convenient abbreviations for python
    autocmd FileType python :iabbrev <buffer> iff if :<left>
    autocmd FileType python :iabbrev <buffer> print3 from __future__ import print_function<cr>
    autocmd FileType python :iabbrev <buffer> bin3 #!/usr/bin/env python3<cr># -*- coding=utf8 -*-
    autocmd FileType python :iabbrev <buffer> INEM if __name__ == '__main__':<cr>main()<esc>
augroup END
"}}}
" java {{{
augroup filetype_java
    autocmd!
    autocmd FileType java nnoremap <buffer> <localleader>im Ipublic static void main(String[] args){<cr>}<esc>ko
    autocmd FileType java :iabbrev <buffer> print System.out.println()<left>;
augroup END
"}}}
" vim {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}
" csv {{{
augroup CSV_Editing
    autocmd!
    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup end
" }}}
"}}}
" Mappings {{{
let mapleader = ","
let maplocalleader = "\\"

" move lines down and up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP

" <c-u> uppercase word
inoremap <leader><c-u> <esc>viwUi
nnoremap <leader><c-u> viwU

" access vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" enclose in quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" make H and L more useful
nnoremap H 0
nnoremap L $

" jk to exit insert mode
inoremap jk <esc>
inoremap <esc> <nop>


" operator pending
onoremap b /return<cr>
" inside/around next/last parentheses
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>

" open last buffer in split
nnoremap <leader>op :execute "rightbelow split " . bufname('#')<cr>

" highlight trailing spaces
noremap <leader>w :match Error /\v +$/<cr>
noremap <leader>W :match<cr>

" end of line semicolon; return
nnoremap <leader>; mqA;<esc>`q

"use very magic regex for searching
nnoremap / /\v
nnoremap ? ?\v
"clear searched stuff with leader space
nnoremap <leader><space> :nohlsearch<cr>

"grep for a word
"nnoremap <leader>g :silent! execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <leader>n :cnext<cr>
nnoremap <leader>N :cprevious<cr>
"}}}
" Artefacts of default vimrc {{{
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
    " Prevent that the langmap option applies to characters that result from a
    " mapping.  If unset (default), this may break plugins (but it's backward
    " compatible).
    set langnoremap
endif
"}}}

iabbrev ssig -- <cr>Lukas Galke<cr>git@lpag.de
iabbrev lpag Lukas Galke <vi-fi@lpag.de>
