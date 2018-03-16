# Files Layer
This layer provides common functionality for files, using

- [`scrooloose/nerdtree`](https://github.com/scrooloose/nerdtree)

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+nav/files` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/files'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | -------------------------------
SPC f r     | Reveal current file on NERDTree
SPC f s     | Save current buffer
SPC f S     | Save current buffer
SPC f t     | Toggle NERDTree
SPC f n     | Synchronize NERDTree with project root
SPC f e d   | Open $MYVIMRC
SPC f e p   | Update plugins
SPC f e R   | Reload config file
SPC f e u   | Update SpaceNeovim layers
