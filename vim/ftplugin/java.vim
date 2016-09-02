
nnoremap <buffer> <localleader>i :JavaImport<cr>
nnoremap <buffer> <localleader>d :JavaDocSearch -x declarations<cr>
nnoremap <buffer> <cr> :JavaSearchContext<cr>

nnoremap <buffer> <localleader>s :JavaSearch<cr>
nnoremap <buffer> <localleader>f :%JavaFormat<cr>
nnoremap <buffer> <localleader>c :JavaCorrect<cr>

nnoremap <buffer> <localleader>r :JavaRename 

inoremap {<CR> {<cr>}<Esc>ko
