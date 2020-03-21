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
elseif (g:spLspBackend ==? 'coc-lsp')
  " Packages are pulled in +completions/coc
  SpAddPlugin 'voldikss/vim-floaterm'
else
  " vim-lsp.
  SpAddPlugin 'prabirshrestha/async.vim'
  SpAddPlugin 'prabirshrestha/vim-lsp'
endif
