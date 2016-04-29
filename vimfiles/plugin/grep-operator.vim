nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        " yank visually selected
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        " move to begin mark enter visual mode, move to end mark, yank
        execute "normal! `[v`]y"
    else
        return
    endif
    "note that grep! somehow breaks coloring. very strange.
    silent execute "grep -R " . shellescape(@@) . " ."
    copen

    let @@ = saved_unnamed_register
endfunction
