execute pathogen#infect()

set encoding=utf8
set background=dark
set t_Co=256
colorscheme xoria256

" Show line numbers
set number
" Turn on syntax highlight
syntax on
" Search while typing
set incsearch
" Highlight search results
set hlsearch
" Smart case. Details `:h smartcast`
set ignorecase
set smartcase
" Default encoding utf8
set termencoding=utf8
" Turn on incompatibility for vi settings, bacause we wont need vi
set nocompatible
" Show cursor position all the time
set ruler
" Show unfinished commands in status bar
set showcmd
" Folding by indents
set foldenable
set foldlevel=100
set foldmethod=indent
" Turn off sounds
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" Support for a mouse
set mouse=a
set mousemodel=popup
" Do not write buffer while switching to another
" This lets to edit multiple files without need to save each time before
" switching
set hidden
" Hide panel and scrollbars in gui version
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=L
" Command panel one line high
set ch=1
" Hide mouse pointer while typing
set mousehide
" Tugn on autoindents
set autoindent
" Do not force new line
set nowrap
" Tab to space
"  set expandtab
" Tab default width
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Statusline format
" set statusline=%&lt;%f%h%m%r\ %b\ %{&amp;encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2
" Turn on smart indents. For example, an indent after `{`
set smartindent
" Display metching symbols
set showmatch
" Default window size
"set lines=50
"set columns=140
" Russian symbols navigation. Next\prev word , etc
set iskeyword=@,48-57,_,192-255
" Delete symbols by backspace in Windows
set backspace=indent,eol,start
" Highlight line where cursor is positioned
set cursorline
"highlight CursorLine guibg=lightblue ctermbg=lightgray
"highlight CursorLine term=none cterm=none
" Enlarge history size
set history=200
" Additional info on status line
set wildmenu
" Special symbols display
" set list listchars=tab:→\ ,trail:·
" Turn on side plugins
filetype plugin on
" Switch leader-button to comma
let mapleader=","

" Quick open .vimrc
nmap <leader>ev :e $MYVIMRC<CR>

" Auto-source Vimrc on save
autocmd BufWritePost vimrc source %


function! SuperCleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

let g:ycm_auto_trigger = 0
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
map <C-n> :NERDTreeTabsToggle<CR>
map  <C-S-l> :bn<CR>
map  <C-S-h> :bp<CR>

" map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easy Motion
let g:EasyMotion_do_mapping = 0
nmap w <Plug>(easymotion-bd-w)
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" Russian language support, switch layout on Ctrl-^
set keymap=russian-jcukenwin 
set iminsert=0 
set imsearch=0 


"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [] }
let g:syntastic_typescript_tsc_fname = ''

" Buffer close
:nnoremap <Leader>q :Bdelete<CR>

" Clear highlighting by esc
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

let g:Powerline_symbols = 'fancy'

let javascript_enable_domhtmlcss = 1

let g:CoffeeAutoTagFile = './coffeetags'

" CTAGS auto update
"let g:easytags_async = 1
let g:easytags_opts = ['--exclude=node_modules', '--exclude=.git']

" Sessions
let g:session_autosave = 'no'
let g:session_autoload = 'yes'
let g:session_directory = ".vim/sessions"
let g:session_lock_enabled = 0

"autocmd BufLeave * :SaveSession!
:nnoremap <Leader>ss :SaveSession!<CR>

let g:ctrlp_custom_ignore = '\v[\/]\.(git|node_modules|svn)$'

"----------- Visuals ------------

highlight lCursor ctermfg=NONE ctermbg=Cyan

" Line number background
highlight LineNr ctermbg=bg guibg=bg

" Remove ugly vertical split border background
highlight vertsplit ctermbg=bg ctermfg=grey guibg=bg guifg=grey

" Clear left git gutter column colors
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
