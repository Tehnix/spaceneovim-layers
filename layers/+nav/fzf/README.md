# FZF Layer

This layer provides fuzzy search functionality using FZF.

- [Install](#install)

- [Key Bindings](#key-bindings)

## Install

Add the `+nav/fzf` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/fzf'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | -------------------------------------------------------------
SPC f b     | Find open buffer
SPC f f     | Find file
SPC f l     | Find line in loaded buffers
SPC f g     | Find line using ripgrep or the silver searcher (if available)
SPC f G     | Find line using git grep (if the `+scm/git` layer is enabled)
