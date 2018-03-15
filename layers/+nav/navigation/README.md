# Navigation Layer
This layer provides common functionality for navigating smoothly around Neovim, using

- [`easymotion/vim-easymotion`](https://github.com/easymotion/vim-easymotion)

#### Table of Contents
- [Install](#install)
- [Configuration](#configuration)
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

## Configuration
You can control whether easymotion should require one or two characters before searching, by setting `let g:spNavigationOneKey = 1`. By default this is set to false (`0`), meaning it uses two characters.

## Key Bindings
Key Binding | Description
----------- | -------------------------------
SPC d       | Start easymotion
SPC N <     | Go to first line
SPC N G     | Go to last line
SPC N >     | Go to line number
SPC N b     | Scroll page up
SPC N f     | Scroll page down
SPC N j     | Scroll line up
SPC N k     | Scroll line down
