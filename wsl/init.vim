set nocompatible 

call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'meain/vim-printer'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'adelarsq/vim-matchit'
Plug 'voldikss/vim-floaterm'
Plug 'dkarter/bullets.vim'
Plug 'rhysd/clever-f.vim'
Plug 'dstein64/vim-startuptime'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhinz/vim-sayonara'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pechorin/any-jump.vim'
Plug 'luochen1990/rainbow'
Plug 'chrisduerr/vim-undead'
Plug 'junegunn/gv.vim'
Plug 'k4u5h1k/hydra.vim'

call plug#end()

" let g:gruvbox_contrast_dark="hard"
" colorscheme gruvbox

colo hybrid
set cursorline

filetype plugin indent on
syntax enable

set mouse=a
set scrolloff=2
set tabstop=4
set shiftwidth=4
set laststatus=0
set path+=**
set number relativenumber
set gdefault
set linebreak "text wrap wont break words
set numberwidth=3
set smartcase
set belloff=all
set hidden
set showmatch
set incsearch
set nohlsearch
set complete-=i
set shell=/bin/bash
set showcmd
set noswapfile
set expandtab
set autowrite
set autoread
set title
set wildmenu
set autoindent
set autochdir

" this makes system clipboard default
" but makes unintended actions
set clipboard=unnamed,unnamedplus

" Print count of search occurences bottom right
set shortmess-=S


" set signcolumn=number

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

let g:netrw_browsex_viewer= "wslview"

let @/ = ""

nnoremap <SPACE> <Nop>
let mapleader=' '

map <silent>J 10gj
map <silent>K 10gk
nnoremap <silent>j gj
nnoremap <silent>k gk
" map <silent>J <c-d>
" map <silent>K <c-u>
nnoremap <silent>j gj
nnoremap <silent>k gk

nnoremap ; :
vnoremap ; :

" Closes all buffers except current
nnoremap <silent><leader>c :%bd\|e#\|bd# <cr>
" nnoremap <leader><leader> <C-^>
nnoremap <silent> <leader><leader> :w <cr>
nnoremap <silent> <leader>n :nohlsearch <cr>
nnoremap <silent>sv :w <cr> :source ~/.config/nvim/init.vim <cr>
inoremap jj <esc>

" nnoremap <F6> :!python3 % <cr>
" nnoremap c<F6> :w<cr>:!clang % &&./a.out <cr>
nnoremap " "_
vnoremap " "_

nnoremap <leader>ff :echo @% <cr>
nnoremap <silent>zz <C-z>

noremap <silent><S-Tab> :call ToggleTab() <cr>
inoremap <silent><S-Tab> <esc>:call ToggleTab() <cr>

nnoremap <silent><leader>s :%!sort -u --version-sort <cr>

nnoremap <silent><leader>t :FloatermToggle<CR>
tnoremap <silent>jj <C-\><C-n>

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange() <cr>

nnoremap <leader>gb <cmd>GBrowse <cr>
nnoremap <silent>gb :BufferLinePick<CR>

nnoremap <silent><Left> :BufferLineCyclePrev<CR>
nnoremap <silent><Right> :BufferLineCycleNext<CR>
nnoremap <silent><Down> :BufferLineMoveNext<CR>
nnoremap <silent><Up> :BufferLineMovePrev<CR>

nnoremap <silent><leader>q :Sayonara<CR>
nnoremap <silent><leader>g :Git blame<CR>

" Move to beginning/end of line
vnoremap H ^
vnoremap L g_
nnoremap H ^
nnoremap L g_
nnoremap $ g_

nnoremap <silent> = @=(foldlevel('.')?'za':"f")<CR>
vnoremap = zf

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

"All COC stuff
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

let g:floaterm_width=1.0
let g:floaterm_height=0.5
let g:floaterm_position='bottom'

let g:rainbow_active = 1

" " Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" To prevent coc zombies
autocmd VimLeavePre * :call coc#rpc#kill()
autocmd VimLeave * if get(g:, 'coc_process_pid', 0) | call system('kill -9 -'.g:coc_process_pid) | endif

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-css', 'coc-sh']

" COC <Tab> remap for completion
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1):
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Find files using Telescope command-line sugar.
nnoremap <leader>e <cmd>Telescope find_files<cr>
nnoremap <leader>ge <cmd>Telescope git_files<cr>
nnoremap <leader>o <cmd>Telescope oldfiles<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>d <cmd>lua Cd('$HOME')<cr>
nnoremap <leader>d <cmd>lua Cd('$HOME/stuff')<cr>
nnoremap <leader>cwd <cmd>echo substitute(getcwd(), $HOME, '~', '')<cr>
nnoremap <C-a> <C-W>

" Template autocommands
au! BufNewFile,BufRead *.scpt setf applescript
au! BufNewFile,BufRead *.applescript setf applescript
augroup templates
    autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/sh.template
    autocmd BufNewFile *.c 0r ~/.config/nvim/templates/c.template
    autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/cpp.template
    autocmd BufNewFile *.applescript 0r ~/.config/nvim/templates/osa.template
    autocmd BufNewFile *.py 0r ~/.config/nvim/templates/py.template
    autocmd BufNewFile *.html 0r ~/.config/nvim/templates/html.template
    autocmd BufNewFile *.java 0r ~/.config/nvim/templates/java.template
augroup END

autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeavePre * call system("tmux rename-window bash")

" Treesitter, Bufferline and telescope-proj config

lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = {"c","javascript","python","lua","go","cpp","php","r","todotxt","yaml","html","bash","java","dockerfile"},
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    additional_vim_regex_highlighting = true
  },
}

require "nvim-treesitter.highlight"                                              
local hlmap = vim.treesitter.highlighter.hl_map                                  
hlmap["punctuation.bracket"] = nil

require("bufferline").setup{
  diagnostics = "coc",
  show_buffer_icons = true,
  show_tab_indicators = true,
  show_buffer_close_icons = true, 
  show_close_icon = true,
  separator_style = "slant"
}

require("telescope").setup{
    defaults = {
        layout_config = {
            vertical = { width = 0.95, height = 0.95 }
        },
        preview = {
            filesize_hook = function(filepath, bufnr, opts)
                local max_bytes = 1000
                local cmd = {"head", "-c", max_bytes, filepath}
            end
        },
        file_ignore_patterns = { "node%_modules/.*", "build/*" }
    },
}

local actions = require('telescope.actions')  
local actions_state = require('telescope.actions.state')  
local previewers = require('telescope.previewers')  
local sorters = require('telescope.sorters')  
local pickers = require('telescope.pickers')  
local finders = require('telescope.finders')  
local utils = require('telescope.utils')  
local actions_set = require('telescope.actions.set')  
local from_entry = require('telescope.from_entry')

local cdPicker = function(name, cmd)
    pickers.new({}, {
        prompt_title = name,
        finder = finders.new_oneshot_job(cmd),
        previewer = previewers.vim_buffer_cat.new({}),
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(prompt_bufnr)
            actions_set.select:replace(function(_, type)
                local entry = actions_state.get_selected_entry()
                actions.close(prompt_bufnr)
                local dir = from_entry.path(entry)
                vim.cmd('cd '..dir)
                require('telescope.builtin').find_files()
            end)
            return true
        end,
    }):find()
end

function Cd(path)
    path = path or '.'
    cdPicker('cd', {vim.o.shell, '-c', "fd . "..path.." --type=d 2>/tmp/err"})
end

function Cdz()
    cdPicker('z directories', {vim.o.shell, '-c', "cat ~/.z | cut -d '|' -f1"})
end

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
