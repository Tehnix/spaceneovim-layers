# Dash Layer
This layer adds support for the offline documentation browser [Dash](https://kapeli.com/dash), via [`rizzatti/dash.vim`](https://github.com/rizzatti/dash.vim). Check out the plugin for more information on how to configure it.

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+docs/dash` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+docs/dash'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | ------------------------------------------------------
SPC d d     | Search for the word under cursor in the current docset
SPC d D     | Search for the word under cursor in all docsets
