let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'bufexplorer.zip')
call add(g:pathogen_disabled, 'vim-gitgutter')
call add(g:pathogen_disabled, 'syntastic')
call add(g:pathogen_disabled, 'vim-railscasts-theme')
call add(g:pathogen_disabled, 'vim-colors-solarized')
call add(g:pathogen_disabled, 'vim-nerdtree-tabs')
call add(g:pathogen_disabled, 'Smart-Tabs') " Crappy thing working badly with ruby and coffeescript
execute pathogen#infect()

set encoding=utf8
set background=dark
set t_Co=256
colorscheme xoria256

filetype plugin indent on

" Show line numbers
set relativenumber
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
"set mouse=a
"set mousemodel=popup
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
"set noexpandtab
" Tab default width
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Statusline format
" set statusline=%&lt;%f%h%m%r\ %b\ %{&amp;encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2
" Turn on smart indents. For example, an indent after `{`
"set smartindent
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
set list listchars=tab:→\ ,trail:·
highlight SpecialKey guifg=darkgrey ctermfg=darkgrey
" Turn on side plugins
filetype plugin on
" Switch leader-button to comma
let mapleader=","

" Quick open .vimrc
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>es :source $MYVIMRC<CR>

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
let g:ycm_collect_identifiers_from_tags_files = 1

"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
map <C-n> :NERDTreeToggle<CR>
map  <C-l> :bn<CR>
map  <C-h> :bp<CR>

" map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Autoformat options
let g:formatters_ejs = ['htmlbeautify']
let g:formatters_eruby = ['htmlbeautify']
let g:php_cs_fixer_level = "symfony"
"let g:php_cs_fixer_fixers_list = "-indentation"
function! MyAutoformat()
	if &filetype == 'php'
		:call PhpCsFixerFixFile()
		:set noexpandtab
		:retab!
	else
		:Autoformat
	endif
endfunction
noremap <F3> :call MyAutoformat()<CR>

" Easy Motion
let g:EasyMotion_do_mapping = 0
map <Leader> <Plug>(easymotion-prefix)
map <Space> <Plug>(easymotion-bd-w)
map <Leader><Space> <Plug>(easymotion-s2)
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1
"nmap <Leader>s <Plug>(easymotion-jumptoanywhere)

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

let g:slime_target = "tmux"

" Enable hard mode by default
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*", "__Tagbar__"  ]
let g:hardtime_timeout = 500
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_normal_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

" Remap increment and decrement actions
nnoremap + <C-a>
nnoremap - <C-x>

"vnoremap jj <esc>
"inoremap jj <esc>

" Tagbar configs
nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_coffee = {
	\ 'ctagstype' : 'coffee',
	\ 'kinds'	  : [
		\ 'c:classes',
		\ 'm:methods',
		\ 'f:functions',
		\ 'v:variables',
		\ 'f:fields',
	\]
\}
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

