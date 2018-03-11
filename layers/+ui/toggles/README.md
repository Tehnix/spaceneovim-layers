# Toggles Layer
This layer provides toggles for various things.

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

  - [Highlighting](#highlighting)

## Install
Add the `+ui/airline` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+ui/airline'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | -----------------------------
SPC t n     | Toggle line numbers
SPC t r     | Toggle relative line numbers
SPC t l     | Toggle truncating lines
SPC t s     | Toggle syntax highlighting
SPC t S     | Toggle spell checking
SPC t H     | Toggle showing hidden symbols

### Highlighting
Key Binding | Description
----------- | ---------------------------------------------
SPC t h c   | Toggle highlight for current line indentation
SPC t h h   | Toggle highlight for current line
SPC t h p   | Toggle highlight for parenthesis
SPC t h s   | Toggle highlight for search results
