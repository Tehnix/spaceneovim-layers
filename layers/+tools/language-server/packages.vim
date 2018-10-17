" Set the default LSP backend to vim-lsp.
let g:spLspBackend = get(g:, 'spLspBackend', 'nvim-lsp')

" nvim-lsp.
if (g:spLspBackend ==? 'nvim-lsp')
  SpAddPlugin 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \}
  SpAddPlugin 'Shougo/echodoc.vim'
elseif (g:spLspBackend ==? 'ale-lsp')
  " Packages are pulled in +checkers/ale.
else
  " vim-lsp.
  SpAddPlugin 'prabirshrestha/async.vim'
  SpAddPlugin 'prabirshrestha/vim-lsp'
endif
