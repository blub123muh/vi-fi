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
" Tpopes plugins are neat.
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

" Essentials
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/SyntaxComplete'
Plugin 'mtth/Scratch.vim'

" Project Drawer complementing vinegar
Plugin 'scrooloose/nerdtree'

" Syntax checking
Plugin 'scrooloose/syntastic'

" This might be useful for rope at least...
" Plugin 'klen/python-mode'

" Fuzzy Finder
Plugin 'ctrlpvim/ctrlp.vim'

" Snippets
Plugin 'drmingdrmer/xptemplate'

" Ideas from sjl
Plugin 'mileszs/ack.vim'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'ajh17/VimCompletesMe'
Plugin 'sjl/gundo.vim'

Plugin 'mhinz/vim-signify'
" Document Conversion and Notes
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'fmoralesc/vim-pad'

" Experimental
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'vimwiki/vimwiki'

" Filetype specific
Plugin 'plasticboy/vim-markdown', {'name' : 'vim-plasticdown'}
Plugin 'diepm/vim-rest-console'
Plugin 'lervag/vimtex'

" Indentation of pymode
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

"Colschemes
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
call vundle#end()
" vifi not sourced atm
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

set statusline=[%n%M]\ %<%.99f\ ~=\ %Y\ %([tw=%{&textwidth}\ sw=%{&shiftwidth}]%)%=%l,%c%V\ %P

augroup lpag_flagship
  autocmd User Flags call Hoist("buffer", {'hl':['StatusLine','StatusLineNC']}, function('fugitive#statusline'))
  autocmd User Flags call Hoist("window", {'hl':['StatusLine','StatusLineNC']}, "SyntasticStatuslineFlag")
  autocmd User Flags call Hoist("global", "%{&ignorecase ? '[IC]' : ''}")
augroup END
" I am the evil squirrel, I steal colors from the bad wolf
" :redir @a | :hi StatusLine | :redir END | :put a

function! s:Fesch(...) abort
  "a:1 normal mode bg
  "a:2 insert mode bg
  "a:3 inactive bg
  "a:4 (in-) active fg
  "if no argument given, resets autocmds
  " clean this up TODO
  augroup fancy_statusline
    autocmd!
    if a:0 >= 4
      " Force fg color of Status- and Tabline
      exe 'highlight StatusLine ctermfg='.a:4
      exe 'highlight StatusLineNC ctermfg='.a:4
      exe 'highlight TabLine ctermfg='.a:4
      exe 'highlight TabLineSel ctermfg='.a:4
    endif
    if a:0 >= 3
      " Set colors of Statusline and Tabline (active and inactive)
      exe 'highlight StatusLineNC ctermbg='.a:3
      exe 'highlight TabLine ctermbg='.a:3
      exe 'highlight TabLineSel ctermbg='.a:1
    endif
    if a:0 >= 2
      " Insert mode color change
      exe 'highlight StatusLine ctermbg='.a:1
      exe 'autocmd InsertLeave * hi StatusLine ctermbg='.a:1
      exe 'autocmd InsertEnter * hi StatusLine ctermbg='.a:2
    endif
  augroup END
endfunction

" if &t_Co == 256 && !has('gui_running')
"   " 15 fancy white
"   " 82 vividchalk string
"   " 208 vividchalk statement
"   " 220 vividchalk identifier
"   " 92 vividchalk comment
"   if has('autocmd')
"     augroup colorscheme_extensions
"       autocmd!
"       " clear fesch autocommands
"       autocmd ColorScheme * call s:Fesch()
"       " make statusline and tabline more fancy
"       autocmd ColorScheme vividchalk call s:Fesch(82, 208, 92, 16)
"       " 196 badwolf statement
"       " autocmd ColorScheme badwolf call s:Fesch(39, 214)
"     augroup END
"   endif
" endif

set background=dark
silent! colorscheme badwolf
set colorcolumn=+1

" }}} Statusline and Colors"
" Section: Plugin Options{{{

" let g:UltiSnipsListSnippets = '<C-k>'
" let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
" let g:UltiSnipsUsePythonVersion = 3

" Builtin Python syntax highlighting
let g:python_highlight_all = 1

" let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
"
let g:fugitive_gitlab_domains = ['git.informatik.uni-kiel.de']

let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024 * 1024

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

nnoremap <right> :vertical resize +3<cr>
nnoremap <left>  :vertical resize -3<cr>
nnoremap <up>    :resize +3<cr>
nnoremap <down>  :resize -3<cr>

" + as : saves shift mnemonic as in 'vim +{cmd}'
nnoremap + :
vnoremap + :
" learn it
nnoremap : <NOP>

nnoremap gb :edit #<cr>

nnoremap <Space> za
nnoremap s :w<CR>

nmap <C-I> <Plug>(pydocstring)

" By T. <the> Pope
if exists(":nohls")
  nnoremap <silent> <C-L> :nohls<CR><C-L>
end

cnoremap ;\ \(\)<Left><Left>
cmap <Up> <NOP>
cmap <Down> <NOP>
cmap <C-O> <Up>


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

" access files
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>:filetype detect<CR>
nnoremap <leader>ep :vsplit ~/.plan/README.markdown<CR>
nnoremap <leader>et :vsplit ~/.tmux.conf<CR>
nnoremap <leader>ea :Vsplit after/plugin/abolish.vim<CR>
nnoremap <leader>eq :split ~/.config/qutebrowser/keys.conf<CR>

nnoremap <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<CR>

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>

" open pdf
nnoremap <leader>vp :!okular %:r.pdf<cr>

" Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/

" make jk, H and L more useful on indented lines and while wrapping
" nnoremap j gj
" nnoremap k gk
" nnoremap gj j
" nnoremap gk k
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

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
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

  autocmd FileType sh,zsh let b:dispatch = ". %"

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
  " csv maps
  autocmd FileType csv nnoremap <buffer> <localleader>ac :%ArrangeColumn!<CR>
  autocmd FileType csv nnoremap <buffer> <localleader>uc :%UnArrangeColumn<CR>
  autocmd FileType csv nnoremap <buffer> o :<C-U>execute "CSVNewRecord ". v:count1<CR>
  autocmd FileType csv setlocal cursorline equalprg=":ArrangeColumn"
  autocmd FileType haskell let b:dispatch="ghc %"
  autocmd FileType pad setlocal nonumber norelativenumber
  autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
augroup END
"}}}
" FileTypes {{{
" Markdown {{{
augroup ft_markdown
  au FileType markdown iabbrev -> $\rightarrow$
  au FileType markdown setlocal sw=2 conceallevel=2
  au FileType markdown let b:dispatch="pandoc -f markdown -o %:p:r.pdf %"
augroup END
" }}}
" Quickfix {{{
augroup ft_quickfix
  au!
  au FileType qf setlocal colorcolumn=0 nolist
  " TODO eval whether this works for pandocs :TOC
  au Filetype qf nnoremap <buffer> <cr> :execute "normal! \<lt>cr>"<cr>
augroup END
" }}}
" }}}
" Plugin settings {{{
" Plasticboy Markdown {{{
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
" }}}
" Splitjoin {{{
let g:splitjoin_normalize_whitespace = 1
let g:splitjoin_align = 1
let g:splitjoin_split_mapping = "S"
let g:splitjoin_join_mapping = "J"
" }}}
" {{{ XPTemplate
let g:xptemplate_vars='$author=Lukas Galke&$email=vim@lpag.de'
" }}}
" {{{ Nerdtree
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeRespectWildIgnore = 1
" }}}
" Syntastic {{{
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = {
"       \ "mode": "active",
"       \ "passive_filetypes": ["python"]}
" experimental
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 1

" Warning 1: Command terminated with space
" Warning 8: wrong length of dash
let g:syntastic_tex_checkers = ["chktex"]
let g:syntastic_tex_chktex_args = "-n1 -n8"

" Python Checkers
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_flake8_exec = '/usr/bin/python3'
let g:syntastic_python_flake8_args = '-m flake8'
" }}}
" Pandoc {{{
autocmd FileType pandoc setlocal nospell nolist sw=4
      \| let b:dispatch = ':Pandoc pdf -N'
let pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#filetypes#handled = ["pandoc"]
let g:pandoc#folding#fdc = 0
let g:pandoc#formatting#mode = "ha"
" let g:pandoc#formatting#extra_equalprg = "--atx-headers"
let g:pandoc#toc#position = "right"
let g:pandoc#toc#close_after_navigating = 0
let g:pandoc#modules#disabled = ["menu"]
let g:pandoc#syntax#conceal#urls = 1
" }}}
" Vimtex {{{
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
let g:vimtex_format_enabled = 1
augroup plug_vimtex
  au!
  au User VimtexEventInitPost nmap <F4> <plug>(vimtex-cmd-create)
  au User VimtexEventInitPost imap <F4> <plug>(vimtex-cmd-create)
augroup END
augroup VimCompletesMeTex
  autocmd!
  autocmd FileType tex let b:vcm_omni_pattern =
        \ '\v\\%('
        \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
        \ . '|hyperref\s*\[[^]]*'
        \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|%(include%(only)?|input)\s*\{[^}]*'
        \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . ')'
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
" }}}
