" Use system clipboard
set clipboard=unnamed
" Disable swap
set noswapfile
" Read modelines from files
set modeline

" Whitespace, tabs & spaces {{{
  set list                          " Show invisible characters
  set expandtab                     " Indent with spaces
  set softtabstop=2                 " Number of spaces per <tab> when inserting
  set shiftwidth=2                  " Number of spaces per <tab> when indenting
  set tabstop=4                     " Number of spaces <tab> counts for
" }}}

" UI {{{
  set laststatus=2
  set scrolloff=7                   " Set 7 lines to the cursor - when moving vertically using j/k
  set splitright                    " Split on the right side
  set splitbelow                    " Split below
  set number                        " Show current line number
  set relativenumber                " Enable relative line numbers
" }}}

" Backups {{{
  set nobackup
  set nowritebackup
  set undofile
  set undolevels=1000               " Maximum number of changes that can be undone
  set undoreload=10000              " Maximum number lines to save for undo on a buffer reload
  set undodir=$HOME/.vim/tmp/undo   " Set persistent undo directory
" }}}

" Search {{{
  set hlsearch                      " Highlight matches
  set incsearch                     " Search as characters are entered
  set ignorecase                    " Ignore case when searching
  set smartcase                     " unless there is a capital letter in the query
" }}}

" Mappings {{{
  " Move more senibly when line wrapping enabled
  nmap k gk
  nmap j gj

  " Switch between windows with CTRL
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  " Moving block of codes
  vnoremap < <gv
  vnoremap > >gv

  " Enable hlserch on start
  nnoremap / :set hlsearch<cr>/
" }}}
