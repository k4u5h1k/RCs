set nocompatible 
set rtp+=~/.config/nvim/bundle/Vundle.vim
let &packpath = &runtimepath
let mapleader=','

if @% == ""
    source ~/.vim/plugins/hydra.vim/plugin/startscreen.vim
endif

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nvim-lua/telescope.nvim'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'Yggdroot/indentLine'
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'k4u5h1k/vim-printer'
Plugin 'neoclide/coc.nvim'
Plugin 'adelarsq/vim-matchit'

call vundle#end()

" let g:gruvbox_contrast_dark="hard"
" colorscheme gruvbox

colo hybrid
set cursorline

filetype plugin indent on
syntax enable

set tabstop=4
set shiftwidth=4
set laststatus=0
set path+=**
set number relativenumber
set gdefault
set numberwidth=3
set smartcase
set belloff=all
set hidden
set showmatch
set incsearch
set complete-=i
set shell=/bin/bash
set showcmd
set noswapfile
set expandtab
set autowrite
set autoread
set title
set wildmenu
set smartindent

" this makes system clipboard default
" but makes unintended actions
" set clipboard=unnamed,unnamedplus

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
nnoremap <silent> sv :w<cr> :source ~/.config/nvim/init.vim <cr>
inoremap jj <esc>
nnoremap <F6> :!python3 % <cr>
nnoremap c<F6> :w <cr> :!clang % &&./a.out <cr>
nnoremap <leader> "_
nnoremap <silent> <leader>t :NERDTreeToggle <cr>
nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap <leader>f :echo @% <cr>
nnoremap <silent>zz <C-z>
" nnoremap <leader>e :e <C-r>+<cr>
noremap <silent><S-Tab> :call ToggleTab() <cr>
inoremap <silent><S-Tab> <esc>:call ToggleTab() <cr>
map <silent>J 10j
map <silent>K 10k

" Find files using Telescope command-line sugar.
nnoremap <leader>e <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

command Makescript call Makescript()


" To prevent coc zombies
autocmd VimLeavePre * :call coc#rpc#kill()
autocmd VimLeave * if get(g:, 'coc_process_pid', 0) | call system('kill -9 -'.g:coc_process_pid) | endif

augroup templates
    autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/sh.template
    autocmd BufNewFile *.c 0r ~/.config/nvim/templates/c.template
    autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/cpp.template
    autocmd BufNewFile *.applescript 0r ~/.config/nvim/templates/osa.template
    autocmd BufNewFile *.py 0r ~/.config/nvim/templates/py.template
    autocmd BufNewFile *.html 0r ~/.config/nvim/templates/html.template
    autocmd BufNewFile *.java 0r ~/.config/nvim/templates/java.template
augroup END

au! BufNewFile,BufRead *.scpt setf applescript
au! BufNewFile,BufRead *.applescript setf applescript

" COC <Tab> remap for completion
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

let g:clipboard = {
    \ 'name': 'xsel',
    \ 'copy': {
        \ '+': ['win32yank.exe', '-i', '--crlf'],
        \ '*': ['win32yank.exe', '-i', '--crlf'],
        \ },
    \ 'paste': {
        \ '+': ['win32yank.exe', '-o', '--lf'],
        \ '*': ['win32yank.exe', '-o', '--lf'],
    \ },
    \ 'cache_enabled': 0,
\ }

if exists('$TMUX')
    let &t_EI = "\<Esc>[1 q"
    let &t_SR = "\<Esc>[3 q"
    let &t_SI = "\<Esc>[5 q"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if has('persistent_undo')
  silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
  set undodir=~/.config/nvim/backups
  set undofile
endif

function ToggleTab()
	if(&expandtab==1)
		set noexpandtab
	else
		set expandtab
	endif
endfunction

function Makescript()
    1r ~/.config/nvim/templates/pyscript.template
endfunction

if(stridx(getcwd(),"maryam")!=-1)
    set noexpandtab
else
    set expandtab
endif

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
