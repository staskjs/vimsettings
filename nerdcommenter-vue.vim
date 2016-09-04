" nerdcommenter
let g:SynDebug = 0
map <leader>cd :call ToggleDebug()<CR>
imap <leader>ci <SPACE><BS><ESC>:call Comment('Insert')<cr>
map <leader>ca :call Comment('AltDelims')<cr>
xmap <leader>c$ :call Comment('ToEOL', 'x')<cr>
nmap <leader>c$ :call Comment('ToEOL', 'n')<cr>
xmap <leader>cA :call Comment('Append', 'x')<cr>
nmap <leader>cA :call Comment('Append', 'n')<cr>
xmap <leader>cs :call Comment('Sexy', 'x')<cr>
nmap <leader>cs :call Comment('Sexy', 'n')<cr>
xmap <leader>ci :call Comment('Invert', 'x')<cr>
nmap <leader>ci :call Comment('Invert', 'n')<cr>
xmap <leader>cm :call Comment('Minimal', 'x')<cr>
nmap <leader>cm :call Comment('Minimal', 'n')<cr>
xmap <leader>c<space> :call Comment('Toggle', 'x')<cr>
nmap <leader>c<space> :call Comment('Toggle', 'n')<cr>
xmap <leader>cl :call Comment('AlignLeft', 'x')<cr>
nmap <leader>cl :call Comment('AlignLeft', 'n')<cr>
xmap <leader>cb :call Comment('AlignBoth', 'x')<cr>
nmap <leader>cb :call Comment('AlignBoth', 'n')<cr>
xmap <leader>cc :call Comment('Comment', 'x')<cr>
nmap <leader>cc :call Comment('Comment', 'n')<cr>
xmap <leader>cn :call Comment('Nested', 'x')<cr>
nmap <leader>cn :call Comment('Nested', 'n')<cr>
xmap <leader>cu :call Comment('Uncomment', 'x')<cr>
nmap <leader>cu :call Comment('Uncomment', 'n')<cr>
xmap <leader>cy :call Comment('Yank', 'x')<cr>
nmap <leader>cy :call Comment('Yank', 'n')<cr>
let g:NERDCreateDefaultMappings=0
let g:NERDSpaceDelims=1
let g:NERDCustomDelimiters = {'pug': { 'left': '//-', 'leftAlt': '//' }}
function! ToggleDebug()
  let g:SynDebug = !g:SynDebug
  echo 'Syntax Debug Mode: '.g:SynDebug
endfunction
function! Comment(...) range
  let mode = a:0
  let type = a:1
  let ft = &ft
  let stack = synstack(line('.'), col('.'))
  if g:SynDebug
    echo ft
    echo map(stack, 'synIDattr(v:val, "name")')
  endif
  if ft == 'vue'
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        let syn = tolower(syn)
        if g:SynDebug
          echo syn
        endif
        exe 'setf '.syn
      endif
    endif
  endif
  if type == 'AltDelims'
    exe "normal \<plug>NERDCommenterAltDelims"
  elseif type == 'Insert'
    call NERDComment('i', "insert")
  else
    exe 'silent '.a:firstline.','.a:lastline.'call NERDComment(mode, type)'
  endif
  if g:SynDebug
    echo &ft
  endif
  exe "setf ".ft
endfunction

let g:ft = ''
fu! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        let syn = tolower(syn)
        exe 'setf '.syn
      endif
    endif
  endif
endfu
fu! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    g:ft
  endif
endfu

