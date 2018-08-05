# NCM2
This layer provides an asynchronous keyword completion system in the current buffer, using

- [`NCM2`](https://github.com/ncm2/ncm2).

#### Table of Contents
- [Install](#install)

## Install
Add the `+completion/ncm2` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+completion/ncm2'
  " ...
endfunction
```

It's recommended you also install `pip3 install --user neovim jedi psutil setproctitle`.
