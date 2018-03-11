# Quickfix (and Location)
This layer provides keybindings and customization for quickfix and location list.

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)
  - [Location list](#location-lise)

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

### Location list
Key Binding | Description
----------- | -------------------------------
SPC e l l   | Open the location error list
SPC e l c   | Close the location error list
SPC e l n   | Jump to next location error
SPC e l æ   | Jump to previous location error
SPC e l f   | Jump to first location error
SPC e l e   | Jump to last location error
