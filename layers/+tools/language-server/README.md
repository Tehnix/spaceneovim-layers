# Language Server Layer
This layer adds support for the Neovim language server client.

- [`autozimu/LanguageClient-neovim`](https:/github.com/autozimu/LanguageClient-neovim)

#### Table of Contents
- [Install](#install)
- [Key Bindings](#key-bindings)

## Install
Add the `+tools/language-server` layer in your configuration file,

```viml
function! Layers()
  " ...
  Layer '+tools/language-server'
  " ...
endfunction
```

The layer assumes you setup the language servers yourself, or rely on language layers to do it for you.

You can manually add more servers with e.g.,

```viml
function! UserConfig()
  let g:LanguageClient_serverCommands.rust = ['~/.cargo/bin/rustup', 'run', 'stable', 'rls']
  let g:LanguageClient_serverCommands.javascript = ['/usr/local/bin/javascript-typescript-stdio']
endfunction
```

__NB__: Make sure not to overwrite `g:LanguageClient_serverCommands` but instead just insert the new dict entries.

## Key Bindings
Key Binding | Description
----------- | --------------------------------
SPC l i     | Show type and documentation info
SPC l g     | Go to definition
SPC l R     | Rename the item under the cursor
SPC l f     | Format the document
SPC l F     | Format the current selection

### Lists
Key Binding | Description
----------- | --------------------------------------
SPC l l s   | List all symbols in the current buffer
SPC l l S   | List all symbols from the project
SPC l l R   | List all references
