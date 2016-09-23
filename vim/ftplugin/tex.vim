" function SplitSentenceFormatExpr(start,end)
"     " join before?
"     silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
" endfunction

" set formatexpr=SplitSentenceFormatExpr(v:lnum,v:lnum+v:count-1)
