"this does not work with vim-plug since it calls filetype plugin indent on
"au BufNewFile,BufRead *.jl setfiletype=julia
au BufNewFile,BufRead *.jl setlocal filetype=julia
