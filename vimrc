" let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'bufexplorer.zip')
" call add(g:pathogen_disabled, 'vim-gitgutter')
" call add(g:pathogen_disabled, 'syntastic')
" call add(g:pathogen_disabled, 'vim-railscasts-theme')
" call add(g:pathogen_disabled, 'vim-colors-solarized')
" call add(g:pathogen_disabled, 'vim-nerdtree-tabs')
" call add(g:pathogen_disabled, 'auto-pairs')
" call add(g:pathogen_disabled, 'Smart-Tabs') " Crappy thing working badly with ruby and coffeescript
" execute pathogen#infect()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'posva/vim-vue' " Highlighting for vue components
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'blueshirts/darcula'
" Plugin 'guns/jellyx.vim'
Plugin 'robertmeta/nofrils'
Plugin 'pangloss/vim-javascript' " Better js highlighting
Plugin 'isRuslan/vim-es6' " Better es6 highlighting
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'othree/html5.vim'
Plugin 'Yggdroot/indentLine' " Adds vertical guides
Plugin 'tmhedberg/matchit' " Extends % for tags, etc
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'SirVer/ultisnips' " Snippets
Plugin 'honza/vim-snippets' " Needed for ultisnips
Plugin 'vim-airline/vim-airline'
Plugin 'gioele/vim-autoswap' " Removes nasty swap thingy in vim
Plugin 'moll/vim-bbye' " Adds :Bclose command that closed buffer
Plugin 'tpope/vim-bundler'
" Plugin 'alvan/vim-closetag'
Plugin 'kchmck/vim-coffee-script'
Plugin 'xolox/vim-easytags' " Automatic ctags generation
Plugin 'tpope/vim-endwise' " Adds 'end' completion in ruby
Plugin 'tommcdo/vim-exchange' " Adds methods to swap text (exchange)
Plugin 'tpope/vim-fugitive' " Git commands in vim
" Plugin 'takac/vim-hardtime'
Plugin 'austintaylor/vim-indentobject' " To manipilate objects on same indent level
Plugin 'briancollins/vim-jst' " For jst/ejs syntax
Plugin 'tpope/vim-repeat' " Extends dot capabilities
Plugin 'vim-ruby/vim-ruby'
Plugin 'xolox/vim-session' " For remembering working session
Plugin 'tpope/vim-sleuth' " For auto adjusting tab width
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-misc'
Plugin 'ap/vim-buftabline' " Tabline
Plugin 'scrooloose/nerdcommenter'
" Plugin 'scrooloose/syntastic'
" Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'maksimr/vim-jsbeautify'
" Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-vinegar'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()

set encoding=utf8
set background=dark
set t_Co=256
colorscheme nofrils-dark

" set timeoutlen=100

" Set terminal
set term=screen-256color
" Show line numbers
set relativenumber
set number
" Highlight search results
set hlsearch
" Smart case. Details `:h smartcast`
set ignorecase
set smartcase
" Default encoding utf8
set termencoding=utf8
" Turn on incompatibility for vi settings, bacause we wont need vi
set nocompatible
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
" Do not force new line
set nowrap
" Tab to space
set expandtab
" Tab default width
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Turn on smart indents. For example, an indent after `{`
set smartindent
" Display metching symbols
set showmatch
" Default window size
"set lines=50
"set columns=140
" Russian symbols navigation. Next\prev word , etc
set iskeyword=@,48-57,_,192-255
" Highlight line where cursor is positioned
set cursorline
"highlight CursorLine guibg=lightblue ctermbg=lightgray
"highlight CursorLine term=none cterm=none
" Special symbols display
set list listchars=tab:→\ ,trail:·
" Turn on side plugins
filetype plugin on
" Switch leader-button to comma
let mapleader=","

" Keep undo history across sessions by storing it in a file
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " Create dirs
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

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

map <C-n> :NERDTreeToggle<CR>
map <C-\> :NERDTreeFind<CR>
noremap  <C-l> :bn<CR>
noremap  <C-h> :bp<CR>

" Autoformat options
let g:formatters_ejs = ['htmlbeautify']
let g:formatters_eruby = ['htmlbeautify']
let g:php_cs_fixer_level = "symfony"
"let g:php_cs_fixer_fixers_list = "-indentation"
function! MyAutoformat()
  if &filetype == 'php'
    :call PhpCsFixerFixFile()
  else
    :Autoformat
  endif
endfunction
noremap <F3> :call MyAutoformat()<CR>

function! Paste()
  :set paste!
endfunction
noremap <F7> :call Paste()<CR>

" Indent lines
noremap <F9> :IndentLinesToggle<CR>
let g:indentLine_enabled = 0

" Easy Motion
" let g:EasyMotion_do_mapping = 0
" map <Leader> <Plug>(easymotion-prefix)
" map <Space> <Plug>(easymotion-bd-w)
" map <Leader><Space> <Plug>(easymotion-s2)
" nmap s <Plug>(easymotion-s)
" let g:EasyMotion_smartcase = 1

" Russian language support, switch layout on Ctrl-^
set keymap=russian-jcukenwin 
set iminsert=0
set imsearch=0

set statusline+=%#warningmsg#

" Buffer close
:nnoremap <Leader>q :Bdelete<CR>

" Clear highlighting by esc
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" let g:Powerline_symbols = 'fancy'

let javascript_enable_domhtmlcss = 1

" CTAGS auto update
let g:easytags_async = 1
let g:easytags_auto_update = 0
let g:easytags_always_enabled = 0
let g:easytags_opts = ['--exclude=node_modules', '--exclude=.git']

" Sessions
let g:session_autosave = 'no'
let g:session_autoload = 'yes'
let g:session_directory = xolox#misc#path#merge('~/.vim/sessions', getcwd())
let g:session_lock_enabled = 0

"autocmd BufLeave * :SaveSession!
:nnoremap <Leader>ss :SaveSession!<CR>

let g:slime_target = "tmux"

" Enable hard mode by default
let g:hardtime_default_on = 0
let g:hardtime_ignore_buffer_patterns = [ "NERD.*", "__Tagbar__"	]
let g:hardtime_timeout = 50
let g:hardtime_allow_different_key = 1
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_normal_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

" Add delimeter to nerd tree commenting
let NERDSpaceDelims=1

" Set ultisnips directory
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
" let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
" let g:UltiSnipsExpandTrigger = "<tab>"

" Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd	ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Closetags
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php,*.ejs,*.html.erb"

let g:ctrlp_custom_ignore = '\v[\/]\.(git|node_modules|svn)$'
set wildignore+=*\\node_modules\\*,*.so,*.swp,*.zip

" Let ctrl p index more files
let g:ctrlp_max_files=0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'find %s -type f'
" if executable('ag')
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif

" Remove concealing in markdown
:set conceallevel=0

nmap <Leader>m :e database/migrations<CR>
nmap <Leader>t :UpdateTags<CR>

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" if $DOTFILES_SIMPLE_THEME != 1
	" let g:airline_powerline_fonts = 1
	" let g:Powerline_symbols = 'fancy'
" endif

" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

source ~/.vim/nerdcommenter-vue.vim
