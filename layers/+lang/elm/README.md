# Elm Layer
This layer provides support for the Elm language with the following packages:

- [`elmcast/elm-vim`](https://github.com/elmcast/elm-vim)

#### Table of Contents
- [Install](#install)
  - [Binaries](#binaries)
- [Key Bindings](#key-bindings)
  - [Documentation](#documentation)

## Install
Add the `+lang/elm` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+lang/elm'
  " ...
endfunction
```

### Binaries
To utilize this layer you need `elm`, `elm-test`, `elm-format` and `elm-oracle` on your path. This can be done with,

```bash
$ npm install -g elm elm-test elm-format elm-oracle
```

## Key Bindings
Key Binding | Description
----------- | ------------------------
SPC m m     | Run elm-make
SPC m M     | Run elm-make on main.elm
SPC m t     | Run elm-test
SPC m r     | Open an elm repl
SPC m f     | Run elm-format
SPC m e     | Run error-detail

### Documentation
Key Binding | Description
----------- | --------------------
SPC m d s   | Show documentation
SPC m d b   | Browse documentation
