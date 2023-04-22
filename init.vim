:set number
:set relativenumber
:set autoindent
:set tabstop     =4
:set softtabstop =4
:set shiftwidth  =4
:set smarttab
:set expandtab
:set clipboard=unnamedplus

call plug#begin()
    Plug 'jacoborus/tender.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'chriskempson/base16-vim'
    Plug 'jam1garner/vim-code-monokai'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'github/copilot.vim'

    Plug 'MrcJkb/haskell-tools.nvim'
    Plug 'bfrg/vim-cpp-modern'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

if (has("termguicolors"))
    set termguicolors
endif

syntax enable

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


  " powerline symbols
let g:airline_left_sep = '▓▒░'
let g:airline_right_sep = '░▒▓'
let g:airline_symbols.branch = '\uF126 '
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

colorscheme codedark

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
