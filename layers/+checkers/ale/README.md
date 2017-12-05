# Ale - Asynchronous Lint Engine

This layer provides on the fly syntax checking and linting using [Ale](https://github.com/w0rp/ale).

- [Install](#install)
- [Key Bindings](#key-bindings)

## Install

Add the `+checkers/ale` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+checkers/ale'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | -----------------------------------
SPC e r     | Run Ale lint
SPC e l     | Open the Ale error list (loclist)
SPC e c     | Close the Ale error list (loclist)
SPC e n     | Jump to next Ale error
SPC e p     | Jump to previous Ale error
SPC e f     | Jump to first Ale error in the file
SPC e F     | Jump to last Ale error in the file
SPC e d     | Open Ale detail window (can be closed with _q_ directly in the window)

