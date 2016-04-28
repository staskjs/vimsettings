# Installation
```
cd ~
git clone https://github.com/staskjs/vimsettings.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
OR
git submodule update --init --recursive
```

`<leader>` is `,` because `\` is not easily accessible on some russian keyboards

# Shortcuts

`Ctrl-^` - keyboard layout switch

`Ctrl-n` - toggle file explorer

`<leader>ci` - toggle comment

`F3` - autoformat

`F4` - find word under cursor in all files

`F6` - convert 2 spaces to tab

`F7` - toggle paste mode

`F8` - toggle tagbar

`Ctrl-w-w` - cycle between opened windows

`Ctrl-h` - previous buffer

`Ctrl-l` - next buffer

`s` - easymotion find

`space`- easymotion bidirectional find

`<leader>space` - easymotion find by 2 symbols

`<leader>q` - close current buffer

`Shift-S` - surround with

`<leader>ev` - open .vimrc

`<leader>es` - source .vimrc

`<leader>ss` - save session
