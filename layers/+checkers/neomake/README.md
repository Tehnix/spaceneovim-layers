# Neomake Syntax Checking

This layer provides on the fly syntax checking using [Neomake](https://github.com/neomake/neomake).

- [Install](#install)
- [Key Bindings](#key-bindings)

## Install

Add the `+checkers/neomake` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+checkers/neomake'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | --------------------------------------
SPC e r     | Run Neomake
SPC e l     | Open the Neomake error list (loclist)
SPC e c     | Close the Neomake error list (loclist)
SPC e n     | Jump to next Neomake error
SPC e p     | Jump to previous Neomake error
