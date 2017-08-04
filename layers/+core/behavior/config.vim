" call SpaceNeovimLoadFunc(expand('<sfile>:p'), 'func.vim')

" Use system clipboard
set clipboard=unnamed
set noswapfile                      " Disable swap

" Shorten the time before the vim-leader-guide buffer appears
set timeoutlen=500
set ttimeoutlen=0

" UI {{{
  set modeline                      " Read modelines from files
  set laststatus=2
  set list                          " Show invisible characters
  set scrolloff=7                   " Set 7 lines to the cursor - when moving vertically using j/k
  set splitright                    " Split on the right side
  set splitbelow                    " Split below
  set number                        " Show current line number
  set relativenumber                " Enable relative line numbers
" }}}

" Whitespace, tabs & spaces {{{
  set expandtab                     " Indent with spaces
  set softtabstop=2                 " Number of spaces per <tab> when inserting
  set shiftwidth=2                  " Number of spaces per <tab> when indenting
  set tabstop=4                     " Number of spaces <tab> counts for
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

  " Use the silver searcher if available
  if executable('ag')
    " Define Ag command to search for the provided text and open a quickfix
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    " Use ag as grep method
    set grepprg=ag\ --nogroup\ --nocolor
  endif
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
