# Text Layer

This layer provides common functionality for text things.

- [Install](#install)
- [Key Bindings](#key-bindings)

## Install

Add the `+nav/text` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/text'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | ----------------------
SPC x J     | Move current line down
SPC x K     | Move current line up
SPC x U     | Uppercase current word
SPC x u     | Downcase current word
