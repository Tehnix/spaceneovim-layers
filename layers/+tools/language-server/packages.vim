" Set the default LSP backend to vim-lsp.
let g:spLSPBackend = get(g:, 'spLSPBackend', 'vim-lsp')

" nvim-lsp.
if (g:spLSPBackend ==? 'nvim-lsp')
  SpAddPlugin 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \}
  SpAddPlugin 'Shougo/echodoc.vim'
else
  " vim-lsp.
  SpAddPlugin 'prabirshrestha/async.vim'
  SpAddPlugin 'prabirshrestha/vim-lsp'
endif
