if !exists("g:julia_command")
    let g:julia_command = "julia"
endif

function! PotionCompileAndRunFile()
    silent !clear
    execute "!" . g:julia_command . " " . bufname("%")
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
