# Language Server Layer

This layer adds support for LSP language server clients, with the option of two different backends.

- [`prabirshrestha/vim-lsp`](https://github.com/prabirshrestha/vim-lsp)
- [`autozimu/LanguageClient-neovim`](https:/github.com/autozimu/LanguageClient-neovim)

#### Table of Contents

- [Install](#install)
- [Backends](#backends)
- [Supported Languages Included](#supported-languages-included)
- [Adding Support for Other Languages](#adding-support-for-other-languages)
  - [vim-lsp](#vim-lsp)
  - [nvim-lsp](#nvim-lsp)
- [Key Bindings](#key-bindings)
  - [Lists](#lists)
  - [Errors](#errors)

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

- **vim-lsp** --> [`vim-lsp`](https://github.com/prabirshrestha/vim-lsp)
- **nvim-lsp** (default for backwards compat.) --> [`LanguageClient-neovim`](https:/github.com/autozimu/LanguageClient-neovim)

You can configure the LSP you want by setting,

```viml
function! UserInit()
  ...
  let g:spLSPBackend = 'nvim-lsp' " Or 'vim-lsp'
endfunction
```

## Supported Languages Included

Support for the following languages are included. Note that most of these will work best in _vim-lsp_, since they have been set up with additionall configuration there, compared to _nvim-lsp_.

| Language  | vim-lsp | nvim-lsp | Command                      | Install                                                                      |
| --------- | ------- | -------- | ---------------------------- | ---------------------------------------------------------------------------- |
| Haskell   | √       | √        | `stack exec -- hie --lsp`    | [installing hie](https://github.com/haskell/haskell-ide-engine#installation) |
| JavaSript | √       | √        | `typescript-language-server` | `npm install -g typescript typescript-language-server`                       |
| TypeSript | √       | √        | `typescript-language-server` | `npm install -g typescript typescript-language-server`                       |
| OCaml     | √       | √        | `ocaml-language-server`      | `npm install -g ocaml-language-server`                                       |
| Reason    | √       | √        | `ocaml-language-server`      | `npm install -g ocaml-language-server`                                       |
| Rust      | √       | √        | `rustup run nightly rls`     | `rustup update && rustup component add rls-preview rust-analysis rust-src`   |
| Ruby      | √       | √        | `solargraph stdio`           | `gem install solargraph`                                                     |
| Python    | √       | √        | `pyls`                       | `pip install python-language-server`                                         |
| Go        | √       | √        | `go-langserver -mode stdio`  | `go get -u github.com/sourcegraph/go-langserver`                             |
| Docker    | √       | √        | `blank`                      | `npm install -g dockerfile-language-server-nodejs`                           |
| Clangd    | √       | √        | `clangd`                     | `brew install llvm` or `sudo pacman -S clang-tools-extra`                    |
| CQuery    | √       | √        | `cquery`                     | [installing cquery](https://github.com/jacobdufault/cquery/wiki)             |
| CCLS      | √       | √        | `ccls`                       | [installing ccls](https://github.com/MaskRay/ccls/wiki/Getting-started)      |

For additional servers, take a look at https://github.com/prabirshrestha/vim-lsp/wiki/Servers.

## Adding Support for Other Languages

You can manually add more servers with e.g.,

### vim-lsp

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
  if executable('hie')
    au User lsp_setup call lsp#register_server({
    \   'name': 'HIE'
    \ , 'cmd': { server_info->[&shell, &shellcmdflag, 'stack exec -- hie --lsp']}
    \ , 'whitelist': ['haskell']
    \})
  endif
endfunction
```

### nvim-lsp

```viml
function! UserConfig()
  if executable('rustup')
    let g:LanguageClient_serverCommands.rust = ['rustup', 'run', 'stable', 'rls']
  endif
  if executable('typescript-language-server')
    let g:LanguageClient_serverCommands.javascript = ['typescript-language-server']
    let g:LanguageClient_serverCommands.typescript = ['typescript-language-server']
    let g:LanguageClient_serverCommands.typescriptreact = ['typescript-language-server']
  endif
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
| SPC l C     | Context menu _(only nvim-lsp)_   |
| SPC l d     | Diagnostics _(only vim-lsp)_     |

### Lists

| Key Binding | Description                            |
| ----------- | -------------------------------------- |
| SPC l l s   | List all symbols in the current buffer |
| SPC l l S   | List all symbols from the project      |
| SPC l l R   | List all references                    |

### Errors

| Key Binding | Description                     |
| ----------- | ------------------------------- |
| SPC l e e   | Explain error _(only nvim-lsp)_ |
| SPC l e n   | Next error _(only vim-lsp)_     |
| SPC l e p   | Previous error _(only vim-lsp)_ |
