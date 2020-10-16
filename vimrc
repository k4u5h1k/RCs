set nocompatible
filetype off

let mapleader=','
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'dkarter/bullets.vim'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'stevearc/vim-arduino'
Plugin 'ervandew/supertab'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-commentary'
" Plugin 'junegunn/fzf'
Plugin 'tpope/vim-surround'
"It's easiest to explain with examples. Press cs"' inside
""Hello world!"
"to change it to
"'Hello world!'
"Now press cs'<q> to change it to
"<q>Hello world!</q>
"To go full circle, press cst" to get
""Hello world!"
"To remove the delimiters entirely, press ds".
"Hello world!
"Now with the cursor on Hello, press ysiw] (iw is a text object).
"[Hello] world!
"Let's make that braces and add some space (use } instead of { for no space): cs]{
"{ Hello } world!
"Now wrap the entire line in parentheses with yssb or yss).  "({ Hello } world!)
"Revert to the original text: ds{ds)
"Hello world!
"Emphasize hello: ysiw<em>
"<em>Hello</em> world!
"Finally, let's try out visual mode. Press a capital V (for linewise visual mode) followed by S<p class="important">.
"<p class="important">
" <em>Hello</em> world!
"</p>
Plugin 'meain/vim-printer'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
" Plugin 'mileszs/ack.vim'
Plugin 'rhysd/clever-f.vim'

call vundle#end()

filetype plugin indent on
syntax enable
" Use 4 spaces when indenting with '>'
set tabstop=4
" Insert 4 spaces when tab is pressed
set shiftwidth=4
set laststatus=2
set complete-=i
set shell=/bin/zsh
set showcmd
set expandtab
" " Auto reload file if opened outside current buffer window
" set autoread
" set linespace=
set encoding=utf-8
set wildmenu
set noswapfile
" set cursorline
" Keep 2 line above and under the cursor at all times
set scrolloff=2
" Default 20
set history=999
" Hit setlocal spell to turn spellcheck on
" set wrap
set spelllang=en
set nostartofline
set hlsearch
set showmatch
set guifont=Inconsolata\ For\ Powerline:h20
set fo+=t
set incsearch
set guioptions=e
" makes internal terminal work idk how
set guioptions+=!
set number relativenumber
set gdefault
set numberwidth=3
set ic
set belloff=all
set hidden
set autoread
" writes buffer before it is hidden
set autowrite
" set foldenable
" set foldlevelstart=10
set lazyredraw
set termwinsize=10x0
set splitbelow

" sets previous search term to null so sourcing vimrc does not highlight previous search
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
nnoremap <leader> "_
nnoremap <silent> <leader>t :NERDTreeToggle <cr>
nnoremap j gj
nnoremap k gk
map J 10j
map K 10k

" autocmd Filetype python nnoremap <buffer> <F9> :w <cr> :vert ter python3 \"%" <cr>
nnoremap <buffer> <F3> :exec '!python3' shellescape(@%, 1)<cr>
" nnoremap <silent> <buffer> <F9> :call timer_stop(timer)<cr>:call MyHandler(200) <cr>
" nnoremap <F9> :!%:p <cr>

" Move to beginning/end of line
nnoremap BB ^
nnoremap EE $

" $/^ doesn't do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>

" No arrow keys masterrace
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Gruvbox settings
set bg=dark
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='dark'
colorscheme gruvbox

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_section_y = "Don't Give Up"
" let g:airline_left_sep=''
" let g:airline_right_sep=''

let g:indentLine_char_list = ['┆']
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"
" Super tab settings
let g:SuperTabDefaultCompletionType = "context"

" snippet run vim-medievel
" nnoremap <buffer> Z! :<C-U>EvalBlock<CR>
" let g:medieval_langs = ['python=python3', 'ruby', 'sh', 'console=bash']

" Template path
let g:tmpl_search_paths = ['~/templates']

" Arduino
" noremap <buffer> <leader>av :ArduinoVerify<CR>
" nnoremap <buffer> <leader>au :ArduinoUpload<CR>
" nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
" nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
" nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

" For bullet lists
let g:bullets_enabled_file_types = ['markdown', 'text', 'gitcommit']

" vim-rainbow 
let g:rainbow_active = 1

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Apply syntax highlighting for applescript files
au! BufNewFile,BufRead *.scpt setf applescript
au! BufNewFile,BufRead *.applescript setf applescript

augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.template
    autocmd BufNewFile *.c 0r ~/.vim/templates/c.template
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/cpp.template
    autocmd BufNewFile *.applescript 0r ~/.vim/templates/osa.template
    autocmd BufNewFile *.py 0r ~/.vim/templates/py.template
    autocmd BufNewFile *.html 0r ~/.vim/templates/html.template
augroup END
