# Quickfix

This layer provides keybindings and customization for quickfix.

- [Install](#install)
- [Key Bindings](#key-bindings)

## Install

Add the `+checkers/quickfix` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+checkers/quickfix'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | -------------------------------
SPC e L     | Open the Quickfix error list
SPC e C     | Close the Quickfix error list
SPC e N     | Jump to next Quickfix error
SPC e P     | Jump to previous Quickfix error
SPC e F     | Jump to first Quickfix error
SPC e E     | Jump to last Quickfix error
