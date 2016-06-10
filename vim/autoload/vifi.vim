if exists('g:loaded_vifi')
  finish
endif
let g:loaded_vifi = 1

function! vifi#interface(path) abort
  let s:vifi_interface = fnamemodify(expand(a:path), ':p')
  if !isdirectory(s:vifi_interface)
    call mkdir(s:vifi_interface, 'p')
  end
endfunction

function! s:connect(...) abort
  " Maybe provide a bang version for non-github urls at some point
  for l:target in a:000
    echom "Connecting to " . l:target
    let l:url = "http://github.com/" . l:target . ".git"
    endif
    let l:result = systemlist('cd ' . s:vifi_interface
          \. ' && git submodule add -f '
          \. shellescape(l:url))
    echom join(l:result, '\n')
  endfor
endfunction

function! s:netstat(...) abort
  let l:result = systemlist('git -C ' . s:vifi_interface . ' submodule status .')
  call map(l:result, 'split(v:val)[1]')
  return l:result
endfunction

function! s:reconnect(...) abort
  let submodules = len(a:000) ? a:000 : s:netstat()
  echon 'Reconnecting...\n'
  for submodule in a:000
    " Unfortunately, git submodule update interface is not location
    " dependant, therefore this WILL affect your other plugins
    let l:result = system('git -C '. s:vifi_interface 
          \. ' submodule update --remote --merge '
          \. submodule)
    echon l:result
  endfor
endfunction

function! s:disconnect(...) abort
  for submodule in a:000
    echom 'Disconnecting ' . submodule
    let l:result = system('cd ' . s:vifi_interface
          \. ' && rm -Rf ' . submodule
          \. ' && git rm -r ' . submodule)
    echon l:result
  endfor
endfunction

function! s:broadcast(cmd) abort
  " FIXME this function does not respect the interface
  echo 'Broadcasting ' . shellescape(a:cmd) . '...'
  let l:result = systemlist('cd ' . s:vifi_interface
        \. ' && git --work-tree='. s:vifi_interface . ' submodule foreach '
        \. shellescape(a:cmd))
  echo join(l:result, '\n')
endfunction

command! -bar -nargs=+ VifiConnect :call s:connect(<f-args>)
command! -bar -nargs=0 VifiNetstat :echon join(s:netstat(),'\n')
command! -bar -nargs=+ -complete=customlist,s:netstat VifiDisconnect :call s:disconnect(<f-args>)
command! -bar -nargs=* -complete=customlist,s:netstat VifiReconnect :call s:reconnect(<f-args>)
command! -bar -nargs=1 VifiBroadcast :call s:broadcast(<q-args>)
