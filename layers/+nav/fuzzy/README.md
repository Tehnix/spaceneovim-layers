# Fuzzy search Layer
This layer provides fuzzy search functionality for files, buffers and methods, using

- [`ctrlpvim/ctrlp.vim`](https://github.com/kien/ctrlp.vim)
- [`tacahiroy/ctrlp-funky`](https://github.com/tacahiroy/ctrlp-funky)
- [`Shougo/denite.nvim`](https://github.com/Shougo/denite.nvim)

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+nav/fuzzy` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/fuzzy'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | --------------------------------
SPC f b     | Find open buffer
SPC f f     | Find file
SPC f m     | Find method in file
SPC f M     | Find method under cursor in file
SPC f R     | Find recently used file
