" nmap <Leader>wf <Plug>VimwikiFollowLink
nmap <Leader>we <Plug>VimwikiSplitLink
let g:vimwiki_folding = 'expr'
let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_toc': 1, 'auto_tags': 1}]

" highlight vimiwiki
" highlight VimwikiHeader1 ctermfg=214 term=bold
" highlight VimwikiHeader2 ctermfg=154 term=bold
" highlight VimwikiHeader3 ctermfg=154 term=none
" highlight VimwikiHeader4 ctermfg=154 term=none
" highlight VimwikiHeader5 ctermfg=154 term=none
" highlight VimwikiHeader6 ctermfg=154 term=none

function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'tabnew ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction

function! s:Vimwiki2Pandoc()
  " Replace all headers
  execute 'normal! :%s/^\s*\(=\{1,6}\)\([^=].*[^=]\)\1/\1\2/' . "\<cr>"
  execute 'normal! :g/^\zs=\{1,6}\ze.*$/s/=/#/g' . "\<cr>"
  " Links with description
  execute 'normal! :%s/\[\[\([^\\\]]\{-}\)|\([^\\\]]\{-}\)\]\]/[\1](\2)'. "\<cr>"
  " Links without description
  execute 'normal! :%s/\[\[\([^\\\]]\{-}\)\]\]/[\1](\1)'. "\<cr>"
endfunction

command! Vimwiki2Pandoc call s:Vimwiki2Pandoc()
command! V2P call s:Vimwiki2Pandoc()
