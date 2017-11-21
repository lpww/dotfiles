" leader
let mapleader = " "

set ruler " display cursor position
set showcmd " display incomplete commands
set laststatus=2 " always display the status line
set autowrite " automatically write before running commands
set scrolloff=1 " display at least 1 lines around you cursor
set visualbell " prevent Vim from beeping
set noerrorbells " prevent Vim from beeping
set backspace=indent,eol,start " backspace behaves as expected
set hidden " hide buffers when switching between them
set directory^=$HOME/.vim/tmp// " set swap dir
set encoding=utf-8 "set the encoding

" switch syntax highlighting on, when the terminal has colors
" also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set nocompatible " disable vi compatability
filetype off " disable while vundle loads

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
Plugin 'tpope/vim-unimpaired'
Plugin 'w0rp/ale'
Plugin 'janko-m/vim-test'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'

call vundle#end()

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " when editing a file, always jump to the last known cursor position.
  " don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " ale linting events
  set updatetime=1000
  let g:ale_lint_on_text_changed = 0
  autocmd CursorHold * call ale#Lint()
  autocmd CursorHoldI * call ale#Lint()
  autocmd InsertEnter * call ale#Lint()
  autocmd InsertLeave * call ale#Lint()
augroup END

" when the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" search
set incsearch " highlight search results when typing
set hlsearch " highlight search results
set ignorecase " ignore case when searching
set smartcase " upper case enables case sensitive search

" softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" use one space, not two, after punctuation
set nojoinspaces

" make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" numbers
set number
set numberwidth=5

" use hybrid line numbers in normal mode and absolute in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" autocomplete with dictionary words when spell check is on
set complete+=kspell

" always use vertical diffs
set diffopt+=vertical

" despacio colorscheme
let g:despacio_Sunset = 1
colorscheme despacio

" auto indent new lines
set autoindent
set smartindent

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" highlight current cursor line and column
set cursorline
set cursorcolumn

" set the colorcolumn to dark
highlight ColorColumn ctermbg=1

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

" tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
  else
      return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" tab-completion for file-related tasks
set path+=**

" display all matching files when we tab complete
set wildmenu

" switch between the last two files
nnoremap <Leader><Leader> <c-^>

" get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" execute current line as shell command and replace with output
noremap Q !!$SHELL<CR>

" escape with kj
imap kj <Esc>
vmap kj <Esc>

" vv to generate new vertical split
nnoremap <silent> <Leader>v <C-w>v

" hh to generate new horizontal split
nnoremap <silent> <Leader>h <C-w>s

" make Y behave like other capitals
map Y y$

