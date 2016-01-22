execute pathogen#infect()

set encoding=utf8
set background=light
" colorscheme molokai

"  Показывать номера строк
set number
" Включить подсветку синтаксиса
syntax on
" Поиск в процессе набора
set incsearch
" Подсвечивание результатов поиска
set hlsearch
" умная зависимость от регистра. Детали `:h smartcase`
set ignorecase
set smartcase
" Кодировка текста по умолчанию utf8
set termencoding=utf8
" Включаем несовместимость настроек с Vi, так как Vi нам и не понадобится
set nocompatible
" Показывать положение курсора всё время.
set ruler
" Показывать незавершённые команды в статусбаре
set showcmd
" Фолдинг по отсупам
set foldenable
set foldlevel=100
set foldmethod=indent
" Выключаем звуковое оповещение о достижении конца буффера, невозможности действия и т.д.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" Поддержка мыши
set mouse=a
set mousemodel=popup
" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden
" Скрыть панель в gui версии
set guioptions-=T
" Сделать строку команд высотой в одну строку
set ch=1
" Скрывать указатель мыши, когда печатаем
set mousehide
" Включить автоотступы
set autoindent
" Не переносить строки
set nowrap
" Преобразование Таба в пробелы
"  set expandtab
" Размер табуляции по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Формат строки состояния. Альтернативные варианты настройки `:h statusline`
" set statusline=%&lt;%f%h%m%r\ %b\ %{&amp;encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2
" Включаем "умные" отступы, например, авто отступ после `{`
set smartindent
" Отображение парных символов
set showmatch
" Указание размеров окна редактора по умолчанию
set lines=50
set columns=140
" Навигация с учетом русских символов, учитывается командами
"  следующее/предыдущее слово и т.п.
set iskeyword=@,48-57,_,192-255
" Удаление символов бэкспэйсом в Windows
set backspace=indent,eol,start
" Подсвечивать линию текста, на которой находится курсор
set cursorline
"highlight CursorLine guibg=lightblue ctermbg=lightgray
"highlight CursorLine term=none cterm=none
" Увеличение размера истории
set history=200
" Дополнительная информация в строке состояния
set wildmenu
" Настройка отображения специальных символов
" set list listchars=tab:→\ ,trail:·
" Включение сторонних плагинов
filetype plugin on
" Переключение leader-кнопки на запятую
let mapleader=","


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

map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

let g:EasyMotion_do_mapping = 0
nmap w <Plug>(easymotion-bd-w)
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

set keymap=russian-jcukenwin 
set iminsert=0 
set imsearch=0 
highlight lCursor guifg=NONE guibg=Cyan

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [] }

let g:syntastic_typescript_tsc_fname = ''

" Закрытие буффера 
:nnoremap <Leader>q :Bdelete<CR>
let NERDTreeShowHidden=1

" Очистка подсветки по esc
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
