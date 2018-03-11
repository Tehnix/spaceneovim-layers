# Syntastic Syntax Checking
This layer provides on the fly syntax checking, using

- [`scrooloose/syntastc`](https://github.com/scrooloose/syntastc).

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+checkers/syntastc` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+checkers/syntastc'
  " ...
endfunction
```

By default it will populate the loclist. For performance reasons aggregate errors and checking on open is disabled (since it runs synchronously).

## Key Bindings
| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC e r     | Run Syntastic                                                  |
| SPC e v     | Syntastic version info                                         |
| SPC e L     | Open the Syntastic error list (loclist)                        |
| SPC e C     | Close the Syntastic error list (loclist)                       |
| SPC e N     | Jump to next Syntastic error                                   |
| SPC e P     | Jump to previous Syntastic error                               |
