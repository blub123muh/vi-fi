setlocal foldmethod=expr
setlocal foldexpr=GetJuliaFold(v:lnum)

function! GetJuliaFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif
    if getline(a:lnum) =~? '\v^\s*end\s*$'
        return s:IndentLevel(a:lnum) + 1
    endif
    if getline(a:lnum) =~? '\v^\s*else\s*$'
        return s:IndentLevel(a:lnum) + 1
    endif
    if getline(a:lnum) =~? '\v^\s*elseif.*$'
        return s:IndentLevel(a:lnum) + 1
    endif
    let this_indent = s:IndentLevel(a:lnum)
    let next_indent = s:IndentLevel(s:NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction

function! s:IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! s:NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1
    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif
        let current += 1
    endwhile
    return -2
endfunction
