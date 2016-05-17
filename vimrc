" A rapidly evolving vim.rc file
" Maintainer:	Lukas Galke <git@lpag.de>
" Homepage:     http://lpag.de/ 
" Author:       Lukas Galke <vim@lpag.de>
set nocompatible
" Vundle {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"Put all your plugins here"
Plugin 'tomasr/molokai.git'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-latex/vim-latex'
Plugin 'chrisbra/csv.vim' 

call vundle#end()
filetype plugin indent on
" }}}
"Basic Settings {{{
" Don't use Ex mode, use Q for formatting
map Q gq
"set backspace=indent,eol,start "seems useless

" Convenient access to [] buttons for non-US keyboards
"nmap < [
"nmap > ]
"omap < [
"omap > ]
"xmap < [
"xmap > ]


"indenting
"set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

"numbers
set number
set relativenumber

"searching
syntax on
set hlsearch
set incsearch
colorscheme molokai

"search and replace
set gdefault
"}}}
" statusline {{{
set noruler	" show the cursor position all the time
"set showcmd	" display incomplete commands
set laststatus=2 " ALWAYS display status line
set statusline=%f " Path
set statusline+=%{fugitive#statusline()} "vim fugitive
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
    "{{{ text
augroup filetype_text
    autocmd FileType text setlocal textwidth=78
augroup END
"}}}
"}}}
"Mappings {{{
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

" make H and L more useful
nnoremap H 0
nnoremap L $

" jk to exit insert mode
inoremap jk <esc>
inoremap <esc> <nop>


" operator pending
onoremap b /return<cr>
" inside/around next/last parentheses
onoremap in( :<c-u> normal! f(vi(<cr>
onoremap il( :<c-u> normal! F)vi(<cr>
onoremap in{ :<c-u> normal! f{vi{<cr>
onoremap il{ :<c-u> normal! F}vi{<cr>

onoremap an( :<c-u> normal! f(va(<cr>
onoremap al( :<c-u> normal! F)va(<cr>
onoremap an{ :<c-u> normal! f{va{<cr>
onoremap al{ :<c-u> normal! F}va{<cr>

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
augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

augroup END

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
"iabbrev vi-fi Lukas Galke <vi-fi@lpag.de>
