# Language Server Layer

This layer adds support for the Neovim language server client.

- [`autozimu/LanguageClient-neovim`](https:/github.com/autozimu/LanguageClient-neovim)
- [`prabirshrestha/vim-lsp`](https://github.com/prabirshrestha/vim-lsp)

#### Table of Contents

- [Install](#install)
- [Backends](#backends)
- [Adding Support for Other Languages](#adding-support-for-other-languages)
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

## Backends

The LSP layer provides the choice of two different backends:

- **vim-lsp** (default) which is [`vim-lsp`](https://github.com/prabirshrestha/vim-lsp)
- **nvim-lsp** which is [`LanguageClient-neovim`](https:/github.com/autozimu/LanguageClient-neovim)

You can configure the LSP you want by setting,

```viml
function! UserInit()
  ...
  let g:spLSPBackend = 'nvim-lsp' " Or 'vim-lsp'
endfunction
```

## Adding Support for Other Languages

You can manually add more servers with e.g.,

**vim-lsp**:

```viml
function! UserConfig()
  if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
    \   'name': 'typescript-language-server'
    \ , 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']}
    \ , 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))}
    \ , 'whitelist': ['typescript', 'javascript', 'javascript.jsx', 'typescript.tsx']
    \})
  endif
endfunction
```

**nvim-lsp**:

```viml
function! UserConfig()
  let g:LanguageClient_serverCommands.rust = ['~/.cargo/bin/rustup', 'run', 'stable', 'rls']
  let g:LanguageClient_serverCommands.javascript = ['/usr/local/bin/typescript-language-server']
endfunction
```

**NB**: Make sure not to overwrite `g:LanguageClient_serverCommands` but instead just insert the new dict entries.

## Key Bindings

| Key Binding | Description                      |
| ----------- | -------------------------------- |
| SPC l i     | Show type and documentation info |
| SPC l g     | Go to definition                 |
| SPC l R     | Rename the item under the cursor |
| SPC l f     | Format the document              |
| SPC l F     | Format the current selection     |

### Lists

| Key Binding | Description                            |
| ----------- | -------------------------------------- |
| SPC l l s   | List all symbols in the current buffer |
| SPC l l S   | List all symbols from the project      |
| SPC l l R   | List all references                    |
