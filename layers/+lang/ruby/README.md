# Ruby Layer

This layer provides support for the Ruby language with the following packages:

- `fishbullet/deoplete-ruby`

- [Install](#install)
- [Key Bindings](#key-bindings)

## Install

Add the `+lang/ruby` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/ruby'
  " ...
endfunction
```

## Key Bindings

Key Binding | Description
----------- | -----------------------------------
SPC m :     | Replace `:symbol =>` with `symbol:`
SPC m b     | Convert blocks
SPC m l     | Extract variable to let
SPC m s     | Convert Struct to Class
