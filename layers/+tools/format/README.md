# Format Layer
This layer adds support for formatting code via [`sbdchd/neoformat`](https://github.com/sbdchd/neoformat). Check out the plugin for more information on how to configure it.

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+tools/format` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+tools/format'
  " ...
endfunction
```

By default the formatter runs on save. You can disable this by setting `let g:spFormatOnSave = 0` in your `UserInit` function.

## Key Bindings
Key Binding | Description
----------- | --------------------------
SPC x f     | Format entire buffer or selection
