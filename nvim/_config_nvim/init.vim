call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-airline/airline.vim'
"Plug 'nvim-airline/airline-themes.vim'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
call plug#end()

"netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :Lexplore<CR>
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
augroup END

set rtp+=~/.fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

colorscheme zenburn
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'lucius'

let mapleader=" "
nnoremap <Leader>sv :source $MYVIMRC<CR> " source init.vim
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fF <cmd>lua require('telescope.builtin').find_browser()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>fG <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader><tab> <cmd>lua require('telescope.builtin').buffers()<cr> 
"nnoremap <leader>q :b#<cr>
nnoremap <leader>q <C-^>

set rtp+=~/.fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"<leader> - b - h :	Switch to the first buffer in the bufferlist
"<leader> - b - j :	Cycle to the next buffer in the bufferlist
"<leader> - b - k :	Cycle to the previous buffer in the bufferlist
"<leader> - b - l :	Switch to the last buffer in the bufferlist
"<leader> - b - d :	Delete current buffer


set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
"set number                  " add line numbers
set number relativenumber
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.


"<leader> - ~ :	Open Dashboard

"Ctrl - c :	Toggle line comment (multiple lines can be commented out in visual mode)
"<leader> - y - a :	Yank all text from selected buffer to system clipboard
"<leader/> - y - l :	Yank line to system clipboard.
"<leader/> - n - f :	Format buffer with neoformat.

"Ctrl - n :	Toggle line numbers.
"Ctrl - t :	Toggle nvimtree.

"Tab :	Cycle down through tab completion menu.
"Shift - Tab :	Cycle down through tab completion menu.
"Ctrl - e :	Close completion menu with completing anything.
"Ctrl - f :	Scroll up through documentation menu.
"Ctrl - d :	Scroll down through documentation menu.
":	Confirm completion.


"fonts for airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set encoding=utf-8
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
let g:airline_left_sep = ''
"let g:airline_left_sep = "\ue602"
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ' "press ga on a char to get its hexa
let g:airline_symbols.readonly = ''
" unicode symbols
"let g:airline_left_sep = "\u00bb"
"let g:airline_left_sep = "\u25b6"
"let g:airline_right_sep = "\u00ab"
"let g:airline_right_sep = "\u25c0"
"let g:airline_symbols.crypt = "\u0001f512"
"let g:airline_symbols.linenr = "\u240a"
"let g:airline_symbols.linenr = "\u2424"
"let g:airline_symbols.linenr = "\u00b6"
"let g:airline_symbols.branch = "\u2387"
"let g:airline_symbols.paste = "\u03c1"
"let g:airline_symbols.paste = "\u00de"
"let g:airline_symbols.paste = "\u2225"
"let g:airline_symbols.whitespace = "\u039e"
" "" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
" let g:airline_left_sep ="\ue0b0" 
"let g:airline_left_alt_sep = "\ue0b1"
"let g:airline_right_sep = "\ue0b2"
"let g:airline_right_alt_sep = "\ue0b3"
"let g:airline_symbols.branch = "\ue0a0"
"let g:airline_symbols.readonly = "\ue0a2"
"let g:airline_symbols.linenr = "\ue0a1"
" "" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'
" let g:airline_symbols.space = "\ua0"
"let g:airline_theme='powerlineish'
"let g:airline_theme='molokai' 
"let g:airline_left_sep='<'
"let g:airline_right_sep='>'
"let g:airline_section_z='#' 

