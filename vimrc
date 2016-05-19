" A rapidly evolving vim.rc file
" Maintainer:	Lukas Galke <vi-fi@lpag.de>
" Homepage:     http://lpag.de/ 
" Author:       Lukas Galke <vi-fi@lpag.de>
set nocompatible "be iMproved
" vim-plug {{{
"if empty(glob('~/.vim/autoload/plug.vim'))
"    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"    autocmd VimEnter * PlugInstall | source $MYVIMRC
"endif
" Retrieve path to _this_ file (with any symlinks resolved)
let s:path = resolve(expand('<sfile>:p'))
" We also need its basename
let s:vifi = fnamemodify(s:path, ':h')
" Check for existence of plug.vim in autoload
if empty(glob(s:vifi . '/vimfiles/autoload/plug.vim'))
    " Download plug.vim
    silent execute "!curl -fLo " . s:vifi . "/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    " Install all the rest
    autocmd VimEnter * PlugInstall | source s:path
endif

"call plug#begin('~/.vim/plugged')
call plug#begin(s:path . '/vimfiles/plugged')
"Put all your plugins here"
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-latex/vim-latex'
Plug 'chrisbra/csv.vim' 
Plug 'wannesm/wmgraphviz.vim'

" Colorschemes
Plug 'tomasr/molokai'

call plug#end()
" }}}
"{{{ Map Leaders and German Keyboard Layout
let mapleader = ","
let maplocalleader = "ü"

nmap ö [
nmap ä ]
omap ö [
omap ä ]
xmap ö [
xmap ä ]
"}}}
"Basic Settings {{{
"indenting {{{
"set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
"}}}
"numbers{{{
set number
set relativenumber
"}}}
"colors {{{
set background=dark
colorscheme molokai
"}}}
"searching and replacing{{{
syntax on
set hlsearch
set incsearch
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
"}}}
"}}}
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
    autocmd!
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
augroup END
"}}}
"}}}
"Mappings {{{
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
"nnoremap / /\v
"nnoremap ? ?\v
"clear searched stuff with leader space
nnoremap <leader><space> :nohlsearch<cr>
"}}}
" Rescue curser position {{{
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

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

"if has('langmap') && exists('+langnoremap')
" Prevent that the langmap option applies to characters that result from a
" mapping.  If unset (default), this may break plugins (but it's backward
" compatible).
"    set langnoremap
"endif
"}}}
"{{{ Unmappings
" jk to exit insert mode
map Q <nop>
inoremap jk <esc>
inoremap <esc> <nop>
"}}}
"Plug specific {{{
nnoremap <leader>tn :NERDTreeToggle<CR>
"}}}
