set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
let mapleader=','

source ~/.vim/plugins/startscreen/plugin/startscreen.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'dkarter/bullets.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'Yggdroot/indentLine'
Plugin 'meain/vim-printer'

call vundle#end()

let g:python_recommended_style = 0
filetype plugin indent on
syntax enable

hi Normal guibg=NONE ctermbg=NONE

set laststatus=0
set path+=**
set number relativenumber
set gdefault
set numberwidth=3
set smartcase
set belloff=all
set hidden
" set bg=dark
set showmatch
set guifont=Inconsolata\ For\ Powerline:h17
set incsearch
" let g:gruvbox_contrast_light='soft'
" let g:gruvbox_contrast_dark='hard'
colorscheme ryuuko
" colo nord
set complete-=i
set shell=/bin/bash
set showcmd
set noswapfile
set expandtab
" set textwidth=80
" set colorcolumn=80
" Writes buffer before exit
set autowrite
" Auto reload file if opened outside current buffer window
set autoread
set title
set wildmenu
set smartindent

" this makes system clipboard default
" but makes unintended actions
set clipboard=unnamed,unnamedplus

" Print count of search occurences bottom right
set shortmess-=S

let @/ = ""
nnoremap ; :
vnoremap ; :
" Closes all buffers except current
nnoremap <silent><leader>c :%bd\|e#\|bd# <cr>
nnoremap <leader><leader> <C-^>
" nnoremap <silent> <leader><leader> :w <cr>
nnoremap <silent> <leader><space> :nohlsearch <cr>
nnoremap <silent> sv :w<cr> :source ~/.vimrc <cr>
inoremap jj <esc>
nnoremap <F6> :!python3 % <cr>
nnoremap c<F6> :w <cr> :!clang % &&./a.out <cr>
nnoremap <leader> "_
nnoremap <silent> <leader>t :NERDTreeToggle <cr>
vnoremap <leader>y "+y
nnoremap <leader>v "+p
nnoremap j gj
nnoremap k gk
nnoremap <leader>f :echo @% <cr>
" nnoremap <leader>e :e <C-r>+<cr>
nnoremap <silent><leader>e :GFiles <cr>
noremap <silent><S-Tab> :call ToggleTab() <cr>
inoremap <silent><S-Tab> <esc>:call ToggleTab() <cr>
map J 10j
map K 10k

command Makescript call Makescript()

" Super Tab settings
let g:SuperTabDefaultCompletionType = "context"

au! BufNewFile,BufRead *.scpt setf applescript
au! BufNewFile,BufRead *.applescript setf applescript

augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.template
    autocmd BufNewFile *.c 0r ~/.vim/templates/c.template
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/cpp.template
    autocmd BufNewFile *.applescript 0r ~/.vim/templates/osa.template
    autocmd BufNewFile *.py 0r ~/.vim/templates/py.template
augroup END

if exists('$TMUX')
    let &t_EI = "\<Esc>[1 q"
    let &t_SR = "\<Esc>[3 q"
    let &t_SI = "\<Esc>[5 q"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

function ToggleTab()
    if(g:python_recommended_style==1)
        set noexpandtab
        set softtabstop=8
        set shiftwidth=8
    else
        set expandtab
        set tabstop=4
        set softtabstop=4
        set tabstop=8
        set shiftwidth=4
    endif
endfunction

function Makescript()
    1r ~/.vim/templates/pyscript.template
endfunction

if(stridx(expand("%:p"),"maryam")!=-1)
    set noexpandtab
    set tabstop=8
    set shiftwidth=8
else
    set tabstop=8
    " Insert 4 spaces when tab is pressed
    set shiftwidth=4
    set expandtab
endif

