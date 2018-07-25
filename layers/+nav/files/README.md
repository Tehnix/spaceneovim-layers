# Files Layer
This layer provides common functionality for files, using

- [`scrooloose/nerdtree`](https://github.com/scrooloose/nerdtree)

#### Table of Contents
- [Install](#install)
- [Configuration](#configuration)
- [Key Bindings](#key-bindings)
  - [Oni](#oni)

## Install
Add the `+nav/files` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/files'
  " ...
endfunction
```

## Configuration
If you are using Oni, it has it's own file tree browser, which you can toggle from Vim. Enabling `let g:spOniSwapFileTree = 1` switches the bindings for Oni sidebar and NERDTree.

## Key Bindings
Key Binding | Description
----------- | -------------------------------
SPC f r     | Reveal current file on NERDTree
SPC f s     | Save current buffer
SPC f S     | Save current buffer
SPC f t     | Toggle NERDTree
SPC f n     | Synchronize NERDTree with project root
SPC f e d   | Open $MYVIMRC
SPC f e s   | Open SpaceNeovim Layers folder
SPC f e U   | Update plugins
SPC f e R   | Reload config file
SPC f e u   | Update SpaceNeovim layers

### Oni
Key Binding | Description
----------- | -------------------------------
SPC f T     | Toggle Oni sidebar
