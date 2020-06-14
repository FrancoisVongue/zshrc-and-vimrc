syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set foldmethod=indent           "fold based on spaces
set wildmenu                    "show files on tab in e: 
set wildmode=list:longest,full
set autoindent             " Respect indentation when starting a new line.
set hlsearch
set relativenumber
set number
set scroll=7
set scrolloff=10
set autowrite              " write on buffer switch
inoremap <Esc> <Esc>:w<CR> " write on exit from insert


set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.
set clipboard=unnamed       " Copy into system * registers
set backspace=2            " Fix backspace behavior on most terminals.

packloadall
silent! helptags ALL

noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" Use ; in addition to : to type commands.
noremap ; :

call plug#begin()               "manage plugins with vim-plug

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim' 
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'raimondi/delimitmate'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar' 
Plug 'scrooloose/nerdtree' 
Plug 'mileszs/ack.vim' 

call plug#end()

colorscheme gruvbox
set bg=dark

let mapleader = ","
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_brose_split = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:coc_disable_startup_warning = 1

nmap <leader>cs :source $MYVIMRC<cr>
nnoremap <leader>ut :UndotreeShow<cr>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>qf :q!<cr>
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <c-p> :Files<cr>
nnoremap <s-l> ;
nnoremap <s-h> ,
nnoremap <leader>sf :w<cr>
nnoremap <leader>b :ls<cr>:b<space>
nnoremap <leader>db :ls<cr>:bd<space>

inoremap <c-l> <esc>A
imap <c-v> <esc>"*pa
inoremap <c-k> <c-o>O
inoremap <c-j> <c-o>o

nnoremap <silent><space> :nohlsearch<bar>:echo<cr>

"CoC configuration
set updatetime=300

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
    " get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

"shift text
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" custom settigs for frequent commands
" config -> save

" Vim defaults from neovim

if !has('nvim')
    set nocompatible
    syntax on

    set tabstop=4 softtabstop=4
    set expandtab
    set smartindent
    set autoindent
    set nowrap
    set smartcase
    set autoread
    set noswapfile
    set nobackup
    set undodir=~/.vim/undodir
    set undofile
    set incsearch
    au FocusLost * :wa

    set backspace=indent,eol,start
    set belloff=all
    set complete-=i
    set display=lastline
    set formatoptions=tcqj
    set history=10000
    set laststatus=2
    set ruler
    set sessionoptions-=options
    set showcmd
    set sidescroll=1
    set smarttab
    set notimeout
    set ttimeout
    set ttimeoutlen=50
    set ttyfast
    set viminfo+=!
    set wildmenu
    set colorcolumn=90
endif
