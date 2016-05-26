" <c-l> solves coloring issue
vnoremap <leader>q :<c-u>call <SID>QuteOperator(visualmode())<cr>
nnoremap <leader>q :set operatorfunc=<SID>QuteOperator<cr>g@
nnoremap <leader>qq :call <SID>QuteOperator("double")<cr>
nnoremap <leader>sq :call <SID>QuteOperator("none")<cr>

function! s:QuteOperator(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v' 
        " yank visually selected
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        " move to begin mark enter visual mode, move to end mark, yank
        execute "normal! `[v`]y"
    elseif a:type ==# 'double'
        execute "normal! yy"
    elseif a:type ==# 'none'
        let @@ = ""
    else
        return
    endif
    echom shellescape(@@)
    silent execute "!qutebrowser " . shellescape(@@) . " 2>/dev/null &"
    redraw!
    let @@ = saved_unnamed_register
endfunction
