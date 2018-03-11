# Ruby Layer

This layer provides support for the Ruby language with the following packages:

- [`jgdavey/vim-blockle`](https://github.com/jgdavey/vim-blockle)
- [`jgdavey/vim-weefactor`](https://github.com/jgdavey/vim-weefactor)
- [`fishbullet/deoplete-ruby`](https://github.com/fishbullet/deoplete-ruby)
- [`keith/rspec.vim`](https://github.com/keith/rspec.vim)

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+lang/ruby` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/ruby'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | -----------------------------------
SPC m :     | Replace `:symbol =>` with `symbol:`
SPC m b     | Convert blocks
SPC m l     | Extract variable to let
SPC m s     | Convert Struct to Class
