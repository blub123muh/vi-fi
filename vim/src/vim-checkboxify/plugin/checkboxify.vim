" checkboxify.vim - Comment stuff out
" Maintainer:   Lukas Galke <http://lpag.de/>
" Version:      0.1
if exists("g:loaded_checkboxify") || &cp || v:version < 700
  finish
endif
let g:loaded_checkboxify = 1

let g:loaded_checkboxify = 1

if !exists('g:checkbox_disable_mappings')
  let g:checkboxify_disable_mappings = 0
endif

if !exists('g:checkboxify_triggerchars')
  let g:checkboxify_triggerchars = "\*+-"
endif

if !exists('g:checkboxify_unchecked')
  let g:checkboxify_unchecked = "[ ]"
endif

if !exists('g:checkboxify_checked')
  let g:checkboxify_checked = "[x]"
endif


""" probably autoload the following functions
function! s:checkboxify(bang,lnum1,lnum2) abort
  " TODO: add bang attribute to undo Checkboxify
  let unchecked = exists("b:checkboxify_unchecked") ? b:checkboxify_unchecked : g:checkboxify_unchecked
  let checked = exists("b:checkboxify_checked") ? b:checkboxify_checked : g:checkboxify_checked
  " trigger 
  let unchecked_regex = '\M^\(\s\*\[*+-]\s\*\)'.unchecked.'\(\s\*\w\.\*\)$'
  let checked_regex = '\M^\(\s\*\[*+-]\s\*\)'.checked.'\(\s\*\w\.\*\)$'
  for lnum in range(a:lnum1, a:lnum2)
    let line = getline(lnum)
    if line !~ unchecked_regex && line !~ checked_regex
      let line = substitute(line, '\M^\(\s\*\[*+-]\s\*\)\(\w\.\*\)$', '\1'.unchecked.' \2', '')
      call setline(lnum, line)
    elseif a:bang
      let line = substitute(line, unchecked_regex . '\|'. checked_regex, '\1\2\3\4', '')
      call setline(lnum, line)
    endif
  endfor
endfunction

command! -range -bar -bang Checkboxify call s:checkboxify(<bang>0, <line1>,<line2>)

function! s:checkbox(type, ...)
  let unchecked = exists("b:checkboxify_unchecked") ? b:checkboxify_unchecked : g:checkboxify_unchecked
  let checked = exists("b:checkboxify_checked") ? b:checkboxify_checked : g:checkboxify_checked
  if a:0
    let [lnum1, lnum2] = [a:type, a:1]
  else
    let [lnum1, lnum2] = [line("'["), line("']")]
  endif
  " Todo think about using \S instead of \w
  let unchecked_regex = '\M^\(\s\*\[*+-]\s\*\)'.unchecked.'\(\s\*\w\.\*\)$'
  let checked_regex = '\M^\(\s\*\[*+-]\s\*\)'.checked.'\(\s\*\w\.\*\)$'
  for lnum in range(lnum1, lnum2)
    let line = getline(lnum)
    if line =~ unchecked_regex
      let line = substitute(line, unchecked_regex, '\1'.checked.'\2','')
    elseif line =~ checked_regex
      let line = substitute(line, checked_regex, '\1'.unchecked.'\2','')
    endif
    call setline(lnum, line)
  endfor
endfunction


xnoremap <silent> <Plug>Checkboxify     :<C-U>call <SID>checkbox(line("'<"),line("'>"))<CR>
nnoremap <silent> <Plug>Checkboxify     :<C-U>set opfunc=<SID>checkbox<CR>g@
nnoremap <silent> <Plug>CheckboxifyLine :<C-U>set opfunc=<SID>checkbox<Bar>exe 'norm! 'v:count1.'g@_'<CR>

if !hasmapto('<Plug>Checkboxify') || maparg('cx','n') ==# ''
  xmap cx  <Plug>Checkboxify
  nmap cx  <Plug>Checkboxify
  omap cx  <Plug>Checkboxify
  nmap cxx <Plug>CheckboxifyLine
endif
