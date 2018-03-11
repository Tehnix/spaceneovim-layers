# Multicursor Layer
This layer provides support for multicursor editing via [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors).

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+tools/multicursor` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+tools/multicursor'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | --------------------------
Ctrl n      | Select next word
Ctrl p      | Select previous word
Ctrl x      | Skip next word
Esc         | Quit multi cursor mode
