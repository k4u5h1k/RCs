set termguicolors
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
let mapleader=','
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'dkarter/bullets.vim'
Plugin 'tpope/vim-commentary'

call vundle#end()

filetype plugin indent on
syntax enable
" Use 4 spaces when indenting with '>'
set tabstop=4
" Insert 4 spaces when tab is pressed
set shiftwidth=4
set laststatus=0
set number relativenumber
set gdefault
set numberwidth=3
set ic
set belloff=all
set hidden
set bg=dark
set showmatch
set guifont=Inconsolata\ For\ Powerline:h20
set incsearch
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set complete-=i
set shell=/bin/bash
set showcmd
set expandtab
" Writes buffer before exit
set autowrite
" Auto reload file if opened outside current buffer window
set autoread

let @/ = ""
nnoremap ; :
" Closes all buffers except current
nnoremap <silent><leader>c :%bd\|e#\|bd#<cr>
nnoremap <silent> <leader><leader> :w <cr>
nnoremap <silent> <leader><space> :nohlsearch<cr>
nnoremap <silent> sv :w <cr> :source ~/.vimrc <cr>
inoremap jj <esc>
nnoremap <silent> :silent! wq! <cr> <esc>:silent! clo! <cr>
nnoremap <F6> :!python3 % <cr>
nnoremap c<F6> :w <cr> :!clang % &&./a.out <cr>
nnoremap <leader> "_
nnoremap <silent> <leader>t :NERDTreeToggle <cr>
nnoremap j gj
nnoremap k gk
map J 10j
map K 10k

au! BufNewFile,BufRead *.scpt setf applescript
au! BufNewFile,BufRead *.applescript setf applescript

augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.template
    autocmd BufNewFile *.c 0r ~/.vim/templates/c.template
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/cpp.template
    autocmd BufNewFile *.applescript 0r ~/.vim/templates/osa.template
    autocmd BufNewFile *.py 0r ~/.vim/templates/py.template
augroup END

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
