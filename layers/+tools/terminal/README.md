# Terminal Layer
This layer provides common functionality for terminal.

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+tools/terminal` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+tools/terminal'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | --------------------------
SPC !       | Start shell command prompt
SPC '       | Open a terminal below
