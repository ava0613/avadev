call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

colorscheme zenburn

let mapleader=" "
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fF <cmd>lua require('telescope.builtin').find_browser()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>fG <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader><tab> <cmd>lua require('telescope.builtin').buffers()<cr> 
"nnoremap <leader>q :b#<cr>
nnoremap <leader>q <C-^>

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
set number                  " add line numbers
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


