# Comments Layer

This layer provides common functionality for manipulating comments.

- [Install](#install)

  - [Layer](#layer)

- [Key Bindings](#key-bindings)

## Install

Add the `+nav/comments` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/comments'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | -------------------------------
SPC c l     | Comment/uncomment lines
SPC c L     | Comment/uncomment lines (inverted)
SPC c y     | Yank and comment/uncomment line *Experimental*
SPC c Y     | Yank and comment/uncomment line (inverted) *Experimental*
SPC c p     | Comment/uncomment paragraph *Experimental*
SPC c P     | Comment/uncomment paragraph (inverted) *Experimental*
