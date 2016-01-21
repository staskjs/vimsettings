# Installation
```
cd ~
git clone https://github.com/dragothefiery/vimsettings.git ~/.vim
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

`F4` - find word under cursor in all files

`Ctrl-w-w` - cycle between opened windows

`Ctrl-h` - previous buffer

`Ctrl-l` - next buffer

`s` - easymotion find

`w`- easymotion bidirectional find

`<leader>q` - close current buffer

`Ctrl-S` - surround with
