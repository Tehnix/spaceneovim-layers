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

" Restore cursor {{{
  " FROM: http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
  " Tell vim to remember certain things when we exit
  "  '40  :  marks will be remembered for up to 10 previously edited files
  "  "100 :  will save up to 100 lines for each register
  "  :20  :  up to 20 lines of command-line history will be remembered
  "  %    :  saves and restores the buffer list
  "  n... :  where to save the viminfo files
  set viminfo='40,\"100,:20,%,n~/.config/nvim/viminfo

  function! ResCur()
    if line("'\"") <= line("$")
      normal! g`"
      return 1
    endif
  endfunction

  augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
  augroup END
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
  " Clear search highlight on 'SPC SPC'
  nnoremap <leader><leader> :noh<CR>

  " Make super tab start from the top and go down.
  let g:SuperTabDefaultCompletionType = "<c-n>"

  " Enable mouse mode.
  set mouse=a

  " Make enter select item when completion menu is visible.
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Set messages to be short.
  set shortmess=at

  " Set soft wrap indent to be ` ·`.
  set breakindent
  set breakindentopt=shift:0
  set showbreak=\ \·
" }}}
