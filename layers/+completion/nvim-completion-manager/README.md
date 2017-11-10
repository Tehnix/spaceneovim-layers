# NCM: nvim-completion-manager

This layer provides an asynchronous keyword completion system in the current buffer [nvim-completion-manager](https://github.com/roxma/nvim-completion-manager).

- [Install](#install)

## Install

Add the `+completion/nvim-completion-manager` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+completion/nvim-completion-manager'
  " ...
endfunction
```

It's recommended you also install `pip3 install --user neovim jedi psutil setproctitle`.
