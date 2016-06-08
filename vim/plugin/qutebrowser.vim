" <c-l> or redraw! solves coloring issue

silent execute "!command -v qutebrowser >/dev/null 2>&1"
if v:shell_error == 0
    nnoremap <leader>q :set operatorfunc=<SID>QuteOperator<cr>g@
    vnoremap <leader>q :<c-u>call <SID>QuteOperator(visualmode())<cr>
else
    nnoremap <leader>q :echom "Qutebrowser not installed."<cr>
    vnoremap <leader>q :echom "Qutebrowser not installed."<cr>
endif

function! s:QuteOperator(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v' || a:type ==#'V'
        " yank visually selected
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        " move to begin mark enter visual mode, move to end mark, yank
        execute "normal! `[v`]y"
    else
        return
    endif
    silent execute "!qutebrowser " . shellescape(@@) . " 2>/dev/null &"
    redraw!
    let @@ = saved_unnamed_register
endfunction
