" vim config

" Cancel the compatibility with Vi. Essential if you want
" to enjoy the features of Vim
set nocompatible
filetype off

" init vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" vundle packages
Plugin 'VundleVim/Vundle.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'AlessandroYorba/Despacio'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'

call vundle#end()
filetype plugin indent on

" -- Display
set title                 " Update the title of your window or your terminal
set ruler                 " Display cursor position
set wrap                  " Wrap lines when they are too long

" Hybrid line numbers
set number relativenumber

" Use hybrid line numbers in normal mode and absolute in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set scrolloff=1           " Display at least 1 lines around you cursor

set guioptions=T          " Enable the toolbar

" -- Search
set ignorecase            " Ignore case when searching
set smartcase             " If there is an uppercase in your search term
                          " search case sensitive again
set incsearch             " Highlight search results when typing
set hlsearch              " Highlight search results

" -- Beep
set visualbell            " Prevent Vim from beeping
set noerrorbells          " Prevent Vim from beeping

" Backspace behaves as expected
set backspace=indent,eol,start

" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden

" Enable syntax highlighting
syntax enable

" Load despacio colorscheme
let g:despacio_Sunset = 1
colorscheme despacio

" Disabling the directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Execute current line as shell command and replace with output
noremap Q !!$SHELL<CR>

" Store all swp files in the same dir - removes lock functionality
set directory^=$HOME/.vim/tmp//

" line at max line width
set colorcolumn=80

" execute command while preserving editor state
function! Preserve(command)
  " save cursor position and search history
  let l:save = winsaveview()
  " do the business
  execute a:command
  " restore search history and cursor position
  call winrestview(l:save)
endfunction

" remove white space
nnoremap <F5> :call Preserve("%s/\\s\\+$//e")<CR>

" escape with ;;
:imap ;; <Esc>

" auto indent new lines
set autoindent
set smartindent

" use indents of 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab

" enable jsx syntax highlighting
let g:jsx_ext_required = 0

