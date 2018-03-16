# Navigation Layer
This layer provides common functionality for navigating smoothly around Neovim.


#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+nav/navigation` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+nav/navigation'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | -------------------------------
SPC N <     | Go to first line
SPC N G     | Go to last line
SPC N >     | Go to line number
SPC N b     | Scroll page up
SPC N f     | Scroll page down
SPC N j     | Scroll line up
SPC N k     | Scroll line down
