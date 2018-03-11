# Airline Layer
This layer replaces the status/tabline with a nice airline bar using [`vim-airline/vim-airline`](https://github.com/vim-airline/vim-airline).

#### Table of Contents

- [Install](#install)
  - [Powerline Fonts](#powerline-fonts)

## Install
Add the `+ui/airline` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+ui/airline'
  " ...
endfunction
```

### Powerline Fonts
By default powerline fonts are enabled, to disable them set `g:sp_airline_disable_powerline_fonts` to 1 in your Neovim configuration file.
