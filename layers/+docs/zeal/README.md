# Zeal Layer
This layer adds support for the offline documentation browser [Zeal](https://zealdocs.org/), via [`KabbAmine/zeavim.vim`](https://github.com/KabbAmine/zeavim.vim). Check out the plugin for more information on how to configure it.

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+docs/zeal` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+docs/zeal'
  " ...
endfunction
```

## Key Bindings
Key Binding | Description
----------- | ----------------------------------------------------------------
SPC d d     | Search for the word under cursor or the current visual selection
SPC d D     | Search with a docset and a query
