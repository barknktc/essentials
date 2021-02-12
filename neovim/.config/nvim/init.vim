
filetype off


call plug#begin('~/local/share/nvim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim'

call plug#end()

syntax on      
filetype plugin indent on
set nocompatible     
set hidden
set showmatch         
set ignorecase         
set mouse=v             
set hlsearch             
"----TABS-----
set tabstop=4             
set softtabstop=4   
set expandtab      
set shiftwidth=4    
set autoindent     
set number        
set wildmode=longest,list
set cc=80               
if (has("termguicolors"))
 set termguicolors
endif
colorscheme codedark
let g:airline_theme = 'codedark'
let g:cursorhold_updatetime = 100
