" nerdcommenter
let g:SynDebug = 0
map <leader>cd :call ToggleDebug()<CR>
imap <leader>ci <SPACE><BS><ESC>:call Comment('Insert')<cr>
map <leader>ca :call Comment('AltDelims')<cr>
xmap <leader>c$ :call nerdcommenter#Comment('x', 'ToEOL')<cr>
nmap <leader>c$ :call nerdcommenter#Comment('n', 'ToEOL')<cr>
xmap <leader>cA :call nerdcommenter#Comment('x', 'Append')<cr>
nmap <leader>cA :call nerdcommenter#Comment('n', 'Append')<cr>
xmap <leader>cs :call nerdcommenter#Comment('x', 'Sexy')<cr>
nmap <leader>cs :call nerdcommenter#Comment('n', 'Sexy')<cr>
xmap <leader>ci :call nerdcommenter#Comment('x', 'Invert')<cr>
nmap <leader>ci :call nerdcommenter#Comment('n', 'Invert')<cr>
xmap <leader>cm :call nerdcommenter#Comment('x', 'Minimal')<cr>
nmap <leader>cm :call nerdcommenter#Comment('n', 'Minimal')<cr>
xmap <leader>c<space> :call nerdcommenter#Comment('x', 'Toggle')<cr>
nmap <leader>c<space> :call nerdcommenter#Comment('n', 'Toggle')<cr>
xmap <leader>cl :call nerdcommenter#Comment('x', 'AlignLeft')<cr>
nmap <leader>cl :call nerdcommenter#Comment('n', 'AlignLeft')<cr>
xmap <leader>cb :call nerdcommenter#Comment('x', 'AlignBoth')<cr>
nmap <leader>cb :call nerdcommenter#Comment('n', 'AlignBoth')<cr>
xmap <leader>cc :call nerdcommenter#Comment('x', 'Comment')<cr>
nmap <leader>cc :call nerdcommenter#Comment('n', 'Comment')<cr>
xmap <leader>cn :call nerdcommenter#Comment('x', 'Nested')<cr>
nmap <leader>cn :call nerdcommenter#Comment('n', 'Nested')<cr>
xmap <leader>cu :call nerdcommenter#Comment('x', 'Uncomment')<cr>
nmap <leader>cu :call nerdcommenter#Comment('n', 'Uncomment')<cr>
xmap <leader>cy :call nerdcommenter#Comment('x', 'Yank')<cr>
nmap <leader>cy :call nerdcommenter#Comment('n', 'Yank')<cr>
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

